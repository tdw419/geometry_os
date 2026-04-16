#!/usr/bin/env python3
"""Search PRNG seeds for BPE tables that include the missing pairs."""

import sys
sys.path.insert(0, ".")

from analyze_v3 import fib

# The 12 missing pairs from the simulation
needed_pairs = [
    b' 1', b' 0', b'ac', b'fo', b'i ', b'e(', b' +', b' <',
    b'ls', b'a ', b'pr', b'(f',
]

# But we should compute the ACTUAL optimal set of pairs for this file
from collections import Counter

data = fib
pair_freq = Counter()
for i in range(len(data) - 1):
    pair_freq[data[i:i+2]] += 1

print("Top 30 pairs by frequency in fibonacci.py:")
for pair, count in pair_freq.most_common(30):
    print(f"  {repr(pair):12s}  {count:3d}x")

# The optimal BPE table for fibonacci would contain the top 127 pairs.
# Our PRNG generates pairs from printable ASCII. How many of the top 127
# pairs are printable?
printable_pairs = []
nonprintable_pairs = []
for pair, count in pair_freq.most_common(200):
    b1, b2 = pair
    if 32 <= b1 <= 126 and 32 <= b2 <= 126:
        printable_pairs.append(pair)
    else:
        nonprintable_pairs.append(pair)

print(f"\nPrintable pairs in top 200: {len(printable_pairs)}")
print(f"Non-printable: {len(nonprintable_pairs)}")
for pair, count in [(p, pair_freq[p]) for p in nonprintable_pairs[:10]]:
    print(f"  {repr(pair):12s}  {count:3d}x")

# Now search: find PRNG seeds that maximize coverage of the top pairs
top_40_pairs = [p for p, _ in pair_freq.most_common(40)]

a = 1664525
c = 1013904223
_BYTE_POOL = bytes(range(32, 127))

def generate_table(seed):
    state = seed & 0xFFF
    table = set()
    seen = set()
    for _ in range(127 * 3):
        if len(seen) >= 127:
            break
        state = (a * state + c) & 0xFFFFFFFF
        b1 = _BYTE_POOL[state % len(_BYTE_POOL)]
        state = (a * state + c) & 0xFFFFFFFF
        b2 = _BYTE_POOL[state % len(_BYTE_POOL)]
        pair = bytes([b1, b2])
        if pair not in seen:
            seen.add(pair)
    return seen

print("\nSearching 4096 PRNG seeds for best BPE table...")
best_coverage = 0
best_seed = 0
best_table = None

for seed in range(4096):
    table = generate_table(seed)
    covered = sum(1 for p in top_40_pairs if p in table)
    if covered > best_coverage:
        best_coverage = covered
        best_seed = seed
        best_table = table

print(f"Best seed: {best_seed} covering {best_coverage}/40 top pairs")

# Check coverage of our needed pairs
needed_covered = sum(1 for p in needed_pairs if p in best_table)
print(f"Needed pairs covered: {needed_covered}/{len(needed_pairs)}")

missing = [p for p in needed_pairs if p not in best_table]
print(f"Still missing: {[repr(p) for p in missing]}")

# Show what the best table covers
print(f"\nTop 40 pairs covered by best seed ({best_seed}):")
for p in top_40_pairs:
    in_table = "YES" if p in best_table else "NO"
    print(f"  {repr(p):12s}  {pair_freq[p]:3d}x  {in_table}")

# Now: how many seeds would the realistic DP give with this custom table?
print("\n" + "=" * 60)
print(f"DP simulation with custom BPE table (seed={best_seed})...")
print("=" * 60)

custom_pair_to_idx = {}
# Build ordered table like generate_bpe_table does
state = best_seed & 0xFFF
table_list = [b'']
seen = set()
for _ in range(127 * 3):
    if len(table_list) >= 128:
        break
    state = (a * state + c) & 0xFFFFFFFF
    b1 = _BYTE_POOL[state % len(_BYTE_POOL)]
    state = (a * state + c) & 0xFFFFFFFF
    b2 = _BYTE_POOL[state % len(_BYTE_POOL)]
    pair = bytes([b1, b2])
    if pair not in seen:
        seen.add(pair)
        table_list.append(pair)
while len(table_list) < 128:
    table_list.append(b'')

for i, pair in enumerate(table_list):
    if pair:
        custom_pair_to_idx[pair] = i

def max_custom_bpe_coverage(pos):
    remaining = len(data) - pos
    for n_pairs in range(4, 0, -1):
        needed = n_pairs * 2
        if needed > remaining:
            continue
        ok = True
        for p in range(n_pairs):
            pair = bytes([data[pos + p*2], data[pos + p*2 + 1]])
            if pair not in custom_pair_to_idx:
                ok = False
                break
        if ok:
            return needed
    return 0

# Run DP
INF = float('inf')
n = len(data)
dp = [INF] * (n + 1)
dp[0] = 0
parent = [None] * (n + 1)

# LZ77 matches
lz77_at = {}
for pos in range(n):
    matches = []
    for start in range(pos):
        ml = 0
        while pos + ml < n and start + ml < n and data[start + ml] == data[pos + ml]:
            ml += 1
        if ml >= 3:
            matches.append(ml)
    if matches:
        lz77_at[pos] = max(matches)

for pos in range(n):
    if dp[pos] == INF:
        continue
    
    # Custom BPE
    bpe_max = max_custom_bpe_coverage(pos)
    for k in range(2, bpe_max + 1, 2):
        if dp[pos] + 1 < dp[pos + k]:
            dp[pos + k] = dp[pos] + 1
            parent[pos + k] = ('BPE', pos, k)
    
    # BYTEPACK
    for k in range(3, min(6, n - pos + 1)):
        if dp[pos] + 1 < dp[pos + k]:
            dp[pos + k] = dp[pos] + 1
            parent[pos + k] = ('BYTEPACK', pos, k)
    
    # LZ77
    if pos in lz77_at:
        ml = lz77_at[pos]
        for l in range(3, ml + 1):
            if dp[pos] + 1 < dp[pos + l]:
                dp[pos + l] = dp[pos] + 1
                parent[pos + l] = ('LZ77', pos, l)
    
    # Literal
    if dp[pos] + 1 < dp[pos + 1]:
        dp[pos + 1] = dp[pos] + 1
        parent[pos + 1] = ('LIT', pos, 1)

# Reconstruct
p = n
actions = []
while p > 0:
    if parent[p] is None:
        break
    actions.append(parent[p])
    p = parent[p][1]
actions.reverse()

strat_counts = Counter(a[0] for a in actions)
print(f"\nDP result with custom BPE table: {len(actions)} seeds (+1 for SET_BPE_TABLE = {len(actions)+1} total)")
for s, cnt in strat_counts.most_common():
    bytes_covered = sum(a[2] for a in actions if a[0] == s)
    print(f"  {s:10s}: {cnt:2d} seeds, {bytes_covered:3d} bytes")
