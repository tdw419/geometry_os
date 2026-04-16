#!/usr/bin/env python3
"""Profile: Compare DP result WITH vs WITHOUT FREQ/KEYWORD strategies."""
import sys, time, copy
sys.path.insert(0,'.')
from boot3 import (
    _build_freq_table, _build_keyword_table,
    _enumerate_matches_fast, _dp_shortest_path, _encode_with_context,
    _consolidate_seeds,
)
from expand3 import ExpandContext, expand_with_context, expand_from_png_v3
from expand import set_freq_table, set_keyword_table, set_file_specific_table, set_file_specific_mode6_table, set_file_specific_mode1_table
from collections import Counter

with open('boot3.py', 'rb') as f:
    target = f.read()
tlen = len(target)

# Setup tables
freq_table = _build_freq_table(target)
set_freq_table(freq_table)
keyword_table = _build_keyword_table(target)
set_keyword_table(keyword_table)
set_file_specific_table(None)
set_file_specific_mode6_table(None)
set_file_specific_mode1_table(None)

full_buf = bytes(target)

# Run WITH FREQ/KEYWORD
t0 = time.time()
print("=== WITH FREQ/KEYWORD ===")
matches_with = _enumerate_matches_fast(target, bytearray(), full_buf, 0, 999, t0)
seeds_with = _dp_shortest_path(target, matches_with, 999, t0)
if seeds_with:
    seeds_with = _consolidate_seeds(target, seeds_with)
    print(f"Result: {len(seeds_with)} seeds")
    # Strategy breakdown
    names = {0:'DICT',1:'DICT',2:'DICT',3:'DICT',4:'DICT',5:'DICT',6:'DICT',7:'NIBBLE',8:'DICTX5',9:'BPE',0xA:'DICTX7',0xB:'FREQ',0xC:'LZ77',0xD:'KWORD',0xE:'BYTEPACK',0xF:'TEMPLATE'}
    counts = Counter()
    bytes_by = Counter()
    ctx = ExpandContext()
    for s in seeds_with:
        r = expand_with_context(s, ctx)
        strat = (s >> 28) & 0xF
        counts[names[strat]] += 1
        bytes_by[names[strat]] += len(r)
    for name in sorted(counts.keys()):
        print(f"  {name:10s}: {counts[name]:4d} seeds, {bytes_by[name]:5d} bytes ({bytes_by[name]/counts[name]:.1f} B/seed)")

# Now run WITHOUT FREQ/KEYWORD by filtering them out
print("\n=== WITHOUT FREQ/KEYWORD (filtered) ===")
matches_no_ft = []
for pos in range(tlen):
    filtered = [(l, s, n) for l, s, n in matches_with[pos] if n not in ('FREQ_TABLE', 'KEYWORD_TABLE')]
    matches_no_ft.append(filtered)

t0 = time.time()
seeds_without = _dp_shortest_path(target, matches_no_ft, 999, t0)
if seeds_without:
    seeds_without = _consolidate_seeds(target, seeds_without)
    print(f"Result: {len(seeds_without)} seeds")
    counts = Counter()
    bytes_by = Counter()
    ctx = ExpandContext()
    for s in seeds_without:
        r = expand_with_context(s, ctx)
        strat = (s >> 28) & 0xF
        counts[names[strat]] += 1
        bytes_by[names[strat]] += len(r)
    for name in sorted(counts.keys()):
        print(f"  {name:10s}: {counts[name]:4d} seeds, {bytes_by[name]:5d} bytes ({bytes_by[name]/counts[name]:.1f} B/seed)")
    print(f"\n  Total B/seed: {tlen/len(seeds_without):.2f}")

if seeds_with:
    print(f"\n  WITH:    {len(seeds_with)} seeds, {tlen/len(seeds_with):.2f} B/seed")
if seeds_without:
    print(f"  WITHOUT: {len(seeds_without)} seeds, {tlen/len(seeds_without):.2f} B/seed")
