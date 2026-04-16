#!/usr/bin/env python3
"""Profile: what if we keep 7-byte max but use variable-width indices?"""
import sys
sys.path.insert(0,'.')
from collections import Counter

with open('boot3.py', 'rb') as f:
    target = f.read()
freq = Counter(target)
tlen = len(target)

# Current v2: 7 x 4-bit = 28 bits. Top-15. 75.3% coverage. Avg match 3.7 (greedy).
# v3a: 5 x 5-bit = 25 bits. Top-31. 91.5% coverage. Avg match 4.4.
# But v3a only gets 5 bytes max vs 7 for v2. And the DP barely uses it.

# What about: keep the 4-bit indices (7 max) but use a SMARTER 15-entry table?
# Instead of top-15 by raw frequency, pick the 15 bytes that maximize
# the number of 7-byte runs (contiguous sequences of table bytes).

# Or: What if we use 7x4-bit but allow index 0xF (15) as an escape
# to mean "use next 4 bits as a literal nibble"? No, too complex.

# Better idea: The v2 format IS good when the top-15 covers the right bytes.
# The problem is that 15 bytes can't cover Python source well.
# But 7 bytes/seed at 4.0 avg is still competitive with BYTEPACK at 4.3.

# What about keeping v2 (7x4, top-15) for the REGULAR path, but adding
# a v3a submode (5x5, top-31) as an ALTERNATE when bytes aren't in top-15?

# Submode encoding: use bit 27 as a flag.
# If bit 27 == 0: 7 x 4-bit into top-15 (current v2 format, 28 bits)
# If bit 27 == 1: 5 x 5-bit into top-31 (v3a format, bits 0-24 = data, bit 27 = 1)
# This way we get BOTH formats in the same seed space.

# But wait -- the current v2 format uses ALL 28 bits (7 x 4 = 28).
# Setting bit 27 would break v2 decoding. We'd need to steal a bit.
# 6 x 4-bit = 24 bits, leaving bits 24-27 (4 bits) for submode + table info.
# That reduces v2 from 7 to 6 bytes max. Not great.

# Alternative: use 6 x 4-bit for v2 (max 6B) and 4 x 6-bit for extended (max 4B).
# [2:0] submode (0-3): 0-2 = v2 with 6x4bit, 3 = extended 4x6bit into top-64
# Nah, only 3 data bits lost.

# Actually the simplest approach: keep v2 (7x4, top-15) as is.
# The 7-byte max is better than 5-byte. The coverage (75%) is the weakness.
# But the DP still found 259 uses for it (7.0 B/seed avg in production).
# That's because the DP cherry-picks positions where top-15 bytes cluster.

# So the question is: what format maximizes the DP's ability to find
# positions where FREQ beats BYTEPACK?

# BYTEPACK strengths: handles any byte (universal), up to 18B/seed for repeats.
# FREQ strengths: handles common bytes, no first-byte-repeat constraint.

# FREQ is useful when:
# 1. A run of common bytes that BYTEPACK can't match (no repeat pattern)
# 2. Run is long enough to be worth a seed (3+ bytes)

# With top-15: 75% coverage, avg 3.7 B/seed greedy (7 max)
# With top-31: 91.5% coverage, avg 4.4 B/seed greedy (5 max)
# With top-31 but allowing up to 5 indices: 
#   5 x 5-bit = 25 bits, leaving 3 bits. Could use for 1 more 4-bit index?
#   5 x 5-bit + 1 x 3-bit = 28 bits (3-bit into top-7 of the 31)
#   That gives 6 bytes/seed! With 91.5% coverage.

# Let's profile that: 5 x 5-bit + 1 x 3-bit, top-31 table
top31 = [b for b, _ in freq.most_common(31)]
set31 = set(top31)

# Greedy matching: max 6 bytes per seed (5 full + 1 partial)
seeds_v3b = 0
bytes_v3b = 0
pos = 0
while pos < tlen:
    # First 5 bytes must be in top-31 (5-bit indices)
    # 6th byte must be in top-7 of the 31 (3-bit index, 1-7)
    best_len = 0
    # Try 6 first
    if pos + 6 <= tlen:
        # First 5 in top-31
        ok5 = all(target[pos+j] in set31 for j in range(5))
        if ok5:
            # 6th byte must be in top-7
            top7 = set(top31[:7])
            if target[pos+5] in top7:
                best_len = 6
    if best_len == 0:
        # Try 5
        if pos + 5 <= tlen and all(target[pos+j] in set31 for j in range(5)):
            best_len = 5
    if best_len == 0:
        # Try shorter (just top-31, 5-bit only)
        for seg_len in range(min(4, tlen - pos), 0, -1):
            if all(target[pos+j] in set31 for j in range(seg_len)):
                best_len = seg_len
                break
    if best_len > 0:
        seeds_v3b += 1
        bytes_v3b += best_len
        pos += best_len
    else:
        pos += 1

avg_v3b = bytes_v3b / max(seeds_v3b, 1)
print(f"v3b (top-31, 5x5+1x3): {seeds_v3b} seeds, {bytes_v3b} bytes, {avg_v3b:.2f} B/seed")

# Compare to v2 (7x4, top-15)
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
print(f"v2  (top-15, 7x4):     {seeds_v2} seeds, {bytes_v2} bytes, {avg_v2:.2f} B/seed")

# How about: variable submode using bit pattern
# If bits[27:25] == 000: 7 x 4-bit into top-15 (v2, max 7B, bits 0-27)
# Wait that uses all 28 bits for data. Can't use a submode bit.

# Different approach: DON'T use a submode. Just use a bigger table.
# 5 x 5-bit into top-31. Max 5B. Simple, clean, 91.5% coverage.
# The issue is it doesn't get used. But WHY?
# Answer: BYTEPACK gets 4-5B on the same positions. The DP picks BYTEPACK
# because it's listed FIRST in the match enumeration, and the dedup keeps
# the first entry per length.

# AHA! That's the bug! The dedup at line 1546-1550 keeps FIRST match per length.
# BYTEPACK is enumerated BEFORE FREQ_TABLE. For a 5-byte position where both
# BYTEPACK and FREQ_TABLE can match, BYTEPACK wins the slot.
# But it shouldn't matter since both cost 1 seed and cover the same bytes.
# Unless BYTEPACK has some positions where it covers 5 but FREQ could cover 5
# at a position BYTEPACK only covers 4...

# Actually the issue is more fundamental: BYTEPACK has mode constraints
# (repeat patterns, XOR patterns). FREQ_TABLE has different constraints
# (bytes must be in the table). They overlap in some positions but not all.
# The DP should pick whichever covers more.

# The real test: does v3a (5x5) help the DP compared to v2 (7x4)?
# With v2: 259 FREQ seeds used (from production run)
# With v3a: 1 FREQ seed used (from our test run)
# v3a is WORSE because 5B max < BYTEPACK's 4-5B avg, so DP skips it.

# CONCLUSION: Keep v2 format (7x4, top-15) but look for other improvements.
# The 7-byte max is critical -- it's what makes FREQ competitive with BYTEPACK.

print()
print("CONCLUSION: v2 (7x4, top-15) with 7B max is better for the DP than v3a (5x5, top-31).")
print("The 7-byte max allows FREQ to cover positions BYTEPACK can't.")
print("The 91.5% coverage of top-31 doesn't help when max drops to 5B.")
print()
print("Reverting to v2 format.")
