#!/usr/bin/env python3
"""Analyze V2 segmentation for LZ77 replacement opportunities."""

from boot2 import _find_multi_seeds_dp
from expand import expand
from expand3 import expand_multi_v3, ExpandContext, expand_with_context
from boot3 import _find_lz77_at, _make_lz77_seed

fib = b'def fibonacci(n):\n    if n <= 0:\n        return 0\n    elif n == 1:\n        return 1\n    else:\n        a, b = 0, 1\n        for i in range(2, n + 1):\n            a, b = b, a + b\n        return b\n\nfor i in range(10):\n    print(f"fib({i}) = {fibonacci(i)}")\n'

# Get V2 segmentation
v2_seeds = _find_multi_seeds_dp(fib, timeout=30.0, max_seeds=128)

# Build segment list
emitted = bytearray()
v2_segments = []
pos = 0
for s in v2_seeds:
    result = expand(s)
    v2_segments.append((pos, pos + len(result), s, result))
    emitted.extend(result)
    pos += len(result)

# Scan for merge opportunities: replace adjacent segments with LZ77
replacements = []
for i in range(len(v2_segments)):
    start_pos = v2_segments[i][0]
    merged_bytes = bytearray()
    for j in range(i, min(i + 6, len(v2_segments))):
        merged_bytes.extend(v2_segments[j][3])
        if len(merged_bytes) < 3:
            continue
        if start_pos > 0:
            search_buf = emitted[:start_pos]
            lz77 = _find_lz77_at(fib, start_pos, search_buf)
            if lz77 and lz77[0] >= len(merged_bytes):
                lz77_len, lz77_offset = lz77
                if lz77_len == len(merged_bytes):
                    seed = _make_lz77_seed(lz77_offset, lz77_len)
                    if seed:
                        saved = (j - i + 1) - 1
                        replacements.append((i, j, seed, saved, bytes(merged_bytes)))

replacements.sort(key=lambda x: -x[3])
print(f'V2 segments: {len(v2_segments)}')
print(f'Replacement opportunities: {len(replacements)}')
print()
print('Top replacements:')
for i, j, seed, saved, data in replacements[:25]:
    print(f'  [{i:2d}:{j+1:2d}] {j-i+1}seeds->1LZ77 saves {saved}px: {data.decode("ascii","replace")!r}')

# Now find the optimal set of non-overlapping replacements
# Greedy: pick highest-savings first, skip overlapping
used = set()
chosen = []
for i, j, seed, saved, data in replacements:
    if any(k in used for k in range(i, j+1)):
        continue
    for k in range(i, j+1):
        used.add(k)
    chosen.append((i, j, seed, saved))

print(f'\nNon-overlapping replacements: {len(chosen)}')
total_saved = sum(s for _, _, _, s in chosen)
print(f'Total savings: {total_saved}px')
print(f'V2: {len(v2_segments)}px -> V3: {len(v2_segments) - total_saved}px')
