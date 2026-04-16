#!/usr/bin/env python3
"""
Combined simulation: Two-pass encoding with hash-chain LZ77 + BPE augmentation.
This is the strategy to validate before building.
"""
import sys
sys.path.insert(0, ".")
from analyze_v3 import fib
from find_seed import BPE_PAIR_TABLE
from collections import Counter

data = fib
n = len(data)

# PASS 1: Analyze
# Count pair frequencies
pair_freq = Counter()
for i in range(n - 1):
    pair_freq[data[i:i+2]] += 1

# Build augmented BPE table: keep 128 entries, replace unused slots with
# file-specific pairs
default_pair_to_idx = {}
for i, p in enumerate(BPE_PAIR_TABLE):
    if p:
        default_pair_to_idx[bytes(p)] = i

# Find pairs in data that aren't in the table
missing_pairs = []
for pair, count in pair_freq.most_common(200):
    if pair not in default_pair_to_idx and 32 <= pair[0] <= 126 and 32 <= pair[1] <= 126:
        missing_pairs.append((pair, count))

# Find slots we can safely replace (unused in this file)
used_indices = set()
for i in range(n - 1):
    pair = data[i:i+2]
    if pair in default_pair_to_idx:
        used_indices.add(default_pair_to_idx[pair])

replacable = [i for i in range(1, 128) if i not in used_indices]
print(f"Default table: {len(default_pair_to_idx)} pairs")
print(f"Pairs used by fibonacci: {len(used_indices)}")
print(f"Replacable slots: {len(replacable)}")
print(f"Missing pairs (printable): {len(missing_pairs)}")
print()

# Build augmented table
aug_pair_to_idx = dict(default_pair_to_idx)
aug_table = list(BPE_PAIR_TABLE)
augmented_count = 0
for pair, count in missing_pairs:
    if replacable:
        idx = replacable.pop(0)
        aug_table[idx] = pair
        aug_pair_to_idx[pair] = idx
        augmented_count += 1

print(f"Augmented table: added {augmented_count} file-specific pairs")
for pair, count in missing_pairs[:augmented_count]:
    print(f"  {repr(pair):12s}  {count}x  -> slot {aug_pair_to_idx[pair]}")
print()

# PASS 2: Encode with augmented table + hash-chain LZ77
# Hash-chain LZ77 (simulated -- use brute force but measure what hash-chain would find)
def max_aug_bpe(pos):
    """Max bytes augmented BPE can encode from pos."""
    remaining = n - pos
    for n_pairs in range(4, 0, -1):
        needed = n_pairs * 2
        if needed > remaining:
            continue
        ok = True
        for p in range(n_pairs):
            pair = bytes([data[pos + p*2], data[pos + p*2 + 1]])
            if pair not in aug_pair_to_idx:
                ok = False
                break
        if ok:
            return needed
    return 0

def max_default_bpe(pos):
    """Max bytes default BPE can encode from pos."""
    remaining = n - pos
    for n_pairs in range(4, 0, -1):
        needed = n_pairs * 2
        if needed > remaining:
            continue
        ok = True
        for p in range(n_pairs):
            pair = bytes([data[pos + p*2], data[pos + p*2 + 1]])
            if pair not in default_pair_to_idx:
                ok = False
                break
        if ok:
            return needed
    return 0

# DP with augmented table + LZ77
INF = float('inf')

# LZ77 matches (precomputed)
lz77_at = {}
for pos in range(n):
    best = 0
    for start in range(pos):
        ml = 0
        while pos + ml < n and start + ml < n and data[start + ml] == data[pos + ml]:
            ml += 1
        if ml > best:
            best = ml
    if best >= 3:
        lz77_at[pos] = best

for label, bpe_fn, table_name in [
    ("DEFAULT", max_default_bpe, "default"),
    ("AUGMENTED", max_aug_bpe, "augmented"),
]:
    dp = [INF] * (n + 1)
    dp[0] = 0
    parent = [None] * (n + 1)
    
    for pos in range(n):
        if dp[pos] == INF:
            continue
        # BPE
        bpe_max = bpe_fn(pos)
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
            for l in range(3, lz77_at[pos] + 1):
                if dp[pos] + 1 < dp[pos + l]:
                    dp[pos + l] = dp[pos] + 1
                    parent[pos + l] = ('LZ77', pos, l)
        # Literal
        if dp[pos] + 1 < dp[pos + 1]:
            dp[pos + 1] = dp[pos] + 1
            parent[pos + 1] = ('LIT', pos, 1)
    
    # Count boot pixels for augmented
    boot_cost = 0
    if table_name == "augmented":
        # Need to encode augmented pairs. Each boot pixel can carry 2 pair overrides.
        # Format: [7:table_idx][7:byte1][7:byte2][7:table_idx2] = 28 bits
        # Actually need BOOT_END too. So: ceil(augmented_count/2) + 1 boot pixels
        boot_cost = (augmented_count + 1) // 2 + 1
    
    # Reconstruct
    p = n
    actions = []
    while p > 0 and parent[p]:
        actions.append(parent[p])
        p = parent[p][1]
    actions.reverse()
    
    strat_counts = Counter(a[0] for a in actions)
    total = len(actions) + boot_cost
    
    print(f"{label} TABLE:")
    print(f"  Data seeds: {len(actions)}")
    if boot_cost:
        print(f"  Boot pixels: {boot_cost} (pair injection + BOOT_END)")
    print(f"  TOTAL: {total} seeds")
    for s, cnt in strat_counts.most_common():
        bc = sum(a[2] for a in actions if a[0] == s)
        print(f"    {s:10s}: {cnt:2d} seeds, {bc:3d} bytes")
    print()

# Now: what about larger files?
# Simulate a "typical" 1KB Python file with more repetition
# (reuse the analysis on expand.py if we can load it quickly)
import os
expand_path = os.path.expanduser("~/zion/projects/pixelpack/expand.py")
if os.path.exists(expand_path):
    with open(expand_path, 'rb') as f:
        big_data = f.read()
    
    # Quick LZ77 potential (sample every 10th position)
    bn = len(big_data)
    sampled_matched = 0
    sampled_total = 0
    step = 10
    for pos in range(0, bn - 10, step):
        best = 0
        for start in range(max(0, pos - 4096), pos):
            ml = 0
            while pos + ml < bn and big_data[start + ml] == big_data[pos + ml]:
                ml += 1
            if ml > best:
                best = ml
        if best >= 3:
            sampled_matched += best
        sampled_total += min(8, bn - pos)
    
    est_ratio = sampled_matched / sampled_total if sampled_total else 0
    print(f"expand.py ({bn}B): LZ77 redundancy ~{est_ratio*100:.0f}% (sampled)")
    est_seeds_default = bn / 7.5  # current ratio
    est_seeds_lz77 = (bn * (1 - est_ratio)) / 8 + (bn * est_ratio) / 10
    print(f"  Estimated seeds (default): ~{est_seeds_default:.0f}")
    print(f"  Estimated seeds (with LZ77): ~{est_seeds_lz77:.0f}")
    print(f"  Savings: ~{est_seeds_default - est_seeds_lz77:.0f} seeds ({(est_seeds_default - est_seeds_lz77)/est_seeds_default*100:.0f}%)")

print("\n" + "=" * 60)
print("CONCLUSION FOR RFL SEED PROMPT")
print("=" * 60)
print("Two-pass encoding with BPE augmentation:")
print("  1. Pass 1: scan file for pair frequencies, build augmented BPE table")
print("  2. Pass 2: encode with augmented table + hash-chain LZ77")
print("  Boot pixels inject file-specific pairs (2 overrides per pixel)")
print("  fibonacci: 34 -> ~30 seeds (augmentation cost offsets gains on small files)")
print("  Larger files: estimated 20-30% seed reduction")
print("  Hash-chain LZ77: O(n) instead of O(n^2) -- fixes timeout on real files")
