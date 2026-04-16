#!/usr/bin/env python3
"""Profile FREQ_TABLE v3 options: measure coverage for different table sizes."""
import sys
sys.path.insert(0,'.')
from collections import Counter

with open('boot3.py', 'rb') as f:
    target = f.read()

freq = Counter(target)
tlen = len(target)
unique = len(freq)
print(f"Target: {tlen} bytes, {unique} unique byte values")
print()

# Current v2: 7 x 4-bit indices into 15-entry table (28 bits)
# Max 7 bytes/seed. Coverage: bytes in top-15.
top15 = [b for b, _ in freq.most_common(15)]
covered_15 = sum(freq.get(b, 0) for b in top15)
print(f"v2 (top-15): coverage {covered_15}/{tlen} ({covered_15/tlen*100:.1f}%)")
# How many 7-byte runs are fully covered?
set15 = set(top15)
runs_15 = sum(1 for i in range(tlen - 6) if all(target[j] in set15 for j in range(i, i+7)))
print(f"  7-byte runs fully covered: {runs_15}")
# Average match length
match_lens = []
pos = 0
while pos < tlen:
    match_len = 0
    while pos + match_len < tlen and target[pos + match_len] in set15 and match_len < 7:
        match_len += 1
    if match_len > 0:
        match_lens.append(match_len)
        pos += match_len
    else:
        pos += 1
avg_match = sum(match_lens) / max(len(match_lens), 1)
print(f"  Average match length: {avg_match:.1f} (of max 7)")
print()

# Option A: 5 x 5-bit indices into 31-entry table (25 bits)
# Max 5 bytes/seed. Coverage: bytes in top-31.
top31 = [b for b, _ in freq.most_common(31)]
covered_31 = sum(freq.get(b, 0) for b in top31)
print(f"v3a (top-31, 5x5bit): coverage {covered_31}/{tlen} ({covered_31/tlen*100:.1f}%)")
set31 = set(top31)
runs_31 = sum(1 for i in range(tlen - 4) if all(target[j] in set31 for j in range(i, i+5)))
print(f"  5-byte runs fully covered: {runs_31}")
match_lens_a = []
pos = 0
while pos < tlen:
    match_len = 0
    while pos + match_len < tlen and target[pos + match_len] in set31 and match_len < 5:
        match_len += 1
    if match_len > 0:
        match_lens_a.append(match_len)
        pos += match_len
    else:
        pos += 1
avg_a = sum(match_lens_a) / max(len(match_lens_a), 1)
print(f"  Average match length: {avg_a:.1f} (of max 5)")
# Bytes per seed estimate
total_covered_runs = 0
for i in range(tlen):
    if target[i] in set31:
        total_covered_runs += 1
print(f"  Estimated bytes/seed: ~{avg_a:.1f} (at max 5)")
print()

# Option B: 4 x 6-bit indices into 64-entry table (24 bits)
# Max 4 bytes/seed. Coverage: bytes in top-64.
top64 = [b for b, _ in freq.most_common(64)]
covered_64 = sum(freq.get(b, 0) for b in top64)
print(f"v3b (top-64, 4x6bit): coverage {covered_64}/{tlen} ({covered_64/tlen*100:.1f}%)")
set64 = set(top64)
runs_64 = sum(1 for i in range(tlen - 3) if all(target[j] in set64 for j in range(i, i+4)))
print(f"  4-byte runs fully covered: {runs_64}")
match_lens_b = []
pos = 0
while pos < tlen:
    match_len = 0
    while pos + match_len < tlen and target[pos + match_len] in set64 and match_len < 4:
        match_len += 1
    if match_len > 0:
        match_lens_b.append(match_len)
        pos += match_len
    else:
        pos += 1
avg_b = sum(match_lens_b) / max(len(match_lens_b), 1)
print(f"  Average match length: {avg_b:.1f} (of max 4)")
print()

# Option C: 4 x 7-bit indices into 128-entry table (28 bits)
# Max 4 bytes/seed. Coverage: top 128.
top128 = [b for b, _ in freq.most_common(128)]
covered_128 = sum(freq.get(b, 0) for b in top128)
print(f"v3c (top-128, 4x7bit): coverage {covered_128}/{tlen} ({covered_128/tlen*100:.1f}%)")
set128 = set(top128)
match_lens_c = []
pos = 0
while pos < tlen:
    match_len = 0
    while pos + match_len < tlen and target[pos + match_len] in set128 and match_len < 4:
        match_len += 1
    if match_len > 0:
        match_lens_c.append(match_len)
        pos += match_len
    else:
        pos += 1
avg_c = sum(match_lens_c) / max(len(match_lens_c), 1)
print(f"  Average match length: {avg_c:.1f} (of max 4)")
print()

# Option D: Hybrid using 2-bit prefix to select format
# 00 = 7x4bit (current), 01 = 5x5bit, 10 = 4x6bit
# Remaining bits: 26 for all modes
# 7x4=28 bits, 5x5=25 bits, 4x6=24 bits -- all fit in 28 bits
# Use 2-bit prefix [27:26], remaining 26 bits for data
# 00: 6x4bit indices into 15-entry table (24 bits used) -> max 6 bytes
# 01: 5x5bit indices into 31-entry table (25 bits used) -> max 5 bytes
# 10: 3x8bit literal bytes (24 bits used) -> max 3 bytes (covers everything)
print("=== Summary ===")
print(f"v2  (top-15, 7x4): {avg_match:.1f} avg, max 7B, {covered_15/tlen*100:.1f}% coverage")
print(f"v3a (top-31, 5x5): {avg_a:.1f} avg, max 5B, {covered_31/tlen*100:.1f}% coverage")
print(f"v3b (top-64, 4x6): {avg_b:.1f} avg, max 4B, {covered_64/tlen*100:.1f}% coverage")
print(f"v3c (top-128, 4x7): {avg_c:.1f} avg, max 4B, {covered_128/tlen*100:.1f}% coverage")

# The REAL metric: how many seeds saved vs BYTEPACK?
# BYTEPACK avg = ~4.3 B/seed (from strategy breakdown)
# FREQ must beat that to be worth using
print()
print(f"BYTEPACK avg: ~4.3 B/seed (from production data)")
print(f"FREQ_TABLE needs to beat ~4.3 B/seed to be useful as DP alternative")
print(f"v2 FREQ at {avg_match:.1f} avg: {'WORTH IT' if avg_match > 4.3 else 'MARGINAL'}")

# Also test on expand.py
with open('expand.py', 'rb') as f:
    target2 = f.read()
freq2 = Counter(target2)
tlen2 = len(target2)

print(f"\n--- expand.py ({tlen2}B) ---")
top15_2 = [b for b, _ in freq2.most_common(15)]
set15_2 = set(top15_2)
match_lens_2 = []
pos = 0
while pos < tlen2:
    ml = 0
    while pos + ml < tlen2 and target2[pos + ml] in set15_2 and ml < 7:
        ml += 1
    if ml > 0:
        match_lens_2.append(ml)
        pos += ml
    else:
        pos += 1
avg_2 = sum(match_lens_2) / max(len(match_lens_2), 1)
print(f"v2 (top-15, 7x4): avg {avg_2:.1f} B/seed")

top31_2 = [b for b, _ in freq2.most_common(31)]
set31_2 = set(top31_2)
match_lens_a2 = []
pos = 0
while pos < tlen2:
    ml = 0
    while pos + ml < tlen2 and target2[pos + ml] in set31_2 and ml < 5:
        ml += 1
    if ml > 0:
        match_lens_a2.append(ml)
        pos += ml
    else:
        pos += 1
avg_a2 = sum(match_lens_a2) / max(len(match_lens_a2), 1)
print(f"v3a (top-31, 5x5): avg {avg_a2:.1f} B/seed")
