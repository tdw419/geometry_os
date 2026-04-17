#!/usr/bin/env python3
"""Analyze FREQ/KEYWORD seeds with proper table setup."""
import sys; sys.path.insert(0,'.')
from boot3 import encode_v3, _build_freq_table, _build_keyword_table
from expand3 import expand_from_png_v3, ExpandContext, expand_with_context
from expand import set_freq_table, set_keyword_table
from PIL import Image
import tempfile, os

fname = 'boot3.py'
with open(fname,'rb') as f: orig = f.read()

# Set up tables FIRST (same as encoder does)
freq_table = _build_freq_table(orig)
set_freq_table(freq_table)
keyword_table = _build_keyword_table(orig)
set_keyword_table(keyword_table)

png_path = tempfile.mktemp(suffix='.png')
seeds, png_data = encode_v3(orig, png_path, timeout=120.0)
result = expand_from_png_v3(png_data)
assert result == orig, "Roundtrip failed!"

# Now analyze with tables set
ctx = ExpandContext()
pos = 0
freq_lens = {}
kword_lens = {}
freq_total_bytes = 0
freq_total_seeds = 0
kword_total_bytes = 0
kword_total_seeds = 0

for s in seeds:
    expanded = expand_with_context(s, ctx)
    strat = (s >> 28) & 0xF
    
    if strat == 0xB:  # FREQ_TABLE
        l = len(expanded)
        freq_lens[l] = freq_lens.get(l, 0) + 1
        freq_total_bytes += l
        freq_total_seeds += 1
    elif strat == 0xD:  # KEYWORD_TABLE
        l = len(expanded)
        kword_lens[l] = kword_lens.get(l, 0) + 1
        kword_total_bytes += l
        kword_total_seeds += 1
    
    pos += len(expanded)

print(f"FREQ_TABLE: {freq_total_seeds} seeds, {freq_total_bytes} bytes, {freq_total_bytes/max(freq_total_seeds,1):.2f} B/seed")
print(f"  Length distribution:")
for l in sorted(freq_lens.keys())[:20]:
    print(f"    {l} bytes: {freq_lens[l]} seeds")
if len(freq_lens) > 20:
    print(f"    ... ({len(freq_lens)} distinct lengths)")

print(f"\nKEYWORD_TABLE: {kword_total_seeds} seeds, {kword_total_bytes} bytes, {kword_total_bytes/max(kword_total_seeds,1):.2f} B/seed")
print(f"  Length distribution:")
for l in sorted(kword_lens.keys())[:20]:
    print(f"    {l} bytes: {kword_lens[l]} seeds")

# Check: how many FREQ positions could LZ77 cover with >= same length?
print("\n--- FREQ vs LZ77 at same positions ---")
ctx2 = ExpandContext()
pos = 0
lz77_would_be_better = 0
freq_could_merge = 0
for s in seeds:
    expanded = expand_with_context(s, ctx2)
    strat = (s >> 28) & 0xF
    
    if strat == 0xB:
        seg = orig[pos:pos+len(expanded)]
        seg_len = len(expanded)
        # Find longest LZ77 match from prior bytes
        search_buf = orig[:pos]
        best_lz = 0
        if pos >= 2:
            for try_len in range(min(pos, 4096, len(orig)-pos), 2, -1):
                try_seg = orig[pos:pos+try_len]
                found = search_buf.rfind(try_seg)
                if found >= 0:
                    offset = pos - 1 - found
                    if offset < (1 << 16):
                        best_lz = try_len
                        break
        if best_lz > seg_len:
            lz77_would_be_better += 1
        elif best_lz == seg_len and seg_len >= 2:
            freq_could_merge += 1  # LZ77 could replace this FREQ seed
    
    pos += len(expanded)

print(f"FREQ seeds where LZ77 covers MORE: {lz77_would_be_better}/{freq_total_seeds}")
print(f"FREQ seeds where LZ77 covers SAME length: {freq_could_merge}/{freq_total_seeds}")

os.unlink(png_path)
