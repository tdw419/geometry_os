#!/usr/bin/env python3
"""Check: can the BPE pair table actually encode the 11-byte chunks from the DP simulation?"""

import sys
sys.path.insert(0, ".")

from analyze_v3 import fib
from find_seed import BPE_PAIR_TABLE

data = fib

# The DP simulation's 23-seed solution (max BPE=11):
# Each BPE chunk is 7-11 bytes. Check if BPE can encode them.
chunks_11 = [
    (0, 10), (10, 11), (21, 11), (32, 11), (43, 11), (54, 11),
    # LZ77 at 65, len 17 -- skip
    (82, 7), (89, 11), (100, 11), (111, 11), (122, 11), (133, 11),
    (144, 11), (155, 11), (166, 11), (177, 11), (188, 11), (199, 11),
    (210, 11), (221, 11), (232, 11), (243, 11),
]

# Build pair lookup
pair_to_idx = {}
for i, pair in enumerate(BPE_PAIR_TABLE):
    if pair:
        pair_to_idx[pair] = i

print(f"BPE pair table: {len(BPE_PAIR_TABLE)} entries")
print(f"Unique pairs: {len(pair_to_idx)}")

encodable = 0
not_encodable = 0
for pos, length in chunks_11:
    chunk = data[pos:pos+length]
    # Try to encode with BPE pairs (2 bytes per pair)
    pairs_needed = (length + 1) // 2
    can_encode = True
    missing = []
    for i in range(0, length - 1, 2):
        pair = bytes([chunk[i], chunk[i+1]])
        if pair not in pair_to_idx:
            can_encode = False
            missing.append(repr(pair))
    if length % 2 == 1:
        # Odd byte -- BPE can't handle odd lengths directly
        can_encode = False
        missing.append("odd length")
    
    if can_encode:
        encodable += 1
        status = "OK"
    else:
        not_encodable += 1
        status = f"FAIL ({', '.join(missing[:3])})"
    
    print(f"  @{pos:3d}: {length:2d}B  {repr(chunk[:20]):30s}  {status}")

print(f"\nEncodable: {encodable}/{len(chunks_11)}")
print(f"Not encodable: {not_encodable}/{len(chunks_11)}")

# What if we use 5 BPE pairs instead of 4? (10 bytes)
# Current: 4 pairs * 7 bits = 28 bits. 5 pairs * 7 bits = 35 bits -- too big for 28-bit payload
# But we could use 5 pairs * 5 bits = 25 bits if we limit to 32 pairs
print("\n--- BPE payload math ---")
print("Current: 4 pairs * 7 bits = 28 bits (128 pairs)")
print("Extended: 5 pairs * 5 bits = 25 bits (32 pairs)")
print("Extended: 5 pairs * 6 bits = 30 bits (64 pairs) -- needs 30-bit payload")

# Check: how many of the BPE pairs are actually used for this file?
used_pairs = set()
for i in range(len(data) - 1):
    pair = data[i:i+2]
    if pair in pair_to_idx:
        used_pairs.add(pair)
print(f"\nPairs used for fibonacci: {len(used_pairs)}")

# Top pairs by frequency
from collections import Counter
pair_freq = Counter()
for i in range(len(data) - 1):
    pair_freq[data[i:i+2]] += 1
print("Top 10 pairs by frequency:")
for pair, count in pair_freq.most_common(10):
    idx = pair_to_idx.get(pair, -1)
    print(f"  {repr(pair):12s}  {count:3d}x  idx={idx}")
