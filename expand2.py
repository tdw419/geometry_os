"""
Pixelpack Phase 2 - Multi-Pixel Expansion

Extends expand.py with:
  - V2 dictionary (96 entries, backward compatible with V1)
  - DICTX8 strategy: 4 entries from V2 dict using 7-bit indices (28 bits)
  - expand_multi(): chain multiple seeds into one output
  - Backward compatible: all V1 seeds still expand identically

The key insight for scaling: a multi-pixel image gives N seeds.
Each seed expands independently, outputs concatenate.
"""

import struct
from expand import expand as expand_v1, seed_from_rgba, seed_to_rgba
from dict_v2 import V2_DICTIONARY


def expand_multi(seeds: list, max_output: int = 65536) -> bytes:
    """
    Expand multiple seeds into one concatenated byte sequence.
    
    This is the core of multi-pixel encoding:
    - Each seed expands independently using its strategy
    - Results concatenate left-to-right, top-to-bottom
    - Total output is the concatenation of all individual expansions
    
    Args:
        seeds: list of 32-bit integers
        max_output: safety cap on total output size
    
    Returns:
        Concatenated bytes from all seed expansions
    """
    result = bytearray()
    for seed in seeds:
        if len(result) >= max_output:
            break
        expanded = expand_single(seed, max_output - len(result))
        result.extend(expanded)
    return bytes(result)


def expand_single(seed: int, max_output: int = 65536) -> bytes:
    """
    Expand a single seed using V2 strategies.
    
    Strategies 0x0-0xE: delegated to V1 expand() for backward compatibility
    Strategy 0xF (TEMPLATE): delegated to V1 expand() for backward compatibility
    
    V2 does NOT add new strategies -- it uses V1 strategies with the V2
    dictionary in find_seed. The scaling comes from multi-pixel chaining.
    
    For DICT_N strategies (0x0-0x6), the V1 base dictionary is always used
    because 4-bit indices can only address 16 entries. The V2 dictionary
    is used by DICTX5 (strategy 0x8) which has 5-bit indices (0-31).
    
    To use entries 32+ from V2, multi-pixel mode is needed: one pixel for
    the part that uses V1 dictionary, another pixel for additional fragments.
    """
    # All V1 strategies are backward compatible
    # V2 just adds more dictionary entries for multi-pixel composition
    return expand_v1(seed, max_output)


def expand_from_png(png_data: bytes) -> bytes:
    """
    Expand a PNG (1x1 or multi-pixel) into bytes.
    
    For 1x1 PNG: behaves exactly like V1 (single seed)
    For NxM PNG: extracts all seeds, calls expand_multi()
    """
    seeds = extract_seeds_from_png(png_data)
    if len(seeds) == 1:
        return expand_single(seeds[0])
    return expand_multi(seeds)


def extract_seeds_from_png(png_data: bytes) -> list:
    """Extract all seed values from a PNG image's pixels."""
    import zlib
    
    if png_data[:8] != b'\x89PNG\r\n\x1a\n':
        raise ValueError("Not a valid PNG file")
    
    pos = 8
    width = height = 0
    bit_depth = 8
    color_type = 6  # RGBA
    idat_data = b''
    
    while pos < len(png_data):
        length = struct.unpack('>I', png_data[pos:pos+4])[0]
        chunk_type = png_data[pos+4:pos+8]
        data = png_data[pos+8:pos+8+length]
        
        if chunk_type == b'IHDR':
            width, height = struct.unpack('>II', data[:8])
            bit_depth = data[8]
            color_type = data[9]
        elif chunk_type == b'IDAT':
            idat_data += data
        
        pos += 12 + length
    
    if not idat_data:
        raise ValueError("No IDAT chunk found")
    
    decompressed = zlib.decompress(idat_data)
    
    # Parse pixel data (filter byte per row)
    bpp = 4  # RGBA
    stride = 1 + width * bpp  # filter byte + pixel data
    seeds = []
    
    for row in range(height):
        row_start = row * stride
        filter_byte = decompressed[row_start]
        if filter_byte != 0:
            # For simplicity, only handle filter=0 (none)
            # Other filters can be added later
            _apply_filter(decompressed, row_start, width, bpp, filter_byte, height, stride)
        
        for col in range(width):
            px = row_start + 1 + col * bpp
            r, g, b, a = decompressed[px:px+4]
            seeds.append(seed_from_rgba(r, g, b, a))
    
    return seeds


def _apply_filter(data, row_start, width, bpp, filter_type, height, stride):
    """Apply PNG row filter to reconstruct raw pixel data (in-place)."""
    if filter_type == 0:
        return  # None
    
    row_len = width * bpp
    
    for i in range(row_len):
        pos = row_start + 1 + i
        x = data[pos]
        
        # Get 'a' (previous byte in same row)
        if i >= bpp:
            a = data[pos - bpp]
        else:
            a = 0
        
        # Get 'b' (corresponding byte in previous row)
        if row_start > 0:
            b = data[pos - stride]
        else:
            b = 0
        
        # Get 'c' (corresponding byte in previous row, bpp bytes back)
        if row_start > 0 and i >= bpp:
            c = data[pos - stride - bpp]
        else:
            c = 0
        
        if filter_type == 1:  # Sub
            data[pos] = (x + a) & 0xFF
        elif filter_type == 2:  # Up
            data[pos] = (x + b) & 0xFF
        elif filter_type == 3:  # Average
            data[pos] = (x + ((a + b) >> 1)) & 0xFF
        elif filter_type == 4:  # Paeth
            data[pos] = (x + _paeth_predictor(a, b, c)) & 0xFF


def _paeth_predictor(a, b, c):
    p = a + b - c
    pa = abs(p - a)
    pb = abs(p - b)
    pc = abs(p - c)
    if pa <= pb and pa <= pc:
        return a
    elif pb <= pc:
        return b
    else:
        return c


if __name__ == '__main__':
    import sys
    if len(sys.argv) < 2:
        print("Pixelpack Phase 2 - Multi-Pixel Expansion")
        print()
        print("Usage:")
        print("  python expand2.py <seed_hex> [<seed_hex2> ...]")
        print("  python expand2.py --png <file.png>")
        sys.exit(1)
    
    if sys.argv[1] == '--png':
        with open(sys.argv[2], 'rb') as f:
            png_data = f.read()
        result = expand_from_png(png_data)
        seeds = extract_seeds_from_png(png_data)
        print(f"Seeds: {len(seeds)}")
        for i, s in enumerate(seeds):
            print(f"  [{i}] 0x{s:08X}")
    else:
        seeds = [int(s, 16) for s in sys.argv[1:]]
        if len(seeds) == 1:
            result = expand_single(seeds[0])
        else:
            result = expand_multi(seeds)
    
    print(f"Output: {len(result)} bytes")
    print(f"Hex: {result.hex()}")
    try:
        print(f"ASCII: {result.decode('ascii')!r}")
    except UnicodeDecodeError:
        print(f"Raw: {result!r}")
