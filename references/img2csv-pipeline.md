# img2csv Optimization Pipeline

The `img2csv.py` tool converts PNG frames into optimized CSV timelines for the Geometry OS visual substrate. It employs a 4-stage optimization pipeline to minimize the number of `RECTF` and `FILL` operations, ensuring high-performance animation.

## Stage 1: Solid Frame Detection (FILL)
If 100% of the pixels in a frame are the same color, the entire frame is emitted as a single `FILL` operation. This is the most efficient state.

## Stage 2: Horizontal Span Merging
For non-solid frames, the tool scans each scanline to identify contiguous runs of the same color. These are merged into horizontal spans (width > 1).

## Stage 3: Vertical Span Merging (Dict-of-Lists)
This stage merges contiguous horizontal spans of the same color and width into vertical rectangles (`RECTF`).
- **Algorithm:** Uses a dictionary mapping signatures `(x, w, r, g, b)` to lists of active vertical "chains".
- **Disjoint Preservation:** By maintaining a list of chains per signature, the algorithm correctly preserves disjoint regions of the same color and width that overlap in X but are separated vertically.
- **Complexity:** $O(N)$ where $N$ is the number of horizontal spans.

## Stage 4: High-Coverage Heuristic (FILL)
If the dominant color in a frame (excluding the background) covers more than 70% of the changed area, the tool emits a `FILL` for that color and then overlays the remaining changes. This significantly reduces operation count for busy frames with a common background or dominant subject.

## Validation Results
- **Blue Rectangle (10x10):** Successfully merged into exactly 1 `RECTF`.
- **Disjoint Red Spans:** Correctly preserved as 2 separate `RECTF` operations.
- **Interleaving Green Span:** No interference with adjacent color tracking.

## Usage
```bash
python3 scripts/img2csv.py frame.png --output timeline.csv
```
