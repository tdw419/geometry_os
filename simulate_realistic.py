#!/usr/bin/env python3
"""Real feasibility check: what would actually work to beat 34 seeds?"""

import sys
sys.path.insert(0, ".")

from analyze_v3 import fib
from find_seed import BPE_PAIR_TABLE, DICTIONARY, DICTIONARY_EXT, SUB_DICT
from collections import Counter

data = fib
n = len(data)

# Strategy coverage analysis:
# BPE (0x9): 4 pairs * 7 bits, covers 2-8 bytes. Need pairs in table.
# DICTX5 (0x8): 5 entries from DICTIONARY_EXT (5 bits each), covers variable bytes.
# DICTX7 (0xA): 7 entries from SUB_DICT (4 bits each), covers variable bytes.
# BYTEPACK (0xE): packs 3-5 raw bytes.
# LZ77 (0xC): back-reference, 16-bit offset + 12-bit length.
# NIBBLE (0x7): 7 nibbles = 3.5 bytes + table lookup.

# What's the actual coverage of each strategy at each position?
print("Analyzing strategy coverage per position...")
print()

# Check BPE coverage (even lengths only)
pair_to_idx = {}
for i, pair in enumerate(BPE_PAIR_TABLE):
    if pair:
        pair_to_idx[bytes(pair)] = i

def max_bpe_coverage(pos):
    """Max bytes BPE can encode starting at pos."""
    remaining = n - pos
    for n_pairs in range(4, 0, -1):
        needed = n_pairs * 2
        if needed > remaining:
            continue
        ok = True
        for p in range(n_pairs):
            pair = bytes([data[pos + p*2], data[pos + p*2 + 1]])
            if pair not in pair_to_idx:
                ok = False
                break
        if ok:
            return needed
    return 0

# Check DICTX5 coverage
def max_dictx5_coverage(pos):
    """Max bytes DICTX5 can encode starting at pos."""
    remaining = n - pos
    # Try to decompose into 5 DICTIONARY_EXT entries
    best = 0
    for n_entries in range(5, 1, -1):
        # Greedy: try longest prefix match at each step
        total = 0
        p = pos
        entries = []
        for _ in range(n_entries):
            found = False
            # Sort by length desc to get longest match
            for entry_idx in range(len(DICTIONARY_EXT) - 1, -1, -1):
                entry = DICTIONARY_EXT[entry_idx]
                elen = len(entry)
                if p + elen <= n and data[p:p+elen] == bytes(entry):
                    total += elen
                    p += elen
                    entries.append(entry_idx)
                    found = True
                    break
            if not found:
                break
        if len(entries) == n_entries and total > best:
            best = total
    return best

# Check BYTEPACK coverage (3-5 bytes)
def max_bytepack_coverage(pos):
    """Max bytes BYTEPACK can encode."""
    return min(5, n - pos) if n - pos >= 3 else 0

# For each position, find best strategy
results = []
for pos in range(n):
    bpe = max_bpe_coverage(pos)
    bp = max_bytepack_coverage(pos) if n - pos >= 3 else 0
    # Simplified -- don't compute full DICTX5 for every position
    results.append((pos, bpe, bp))

# DP with realistic strategy limits
print("Running DP with realistic BPE limits...")
INF = float('inf')

# Strategy 1: BPE (up to 8 bytes, only if pairs available)
# Strategy 2: BYTEPACK (3-5 bytes)
# Strategy 3: LZ77 (any backreference)
# Strategy 4: DICTX5/DICTX7/NIBBLE (approximate as "up to 11 bytes if dictionary matches")

dp = [INF] * (n + 1)
dp[0] = 0
parent = [None] * (n + 1)

# Pre-compute LZ77 matches
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
    
    # BPE: up to 8 bytes (if pairs available)
    bpe_max = max_bpe_coverage(pos)
    for k in range(2, bpe_max + 1, 2):  # BPE only covers even lengths
        if dp[pos] + 1 < dp[pos + k]:
            dp[pos + k] = dp[pos] + 1
            parent[pos + k] = ('BPE', pos, k)
    
    # BYTEPACK: 3-5 bytes
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
    
    # Single byte literal (worst case)
    if dp[pos] + 1 < dp[pos + 1]:
        dp[pos + 1] = dp[pos] + 1
        parent[pos + 1] = ('LIT', pos, 1)

# Reconstruct
p = n
actions = []
while p > 0:
    if parent[p] is None:
        print(f"GAP at {p}")
        break
    actions.append(parent[p])
    p = parent[p][1]
actions.reverse()

strat_counts = Counter(a[0] for a in actions)
print(f"\nRealistic DP result: {len(actions)} seeds")
for s, c in strat_counts.most_common():
    bytes_covered = sum(a[2] for a in actions if a[0] == s)
    print(f"  {s:10s}: {c:2d} seeds, {bytes_covered:3d} bytes")

# Show the encoding
print()
for i, (action, pos, length) in enumerate(actions):
    chunk = data[pos:pos+length]
    print(f"  {i:2d}: {action:10s} @{pos:3d} {length:2d}B  {repr(chunk[:30])}")

# The real question: what would a "BPE-5" strategy (5 pairs, 10 bytes) need?
print("\n" + "=" * 60)
print("ANALYSIS: What would help most?")
print("=" * 60)

# Count positions where BPE fails for lack of pairs
bpe_fail_positions = 0
missing_pairs = Counter()
for pos in range(n):
    bpe_max = max_bpe_coverage(pos)
    if bpe_max == 0 and pos + 1 < n:
        pair = bytes([data[pos], data[pos+1]])
        missing_pairs[pair] += 1
        bpe_fail_positions += 1

print(f"Positions where BPE fails at first pair: {bpe_fail_positions}")
print("Top missing pairs:")
for pair, count in missing_pairs.most_common(10):
    print(f"  {repr(pair):12s}  {count}x")
