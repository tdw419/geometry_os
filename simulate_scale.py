#!/usr/bin/env python3
"""The real question: do these strategies scale? fibonacci is too small."""

import sys
sys.path.insert(0, ".")

from analyze_v3 import fib

# fibonacci is 254 bytes, 34 seeds = 7.5 bytes/seed
# The issue is that 254 bytes isn't enough for LZ77/reuse to dominate.
# What would a larger file look like?

# Let's check: what does the current encoder do on itself?
import os
from collections import Counter

# Try encoding boot3.py (the encoder itself -- much larger, lots of repetition)
boot3_path = os.path.expanduser("~/zion/projects/pixelpack/boot3.py")
if os.path.exists(boot3_path):
    with open(boot3_path, 'rb') as f:
        boot3_data = f.read()
    print(f"boot3.py: {len(boot3_data)} bytes")
    
    # Count repetition
    pair_freq = Counter()
    for i in range(len(boot3_data) - 1):
        pair_freq[boot3_data[i:i+2]] += 1
    
    # Top pairs
    print("Top 10 pairs:")
    for pair, count in pair_freq.most_common(10):
        print(f"  {repr(pair):12s}  {count:4d}x")
    
    # LZ77 potential
    data = boot3_data
    total_matched = 0
    pos = 0
    matches = []
    while pos < len(data):
        best_len = 0
        for start in range(max(0, pos - 65535), pos):
            ml = 0
            while pos + ml < len(data) and start + ml < len(data) and data[start + ml] == data[pos + ml]:
                ml += 1
            if ml > best_len:
                best_len = ml
        if best_len >= 3:
            matches.append(best_len)
            total_matched += best_len
            pos += best_len
        else:
            pos += 1
    
    print(f"\nLZ77 potential:")
    print(f"  Matched: {total_matched}/{len(data)} bytes ({total_matched/len(data)*100:.1f}%)")
    print(f"  Matches: {len(matches)}")
    if matches:
        print(f"  Avg length: {total_matched/len(matches):.1f}")
    
    # Current seed count estimate
    seeds_est = (len(data) - total_matched + 7) // 8 + len(matches)
    print(f"  Estimated seeds: ~{seeds_est}")
    print(f"  Bytes/seed: {len(data)/seeds_est:.1f}")
else:
    print("boot3.py not found")

# What about expand.py?
from collections import Counter
expand_path = os.path.expanduser("~/zion/projects/pixelpack/expand.py")
if os.path.exists(expand_path):
    with open(expand_path, 'rb') as f:
        expand_data = f.read()
    print(f"\nexpand.py: {len(expand_data)} bytes")
    
    data = expand_data
    total_matched = 0
    pos = 0
    match_count = 0
    while pos < len(data):
        best_len = 0
        for start in range(max(0, pos - 65535), pos):
            ml = 0
            while pos + ml < len(data) and start + ml < len(data) and data[start + ml] == data[pos + ml]:
                ml += 1
            if ml > best_len:
                best_len = ml
        if best_len >= 3:
            total_matched += best_len
            match_count += 1
            pos += best_len
        else:
            pos += 1
    
    print(f"LZ77 potential: {total_matched}/{len(data)} bytes ({total_matched/len(data)*100:.1f}%)")
    seeds_est = (len(data) - total_matched + 7) // 8 + match_count
    print(f"Estimated seeds: ~{seeds_est}")
    print(f"Bytes/seed: {len(data)/seeds_est:.1f}")

print("\n" + "=" * 60)
print("KEY INSIGHT")
print("=" * 60)
print("fibonacci.py is 254 bytes with 59% LZ77 redundancy.")
print("Larger Python files will have MORE redundancy (more repetition).")
print("The strategies that don't help on fibonacci WILL help on larger files.")
print()
print("Current 34 seeds is near-optimal for 254 bytes.")
print("The real test: encode a 1KB+ file and see if the same tools help.")
