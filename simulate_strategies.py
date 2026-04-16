#!/usr/bin/env python3
"""Simulate encoding strategies on fibonacci data to project seed savings."""

import sys
sys.path.insert(0, ".")

from analyze_v3 import fib
from boot3 import encode_v3

# First, let's see the raw byte layout
print("=" * 60)
print("FIBONACCI SOURCE ANALYSIS")
print("=" * 60)
print(f"Total bytes: {len(fib)}")
print(f"Source:\n{fib.decode()}")
print()

# Show repeated substrings
from collections import Counter
repeats = Counter()
for length in [3, 4, 5, 6]:
    for i in range(len(fib) - length):
        s = fib[i:i+length]
        repeats[s] += 1

print("Most repeated 3-6 byte sequences:")
for seq, count in repeats.most_common(20):
    if count >= 2:
        pct = (count * len(seq) / len(fib)) * 100
        print(f"  {count}x  {repr(seq):30s}  ({count * len(seq)}B = {pct:.1f}% of file)")

# Now simulate: what if seeds could reference previous seed output?
print("\n" + "=" * 60)
print("SIMULATION 1: Cross-seed backreferences")
print("=" * 60)

# Encode with V3 to get the 34 seeds
seeds, png_data = encode_v3(fib, '/tmp/fib_sim.png')
print(f"V3 seeds: {len(seeds)}")

# Now simulate: what if we had a "backreference" strategy that could
# say "copy bytes [X:Y] from seed N's output"?
# Each seed would need: (seed_ref, start, length) = ~12 bits
# With 28 bits of payload, that's ~2 backreferences per seed
# But we also need the "new data" part

# Let's measure: how many bytes in the file are copies of bytes 
# that appeared earlier in the file?
def find_longest_match(data, pos, window_start=0):
    """Find longest match of data[pos:] in data[window_start:pos]."""
    best_len = 0
    best_off = 0
    max_len = min(50, len(data) - pos)  # cap at 50 bytes
    for start in range(window_start, pos):
        match_len = 0
        while match_len < max_len and pos + match_len < len(data):
            if data[start + match_len] == data[pos + match_len]:
                match_len += 1
            else:
                break
            # Don't go past start of data
            if start + match_len > pos:
                break
        if match_len > best_len:
            best_len = match_len
            best_off = pos - start
    return best_off, best_len

# Greedy LZ-style analysis
total_matched = 0
total_literal = 0
matches = []
pos = 0
while pos < len(fib):
    offset, length = find_longest_match(fib, pos, max(0, pos - 256))
    if length >= 3:  # minimum match length
        matches.append((pos, offset, length))
        total_matched += length
        pos += length
    else:
        total_literal += 1
        pos += 1

print(f"Total bytes: {len(fib)}")
print(f"Matched bytes: {total_matched} ({total_matched/len(fib)*100:.1f}%)")
print(f"Literal bytes: {total_literal} ({total_literal/len(fib)*100:.1f}%)")
print(f"Number of matches: {len(matches)}")
print(f"Avg match length: {total_matched/len(matches) if matches else 0:.1f}")
print()
print("Top 10 longest matches:")
for pos, offset, length in sorted(matches, key=lambda x: -x[2])[:10]:
    print(f"  @{pos:3d}: offset={offset:3d}, len={length:2d}  {repr(fib[pos:pos+min(length,30)])}")

# How many seeds would this save?
# Each backreference replaces a seed that would otherwise encode those bytes
# Average seed covers ~7 bytes (254/34)
avg_seed_coverage = len(fib) / len(seeds)
backref_seeds_saved = int(total_matched / avg_seed_coverage)
print(f"\nAvg seed covers {avg_seed_coverage:.1f} bytes")
print(f"Estimated seeds saved by backrefs: {backref_seeds_saved}")
print(f"Projected total: {len(seeds) - backref_seeds_saved} seeds")

print("\n" + "=" * 60)
print("SIMULATION 2: Delta encoding between seeds")
print("=" * 60)

# Encode each segment and compare adjacent outputs
# Use the V2 segment boundaries from the analysis
from expand import expand, seed_from_rgba
from expand3 import expand_with_context, ExpandContext

# Let's just analyze the raw file for delta encoding opportunity
# Compare adjacent N-byte blocks
block_sizes = [7, 8, 10]  # typical seed expansion sizes
for block_size in block_sizes:
    total_delta = 0
    num_blocks = len(fib) // block_size
    for i in range(1, num_blocks):
        prev = fib[(i-1)*block_size : i*block_size]
        curr = fib[i*block_size : (i+1)*block_size]
        # XOR delta
        delta = bytes(a ^ b for a, b in zip(prev, curr))
        zero_count = delta.count(0)
        total_delta += len(delta) - zero_count
    avg_nonzero = total_delta / max(num_blocks - 1, 1)
    print(f"  Block size {block_size}: avg nonzero delta bytes = {avg_nonzero:.1f}/{block_size} ({avg_nonzero/block_size*100:.0f}%)")

print("\n" + "=" * 60)
print("SIMULATION 3: Variable-length seeds (2 pixels = 64 bits)")
print("=" * 60)

# Count how many segments are "wasteful" -- small (3-5 bytes) when they could be merged
# with neighbors
segments = []
pos = 0
# Reconstruct from the V2 analysis output (we know the segments from above)
seg_data = [
    (8, 0), (5, 8), (8, 13), (8, 21), (4, 29), (8, 33), (11, 41),
    (8, 52), (8, 60), (8, 68), (8, 76), (8, 84), (8, 92), (8, 100),
    (6, 108), (7, 114), (8, 121), (6, 129), (3, 135), (8, 138),
    (8, 146), (8, 154), (8, 162), (3, 170), (8, 173), (8, 181),
    (3, 189), (3, 192), (8, 195), (5, 203), (6, 208), (10, 214),
    (3, 224), (3, 227), (8, 230), (8, 238), (8, 246),
]

small_segs = [(sz, off) for sz, off in seg_data if sz <= 5]
large_segs = [(sz, off) for sz, off in seg_data if sz >= 8]
print(f"Small segments (<=5 bytes): {len(small_segs)} -> {sum(s for s,_ in small_segs)} bytes")
print(f"Large segments (>=8 bytes): {len(large_segs)} -> {sum(s for s,_ in large_segs)} bytes")
print(f"Medium segments (6-7 bytes): {len(seg_data) - len(small_segs) - len(large_segs)}")

# What if we merged adjacent small segments into a single 64-bit seed?
merged = 0
used = set()
for i in range(len(seg_data)):
    if i in used:
        continue
    sz, off = seg_data[i]
    if sz <= 5 and i + 1 < len(seg_data):
        next_sz, next_off = seg_data[i+1]
        combined = sz + next_sz
        if combined <= 15:  # a 64-bit seed could handle this
            merged += 1
            used.add(i)
            used.add(i+1)
            print(f"  Merge seg {i} ({sz}B) + seg {i+1} ({next_sz}B) = {combined}B in 1 double-seed")
print(f"\nMerged {merged} pairs -> saved {merged} seeds")
print(f"Projected: {len(seg_data) - merged} seeds")

print("\n" + "=" * 60)
print("SUMMARY")
print("=" * 60)
print(f"Current: {len(seeds)} seeds")
print(f"Cross-seed backrefs: ~{len(seeds) - backref_seeds_saved} seeds (est)")
print(f"Delta encoding: moderate (adjacent blocks share ~50% bytes)")
print(f"Variable-length seeds: ~{len(seg_data) - merged} seeds (from merging small pairs)")
print(f"Combined (backrefs + variable-length): ~{len(seeds) - backref_seeds_saved - merged} seeds")
