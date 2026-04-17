#!/usr/bin/env python3
"""Analyze FREQ/KEYWORD seed effectiveness vs alternatives."""
import sys; sys.path.insert(0,'.')
from boot3 import encode_v3
from expand3 import expand_from_png_v3, ExpandContext, expand_with_context
from PIL import Image
import tempfile, os

fname = 'boot3.py'
with open(fname,'rb') as f: orig = f.read()
png_path = tempfile.mktemp(suffix='.png')
seeds, png_data = encode_v3(orig, png_path, timeout=120.0)
result = expand_from_png_v3(png_data)
assert result == orig, "Roundtrip failed!"

# Analyze each FREQ/KEYWORD seed - could LZ77 have covered it?
ctx = ExpandContext()
pos = 0
freq_short = 0  # FREQ seeds covering <= 4 bytes
freq_total = 0
freq_bytes_lost = 0
kword_short = 0
kword_total = 0

for s in seeds:
    expanded = expand_with_context(s, ctx)
    strat = (s >> 28) & 0xF
    seg = orig[pos:pos+len(expanded)]
    
    if strat == 0xB:  # FREQ_TABLE
        freq_total += 1
        seg_len = len(expanded)
        # Could LZ77 have covered these bytes from earlier in the file?
        if pos >= seg_len:
            search_buf = orig[:pos]
            found_at = search_buf.rfind(seg)
            if found_at >= 0:
                # LZ77 could cover this - but FREQ was chosen instead
                # This means the DP found a path through FREQ that was shorter overall
                pass
        if seg_len <= 4:
            freq_short += 1
            
    elif strat == 0xD:  # KEYWORD_TABLE
        kword_total += 1
        seg_len = len(expanded)
        if seg_len <= 4:
            kword_short += 1
    
    pos += len(expanded)

print(f"FREQ_TABLE: {freq_total} seeds, {freq_short} covering <= 4 bytes")
print(f"KEYWORD_TABLE: {kword_total} seeds, {kword_short} covering <= 4 bytes")

# Now: what's the max LZ77 match at each FREQ position?
print("\nFREQ seed length distribution:")
ctx2 = ExpandContext()
pos = 0
len_hist = {}
for s in seeds:
    expanded = expand_with_context(s, ctx2)
    strat = (s >> 28) & 0xF
    if strat == 0xB:
        l = len(expanded)
        len_hist[l] = len_hist.get(l, 0) + 1
    pos += len(expanded)
for l in sorted(len_hist.keys()):
    print(f"  {l} bytes: {len_hist[l]} seeds")

# Check: for each FREQ seed position, what's the longest LZ77 match?
print("\nFREQ vs LZ77 comparison:")
ctx3 = ExpandContext()
pos = 0
lz77_better = 0
for s in seeds:
    expanded = expand_with_context(s, ctx3)
    strat = (s >> 28) & 0xF
    if strat == 0xB:
        seg = orig[pos:pos+len(expanded)]
        seg_len = len(expanded)
        # Find longest LZ77 match at this position
        best_lz = 0
        search_buf = orig[:pos]
        for try_len in range(min(seg_len * 3, len(orig) - pos, 4096), 2, -1):
            try_seg = orig[pos:pos+try_len]
            found = search_buf.rfind(try_seg)
            if found >= 0:
                offset = pos - 1 - found
                if offset < (1 << 16):
                    best_lz = try_len
                    break
        if best_lz > seg_len:
            lz77_better += 1
    pos += len(expanded)

print(f"  Positions where LZ77 could cover MORE bytes: {lz77_better}/{freq_total}")

os.unlink(png_path)
