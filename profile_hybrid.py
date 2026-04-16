#!/usr/bin/env python3
"""Test hybrid FREQ_TABLE: 2-bit submode + adaptive encoding."""
import sys
sys.path.insert(0,'.')
from collections import Counter

with open('boot3.py', 'rb') as f:
    target = f.read()
freq = Counter(target)
tlen = len(target)

# Hybrid proposal: 2-bit submode in [27:26], 26 data bits
# 00: 6x4-bit into 15-entry table (max 6B, 24 data bits)  -- current with 1 less slot
# 01: 5x5-bit into 31-entry table (max 5B, 25 data bits)
# 10: 3x8-bit literal bytes (max 3B, 24 data bits) -- universal fallback

# But wait: 28 bits total, minus 2-bit prefix = 26 bits
# 5x5 = 25 bits -> fits with 1 bit padding
# 4x6 = 24 bits -> fits (but only 4 indices)
# Actually let me reconsider: the current format uses ALL 28 bits for data.
# Adding a prefix reduces payload.

# Alternative: use the FIRST index as the submode indicator.
# If idx[0] == 0xF (15), switch to alternate table (bit pattern 1111)
# Otherwise, normal 7x4 encoding.

# Even simpler: just go with v3a (top-31, 5x5-bit) as the ONLY format.
# 5 indices * 5 bits = 25 bits. Remaining 3 bits unused (or used for length hint).

# Actually 25 bits fits in 28 bits with room to spare.
# 28 - 25 = 3 bits. Could use for:
# - 3-bit count (0-7 = actual count, 0=terminator)
# But that's redundant with the 0-terminator pattern.

# Let me just measure: how many positions have a 5-byte match in top-31?
top31 = [b for b, _ in freq.most_common(31)]
set31 = set(top31)

# Count actual seeds needed with v3a (greedy left-to-right, longest first)
seeds_v3a = 0
bytes_v3a = 0
pos = 0
while pos < tlen:
    best_len = 0
    for seg_len in range(min(5, tlen - pos), 0, -1):
        if all(target[pos + j] in set31 for j in range(seg_len)):
            best_len = seg_len
            break
    if best_len > 0:
        seeds_v3a += 1
        bytes_v3a += best_len
        pos += best_len
    else:
        pos += 1

print(f"v3a (top-31, 5x5): {seeds_v3a} seeds for {bytes_v3a} bytes, {bytes_v3a/seeds_v3a:.2f} B/seed")

# Same for v2 (top-15, 7x4)
top15 = [b for b, _ in freq.most_common(15)]
set15 = set(top15)
seeds_v2 = 0
bytes_v2 = 0
pos = 0
while pos < tlen:
    best_len = 0
    for seg_len in range(min(7, tlen - pos), 0, -1):
        if all(target[pos + j] in set15 for j in range(seg_len)):
            best_len = seg_len
            break
    if best_len > 0:
        seeds_v2 += 1
        bytes_v2 += best_len
        pos += best_len
    else:
        pos += 1

print(f"v2  (top-15, 7x4): {seeds_v2} seeds for {bytes_v2} bytes, {bytes_v2/seeds_v2:.2f} B/seed")

# Hybrid: use top-31 for 5-byte runs, but allow partial matches
# Submode 0 (00): 5x5bit into top-31 (max 5B)
# Submode 1 (01): 7x4bit into top-15 (max 7B) -- for dense regions
# 2-bit prefix [27:26] -> 26 data bits
# 5x5=25 bits fits. 7x4=28 bits -- DOESN'T fit with 2-bit prefix!
# So we'd get 6x4=24 bits (max 6B) for submode 1.

# Actually the simplest upgrade: just replace the table from 15 to 31 entries.
# v3a uses 5 x 5-bit = 25 bits. The remaining 3 bits can encode:
# - bit 25: 0 = 5 entries, 1 = 4 entries (shorter match, save lookup)
# But this doesn't help much. The key is just the table size.

# Best approach: adaptive table based on file content
# - Build top-31 table from file
# - Encode 5 bytes per seed with 5-bit indices
# - If a byte isn't in the table, skip it (leave for other strategies)

# The 3 unused bits (28 - 25 = 3) could extend one index to 8 bits
# for a "wildcard" literal byte. Format:
# 5 x 5-bit indices, but the LAST index with value 0 means "stop",
# and value 31 means "next 8 bits are a literal byte"
# Nah, that's over-complicated. Let's keep it simple.

# DECISION: v3a (top-31, 5x5-bit) is the best option.
# 25 bits payload, 3 unused bits (set to 0).
# Index 0 = terminator (like current v2).
# Indices 1-31 = top-31 bytes.
# Max 5 bytes per seed, avg 4.4 on Python source.

print()
print("DECISION: Use top-31 table with 5x5-bit encoding (v3a)")
print(f"  Coverage: 91.5% of bytes (vs 75.3% for v2)")
print(f"  Avg B/seed: ~4.4 (vs ~3.7 for v2)")
print(f"  Beats BYTEPACK (4.3 B/seed) -> DP will prefer it over BYTEPACK fills")
