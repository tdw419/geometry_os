#!/usr/bin/env python3
"""Find the optimal FREQ_TABLE format within 28 bits that maximizes DP utility."""
import sys
sys.path.insert(0,'.')
from collections import Counter

with open('boot3.py', 'rb') as f:
    target = f.read()
freq = Counter(target)
tlen = len(target)

# We have 28 bits. We want to maximize B/seed in positions where BYTEPACK fails.
# BYTEPACK fails when: no repeat pattern, no XOR pattern.
# FREQ succeeds when: bytes are in the table.

# Current v2: 7 x 4-bit = 28 bits, top-15 table, max 7B
# The constraint: 4-bit indices max 16 values (1 terminator + 15 data)

# Can we do better with 28 bits?
# 7 x 4-bit = 28: top-15, max 7B (current)
# 5 x 5-bit = 25: top-31, max 5B (too short)
# 4 x 7-bit = 28: top-127, max 4B (way too short)
# 6 x 4-bit + 1 x 4-bit = 28: same as v2

# Hybrid idea: use variable-length encoding within the 28 bits
# Rice coding: common bytes get shorter codes, rare bytes get longer
# But that makes decode complex and unpredictable length.

# Better idea: DUAL TABLE. 2-bit submode + 26 data bits.
# 00: 6 x 4-bit into top-15 (max 6B) -- like v2 with 1 fewer slot
# 01: 4 x 6-bit into top-63 (max 4B)
# This steals 2 bits, reducing v2 from 7 to 6. Is the tradeoff worth it?

# With 6x4 top-15:
top15 = [b for b, _ in freq.most_common(15)]
set15 = set(top15)
seeds_6x4 = 0
bytes_6x4 = 0
pos = 0
while pos < tlen:
    best_len = 0
    for seg_len in range(min(6, tlen - pos), 0, -1):
        if all(target[pos+j] in set15 for j in range(seg_len)):
            best_len = seg_len
            break
    if best_len > 0:
        seeds_6x4 += 1
        bytes_6x4 += best_len
        pos += best_len
    else:
        pos += 1
avg_6x4 = bytes_6x4 / max(seeds_6x4, 1)
print(f"6x4 top-15: {seeds_6x4} seeds, {bytes_6x4} bytes, {avg_6x4:.2f} B/seed")

# With 4x6 top-63:
top63 = [b for b, _ in freq.most_common(63)]
set63 = set(top63)
seeds_4x6 = 0
bytes_4x6 = 0
pos = 0
while pos < tlen:
    best_len = 0
    for seg_len in range(min(4, tlen - pos), 0, -1):
        if all(target[pos+j] in set63 for j in range(seg_len)):
            best_len = seg_len
            break
    if best_len > 0:
        seeds_4x6 += 1
        bytes_4x6 += best_len
        pos += best_len
    else:
        pos += 1
avg_4x6 = bytes_4x6 / max(seeds_4x6, 1)
print(f"4x6 top-63: {seeds_4x6} seeds, {bytes_4x6} bytes, {avg_4x6:.2f} B/seed")

# Hybrid: use 6x4 for positions where top-15 covers 6+ bytes,
# use 4x6 for positions where top-15 fails but top-63 covers 4+ bytes
seeds_hybrid = 0
bytes_hybrid = 0
pos = 0
while pos < tlen:
    # Try 6x4 (top-15) first
    best_len_15 = 0
    for seg_len in range(min(6, tlen - pos), 0, -1):
        if all(target[pos+j] in set15 for j in range(seg_len)):
            best_len_15 = seg_len
            break
    # Try 4x6 (top-63)
    best_len_63 = 0
    for seg_len in range(min(4, tlen - pos), 0, -1):
        if all(target[pos+j] in set63 for j in range(seg_len)):
            best_len_63 = seg_len
            break
    # Pick the better one
    best_len = max(best_len_15, best_len_63)
    if best_len > 0:
        seeds_hybrid += 1
        bytes_hybrid += best_len
        pos += best_len
    else:
        pos += 1
avg_hybrid = bytes_hybrid / max(seeds_hybrid, 1)
print(f"hybrid:     {seeds_hybrid} seeds, {bytes_hybrid} bytes, {avg_hybrid:.2f} B/seed")

# Compare to v2 (7x4, top-15)
seeds_v2 = 0
bytes_v2 = 0
pos = 0
while pos < tlen:
    best_len = 0
    for seg_len in range(min(7, tlen - pos), 0, -1):
        if all(target[pos+j] in set15 for j in range(seg_len)):
            best_len = seg_len
            break
    if best_len > 0:
        seeds_v2 += 1
        bytes_v2 += best_len
        pos += best_len
    else:
        pos += 1
avg_v2 = bytes_v2 / max(seeds_v2, 1)
print(f"v2 (7x4):   {seeds_v2} seeds, {bytes_v2} bytes, {avg_v2:.2f} B/seed")

# What about: use top-15 but add 1 "escape" byte.
# 6 x 4-bit into top-15 + 1 x 4-bit escape code
# When index = 0xF (15), read the next 4 bits as a LITERAL nibble
# Nah, too complex.

# What about: instead of changing the encoding, change the TABLE SELECTION.
# Current: top-15 by global frequency.
# Better: top-15 that maximizes 7-byte run coverage.
# This is a SET COVER problem -- pick 15 bytes that maximize contiguous runs.

# Greedy set cover: pick bytes one at a time, each time picking the byte
# that adds the most new 7-byte runs.
print()
print("=== Optimized table selection ===")

# Current top-15
runs_15 = 0
for i in range(tlen - 6):
    if all(target[j] in set15 for j in range(i, i+7)):
        runs_15 += 1
print(f"Top-15 by frequency: {runs_15} 7-byte runs")

# Greedy: pick 15 bytes that maximize 7-byte runs
best_table = []
remaining_bytes = set(freq.keys())
for _ in range(15):
    best_b = None
    best_runs = -1
    for b in remaining_bytes:
        candidate = set(best_table + [b])
        runs = 0
        for i in range(tlen - 6):
            if all(target[j] in candidate for j in range(i, i+7)):
                runs += 1
        if runs > best_runs:
            best_runs = runs
            best_b = b
    best_table.append(best_b)
    remaining_bytes.discard(best_b)

set_opt = set(best_table)
runs_opt = sum(1 for i in range(tlen - 6) if all(target[j] in set_opt for j in range(i, i+7)))
print(f"Top-15 by set cover: {runs_opt} 7-byte runs")
print(f"Table: {bytes(best_table)}")

# Greedy match with optimized table
seeds_opt = 0
bytes_opt = 0
pos = 0
while pos < tlen:
    best_len = 0
    for seg_len in range(min(7, tlen - pos), 0, -1):
        if all(target[pos+j] in set_opt for j in range(seg_len)):
            best_len = seg_len
            break
    if best_len > 0:
        seeds_opt += 1
        bytes_opt += best_len
        pos += best_len
    else:
        pos += 1
avg_opt = bytes_opt / max(seeds_opt, 1)
print(f"Set cover table: {seeds_opt} seeds, {bytes_opt} bytes, {avg_opt:.2f} B/seed")
