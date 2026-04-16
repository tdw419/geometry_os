#!/usr/bin/env python3
"""Simulation: Direct BPE pair injection via boot pixels."""

import sys
sys.path.insert(0, ".")

from analyze_v3 import fib
from find_seed import BPE_PAIR_TABLE
from collections import Counter

data = fib
n = len(data)

# Which pairs would we inject? The pairs that appear most in fibonacci
# but are NOT in the default BPE table.
pair_freq = Counter()
for i in range(len(data) - 1):
    pair_freq[data[i:i+2]] += 1

default_pairs = set()
for p in BPE_PAIR_TABLE:
    if p:
        default_pairs.add(bytes(p))

# Missing pairs, ranked by frequency
missing = []
for pair, count in pair_freq.most_common(200):
    if pair not in default_pairs and 32 <= pair[0] <= 126 and 32 <= pair[1] <= 126:
        missing.append((pair, count))

print("Pairs needed but missing from default BPE table:")
total_impact = 0
for pair, count in missing[:20]:
    # Each pair occurrence saves 1 byte in a BPE encoding
    print(f"  {repr(pair):12s}  {count:3d}x")
    total_impact += count
print(f"Total missing pair occurrences: {total_impact}")

# What if we inject the top N missing pairs?
# Each boot pixel can inject ~4 pairs (28 bits / 7 bits per pair index)
# But actually, we need to encode: (position_in_table, pair_byte1, pair_byte2)
# That's 7 + 7 + 7 = 21 bits for one pair, or 1 pair per boot pixel
# Or: (position, pair) where position is 7 bits and pair is 2 bytes = 23 bits
# We could do 1 replacement per boot pixel

# Better approach: SET_BPE_OVERRIDE opcode
# Payload: [7:table_index][7:byte1][7:byte2][7:table_index2]
# = 2 pair overrides per boot pixel (28 bits)
# Need ~6 boot pixels for 12 pair overrides + 1 BOOT_END = 7 boot pixels

print("\n" + "=" * 60)
print("Simulation: Inject top missing pairs and re-run DP")
print("=" * 60)

# Try injecting 4, 8, 12, 16 pairs
for n_inject in [4, 8, 12, 16]:
    # Create modified BPE table with injected pairs
    modified_pairs = dict(default_pairs)  # set of pairs for lookup
    modified_table = list(BPE_PAIR_TABLE)  # actual table for indexing
    modified_pair_to_idx = {}
    for i, p in enumerate(BPE_PAIR_TABLE):
        if p:
            modified_pair_to_idx[bytes(p)] = i
    
    # Inject pairs by replacing least-used entries
    # Find least-used entries in the table
    table_usage = Counter()
    for i in range(len(data) - 1):
        pair = data[i:i+2]
        if pair in modified_pair_to_idx:
            table_usage[modified_pair_to_idx[pair]] += 1
    
    # Entries not used by fibonacci
    unused_entries = [i for i in range(1, 128) if i not in table_usage]
    
    for j in range(min(n_inject, len(missing), len(unused_entries))):
        pair = missing[j][0]
        idx = unused_entries[j]
        modified_table[idx] = pair
        modified_pair_to_idx[pair] = idx
        # Remove old pair from lookup
        old = bytes(modified_table[idx]) if modified_table[idx] else None
    
    # DP with modified table
    def max_modified_bpe(pos):
        remaining = n - pos
        for n_pairs in range(4, 0, -1):
            needed = n_pairs * 2
            if needed > remaining:
                continue
            ok = True
            for p in range(n_pairs):
                pair = bytes([data[pos + p*2], data[pos + p*2 + 1]])
                if pair not in modified_pair_to_idx:
                    ok = False
                    break
            if ok:
                return needed
        return 0
    
    INF = float('inf')
    dp = [INF] * (n + 1)
    dp[0] = 0
    parent = [None] * (n + 1)
    
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
        bpe_max = max_modified_bpe(pos)
        for k in range(2, bpe_max + 1, 2):
            if dp[pos] + 1 < dp[pos + k]:
                dp[pos + k] = dp[pos] + 1
                parent[pos + k] = ('BPE', pos, k)
        for k in range(3, min(6, n - pos + 1)):
            if dp[pos] + 1 < dp[pos + k]:
                dp[pos + k] = dp[pos] + 1
                parent[pos + k] = ('BYTEPACK', pos, k)
        if pos in lz77_at:
            ml = lz77_at[pos]
            for l in range(3, ml + 1):
                if dp[pos] + 1 < dp[pos + l]:
                    dp[pos + l] = dp[pos] + 1
                    parent[pos + l] = ('LZ77', pos, l)
        if dp[pos] + 1 < dp[pos + 1]:
            dp[pos + 1] = dp[pos] + 1
            parent[pos + 1] = ('LIT', pos, 1)
    
    # Count boot pixels needed
    n_boot = (n_inject + 1) // 2 + 1  # 2 overrides per pixel + BOOT_END
    total = dp[n] + n_boot
    
    # Count strategies
    p = n
    actions = []
    while p > 0 and parent[p]:
        actions.append(parent[p])
        p = parent[p][1]
    actions.reverse()
    
    strat_counts = Counter(a[0] for a in actions)
    print(f"\nInject {n_inject:2d} pairs ({n_boot} boot pixels): {dp[n]} data + {n_boot} boot = {total} total seeds")
    for s, cnt in strat_counts.most_common():
        bc = sum(a[2] for a in actions if a[0] == s)
        print(f"  {s:10s}: {cnt:2d} seeds, {bc:3d} bytes")
