#!/usr/bin/env python3
"""Try Huffman-style variable-width encoding for FREQ_TABLE.

Idea: common bytes get shorter codes (2-3 bits), less common get longer (5-7 bits).
Within 28 bits, we can encode MORE bytes if they're common, or fewer if they're rare.
A 7-byte run of top-3 bytes might use only 14-21 bits, leaving room for more.

But: Huffman is complex to decode and variable-length means we don't know
the boundary between indices. We need self-delimiting codes.

Simpler approach: Use Elias gamma coding or a 2-tier table:
- 2-bit tier selector (4 tiers)
- Tier 0: top-7 bytes (3-bit index) 
- Tier 1: bytes 8-23 (4-bit index)
- Tier 2: bytes 24-55 (5-bit index)
- Tier 3: bytes 56-119 (6-bit index)

Each byte costs 2 + N bits. For top-7 bytes: 5 bits each.
For bytes 8-23: 6 bits each. Etc.

28 bits / 5 = 5.6 bytes max for top-7 (worse than current 7).
28 bits / 6 = 4.6 bytes max for top-23.

Still worse than v2! The fundamental constraint is information theory:
4 bits/byte * 7 = 28. That's the max throughput for 15-entry table.
More entries = more bits per entry = fewer entries per seed.

UNLESS we use run-length: if the same byte repeats, encode it as (index, count).
But that's what BYTEPACK mode 0 already does.

Actually: the only way to beat v2 is to use FEWER bits for common bytes.
"""
import sys
sys.path.insert(0,'.')
from collections import Counter

with open('boot3.py', 'rb') as f:
    target = f.read()
freq = Counter(target)
tlen = len(target)

# Approach: Truncated binary encoding
# For 15 entries, we need ceil(log2(15)) = 4 bits per entry.
# For 31 entries, ceil(log2(31)) = 5 bits.
# Can't escape this without variable-length codes.

# Variable-length approach: first byte uses 4 bits. If top bit (bit 3) is 0,
# it's a 3-bit index (0-7 = top 8 bytes). If bit 3 is 1, read 2 more bits
# for a 5-bit index (8-31 = remaining bytes). Total: 3-5 bits per byte.
# For top-8 bytes: 4 bits each (3 data + 1 flag)
# Wait, that's the same as 4 bits. Hmm.

# Unary-prefix approach:
# 0xx = 2-bit index (top 4 bytes), cost 3 bits
# 10xx = 4-bit index (top 16 bytes minus top 4 = 12 more), cost 4+1 = 5 bits  
# Total: 3-5 bits per byte. Top 4 get 3 bits, next 12 get 5 bits.
# 28 / 3 = 9.3 bytes max for top-4-only runs
# 28 / 5 = 5.6 bytes max for extended runs
# 7 common bytes = 7 * 3 = 21 bits + 2 uncommon = 2 * 5 = 10 bits = 31 bits. Over by 3.

# Let me try: 1 bit prefix per byte.
# 0 + 3 bits = top 8 bytes (4 bits each)
# 1 + 4 bits = next 16 bytes (5 bits each)
# Top 24 bytes total.

# 7 top-8 bytes = 7 * 4 = 28 bits. Same as v2!
# But we can now handle top-24 (96%+ coverage).

# Mixed: 5 common (4 bits each) + 1 uncommon (5 bits) = 25 bits. Fits!
# 4 common (16 bits) + 2 uncommon (10 bits) = 26 bits. Fits!
# 3 common (12 bits) + 3 uncommon (15 bits) = 27 bits. Fits!

# Decode: read bit, if 0 read 3 more bits (top-8), if 1 read 4 more bits (extended).
# Stop when we run out of bits or hit terminator (index 0).

# Top-8 by frequency:
top8 = [b for b, _ in freq.most_common(8)]
top24_extra = [b for b, _ in freq.most_common(24)][8:]
set8 = set(top8)
set24 = set(top8 + top24_extra)

covered_24 = sum(freq.get(b, 0) for b in top8 + top24_extra)
print(f"Top-24 coverage: {covered_24}/{tlen} ({covered_24/tlen*100:.1f}%)")

# Simulate: greedy matching with variable-width encoding
seeds_var = 0
bytes_var = 0
pos = 0
while pos < tlen:
    bits_used = 0
    bytes_covered = 0
    while pos + bytes_covered < tlen and bits_used < 28:
        b = target[pos + bytes_covered]
        if b in set8:
            bits_needed = 4  # 0 + 3 bits
        elif b in set24:
            bits_needed = 5  # 1 + 4 bits
        else:
            break  # Not in table
        if bits_used + bits_needed > 28:
            break
        bits_used += bits_needed
        bytes_covered += 1
    if bytes_covered > 0:
        seeds_var += 1
        bytes_var += bytes_covered
        pos += bytes_covered
    else:
        pos += 1

avg_var = bytes_var / max(seeds_var, 1)
print(f"Variable-width (top-24): {seeds_var} seeds, {bytes_var} bytes, {avg_var:.2f} B/seed")

# Compare to v2
top15 = [b for b, _ in freq.most_common(15)]
set15 = set(top15)
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
print(f"v2 (7x4, top-15):      {seeds_v2} seeds, {bytes_v2} bytes, {avg_v2:.2f} B/seed")

# Now check: how many seeds have 7+ bytes with variable encoding?
count_7plus = 0
count_6plus = 0
pos = 0
while pos < tlen:
    bits_used = 0
    bytes_covered = 0
    while pos + bytes_covered < tlen and bits_used < 28:
        b = target[pos + bytes_covered]
        if b in set8:
            bits_needed = 4
        elif b in set24:
            bits_needed = 5
        else:
            break
        if bits_used + bits_needed > 28:
            break
        bits_used += bits_needed
        bytes_covered += 1
    if bytes_covered >= 7:
        count_7plus += 1
    if bytes_covered >= 6:
        count_6plus += 1
    if bytes_covered > 0:
        pos += bytes_covered
    else:
        pos += 1

print(f"\nVariable-width seeds >= 7 bytes: {count_7plus}")
print(f"Variable-width seeds >= 6 bytes: {count_6plus}")

# What's the max possible with variable-width?
# All top-8 bytes: 28 / 4 = 7 bytes (same as v2)
# Mix: 5 top-8 (20 bits) + 1 top-24 extra (5 bits) = 25 bits -> 6 bytes in 28 bits
# Mix: 4 top-8 (16 bits) + 2 extra (10 bits) = 26 bits -> 6 bytes in 28 bits
# Mix: 3 top-8 (12 bits) + 3 extra (15 bits) = 27 bits -> 6 bytes in 28 bits
# Mix: 2 top-8 (8 bits) + 4 extra (20 bits) = 28 bits -> 6 bytes (EXACT)
# All extra: 28 / 5 = 5.6 -> 5 bytes max

# So the variable approach gets:
# - 7 bytes when all are top-8 (same as v2)
# - 5-6 bytes when mixing top-8 and extended
# - 5 bytes when all are extended
# But covers 24 entries instead of 15!

# The key insight: this is STRICTLY BETTER than v2 in coverage
# while being IDENTICAL for pure top-8 runs (7 bytes/seed).
# For mixed runs, it still covers 5-6 bytes where v2 would cover 0.

print("\n=== Verdict ===")
print("Variable-width (1-bit prefix + 3/4-bit index):")
print("  Covers top-24 bytes (vs top-15 for v2)")
print("  7 bytes/seed for pure top-8 runs (same as v2)")
print("  5-6 bytes/seed for mixed runs (v2 covers 0)")
print(f"  Greedy avg: {avg_var:.2f} B/seed (vs {avg_v2:.2f} for v2)")
print(f"  Greedy coverage: {bytes_var} bytes (vs {bytes_v2} for v2)")
