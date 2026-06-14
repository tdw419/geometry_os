#!/usr/bin/env python3
"""
img2csv.py -- Convert a sequence of PNG frames into a GeOS CSV timeline.

This tool implements the "Visual Replay" strategy for converting existing 
software to pixel software. It performs frame-differencing to extract only 
the changed pixels (dirty rectangles) between frames, minimizing the 
resulting CSV size and ASM footprint.

Usage:
    python3 scripts/img2csv.py frames_dir/ -o my_animation.csv
"""

import os
import sys
import argparse
from PIL import Image
import csv

def get_dirty_rects(img1, img2, threshold=0):
    """
    Compare two images and return a list of (x, y, w, h, r, g, b) for changed regions.
    Implements horizontal span merging and FILL heuristics.
    """
    width, height = img2.size
    pix2 = img2.load()
    
    # 1. Fill check for the whole frame (Optimization for frame 0 or screen clears)
    # Sample some pixels to see if it's likely a solid color
    first_pixel = pix2[0, 0][:3]
    is_solid = True
    # If it's the first frame, we MUST check for a solid fill.
    # On subsequent frames, we'll only do it if the diff is massive (handled in step 3),
    # but a quick sample check here doesn't hurt.
    if img1 is None:
        for y in range(0, height, 8): # Stride for speed
            for x in range(0, width, 8):
                if pix2[x, y][:3] != first_pixel:
                    is_solid = False
                    break
            if not is_solid: break
        
        if is_solid:
            # Re-verify fully if stride check passed
            for y in range(height):
                for x in range(width):
                    if pix2[x, y][:3] != first_pixel:
                        is_solid = False
                        break
                if not is_solid: break
            
            if is_solid:
                r, g, b = first_pixel
                return [(0, 0, width, height, r, g, b, 'FILL')]

    # 2. Identify changed pixels
    changed = []
    if img1 is None:
        # Everything changed from "nothing"
        for y in range(height):
            for x in range(width):
                changed.append((x, y, pix2[x, y][:3]))
    else:
        pix1 = img1.load()
        for y in range(height):
            for x in range(width):
                p1 = pix1[x, y][:3]
                p2 = pix2[x, y][:3]
                if p1 != p2:
                    changed.append((x, y, p2))

    if not changed:
        return []

    # 3. FILL heuristic for large changes
    # If > 95% of the screen changed to the same color AND there are few
    # unique colors overall, just FILL. Two conditions must both be true:
    #   a) Dominant color covers > 97% of changed pixels
    #   b) Fewer than 10 unique colors in the changed set
    # This prevents loss on rich imagery (fireworks, fractals) while still
    # optimizing simple scenes (starfield, solid backgrounds).
    if len(changed) > (width * height * 0.7):
        color_counts = {}
        for _, _, c in changed:
            color_counts[c] = color_counts.get(c, 0) + 1
        most_common_color = max(color_counts, key=color_counts.get)
        mc_count = color_counts[most_common_color]
        if mc_count > (width * height * 0.97) and len(color_counts) < 10:
            r, g, b = most_common_color
            return [(0, 0, width, height, r, g, b, 'FILL')]

    # 4. Horizontal span merging (Greedy clustering)
    h_spans = []
    # Group by Y then merge contiguous X
    rows = {}
    for x, y, c in changed:
        if y not in rows: rows[y] = []
        rows[y].append((x, c))
    
    for y in sorted(rows.keys()):
        row_pixels = sorted(rows[y])
        if not row_pixels: continue
        
        start_x, current_color = row_pixels[0]
        width_span = 1
        
        for i in range(1, len(row_pixels)):
            x, c = row_pixels[i]
            if x == start_x + width_span and c == current_color:
                width_span += 1
            else:
                # End of span
                r, g, b = current_color
                h_spans.append([start_x, y, width_span, 1, r, g, b, 'RECTF'])
                start_x, current_color = x, c
                width_span = 1
        
        # Last span in row
        r, g, b = current_color
        h_spans.append([start_x, y, width_span, 1, r, g, b, 'RECTF'])

    # 5. Vertical span merging
    # Merge adjacent identical spans (same x, w, color, and consecutive y).
    # Uses a dict keyed by (x, w, r, g, b) -> list of spans, so disjoint
    # vertical ranges with the same signature don't collide.
    merged_dict = {}  # key -> list of [x, y, w, h, r, g, b, 'RECTF']
    
    for span in h_spans:
        x, y, w, h, r, g, b, op = span
        key = (x, w, r, g, b)
        if key in merged_dict:
            # Try to extend the most recent span with this key
            prev = merged_dict[key][-1]
            if y == prev[1] + prev[3]:  # y == prev_y + prev_h
                prev[3] += 1  # extend height
                continue
        # Start a new vertical span
        if key not in merged_dict:
            merged_dict[key] = []
        merged_dict[key].append([x, y, w, h, r, g, b, op])
    
    # Flatten and sort by y then x for deterministic output
    result = []
    for spans in merged_dict.values():
        result.extend(tuple(s) for s in spans)
    result.sort(key=lambda s: (s[1], s[0]))
    return result

def main():
    parser = argparse.ArgumentParser(description="Convert PNG frames to GeOS CSV timeline")
    parser.add_argument("frames_dir", help="Directory containing PNG frames")
    parser.add_argument("-o", "--output", help="Output CSV file")
    parser.add_argument("--res", type=int, default=256, help="Target resolution (square)")
    
    args = parser.parse_args()
    
    if not os.path.isdir(args.frames_dir):
        print(f"Error: {args.frames_dir} is not a directory")
        sys.exit(1)
        
    files = sorted([f for f in os.listdir(args.frames_dir) if f.endswith(".png")])
    if not files:
        print("No PNG files found")
        sys.exit(1)
        
    csv_rows = []
    prev_img = None
    
    print(f"Processing {len(files)} frames...")
    
    for i, filename in enumerate(files):
        path = os.path.join(args.frames_dir, filename)
        img = Image.open(path).convert("RGB")
        if img.size != (args.res, args.res):
            img = img.resize((args.res, args.res), Image.NEAREST)
            
        diff_results = get_dirty_rects(prev_img, img)
        
        for x, y, w, h, r, g, b, op in diff_results:
            csv_rows.append({
                'frame': i,
                'op': op,
                'x': x,
                'y': y,
                'w': w,
                'h': h,
                'r': r,
                'g': g,
                'b': b,
                'text': ''
            })
            
        prev_img = img
        if i % 10 == 0:
            print(f"  Frame {i}...")

    header = ['frame', 'op', 'x', 'y', 'w', 'h', 'r', 'g', 'b', 'text']
    
    if args.output:
        with open(args.output, 'w', newline='') as f:
            writer = csv.DictWriter(f, fieldnames=header)
            writer.writeheader()
            writer.writerows(csv_rows)
        print(f"Wrote {len(csv_rows)} rows to {args.output}")
    else:
        writer = csv.DictWriter(sys.stdout, fieldnames=header)
        writer.writeheader()
        writer.writerows(csv_rows)

if __name__ == "__main__":
    main()
