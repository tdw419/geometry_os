#!/usr/bin/env python3
"""Quick profiling: how much time does FREQ/KEYWORD enumeration add?"""
import sys, time
sys.path.insert(0,'.')
from boot3 import (
    _build_freq_table, _build_keyword_table, _try_freq_table_encode,
    _try_keyword_table_encode, _try_keyword_hybrid_encode,
    _enumerate_matches_fast,
)
from collections import Counter
from expand import set_freq_table, get_freq_table, set_keyword_table, get_keyword_table

# Use boot3.py as test target
with open('boot3.py', 'rb') as f:
    target = f.read()

tlen = len(target)
print(f"Target: {tlen} bytes")

# Build tables
freq_table = _build_freq_table(target)
set_freq_table(freq_table)
keyword_table = _build_keyword_table(target)
set_keyword_table(keyword_table)

ft_freq = Counter(target)
ft_top = sum(ft_freq.get(freq_table[i], 0) for i in range(len(freq_table)))
print(f"Top-15 coverage: {ft_top}/{tlen} ({ft_top/tlen*100:.1f}%)")

# Profile FREQ_TABLE matching at every position
t0 = time.time()
freq_matches = 0
freq_bytes = 0
for pos in range(tlen):
    remaining = tlen - pos
    for seg_len in range(min(7, remaining), 0, -1):
        seg = target[pos:pos + seg_len]
        ft_result = _try_freq_table_encode(seg, freq_table)
        if ft_result:
            seed, encoded_len = ft_result
            freq_matches += 1
            freq_bytes += encoded_len
            break
t1 = time.time()
print(f"FREQ enumeration: {t1-t0:.2f}s, {freq_matches} matches, {freq_bytes} bytes (avg {freq_bytes/freq_matches:.1f} B/seed)")

# Count how many of those positions also have LZ77 >= same length
# We need to run full enumeration to know
full_buf = bytes(target)
buf_offset = 0
from collections import defaultdict

# Just check: for positions where FREQ found a match, would BYTEPACK alone suffice?
t0 = time.time()
bp_only_matches = 0
bp_only_bytes = 0
from boot3 import _quick_bytepack
for pos in range(tlen):
    remaining = tlen - pos
    # Check if BYTEPACK can match the same bytes FREQ matched
    max_bp = min(18, remaining)
    best_bp = 0
    for seg_len in range(max_bp, 0, -1):
        seg = target[pos:pos + seg_len]
        seed = _quick_bytepack(seg)
        if seed:
            best_bp = seg_len
            break
    if best_bp >= 4:
        bp_only_matches += 1
        bp_only_bytes += best_bp
t1 = time.time()
print(f"BYTEPACK-only at FREQ positions: {bp_only_matches} positions, {bp_only_bytes} bytes (avg {bp_only_bytes/max(bp_only_matches,1):.1f} B/seed)")

# The real test: run _enumerate_matches_fast with and without FREQ/KEYWORD
# and compare DP results
print("\n--- Full enumeration with FREQ/KEYWORD ---")
t0 = time.time()
matches_with = _enumerate_matches_fast(target, bytearray(), full_buf, 0, 999, t0)
t1 = time.time()
print(f"Enumeration time: {t1-t0:.2f}s")

# Count strategies at each position
from collections import Counter as C
strat_counts = C()
for pos in range(tlen):
    for length, seed, name in matches_with[pos]:
        strat_counts[name] += 1
print(f"Strategy counts: {dict(strat_counts)}")
