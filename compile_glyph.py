#!/usr/bin/env python3
"""Quick script to compile window_manager.glyph"""

import sys
sys.path.insert(0, '/home/jericho/zion/projects/geometry_os/geometry_os/systems/infinite_map_rs/src')

from glyph_stratum import glyph_to_rts

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: compile_glyph.py <input.glyph> <output.rts.png>")
        sys.exit(1)

    input_path = sys.argv[1]
    output_path = sys.argv[2]

    glyph_to_rts.compile_glyph_file(input_path, output_path)
    print(f"Compiled {input_path} -> {output_path}")
