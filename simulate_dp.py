#!/usr/bin/env python3
"""DP-optimal simulation: what's the minimum seeds with LZ77 + BPE?"""

import sys
sys.path.insert(0, ".")

from analyze_v3 import fib

data = fib
n = len(data)
print(f"Source: {n} bytes")

# Build match table: for each position, find all substrings that appear
# earlier in the data. This simulates what LZ77 can reference.
# Key: LZ77 can only reference bytes at positions < current pos.
print("Building LZ77 match table...")

# For efficiency, use suffix matching
# For each pos, find all (length, start_pos) where data[start:start+length] == data[pos:pos+length]
# and start < pos
all_matches = {}  # pos -> list of (length, start) sorted by length desc

for pos in range(n):
    matches = []
    for start in range(pos):
        ml = 0
        while pos + ml < n and start + ml < n and data[start + ml] == data[pos + ml]:
            ml += 1
            if ml >= 2:
                matches.append((ml, start))
    # Keep only max-length match per start (longest)
    if matches:
        # Deduplicate: for each start, keep longest
        best = {}
        for length, start in matches:
            if start not in best or length > best[start]:
                best[start] = length
        all_matches[pos] = [(length, start) for start, length in sorted(best.items(), key=lambda x: -x[1])[:5]]
    else:
        all_matches[pos] = []

match_positions = sum(1 for v in all_matches.values() if v)
print(f"Positions with LZ77 matches: {match_positions}/{n}")

# DP: min seeds to encode data[0:n]
# At position pos, accumulated output = data[0:pos]
# Choices:
#   BPE seed: cover k bytes -> advance k, cost 1
#   LZ77 seed: reference data[start:start+length] where start < pos -> advance length, cost 1
INF = float('inf')

# First: max BPE = 11 bytes (DICTX5 range)
for max_bpe in [8, 11, 15]:
    dp = [INF] * (n + 1)
    dp[0] = 0
    parent = [None] * (n + 1)
    
    for pos in range(n):
        if dp[pos] == INF:
            continue
        
        # BPE: cover 1 to max_bpe bytes
        for k in range(1, min(max_bpe + 1, n - pos + 1)):
            cost = dp[pos] + 1
            if cost < dp[pos + k]:
                dp[pos + k] = cost
                parent[pos + k] = ('BPE', pos, k)
        
        # LZ77: reference earlier bytes
        for length, start in all_matches.get(pos, []):
            if start >= pos:
                continue  # can't reference future
            end = pos + length
            if end <= n:
                cost = dp[pos] + 1
                if cost < dp[end]:
                    dp[end] = cost
                    parent[pos + length] = ('LZ77', pos, length)
    
    # Reconstruct
    actions = []
    p = n
    while p > 0:
        if parent[p] is None:
            break
        actions.append(parent[p])
        p = parent[p][1]
    actions.reverse()
    
    bpe = sum(1 for a in actions if a[0] == 'BPE')
    lz77 = sum(1 for a in actions if a[0] == 'LZ77')
    print(f"\nMax BPE={max_bpe}: {dp[n]} seeds ({bpe} BPE + {lz77} LZ77)")
    
    # Show first encoding in detail
    if max_bpe == 11:
        for a in actions:
            action, pos, detail = a
            if action == 'BPE':
                k = detail
                print(f"  BPE   @{pos:3d}: {k:2d}B  {repr(data[pos:pos+k][:40])}")
            else:
                length, start = detail, None
                # Find start from match table
                for l, s in all_matches.get(pos, []):
                    if l == detail:
                        start = s
                        break
                print(f"  LZ77  @{pos:3d}: {detail:2d}B  ref @{start}  {repr(data[pos:pos+detail][:40])}")

print("\n" + "=" * 60)
print("SUMMARY")
print("=" * 60)
print("Current V3: 34 seeds")
print("Theoretical minimum with better LZ77 usage + longer BPE chunks")
print("Target: <25 seeds")
