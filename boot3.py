"""
Pixelpack Phase 3 - Context-Aware Encoder v3

Two-phase approach:
  1. SETUP: Pre-emit high-value repeated patterns into the reference buffer
     (dict_only seeds). These don't appear in output but establish LZ77 targets.
  2. ENCODE: Encode the target using LZ77 back-references (to setup + emitted
     content) and V1 strategies for unique content.

Key insight: Only pre-emit patterns that cost MORE in V1 than setup+LZ77.
A pattern needing N V1 pixels that appears K times costs N*K pixels in V2.
With setup, it costs setup_px + K LZ77 pixels. Savings = N*K - setup_px - K.

Produces V3 PNGs with t3mode=1 tEXt chunk and dict_only=N metadata.
"""

import struct
import zlib
import math
import time
from expand import (
    seed_to_rgba, seed_from_rgba, expand,
    DICTIONARY, DICTIONARY_EXT, SUB_DICT, NIBBLE_TABLE,
)
from expand2 import expand_multi, expand_from_png, extract_seeds_from_png
from expand3 import (
    ExpandContext, expand_with_context, expand_multi_v3, expand_from_png_v3,
    _expand_lz77, emit_dict_seed,
)
from find_seed import search as seed_search
from boot2 import (
    _find_multi_seeds_dp, make_multipixel_png,
    _try_prefix_decompose, _try_nibble, _quick_bytepack,
)


# ============================================================
# PNG Construction
# ============================================================

def make_v3_png(seeds: list, xor_mode: bool = False, dict_only: int = 0) -> bytes:
    """Create a PNG with phase 3 metadata. dict_only = number of setup seeds."""
    n = len(seeds)
    width, height = _auto_dimensions(n)
    raw_rows = bytearray()
    for row in range(height):
        raw_rows.append(0)  # filter byte
        for col in range(width):
            idx = row * width + col
            if idx < n:
                r, g, b, a = seed_to_rgba(seeds[idx])
            else:
                r, g, b, a = 0, 0, 0, 0
            raw_rows.extend([r, g, b, a])
    compressed = zlib.compress(bytes(raw_rows))
    return _build_v3_png(width, height, compressed, n, xor_mode, dict_only)


def _build_v3_png(width, height, compressed_data, seed_count, xor_mode=False, dict_only=0):
    def chunk(chunk_type, data):
        c = chunk_type + data
        crc = zlib.crc32(c) & 0xFFFFFFFF
        return struct.pack('>I', len(data)) + c + struct.pack('>I', crc)

    signature = b'\x89PNG\r\n\x1a\n'
    ihdr_data = struct.pack('>IIBBBBB', width, height, 8, 6, 0, 0, 0)
    ihdr = chunk(b'IHDR', ihdr_data)
    chunks = [signature, ihdr]
    chunks.append(chunk(b'tEXt', b'seedcnt\x00' + str(seed_count).encode()))
    chunks.append(chunk(b'tEXt', b't3mode\x001'))
    if dict_only > 0:
        chunks.append(chunk(b'tEXt', b'dict_only\x00' + str(dict_only).encode()))
    if xor_mode:
        chunks.append(chunk(b'tEXt', b'xor_mode\x00true'))
    idat = chunk(b'IDAT', compressed_data)
    iend = chunk(b'IEND', b'')
    chunks.extend([idat, iend])
    return b''.join(chunks)


def _auto_dimensions(n):
    if n <= 0: return 1, 1
    if n == 1: return 1, 1
    if n == 2: return 2, 1
    side = math.ceil(math.sqrt(n))
    return side, side


# ============================================================
# LZ77 Helpers
# ============================================================

def _make_lz77_seed(offset, length):
    """Create an LZ77 seed. Returns None if params don't fit."""
    if offset >= (1 << 16) or length >= (1 << 12) or length < 1:
        return None
    params = offset | (length << 16)
    seed = 0xC0000000 | params
    return seed


def _verify_lz77(offset, length, emitted, expected):
    """Verify that LZ77 produces the expected bytes."""
    ctx = ExpandContext()
    ctx.output_buffer = bytearray(emitted)
    params = offset | (length << 16)
    result = _expand_lz77(params, ctx)
    return result == expected


def _find_lz77_at(target, pos, emitted):
    """Find longest LZ77 match for target[pos:] in emitted buffer."""
    buf_len = len(emitted)
    if buf_len == 0:
        return None
    remaining = len(target) - pos
    max_len = min(remaining, 0xFFF)

    best_len = 0
    best_offset = 0

    # For each possible start position in the buffer
    for start in range(buf_len):
        match_len = 0
        ei = start
        while match_len < max_len:
            if ei < buf_len:
                if emitted[ei] == target[pos + match_len]:
                    match_len += 1
                    ei += 1
                else:
                    break
            else:
                # Overlapping copy: reference bytes we're about to produce
                wrap_pos = ei - buf_len
                if wrap_pos < match_len and (pos + wrap_pos) < len(target):
                    if target[pos + wrap_pos] == target[pos + match_len]:
                        match_len += 1
                        ei += 1
                    else:
                        break
                else:
                    break

        if match_len > best_len:
            best_len = match_len
            best_offset = buf_len - 1 - start

    if best_len >= 2 and best_offset < (1 << 16):
        if _verify_lz77(best_offset, best_len, emitted, target[pos:pos+best_len]):
            return best_len, best_offset
    return None



# ============================================================
# V1 Match Finding
# ============================================================

def _find_v1_match(target, pos):
    """Find the best V1 strategy match at target[pos:]."""
    remaining = len(target) - pos
    suffix = target[pos:]

    best = (0, None, "")

    # DICT_N (1-7)
    for n in range(1, 8):
        decomp = _try_prefix_decompose(suffix, n, DICTIONARY)
        if decomp:
            dlen = sum(len(DICTIONARY[i]) for i in decomp)
            if dlen > best[0]:
                from find_seed import _pack_dict_seed
                seed = _pack_dict_seed(n, decomp)
                from find_seed import _verify
                if _verify(seed, target[pos:pos+dlen]):
                    best = (dlen, seed, f"DICT_{n}")

    # DICTX5
    decomp = _try_prefix_decompose(suffix, 5, DICTIONARY_EXT)
    if decomp and all(i < 32 for i in decomp):
        dlen = sum(len(DICTIONARY_EXT[i]) for i in decomp)
        params = sum((idx & 0x1F) << (5 * i) for i, idx in enumerate(decomp))
        seed = 0x80000000 | params
        from find_seed import _verify
        if dlen > best[0] and _verify(seed, target[pos:pos+dlen]):
            best = (dlen, seed, "DICTX5")

    # DICTX6
    decomp = _try_prefix_decompose(suffix, 6, SUB_DICT)
    if decomp:
        dlen = sum(len(SUB_DICT[i]) for i in decomp)
        params = sum((idx & 0xF) << (4 * i) for i, idx in enumerate(decomp))
        seed = 0x90000000 | params
        from find_seed import _verify
        if dlen > best[0] and _verify(seed, target[pos:pos+dlen]):
            best = (dlen, seed, "DICTX6")

    # DICTX7
    decomp = _try_prefix_decompose(suffix, 7, SUB_DICT)
    if decomp:
        dlen = sum(len(SUB_DICT[i]) for i in decomp)
        params = sum((idx & 0xF) << (4 * i) for i, idx in enumerate(decomp))
        seed = 0xA0000000 | params
        from find_seed import _verify
        if dlen > best[0] and _verify(seed, target[pos:pos+dlen]):
            best = (dlen, seed, "DICTX7")

    # NIBBLE
    if remaining >= 7:
        nib = _try_nibble(suffix[:7])
        if nib and 7 > best[0]:
            best = (7, nib, "NIBBLE")

    # BYTEPACK
    for seg_len in range(min(5, remaining), 2, -1):
        seg = target[pos:pos + seg_len]
        seed = _quick_bytepack(seg)
        if seed and seg_len > best[0]:
            best = (seg_len, seed, "BYTEPACK")

    return best if best[0] > 0 else None


# ============================================================
# Setup Pattern Analysis
# ============================================================

def _find_setup_candidates(target, max_setup_seeds=10):
    """
    Find repeated substrings worth pre-emitting into the reference buffer.

    For each repeated substring, compute:
      - v1_cost: how many V1 pixels to encode one occurrence
      - occurrences: how many times it appears in target
      - setup_cost: how many V1 pixels to encode the pattern for setup
      - net_savings: v1_cost * occurrences - setup_cost - occurrences

    Returns list of (pattern, setup_seeds, v1_cost, occurrences, net_savings)
    sorted by net_savings descending.
    """
    tlen = len(target)
    candidates = {}

    # Find all repeated substrings (4-30 bytes, appearing >= 2 times)
    for length in range(30, 3, -1):
        seen = {}
        for i in range(tlen - length + 1):
            sub = target[i:i+length]
            if sub in seen:
                if sub not in candidates:
                    candidates[sub] = [seen[sub]]
                if i not in candidates[sub]:
                    candidates[sub].append(i)
            else:
                seen[sub] = i

    # Filter to only patterns appearing >= 2 times
    candidates = {k: v for k, v in candidates.items() if len(v) >= 2}

    # For each candidate, compute cost/benefit
    scored = []
    for pattern, positions in candidates.items():
        occurrences = len(positions)

        # V1 cost to encode one occurrence (using multi-seed DP)
        v1_seeds = _find_multi_seeds_dp(pattern, timeout=2.0, max_seeds=32)
        if not v1_seeds:
            continue
        v1_cost = len(v1_seeds)

        # Setup cost = same as v1_cost (we need to encode it as dict_only seeds)
        setup_cost = v1_cost

        # Without setup: v1_cost * occurrences total pixels
        # With setup: setup_cost + occurrences LZ77 pixels
        # But wait - LZ77 is only useful when v1_cost > 1.
        # If v1_cost == 1, LZ77 saves nothing (1 pixel either way).
        if v1_cost <= 1:
            continue

        net_savings = (v1_cost * occurrences) - (setup_cost + occurrences)
        if net_savings > 0:
            scored.append((pattern, v1_seeds, v1_cost, occurrences, positions, net_savings))

    scored.sort(key=lambda x: -x[5])

    # Select non-overlapping patterns greedily by savings
    selected = []
    covered_positions = set()

    for pattern, v1_seeds, v1_cost, occurrences, positions, net_savings in scored:
        # Check how many occurrences don't overlap with already-selected patterns
        usable_positions = []
        for pos in positions:
            overlap = False
            for j in range(len(pattern)):
                if pos + j in covered_positions:
                    overlap = True
                    break
            if not overlap:
                usable_positions.append(pos)

        if len(usable_positions) < 2:
            continue

        # Recalculate savings with actual usable positions
        actual_savings = (v1_cost * len(usable_positions)) - (len(v1_seeds) + len(usable_positions))
        if actual_savings <= 0:
            continue

        # Mark positions as covered
        for pos in usable_positions:
            for j in range(len(pattern)):
                covered_positions.add(pos + j)

        selected.append((pattern, v1_seeds, v1_cost, len(usable_positions), actual_savings))

    # Limit setup seeds
    total_setup = 0
    final = []
    for pattern, v1_seeds, v1_cost, count, savings in selected:
        if total_setup + len(v1_seeds) > max_setup_seeds:
            continue
        total_setup += len(v1_seeds)
        final.append((pattern, v1_seeds, count, savings))

    return final


# ============================================================
# V3 Encoder
# ============================================================

def encode_v3(target: bytes, output_png: str = None, timeout: float = 120.0,
              use_xor: bool = False) -> tuple:
    """Encode target bytes into a V3 PNG."""
    start_time = time.time()
    tlen = len(target)

    print(f"V3 Encoding: {tlen} bytes")
    try:
        print(f"  Text: {target.decode('ascii')!r}")
    except UnicodeDecodeError:
        pass

    # Get V2 baseline
    v2_seeds = _find_multi_seeds_dp(target, timeout * 0.15, max_seeds=128)
    v2_count = len(v2_seeds) if v2_seeds else 999
    print(f"  V2 baseline: {v2_count} seeds")

    # Strategy: try encoding with and without setup seeds, pick best.
    # Also compare to V2 baseline -- never use more pixels than V2.
    best_total = v2_count  # V2 baseline as initial best
    best_seeds_list = v2_seeds  # Store as a flat list for V2 fallback
    best_is_v3 = False
    best_setup_seeds = []
    best_data_seeds = None
    best_png = None

    # Helper: build a V2-compat PNG from seed list
    def _make_v2_png_fallback(seeds):
        from boot2 import make_multipixel_png
        return make_multipixel_png(seeds)

    # --- Option A: No setup seeds (pure LZ77 from natural output) ---
    data_seeds_a = _encode_with_context(target, bytearray(), {},
                                         timeout * 0.30, start_time)
    if data_seeds_a:
        total_a = len(data_seeds_a)
        if total_a <= best_total:
            png_a = make_v3_png(data_seeds_a, xor_mode=use_xor, dict_only=0)
            decoded_a = expand_from_png_v3(png_a)
            if decoded_a == target:
                best_total = total_a
                best_setup_seeds = []
                best_data_seeds = data_seeds_a
                best_png = png_a
                best_is_v3 = True
                print(f"  No-setup V3: {total_a} pixels (chosen)")

    # --- Option B: With setup seeds ---
    setup_patterns = _find_setup_candidates(target, max_setup_seeds=12)
    all_setup_seeds = []
    setup_buffer = bytearray()
    setup_ranges = {}

    for pattern, v1_seeds, count, savings in setup_patterns:
        all_setup_seeds.extend(v1_seeds)
        setup_buffer.extend(pattern)
        print(f"  Setup: {pattern!r} ({len(pattern)}B x{count}, saves ~{savings}px, {len(v1_seeds)} setup seeds)")
        pos = 0
        while True:
            idx = target.find(pattern, pos)
            if idx == -1:
                break
            setup_ranges[(idx, idx + len(pattern))] = True
            pos = idx + 1

    data_seeds_b = _encode_with_context(target, setup_buffer, setup_ranges,
                                         timeout * 0.30, start_time)
    if data_seeds_b:
        total_b = len(all_setup_seeds) + len(data_seeds_b)
        if total_b <= best_total:
            png_b = make_v3_png(all_setup_seeds + data_seeds_b,
                                xor_mode=use_xor, dict_only=len(all_setup_seeds))
            decoded_b = expand_from_png_v3(png_b)
            if decoded_b == target:
                print(f"  With-setup V3: {total_b} pixels ({len(all_setup_seeds)} setup + {len(data_seeds_b)} data)")
                if total_b < best_total:
                    best_total = total_b
                    best_setup_seeds = all_setup_seeds
                    best_data_seeds = data_seeds_b
                    best_png = png_b
                    best_is_v3 = True

    # If no V3 option beat V2, use V2
    if best_png is None or not best_is_v3:
        print(f"  V2 fallback: {v2_count} pixels (V3 could not improve)")
        # Build a simple V3 PNG from V2 seeds (no context needed)
        from boot2 import make_multipixel_png
        best_png = make_multipixel_png(v2_seeds)
        best_setup_seeds = []
        best_data_seeds = v2_seeds
        best_total = v2_count

    # Report results
    dict_only = len(best_setup_seeds)
    all_seeds = best_setup_seeds + best_data_seeds
    width, height = _auto_dimensions(len(all_seeds))
    print(f"  V3 result: {tlen}B -> {len(all_seeds)} pixels ({width}x{height}) [{dict_only} setup + {len(best_data_seeds)} data]")
    saved = v2_count - len(all_seeds)
    pct = (saved / v2_count * 100) if v2_count else 0
    print(f"  Saved: {saved} pixels ({pct:.0f}% reduction vs V2)")

    _show_strategy_breakdown(all_seeds, dict_only)

    if output_png:
        with open(output_png, 'wb') as f:
            f.write(best_png)

    return best_data_seeds, best_png


def _encode_with_context(target, setup_buffer, setup_ranges, timeout, global_start):
    """Encode target using DP-based optimal parser (minimum seeds).

    Three phases:
      1. Enumerate all strategy matches at every position (V1 + LZ77)
         Buffer at position P = setup_buffer + target[0:P] (deterministic).
      2. DP shortest-path from 0 to tlen (each edge = 1 seed)
      3. Replay the path, verify, and return seed list

    Key insight: the output buffer at position P is always
    setup_buffer + target[0:P], regardless of which seeds produced it,
    because seeds emit left-to-right and must cover the target exactly.
    So LZ77 offsets computed against this buffer are always valid.
    """
    tlen = len(target)
    if tlen == 0:
        return []

    elapsed = time.time() - global_start
    if elapsed > timeout * 0.9:
        return _encode_greedy(target, setup_buffer, timeout, global_start)

    # Build a rolling hash table for fast LZ77 matching
    # The "virtual buffer" at position P is: setup_buffer + target[0:P]
    full_buf = bytes(setup_buffer) + bytes(target)
    buf_offset = len(setup_buffer)  # target[0] is at this index in full_buf

    # Phase 1: Enumerate matches at every position
    match_time = timeout * 0.7
    matches = _enumerate_matches_fast(target, setup_buffer, full_buf, buf_offset,
                                       match_time, global_start)

    # Phase 2: DP shortest path
    seeds = _dp_shortest_path(target, matches, timeout, global_start)

    if seeds is not None:
        return seeds

    return _encode_greedy(target, setup_buffer, timeout, global_start)


def _enumerate_matches_fast(target, setup_buffer, full_buf, buf_offset,
                            timeout, global_start):
    """Enumerate all strategy matches at every position in target.

    Uses hash-based LZ77 matching for O(n) per position instead of O(n^2).
    Returns matches[pos] = list of (length, seed, strategy_name).
    """
    tlen = len(target)
    matches = [[] for _ in range(tlen)]

    # Build 2-byte hash table for the full buffer (setup + target)
    # Maps hash(2 bytes) -> list of positions in full_buf
    hash_table = {}
    for i in range(len(full_buf) - 1):
        key = full_buf[i] | (full_buf[i + 1] << 8)
        if key not in hash_table:
            hash_table[key] = []
        hash_table[key].append(i)

    for pos in range(tlen):
        if time.time() - global_start > timeout:
            break

        remaining = tlen - pos
        suffix = target[pos:]

        # --- V1 strategies (stateless, fast) ---
        for n in range(1, 8):
            decomp = _try_prefix_decompose(suffix, n, DICTIONARY)
            if decomp:
                dlen = sum(len(DICTIONARY[i]) for i in decomp)
                from find_seed import _pack_dict_seed, _verify
                seed = _pack_dict_seed(n, decomp)
                if _verify(seed, target[pos:pos+dlen]):
                    matches[pos].append((dlen, seed, f"DICT_{n}"))

        # DICTX5
        decomp = _try_prefix_decompose(suffix, 5, DICTIONARY_EXT)
        if decomp and all(i < 32 for i in decomp):
            dlen = sum(len(DICTIONARY_EXT[i]) for i in decomp)
            params = sum((idx & 0x1F) << (5 * i) for i, idx in enumerate(decomp))
            seed = 0x80000000 | params
            from find_seed import _verify
            if _verify(seed, target[pos:pos+dlen]):
                matches[pos].append((dlen, seed, "DICTX5"))

        # DICTX6
        decomp = _try_prefix_decompose(suffix, 6, SUB_DICT)
        if decomp:
            dlen = sum(len(SUB_DICT[i]) for i in decomp)
            params = sum((idx & 0xF) << (4 * i) for i, idx in enumerate(decomp))
            seed = 0x90000000 | params
            from find_seed import _verify
            if _verify(seed, target[pos:pos+dlen]):
                matches[pos].append((dlen, seed, "DICTX6"))

        # DICTX7
        decomp = _try_prefix_decompose(suffix, 7, SUB_DICT)
        if decomp:
            dlen = sum(len(SUB_DICT[i]) for i in decomp)
            params = sum((idx & 0xF) << (4 * i) for i, idx in enumerate(decomp))
            seed = 0xA0000000 | params
            from find_seed import _verify
            if _verify(seed, target[pos:pos+dlen]):
                matches[pos].append((dlen, seed, "DICTX7"))

        # NIBBLE
        if remaining >= 7:
            nib = _try_nibble(suffix[:7])
            if nib:
                matches[pos].append((7, nib, "NIBBLE"))

        # BYTEPACK -- all lengths 1-5 for DP completeness
        for seg_len in range(min(5, remaining), 0, -1):
            seg = target[pos:pos + seg_len]
            seed = _quick_bytepack(seg)
            if seed:
                matches[pos].append((seg_len, seed, "BYTEPACK"))

        # --- LZ77 matches via hash table ---
        # Buffer at position pos = full_buf[0 : buf_offset + pos]
        buf_len = buf_offset + pos  # length of emitted buffer so far
        if buf_len >= 1 and remaining >= 2:
            best_lz77_len = 0
            best_lz77_offset = 0

            # Look up 2-byte key at target[pos:pos+2]
            key = target[pos] | (target[pos + 1] << 8)
            candidates = hash_table.get(key, [])

            # Only consider positions before buf_len in full_buf
            for cand in candidates:
                if cand >= buf_len:
                    continue

                # Extend match
                match_len = 0
                max_match = min(remaining, 0xFFF)
                ci = cand
                ti = pos
                while match_len < max_match:
                    # Source byte: if ci < buf_len, use full_buf[ci]
                    # else overlapping: use target[ti] (already matched)
                    if ci < buf_len:
                        if full_buf[ci] == target[ti]:
                            match_len += 1
                            ci += 1
                            ti += 1
                        else:
                            break
                    else:
                        # Overlapping copy
                        wrap_pos = ci - buf_len
                        if wrap_pos < match_len and ti < tlen:
                            if target[pos + wrap_pos] == target[ti]:
                                match_len += 1
                                ci += 1
                                ti += 1
                            else:
                                break
                        else:
                            break

                if match_len > best_lz77_len:
                    offset = buf_len - 1 - cand
                    if offset < (1 << 16):
                        best_lz77_len = match_len
                        best_lz77_offset = offset

            if best_lz77_len >= 2:
                # Verify and add all valid lengths for DP flexibility
                emitted = full_buf[:buf_len]
                if _verify_lz77(best_lz77_offset, best_lz77_len,
                                emitted, target[pos:pos + best_lz77_len]):
                    # Add key lengths: longest, and also some intermediate
                    for length in range(2, best_lz77_len + 1):
                        seed = _make_lz77_seed(best_lz77_offset, length)
                        if seed:
                            matches[pos].append((length, seed, "LZ77"))

        # --- search() fallback for RLE, XOR_CHAIN, etc. ---
        best_so_far = max((l for l, _, _ in matches[pos]), default=0)
        if best_so_far < 5:
            _add_search_matches_extended_fast(matches, target, pos, remaining,
                                              best_so_far, timeout, global_start)

        # Deduplicate by length (keep first/best seed per length)
        seen_lens = {}
        for length, seed, name in matches[pos]:
            if length not in seen_lens:
                seen_lens[length] = (length, seed, name)
        matches[pos] = sorted(seen_lens.values(), key=lambda x: -x[0])

    return matches


def _add_search_matches(matches, target, pos, remaining, timeout, global_start):
    """Use search() to find any strategy match at target[pos:].
    
    Only called when no long V1 match exists. Tries longest first.
    Catches RLE, XOR_CHAIN, LINEAR, TEMPLATE, etc.
    """
    import io, sys
    # Suppress search() verbose output
    old_stdout = sys.stdout
    sys.stdout = io.StringIO()
    try:
        for seg_len in range(min(5, remaining), 0, -1):
            if time.time() - global_start > timeout:
                break
            seg = target[pos:pos + seg_len]
            results = seed_search(seg, timeout=0.02)
            if results:
                seed, name = results[0]
                matches[pos].append((seg_len, seed, name))
                break  # Found a match, stop
    finally:
        sys.stdout = old_stdout


def _add_search_matches_extended_fast(matches, target, pos, remaining,
                                       best_so_far, timeout, global_start):
    """Search for strategy matches longer than best_so_far at target[pos:].

    Tries RLE, XOR_CHAIN, LINEAR, TEMPLATE, etc. that the V1 enumeration
    might miss. Only tries lengths > best_so_far for efficiency.
    Uses short per-call timeouts for speed.
    """
    import io, sys
    max_try = min(20, remaining)
    if max_try <= best_so_far:
        return
    old_stdout = sys.stdout
    sys.stdout = io.StringIO()
    try:
        for seg_len in range(max_try, best_so_far, -1):
            if time.time() - global_start > timeout:
                break
            seg = target[pos:pos + seg_len]
            results = seed_search(seg, timeout=0.03)
            if results:
                seed, name = results[0]
                from find_seed import _verify
                if _verify(seed, seg):
                    matches[pos].append((seg_len, seed, name))
                    break  # Found longest, done
    finally:
        sys.stdout = old_stdout


def _dp_shortest_path(target, matches, timeout, global_start, _retry_count=0):
    """Find minimum-seed encoding using DP shortest path.

    Each edge from pos -> pos+length has cost 1 (one seed).
    BFS from 0 to len(target).
    """
    tlen = len(target)
    INF = float('inf')

    # dp[pos] = minimum seeds to cover target[0:pos]
    dp = [INF] * (tlen + 1)
    dp[0] = 0
    parent = [None] * (tlen + 1)  # (length, seed, name)

    # Forward DP: for each position, try all matches
    for pos in range(tlen):
        if dp[pos] == INF:
            continue
        if time.time() - global_start > timeout:
            break

        for length, seed, name in matches[pos]:
            end = pos + length
            if end <= tlen and dp[pos] + 1 < dp[end]:
                dp[end] = dp[pos] + 1
                parent[end] = (pos, length, seed, name)

    # If DP didn't reach the end, try filling gaps with search()
    if dp[tlen] == INF:
        return _dp_with_search_fallback(target, matches, dp, parent,
                                        timeout, global_start)

    # Replay: walk backwards from tlen to 0
    seeds = []
    pos = tlen
    while pos > 0:
        if parent[pos] is None:
            # Gap -- shouldn't happen if dp[tlen] is finite, but handle it
            return _dp_with_search_fallback(target, matches, dp, parent,
                                            timeout, global_start)
        prev_pos, length, seed, name = parent[pos]
        seeds.append((prev_pos, length, seed, name))
        pos = prev_pos

    seeds.reverse()

    # Verify the replay produces correct bytes using context-aware expansion
    result = []
    for seg_pos, length, seed, name in seeds:
        expected = target[seg_pos:seg_pos + length]
        if name == 'LZ77':
            # LZ77 seeds need context verification
            ctx = ExpandContext()
            ctx.output_buffer = bytearray(target[:seg_pos])
            expanded = expand_with_context(seed, ctx)
            if expanded != expected:
                # Context mismatch -- remove bad LZ77 matches and retry
                if _retry_count < 3:
                    return _dp_retry_without_bad_lz77(
                        target, matches, timeout, global_start, _retry_count)
                return None
        else:
            if not _verify_v1(seed, expected):
                return None
        result.append(seed)

    print(f"  DP optimal: {len(result)} seeds (vs greedy baseline)")
    return result


def _verify_v1(seed, expected):
    """Verify a V1 (non-LZ77) seed produces the expected bytes."""
    from find_seed import _verify
    return _verify(seed, expected)


def _dp_retry_without_bad_lz77(target, matches, timeout, global_start, retry_count):
    """Retry DP after removing LZ77 matches that fail context verification."""
    tlen = len(target)

    # Filter out bad LZ77 matches
    for pos in range(tlen):
        good = []
        for length, seed, name in matches[pos]:
            if name == 'LZ77':
                ctx = ExpandContext()
                ctx.output_buffer = bytearray(target[:pos])
                expanded = expand_with_context(seed, ctx)
                if expanded == target[pos:pos + length]:
                    good.append((length, seed, name))
            else:
                good.append((length, seed, name))
        matches[pos] = good

    # Re-run DP with incremented retry count
    return _dp_shortest_path(target, matches, timeout, global_start,
                             retry_count + 1)


def _dp_with_search_fallback(target, matches, dp, parent, timeout, global_start):
    """DP with search() fallback for uncovered positions.

    First fill gaps in matches[] using search(), then re-run DP.
    """
    tlen = len(target)
    INF = float('inf')

    # Find positions with no matches and fill with search()
    for pos in range(tlen):
        if matches[pos]:
            continue
        if time.time() - global_start > timeout:
            break

        remaining = tlen - pos
        for seg_len in range(min(20, remaining), 0, -1):
            if time.time() - global_start > timeout:
                break
            seg = target[pos:pos + seg_len]
            import io, sys
            old_stdout = sys.stdout
            sys.stdout = io.StringIO()
            try:
                results = seed_search(seg, timeout=0.3)
            finally:
                sys.stdout = old_stdout
            if results:
                matches[pos].append((seg_len, results[0][0], results[0][1]))
                break

    # Re-run DP
    dp2 = [INF] * (tlen + 1)
    dp2[0] = 0
    parent2 = [None] * (tlen + 1)

    for pos in range(tlen):
        if dp2[pos] == INF:
            continue
        if time.time() - global_start > timeout:
            break

        if not matches[pos]:
            continue

        for length, seed, name in matches[pos]:
            end = pos + length
            if end <= tlen and dp2[pos] + 1 < dp2[end]:
                dp2[end] = dp2[pos] + 1
                parent2[end] = (pos, length, seed, name)

    if dp2[tlen] == INF:
        return None

    # Replay
    seeds = []
    pos = tlen
    while pos > 0:
        if parent2[pos] is None:
            return None
        prev_pos, length, seed, name = parent2[pos]
        seeds.append(seed)
        pos = prev_pos

    seeds.reverse()
    print(f"  DP+search: {len(seeds)} seeds")
    return seeds


def _encode_greedy(target, setup_buffer, timeout, global_start):
    """Original greedy left-to-right parser as fallback."""
    tlen = len(target)
    result_seeds = []
    emitted = bytearray(setup_buffer)
    pos = 0

    while pos < tlen:
        if time.time() - global_start > timeout:
            print(f"  Timeout at position {pos}/{tlen}")
            break

        remaining = tlen - pos
        best_len = 0
        best_seed = None

        if len(emitted) > 0:
            lz77 = _find_lz77_at(target, pos, emitted)
            if lz77:
                lz77_len, lz77_offset = lz77
                seed = _make_lz77_seed(lz77_offset, lz77_len)
                if seed and lz77_len > best_len:
                    best_len = lz77_len
                    best_seed = seed

        v1_match = _find_v1_match(target, pos)
        if v1_match and v1_match[0] > best_len:
            best_len, best_seed, _ = v1_match

        if best_len == 0:
            import io, sys
            old_stdout = sys.stdout
            sys.stdout = io.StringIO()
            try:
                for seg_len in range(min(20, remaining), 0, -1):
                    if time.time() - global_start > timeout:
                        break
                    seg = target[pos:pos + seg_len]
                    results = seed_search(seg, timeout=0.3)
                    if results:
                        best_len = seg_len
                        best_seed = results[0][0]
                        break
            finally:
                sys.stdout = old_stdout

        if best_seed is None or best_len == 0:
            print(f"  FAIL at offset {pos}: 0x{target[pos]:02X}")
            return None

        result_seeds.append(best_seed)
        emitted.extend(target[pos:pos + best_len])
        pos += best_len

    if pos != tlen:
        return None

    return result_seeds


# ============================================================
# Diagnostics
# ============================================================

def _diagnose_mismatch(expected, got, data_seeds, setup_seeds):
    ctx = ExpandContext()
    # Process setup seeds
    for seed in setup_seeds:
        emit_dict_seed(seed, ctx)
    # Process data seeds
    pos = 0
    for i, seed in enumerate(data_seeds):
        result = expand_with_context(seed, ctx)
        if pos < len(expected):
            exp = expected[pos:pos+len(result)]
            if result != exp:
                print(f"  Divergence at data seed {i}: 0x{seed:08X}")
                print(f"    Expected: {exp!r}")
                print(f"    Got:      {result!r}")
                return
        pos += len(result)


def _show_strategy_breakdown(seeds, dict_only=0):
    names = {
        0:'DICT_1',1:'DICT_2',2:'DICT_3',3:'DICT_4',4:'DICT_5',
        5:'DICT_6',6:'DICT_7',7:'NIBBLE',8:'DICTX5',9:'DICTX6',
        0xA:'DICTX7',0xB:'RLE',0xC:'LZ77',0xD:'DYN_DICT',
        0xE:'BYTEPACK',0xF:'TEMPLATE'
    }
    counts = {}
    bytes_by = {}
    ctx = ExpandContext()
    for i, s in enumerate(seeds):
        if i < dict_only:
            result = emit_dict_seed(s, ctx)
        else:
            result = expand_with_context(s, ctx)
        strat = (s >> 28) & 0xF
        name = names.get(strat, f'?{strat:X}')
        counts[name] = counts.get(name, 0) + 1
        bytes_by[name] = bytes_by.get(name, 0) + len(result)
    print(f"  Strategy breakdown:")
    for name in sorted(counts.keys()):
        print(f"    {name:12s}: {counts[name]:3d} seeds, {bytes_by[name]:4d} bytes")


# ============================================================
# CLI
# ============================================================

if __name__ == '__main__':
    import sys
    if len(sys.argv) < 2:
        print("Pixelpack Phase 3 - Context-Aware Encoder v3")
        print()
        print("Usage:")
        print("  python3 boot3.py encode <input_file> <output.png> [--xor]")
        print("  python3 boot3.py decode <input.png> [output_file]")
        print("  python3 boot3.py demo")
        sys.exit(1)

    cmd = sys.argv[1]

    if cmd == 'encode':
        if len(sys.argv) < 4:
            print("Usage: python3 boot3.py encode <input_file> <output.png>")
            sys.exit(1)
        use_xor = '--xor' in sys.argv
        target = open(sys.argv[2], 'rb').read()
        seeds, png_data = encode_v3(target, sys.argv[3], timeout=120.0, use_xor=use_xor)
        sys.exit(0 if seeds else 1)

    elif cmd == 'decode':
        if len(sys.argv) < 3:
            print("Usage: python3 boot3.py decode <input.png> [output_file]")
            sys.exit(1)
        with open(sys.argv[2], 'rb') as f:
            png_data = f.read()
        result = expand_from_png_v3(png_data)
        print(f"Output: {len(result)} bytes")
        try:
            print(f"Text: {result.decode('ascii')!r}")
        except UnicodeDecodeError:
            print(f"Hex: {result.hex()}")
        if len(sys.argv) > 3:
            with open(sys.argv[3], 'wb') as f:
                f.write(result)
            import os
            os.chmod(sys.argv[3], 0o755)
            print(f"Written to: {sys.argv[3]}")

    elif cmd == 'demo':
        print("=" * 60)
        print("PIXELPACK PHASE 3 DEMO")
        print("=" * 60)
        print()
        fib = b'def fibonacci(n):\n    if n <= 0:\n        return 0\n    elif n == 1:\n        return 1\n    else:\n        a, b = 0, 1\n        for i in range(2, n + 1):\n            a, b = b, a + b\n        return b\n\nfor i in range(10):\n    print(f"fib({i}) = {fibonacci(i)}")\n'
        print(f"Target: fibonacci ({len(fib)} bytes)")
        print(f"V2 baseline: 56 pixels")
        print()
        seeds, png_data = encode_v3(fib, '/tmp/fib_v3.png', timeout=120.0)
        if seeds:
            print(f"\nV3: {len(seeds)} pixels (vs 56 V2)")
