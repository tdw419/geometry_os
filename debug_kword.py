#!/usr/bin/env python3
"""Debug: what are the 0-byte KEYWORD seeds?"""
import sys; sys.path.insert(0,'.')
from boot3 import encode_v3, _build_keyword_table
from expand3 import expand_from_png_v3, ExpandContext, expand_with_context
from expand import set_keyword_table, get_keyword_table
from PIL import Image
import tempfile, os

fname = 'boot3.py'
with open(fname,'rb') as f: orig = f.read()

png_path = tempfile.mktemp(suffix='.png')
seeds, png_data = encode_v3(orig, png_path, timeout=120.0)
result = expand_from_png_v3(png_data)
assert result == orig, "Roundtrip failed!"

# After expand_from_png_v3, tables should be set from PNG metadata
kw = get_keyword_table()
print(f"Keyword table: {len(kw) if kw else 0} keywords")
if kw:
    for i, k in enumerate(kw[:10]):
        print(f"  [{i}] {k!r}")

# Try expanding a few KWORD seeds
ctx = ExpandContext()
pos = 0
kword_count = 0
for s in seeds:
    expanded = expand_with_context(s, ctx)
    strat = (s >> 28) & 0xF
    if strat == 0xD:
        kword_count += 1
        if kword_count <= 10 or len(expanded) == 0:
            params = s & 0x0FFFFFFF
            count = params & 0xF
            print(f"  KWORD seed 0x{s:08X}: count={count}, params=0x{params:07X}, expanded={len(expanded)}B")
    pos += len(expanded)

os.unlink(png_path)
