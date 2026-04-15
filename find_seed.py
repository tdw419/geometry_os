"""
Boot Pixel Seed Searcher v3

Analytically decomposes targets into dictionary entries for instant matching.
Falls back to NIBBLE table lookup, then pattern-based strategies.

Key insight: For DICT_N strategies, the search is O(16^N) but with early
termination it's effectively O(target_length * 16). No brute force needed
for dictionary-decomposable targets.
"""

import sys
import time
from expand import expand, DICTIONARY, NIBBLE_TABLE, seed_from_rgba, seed_to_rgba


def search(target: bytes, timeout: float = 60.0) -> list:
    """
    Search for seeds that expand to the target bytes.
    Returns list of (seed, strategy_name) tuples.
    """
    results = []
    start_time = time.time()
    tlen = len(target)

    print(f"Target: {target.hex()}")
    try:
        print(f"  ASCII: {target.decode('ascii')!r}")
    except UnicodeDecodeError:
        print(f"  Bytes: {repr(target)}")
    print(f"  Length: {tlen} bytes")
    print()

    # --- Strategy 0x0-0x6: DICT_N (analytical decomposition) ---
    for n in range(1, 8):
        if time.time() - start_time > timeout:
            break
        decomposition = _decompose(target, n)
        if decomposition is not None:
            seed = _make_dict_seed(n, decomposition)
            if _verify(seed, target):
                strategy_name = f"DICT_{n}"
                results.append((seed, strategy_name))
                print(f"  FOUND via {strategy_name}: indices={decomposition}")
                r, g, b, a = seed_to_rgba(seed)
                print(f"    Seed: 0x{seed:08X}  RGBA: ({r},{g},{b},{a})")
                break  # first match is good enough

    if results:
        _print_results(results)
        return results

    # --- Strategy 0x7: NIBBLE (7-byte max, nibble table lookup) ---
    r = _search_nibble(target)
    if r is not None:
        results.append((r, "NIBBLE"))
        print(f"  FOUND via NIBBLE")

    if results:
        _print_results(results)
        return results

    # --- Strategy 0x9: RLE (two-byte pattern) ---
    r = _search_rle(target)
    if r:
        results.append((r, "RLE"))
        print(f"  FOUND via RLE")

    if results:
        _print_results(results)
        return results

    # --- Strategy 0xE: BYTEPACK (direct byte encoding) ---
    r = _search_bytepack(target)
    if r is not None:
        results.append((r, "BYTEPACK"))
        print(f"  FOUND via BYTEPACK")

    if results:
        _print_results(results)
        return results

    # --- Strategy 0xA: XOR_CHAIN ---
    r = _search_xor_chain(target, start_time, timeout)
    if r is not None:
        results.append((r, "XOR_CHAIN"))
        print(f"  FOUND via XOR_CHAIN")

    if results:
        _print_results(results)
        return results

    # --- Strategy 0xE: TEMPLATE + XOR ---
    r = _search_template(target)
    if r is not None:
        results.append((r, "TEMPLATE"))
        print(f"  FOUND via TEMPLATE")

    if results:
        _print_results(results)
        return results

    # --- Strategy 0x8: PRNG brute force (for short targets) ---
    if tlen <= 4:
        print(f"  Trying PRNG brute force (28-bit space, {tlen}-byte target)...")
        r = _search_prng(target, start_time, timeout)
        if r is not None:
            results.append((r, "PRNG"))
            print(f"  FOUND via PRNG!")

    if results:
        _print_results(results)
        return results

    elapsed = time.time() - start_time
    print(f"\nNo exact match found after {elapsed:.1f}s")
    print("  Target may need a dictionary update or multi-pixel encoding.")
    return results


def _verify(seed, target):
    """Check if seed expands to target."""
    try:
        return expand(seed, len(target) + 1) == target
    except Exception:
        return False


def _decompose(target, n_entries):
    """
    Find a decomposition of target into exactly n_entries consecutive
    dictionary entries. Returns list of indices or None.

    Uses BFS with early termination.
    """
    if n_entries == 0:
        return [] if len(target) == 0 else None

    return _decompose_recursive(target, 0, n_entries)


def _decompose_recursive(target, pos, remaining):
    """Recursively try to decompose target[pos:] into `remaining` dict entries."""
    if remaining == 0:
        return [] if pos == len(target) else None
    if pos >= len(target):
        return None

    # Pruning: estimate minimum/maximum bytes remaining entries can produce
    min_remaining = remaining * 1  # shortest dict entry is 1 byte
    max_remaining = remaining * 7  # longest dict entry is 7 bytes
    bytes_left = len(target) - pos
    if bytes_left < min_remaining or bytes_left > max_remaining:
        return None

    for i, entry in enumerate(DICTIONARY):
        elen = len(entry)
        if pos + elen <= len(target) and target[pos:pos + elen] == entry:
            rest = _decompose_recursive(target, pos + elen, remaining - 1)
            if rest is not None:
                return [i] + rest

    return None


def _make_dict_seed(n, indices):
    """Build a 32-bit seed for DICT_N strategy.

    Strategy nibble = n - 1 (DICT_1=0x0, DICT_2=0x1, ..., DICT_7=0x6).
    """
    assert len(indices) == n
    assert 1 <= n <= 7
    params = 0
    for i, idx in enumerate(indices):
        params |= (idx & 0xF) << (4 * i)
    strategy_nibble = n - 1  # DICT_1 -> 0x0, DICT_7 -> 0x6
    return (strategy_nibble << 28) | params


def _search_nibble(target):
    """Search NIBBLE strategy: 7 nibbles each index NIBBLE_TABLE.

    Inverse: for each target byte, find its nibble index (if any).
    Only works for 7-byte targets where all bytes are in NIBBLE_TABLE.
    """
    if len(target) != 7:
        return None

    # Build reverse lookup: byte -> nibble index
    byte_to_nibble = {}
    for i, b in enumerate(NIBBLE_TABLE):
        byte_to_nibble[b] = i

    nibbles = []
    for b in target:
        if b not in byte_to_nibble:
            return None
        nibbles.append(byte_to_nibble[b])

    # Pack nibbles into params (LSB first)
    params = 0
    for i, nib in enumerate(nibbles):
        params |= (nib & 0xF) << (4 * i)
    seed = 0x70000000 | params

    if _verify(seed, target):
        return seed
    return None


def _search_rle(target):
    """Search RLE strategy: [byte_a]*count_a + [byte_b]*count_b repeated."""
    tlen = len(target)
    for repeats in range(1, 17):
        if tlen % repeats != 0:
            continue
        pattern_len = tlen // repeats
        for count_a in range(1, min(17, pattern_len)):
            count_b = pattern_len - count_a
            if count_b < 1 or count_b > 16:
                continue

            byte_a = target[0]
            byte_b = target[count_a]

            valid = True
            for r in range(repeats):
                base = r * pattern_len
                for j in range(count_a):
                    if target[base + j] != byte_a:
                        valid = False
                        break
                if not valid:
                    break
                for j in range(count_b):
                    if target[base + count_a + j] != byte_b:
                        valid = False
                        break
                if not valid:
                    break

            if valid:
                params = (byte_a & 0xFF) | ((byte_b & 0xFF) << 8) | \
                         (((count_a - 1) & 0xF) << 16) | \
                         (((count_b - 1) & 0xF) << 20) | \
                         (((repeats - 1) & 0xF) << 24)
                seed = 0x90000000 | params
                if _verify(seed, target):
                    return seed
    return None


def _search_xor_chain(target, start_time, timeout):
    """Search XOR_CHAIN strategy."""
    tlen = len(target)
    if tlen > 16 or tlen == 0:
        return None

    start = target[0]
    for key in range(256):
        if time.time() - start_time > timeout:
            return None
        for mask in [0xFF] + [m for m in range(1, 256) if m != 0xFF]:
            val = start
            match = True
            for i in range(tlen):
                if val != target[i]:
                    match = False
                    break
                val = ((val ^ key) & mask)
                if val == 0:
                    val = key

            if match:
                count_bits = (tlen - 1) & 0xF
                params = (start & 0xFF) | ((key & 0xFF) << 8) | \
                         ((mask & 0xFF) << 16) | (count_bits << 24)
                seed = 0xA0000000 | params
                if _verify(seed, target):
                    return seed
    return None


def _search_prng(target, start_time, timeout):
    """Brute-force PRNG strategy for short targets (1-4 bytes)."""
    tlen = len(target)

    for seed28 in range(0x0FFFFFFF):
        if seed28 % 10000000 == 0:
            if time.time() - start_time > timeout:
                print(f"    PRNG: timed out at {seed28/0x0FFFFFFF*100:.0f}%")
                return None

        # Inline the PRNG for speed
        state = seed28 | 1
        match = True
        for i in range(tlen):
            state = (state * 1103515245 + 12345) & 0x0FFFFFFF
            if ((state >> 12) & 0xFF) != target[i]:
                match = False
                break

        if match:
            seed = 0x80000000 | seed28
            if _verify(seed, target):
                return seed

    return None


def _search_bytepack(target):
    """Search BYTEPACK strategy: tries all 8 sub-modes analytically."""
    from expand import _expand_bytepack
    tlen = len(target)

    # Mode 0: 3 raw bytes [+ repeats of first byte]
    if 3 <= tlen <= 18:
        for extra in range(0, min(16, tlen - 3 + 1)):
            if tlen == 3 + extra:
                b0, b1, b2 = target[0], target[1], target[2]
                if extra == 0 or all(target[3+i] == b0 for i in range(extra)):
                    data = b0 | (b1 << 8) | (b2 << 16) | (extra << 24)
                    params = (0 << 0) | (data << 3)
                    seed = 0xE0000000 | params
                    if _verify(seed, target):
                        return seed

    # Mode 1: XOR delta (3 bytes + optional repeat)
    if 3 <= tlen <= 18:
        base = target[0]
        d1 = target[0] ^ target[1] if tlen > 1 else 0
        d2 = (target[0] ^ target[1] ^ target[2]) if tlen > 2 else 0
        # Verify
        check = bytearray([base, base ^ d1, (base ^ d1) ^ d2])
        if bytes(check[:tlen]) == target[:min(tlen, 3)]:
            for extra in range(0, min(16, tlen - 3 + 1)):
                if tlen == 3 + extra:
                    if extra == 0 or all(target[3+i] == check[-1] for i in range(extra)):
                        data = base | (d1 << 8) | (d2 << 16) | (extra << 24)
                        params = (1 << 0) | (data << 3)
                        seed = 0xE0000000 | params
                        if _verify(seed, target):
                            return seed

    # Mode 2: ADD delta (3-4 bytes)
    if 3 <= tlen <= 4:
        base = target[0]
        d1 = (target[1] - base) & 0xFF
        d2 = (target[2] - target[1]) & 0xFF
        d3 = (target[3] - target[2]) & 0xF if tlen > 3 else 0
        if tlen == 3:
            d3 = 0
        data = base | (d1 << 8) | (d2 << 16) | (d3 << 24)
        params = (2 << 0) | (data << 3)
        seed = 0xE0000000 | params
        if _verify(seed, target):
            return seed

    # Mode 3: 4 nibbles with shared high nibble
    if tlen == 4:
        hi_nibble = target[0] >> 4
        if all((b >> 4) == hi_nibble for b in target):
            data = hi_nibble | ((target[0] & 0xF) << 4) | ((target[1] & 0xF) << 8) | \
                   ((target[2] & 0xF) << 12) | ((target[3] & 0xF) << 16)
            params = (3 << 0) | (data << 3)
            seed = 0xE0000000 | params
            if _verify(seed, target):
                return seed

    # Mode 4: 4 bytes, 7 bits each
    if tlen == 4 and all(b <= 127 for b in target):
        data = (target[0] & 0x7F) | ((target[1] & 0x7F) << 7) | \
               ((target[2] & 0x7F) << 14) | ((target[3] & 0x7F) << 21)
        params = (4 << 0) | (data << 3)
        seed = 0xE0000000 | params
        if _verify(seed, target):
            return seed

    # Mode 5: Shared base + 4 nibble offsets
    if tlen == 4:
        # Try different base values
        for base in range(256):
            offsets = [(b - base) & 0xFF for b in target]
            if all(0 <= o <= 15 for o in offsets):
                data = base | (offsets[0] << 8) | (offsets[1] << 12) | \
                       (offsets[2] << 16) | (offsets[3] << 20)
                params = (5 << 0) | (data << 3)
                seed = 0xE0000000 | params
                if _verify(seed, target):
                    return seed

    # Mode 6: 5 bytes via lowercase alpha + digits
    if tlen == 5:
        table = 'abcdefghijklmnopqrstuvwxyz012345'
        try:
            indices = [table.index(chr(b)) for b in target]
            if all(0 <= idx <= 31 for idx in indices):
                data = 0
                for i, idx in enumerate(indices):
                    data |= (idx << (5 * i))
                params = (6 << 0) | (data << 3)
                seed = 0xE0000000 | params
                if _verify(seed, target):
                    return seed
        except (ValueError, OverflowError):
            pass

    # Mode 7: 5 bytes via uppercase alpha + symbols
    if tlen == 5:
        table = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ !,.\n('
        try:
            indices = [table.index(chr(b)) for b in target]
            if all(0 <= idx <= 31 for idx in indices):
                data = 0
                for i, idx in enumerate(indices):
                    data |= (idx << (5 * i))
                params = (7 << 0) | (data << 3)
                seed = 0xE0000000 | params
                if _verify(seed, target):
                    return seed
        except (ValueError, OverflowError):
            pass

    return None


def _search_template(target):
    """Search TEMPLATE strategy."""
    templates = [
        b'Hello, World!\n', b'print("hi")\n', b'echo hello\n',
        b'int main(){}\n', b'mov r0, #1\n', b'AAAA', b'BBBB', b'CCCC',
        b'ld a, 0\n', b'push 42\n', b'x = 1\n', b'a = b\n',
        b'fn f()\n', b'pub fn\n', b'val x\n', b'let x\n',
    ]

    tlen = len(target)
    for idx, template in enumerate(templates):
        expected_len = len(template) + 2
        if tlen != expected_len:
            continue

        key = (target[0] - template[0]) & 0xFF
        if all((template[i] + key) & 0xFF == target[i] for i in range(len(template))):
            extra1 = target[len(template)]
            extra2 = target[len(template) + 1]
            params = (idx & 0xF) | ((key & 0xFF) << 4) | \
                     ((extra1 & 0xFF) << 12) | ((extra2 & 0xFF) << 20)
            seed = 0xF0000000 | params
            if _verify(seed, target):
                return seed
    return None


def _print_results(results):
    print(f"\n{'='*50}")
    print(f"Found {len(results)} matching seed(s):")
    for seed, name in results:
        r, g, b, a = seed_to_rgba(seed)
        output = expand(seed)
        print(f"  Seed: 0x{seed:08X}  Strategy: {name}")
        print(f"  RGBA: ({r}, {g}, {b}, {a})")
        print(f"  Output ({len(output)} bytes): {output.hex()}")
        try:
            print(f"  Text: {output.decode('ascii')!r}")
        except UnicodeDecodeError:
            pass
    print(f"{'='*50}")


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Boot Pixel Seed Searcher v3")
        print()
        print("Usage:")
        print("  python find_seed.py --text \"print('Hello')\" ")
        print("  python find_seed.py --hex 48656C6C6F")
        print("  python find_seed.py --demo")
        sys.exit(1)

    if sys.argv[1] == '--demo':
        # Run a few demo searches
        demos = [
            b'print("Hello")\n',
            b'echo Hello\n',
            b'42\n',
        ]
        for target in demos:
            search(target)
            print()
    elif sys.argv[1] == '--text':
        target = sys.argv[2].encode('utf-8')
        results = search(target)
        if not results:
            sys.exit(1)
    elif sys.argv[1] == '--hex':
        target = bytes.fromhex(sys.argv[2])
        results = search(target)
        if not results:
            sys.exit(1)
    else:
        print(f"Unknown option: {sys.argv[1]}")
        sys.exit(1)
