"""
Pixelpack Phase 2 - Multi-Pixel PNG Encoder/Decoder

Extends boot.py with:
  - make_multipixel_png(): NxM RGBA PNG with N*M seeds
  - read_multipixel_png(): extract all seeds from a multi-pixel PNG
  - encode_multi(): encode a program into a multi-pixel PNG
  - decode_multi(): decode a multi-pixel PNG back to bytes
  - Backward compatible: 1x1 PNGs still work exactly as V1

The image dimensions are chosen automatically:
  - For 1 seed: 1x1
  - For 2 seeds: 1x2
  - For 3-4 seeds: 2x2
  - For 5-16 seeds: 4x4
  - For 17+ seeds: sqrt(N) x sqrt(N) rounded up
"""

import struct
import zlib
import sys
from expand import seed_to_rgba, seed_from_rgba, expand
from expand2 import expand_multi, extract_seeds_from_png, expand_from_png
from find_seed import search


def make_multipixel_png(seeds: list) -> bytes:
    """
    Create an NxM RGBA PNG containing the given seeds as pixel colors.
    
    Automatically chooses dimensions:
      1 seed  -> 1x1
      2 seeds -> 2x1
      3-4     -> 2x2
      5-9     -> 3x3
      10-16   -> 4x4
      17-25   -> 5x5
      etc.
    """
    n = len(seeds)
    width, height = _auto_dimensions(n)
    total_pixels = width * height
    
    # Build raw pixel data with filter byte 0 (none) per row
    raw_rows = bytearray()
    for row in range(height):
        raw_rows.append(0)  # filter byte = none
        for col in range(width):
            idx = row * width + col
            if idx < n:
                r, g, b, a = seed_to_rgba(seeds[idx])
            else:
                # Padding pixels: use seed 0x00000000 (DICT_1, index 0)
                r, g, b, a = 0, 0, 0, 0
            raw_rows.extend([r, g, b, a])
    
    compressed = zlib.compress(bytes(raw_rows))
    
    return _build_png(width, height, compressed)


def read_multipixel_png(png_data: bytes) -> tuple:
    """
    Read a multi-pixel PNG.
    
    Returns:
        (width, height, seeds) where seeds is a list of 32-bit ints
    """
    seeds = extract_seeds_from_png(png_data)
    
    # Get dimensions
    width = height = 0
    pos = 8
    while pos < len(png_data):
        length = struct.unpack('>I', png_data[pos:pos+4])[0]
        chunk_type = png_data[pos+4:pos+8]
        data = png_data[pos+8:pos+8+length]
        if chunk_type == b'IHDR':
            width, height = struct.unpack('>II', data[:8])
            break
        pos += 12 + length
    
    return width, height, seeds


def encode_multi(target: bytes, output_png: str, timeout: float = 60.0,
                 max_seeds: int = 16):
    """
    Encode a target byte sequence into a multi-pixel PNG.
    
    Strategy:
    1. Try to find a single seed first (1x1 PNG)
    2. If that fails, split target into segments and find seeds for each
    3. Greedy split: find the longest prefix that has a seed, then recurse
    
    Args:
        target: bytes to encode
        output_png: path to write PNG
        timeout: total search timeout in seconds
        max_seeds: maximum number of pixels to use
    
    Returns:
        True if successful, False otherwise
    """
    import time
    start_time = time.time()
    
    print(f"Encoding: {len(target)} bytes")
    try:
        print(f"  Text: {target.decode('ascii')!r}")
    except UnicodeDecodeError:
        print(f"  Hex: {target.hex()}")
    print()
    
    # Step 1: Try single seed
    results = search(target, timeout=min(timeout, 15.0))
    if results:
        seed = results[0][0]
        png_data = make_multipixel_png([seed])
        with open(output_png, 'wb') as f:
            f.write(png_data)
        print(f"Encoded as 1x1 PNG ({len(png_data)} bytes)")
        return True
    
    # Step 2: Multi-seed encoding
    print("Single seed not found. Trying multi-pixel encoding...")
    remaining_time = timeout - (time.time() - start_time)
    seeds = _find_multi_seeds(target, remaining_time, max_seeds)
    
    if not seeds:
        print("FAILED: Could not encode target")
        return False
    
    png_data = make_multipixel_png(seeds)
    with open(output_png, 'wb') as f:
        f.write(png_data)
    
    width, height = _auto_dimensions(len(seeds))
    print(f"Encoded as {width}x{height} PNG ({len(seeds)} seeds, {len(png_data)} bytes)")
    
    # Verify
    decoded = expand_multi(seeds)
    if decoded == target:
        print("Verification: PASS")
        return True
    else:
        print(f"Verification: FAIL")
        print(f"  Expected: {target.hex()}")
        print(f"  Got:      {decoded.hex()}")
        return False


def _find_multi_seeds(target: bytes, timeout: float, max_seeds: int) -> list:
    """
    Find multiple seeds whose concatenated expansions equal target.
    
    Strategy:
    1. For each position, try to decompose a prefix into dict entries
    2. Prefer longer segments to minimize total seed count
    3. Fall back to full search for non-dict segments
    """
    import time
    from expand import DICTIONARY, DICTIONARY_EXT
    from find_seed import _decompose, _pack_dict_seed, _verify
    
    start_time = time.time()
    seeds = []
    pos = 0
    
    while pos < len(target) and len(seeds) < max_seeds:
        if time.time() - start_time > timeout:
            print(f"  Timeout after {len(seeds)} segments")
            return []
        
        remaining = len(target) - pos
        found = False
        
        # Strategy 1: Try dict decomposition on a prefix of the remaining target
        # For each n (1-7 for base, 1-5 for ext), try to decompose a prefix
        best_seed = None
        best_len = 0
        best_name = ""
        
        for n in range(7, 0, -1):
            if best_len >= remaining:
                break
            # _decompose needs exact match: all of target must be consumed
            # So we need to try different prefix lengths
            # Better: try to decompose and see how far we get
            prefix = target[pos:]
            decomp = _try_prefix_decompose(prefix, n, DICTIONARY)
            if decomp:
                dlen = sum(len(DICTIONARY[i]) for i in decomp)
                if dlen > best_len:
                    seed = _pack_dict_seed(n, decomp)
                    if _verify(seed, target[pos:pos+dlen]):
                        best_seed = seed
                        best_len = dlen
                        best_name = f"DICT_{n}"
        
        # Also try DICTX5 (5-bit indices, DICTIONARY_EXT, 5 entries)
        if best_len < remaining:
            for n in range(5, 0, -1):
                if best_len >= remaining:
                    break
                prefix = target[pos:]
                decomp = _try_prefix_decompose(prefix, n, DICTIONARY_EXT)
                if decomp:
                    dlen = sum(len(DICTIONARY_EXT[i]) for i in decomp)
                    if dlen > best_len and all(i < 32 for i in decomp):
                        params = 0
                        for i, idx in enumerate(decomp):
                            params |= (idx & 0x1F) << (5 * i)
                        seed = 0x80000000 | params
                        if _verify(seed, target[pos:pos+dlen]):
                            best_seed = seed
                            best_len = dlen
                            best_name = "DICTX5"
        
        if best_seed and best_len > 0:
            seeds.append(best_seed)
            print(f"  Segment {len(seeds)}: {best_len} bytes at offset {pos} -> seed 0x{best_seed:08X} ({best_name})")
            pos += best_len
            found = True
            continue
        
        # Strategy 2: Full search for shorter segments
        per_seg_timeout = min(0.5, (timeout - (time.time() - start_time)) / max(remaining, 1))
        for seg_len in range(min(remaining, 20), 0, -1):
            if time.time() - start_time > timeout:
                break
            segment = target[pos:pos + seg_len]
            results = search(segment, timeout=per_seg_timeout)
            if results:
                seeds.append(results[0][0])
                pos += seg_len
                found = True
                print(f"  Segment {len(seeds)}: {seg_len} bytes at offset {pos - seg_len} -> seed 0x{results[0][0]:08X} ({results[0][1]})")
                break
        
        if not found:
            print(f"  Cannot encode byte at offset {pos}: 0x{target[pos]:02X}")
            return []
    
    if pos != len(target):
        print(f"  Only encoded {pos}/{len(target)} bytes")
        return []
    
    return seeds


def _try_prefix_decompose(target, n_entries, dictionary):
    """
    Try to decompose a PREFIX of target into exactly n_entries dict entries.
    
    Unlike _decompose which requires exact match of the entire target,
    this returns the first successful n_entries decomposition of a prefix.
    
    Returns list of indices or None.
    """
    return _prefix_decomp_rec(target, 0, n_entries, dictionary)


def _prefix_decomp_rec(target, pos, remaining, dictionary):
    """
    Recursively try to match exactly `remaining` dict entries starting at pos.
    Returns the index list if the first `remaining` entries match a prefix,
    and there's nothing more to match (remaining == 0).
    """
    if remaining == 0:
        return []  # matched all entries, prefix is target[:pos]
    if pos >= len(target):
        return None  # need more entries but out of data
    
    for i, entry in enumerate(dictionary):
        elen = len(entry)
        if pos + elen <= len(target) and target[pos:pos + elen] == entry:
            rest = _prefix_decomp_rec(target, pos + elen, remaining - 1, dictionary)
            if rest is not None:
                return [i] + rest
    return None


def _auto_dimensions(n):
    """Choose image dimensions for n seeds."""
    if n <= 0:
        return 1, 1
    if n == 1:
        return 1, 1
    if n == 2:
        return 2, 1
    if n <= 4:
        return 2, 2
    
    # Find smallest square that fits n
    import math
    side = math.ceil(math.sqrt(n))
    return side, side


def _build_png(width, height, compressed_data):
    """Build a PNG file from dimensions and compressed IDAT data."""
    def chunk(chunk_type, data):
        c = chunk_type + data
        crc = zlib.crc32(c) & 0xFFFFFFFF
        return struct.pack('>I', len(data)) + c + struct.pack('>I', crc)
    
    signature = b'\x89PNG\r\n\x1a\n'
    ihdr_data = struct.pack('>IIBBBBB', width, height, 8, 6, 0, 0, 0)
    ihdr = chunk(b'IHDR', ihdr_data)
    idat = chunk(b'IDAT', compressed_data)
    iend = chunk(b'IEND', b'')
    
    return signature + ihdr + idat + iend


def decode_png(png_path: str, output_path: str = None):
    """Decode a multi-pixel PNG back to bytes."""
    with open(png_path, 'rb') as f:
        png_data = f.read()
    
    width, height, seeds = read_multipixel_png(png_data)
    
    print(f"Decoding: {png_path}")
    print(f"  Dimensions: {width}x{height}")
    print(f"  Seeds: {len(seeds)}")
    for i, s in enumerate(seeds):
        print(f"    [{i}] 0x{s:08X}")
    
    if len(seeds) == 1:
        result = expand(seeds[0])
    else:
        result = expand_multi(seeds)
    
    print(f"  Output: {len(result)} bytes")
    try:
        print(f"  Text: {result.decode('ascii')!r}")
    except UnicodeDecodeError:
        print(f"  Hex: {result.hex()}")
    
    if output_path:
        with open(output_path, 'wb') as f:
            f.write(result)
        print(f"  Written to: {output_path}")
        import os
        os.chmod(output_path, 0o755)
    
    return result


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Pixelpack Phase 2 - Multi-Pixel PNG Encoder/Decoder")
        print()
        print("Usage:")
        print("  python boot2.py encode <input_file> <output.png>")
        print("  python boot2.py decode <input.png> [output_file]")
        print("  python boot2.py demo")
        sys.exit(1)
    
    cmd = sys.argv[1]
    
    if cmd == 'encode':
        if len(sys.argv) < 4:
            print("Usage: python boot2.py encode <input_file> <output.png>")
            sys.exit(1)
        success = encode_multi(
            open(sys.argv[2], 'rb').read(),
            sys.argv[3]
        )
        sys.exit(0 if success else 1)
    
    elif cmd == 'decode':
        if len(sys.argv) < 3:
            print("Usage: python boot2.py decode <input.png> [output_file]")
            sys.exit(1)
        output = sys.argv[3] if len(sys.argv) > 3 else None
        result = decode_png(sys.argv[2], output)
        sys.exit(0)
    
    elif cmd == 'demo':
        print("=" * 60)
        print("PIXELPACK PHASE 2 DEMO - Multi-Pixel Encoding")
        print("=" * 60)
        print()
        
        demos = [
            (b'print("Hello")\n', 'V1 backward compat (1x1)'),
            (b'echo Hello\n', 'Shell echo (1x1)'),
            (b'x = "Hello"\nprint(x)\n', 'Python variable (multi-pixel)'),
        ]
        
        for target, desc in demos:
            print(f"--- {desc} ---")
            print(f"Target: {target!r} ({len(target)} bytes)")
            
            png_path = f'/tmp/pixelpack_demo_{hash(target) % 10000}.png'
            success = encode_multi(target, png_path, timeout=15.0)
            
            if success:
                decoded = decode_png(png_path)
                if decoded == target:
                    print("Round-trip: PASS")
                else:
                    print("Round-trip: FAIL")
                    print(f"  Expected: {target.hex()}")
                    print(f"  Got:      {decoded.hex()}")
            else:
                print("Encoding: FAILED")
            print()
    
    else:
        print(f"Unknown command: {cmd}")
        sys.exit(1)
