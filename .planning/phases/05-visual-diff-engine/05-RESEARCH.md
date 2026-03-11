# Phase 5: Visual Diff Engine - Research

**Researched:** 2026-03-08
**Domain:** Binary diff visualization, PixelRTS v2 format, CLI output
**Confidence:** HIGH

## Summary

This phase implements a visual diff engine for comparing two `.rts.png` files. The core challenge is mapping byte-level differences back to visual Hilbert-space coordinates and presenting meaningful output in the terminal.

The implementation leverages the existing `PixelRTSDecoder` class to extract binary data from both PNGs, compares the raw bytes, then uses the `HilbertCurve` class to map changed byte positions back to (x, y) pixel coordinates for visualization. The existing codebase already has the foundational pieces: `feedback_loop.py` demonstrates diff masking with numpy, and `pixelrts_analyze.py` shows the Rich library pattern for terminal output.

**Primary recommendation:** Create a new `PixelRTSDiffer` class that combines the existing decoder + Hilbert curve + numpy diff operations, outputting results via Rich tables with a graceful plain-text fallback.

## Standard Stack

The established libraries/tools for this domain:

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| numpy | >=1.24.0 | Array operations for diff computation | Already in use, efficient byte comparison |
| Pillow | >=10.0.0 | PNG loading and metadata extraction | Already in use for PixelRTS encoding/decoding |
| Rich | optional | Terminal output with colors/tables | Already used in `pixelrts_analyze.py` |

### Supporting
| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| scipy.ndimage | any | Connected region labeling | For grouping changed pixels into regions |
| click | optional | Colored output fallback | Already in CLI, fallback when Rich unavailable |

### Alternatives Considered
| Instead of | Could Use | Tradeoff |
|------------|-----------|----------|
| Rich | click.secho | Rich provides tables/panels, click only basic colors |
| numpy diff | pixelmatch | pixelmatch is pixel-based, we need byte-level diff |
| Custom Hilbert | hilbertcurve package | Existing implementation already works |

**Installation:**
```bash
# Core dependencies already installed
# Optional: pip install rich scipy
```

## Architecture Patterns

### Recommended Project Structure
```
systems/pixel_compiler/
├── pixelrts_diff.py           # New: PixelRTSDiffer class
├── pixelrts_v2_core.py        # Existing: HilbertCurve, PixelRTSDecoder
├── pixelrts_cli.py            # Modified: Add 'diff' subcommand
└── feedback_loop.py           # Reference: get_diff_mask pattern
```

### Pattern 1: Byte-Level Diff with Hilbert Mapping

**What:** Compare raw bytes from decoded PNGs, then map byte indices to (x, y) coordinates using the Hilbert LUT.

**When to use:** Always - this is the core diff operation.

**Example:**
```python
# Source: Based on pixelrts_v2_core.py PixelRTSDecoder and HilbertCurve
from pixelrts_v2_core import PixelRTSDecoder, HilbertCurve
import numpy as np

class PixelRTSDiffer:
    def compare(self, old_png: bytes, new_png: bytes) -> dict:
        # Decode both PNGs to raw bytes
        decoder = PixelRTSDecoder()
        old_data = decoder.decode(old_png)
        new_data = decoder.decode(new_png)

        # Get metadata for grid size
        metadata = decoder.get_metadata()
        grid_size = metadata.get('grid_size', 256)

        # Compute byte-level diff
        old_arr = np.frombuffer(old_data, dtype=np.uint8)
        new_arr = np.frombuffer(new_data, dtype=np.uint8)

        # Pad shorter array
        max_len = max(len(old_arr), len(new_arr))
        old_padded = np.pad(old_arr, (0, max_len - len(old_arr)))
        new_padded = np.pad(new_arr, (0, max_len - len(new_arr)))

        # Calculate diff statistics
        added_mask = (old_padded == 0) & (new_padded != 0)
        removed_mask = (old_padded != 0) & (new_padded == 0)
        changed_mask = (old_padded != new_padded) & ~added_mask & ~removed_mask

        return {
            'added_bytes': int(np.sum(added_mask)),
            'removed_bytes': int(np.sum(removed_mask)),
            'changed_bytes': int(np.sum(changed_mask)),
            'total_bytes': max_len,
            'diff_mask': changed_mask | added_mask | removed_mask,
            'old_data': old_padded,
            'new_data': new_padded,
            'grid_size': grid_size
        }

    def map_to_hilbert(self, diff_mask: np.ndarray, grid_size: int) -> list:
        """Map changed byte indices to Hilbert (x, y) coordinates."""
        order = int(np.log2(grid_size))
        hilbert = HilbertCurve(order=order)
        lut = hilbert.generate_lut()

        # Each pixel holds 4 bytes (RGBA)
        changed_pixels = []
        for byte_idx in np.where(diff_mask)[0]:
            pixel_idx = byte_idx // 4
            if pixel_idx < len(lut):
                x, y = lut[pixel_idx]
                changed_pixels.append({
                    'byte_idx': int(byte_idx),
                    'pixel_idx': int(pixel_idx),
                    'x': int(x),
                    'y': int(y),
                    'channel': ['R', 'G', 'B', 'A'][byte_idx % 4]
                })
        return changed_pixels
```

### Pattern 2: Terminal Output with Rich

**What:** Use Rich library for formatted tables and colored output, with plain text fallback.

**When to use:** CLI output for diff command.

**Example:**
```python
# Source: Based on pixelrts_analyze.py pattern
try:
    from rich.console import Console
    from rich.table import Table
    from rich.panel import Panel
    HAS_RICH = True
except ImportError:
    HAS_RICH = False

def format_diff_output(result: dict) -> str:
    if not HAS_RICH:
        return format_diff_plain(result)
    return format_diff_rich(result)

def format_diff_rich(result: dict) -> str:
    console = Console()

    # Summary panel
    summary = (
        f"[green]Added:[/] {result['added_bytes']} bytes\n"
        f"[red]Removed:[/] {result['removed_bytes']} bytes\n"
        f"[yellow]Changed:[/] {result['changed_bytes']} bytes\n"
        f"[dim]Total:[/] {result['total_bytes']} bytes"
    )
    console.print(Panel(summary, title="[bold]Diff Summary[/]"))

    # Changed regions table
    if result.get('changed_regions'):
        table = Table(title="Changed Regions (Hilbert Space)")
        table.add_column("Region", style="cyan")
        table.add_column("Bytes", justify="right")
        table.add_column("X Range", justify="center")
        table.add_column("Y Range", justify="center")
        for region in result['changed_regions'][:20]:  # Limit output
            table.add_row(
                region['id'],
                str(region['byte_count']),
                f"{region['x_min']}-{region['x_max']}",
                f"{region['y_min']}-{region['y_max']}"
            )
        console.print(table)

    return ""
```

### Pattern 3: Region Grouping with scipy

**What:** Group adjacent changed pixels into regions for easier interpretation.

**When to use:** When showing visual summary of changes.

**Example:**
```python
# Source: Based on feedback_loop.py get_changed_regions pattern
from scipy import ndimage

def get_changed_regions(diff_mask: np.ndarray, grid_size: int) -> list:
    """Group changed bytes into connected regions in Hilbert space."""
    order = int(np.log2(grid_size))
    hilbert = HilbertCurve(order=order)
    lut = hilbert.generate_lut()

    # Create 2D mask from byte diff
    pixel_mask = np.zeros((grid_size, grid_size), dtype=bool)
    for byte_idx in np.where(diff_mask)[0]:
        pixel_idx = byte_idx // 4
        if pixel_idx < len(lut):
            x, y = lut[pixel_idx]
            pixel_mask[y, x] = True

    # Label connected regions
    labeled, num_features = ndimage.label(pixel_mask)

    regions = []
    for i in range(1, num_features + 1):
        coords = np.where(labeled == i)
        if len(coords[0]) > 0:
            y_coords, x_coords = coords
            regions.append({
                'id': f"R{i}",
                'x_min': int(x_coords.min()),
                'x_max': int(x_coords.max()),
                'y_min': int(y_coords.min()),
                'y_max': int(y_coords.max()),
                'pixel_count': int(len(x_coords)),
                'byte_count': int(len(x_coords) * 4)  # Approximate
            })

    return sorted(regions, key=lambda r: r['byte_count'], reverse=True)
```

### Anti-Patterns to Avoid

- **Comparing PNG pixels directly:** Must decode to raw bytes first - PNG compression means pixel differences don't map to byte differences
- **Ignoring grid size differences:** Two PNGs may have different grid sizes; handle this gracefully
- **Re-implementing Hilbert logic:** Use existing `HilbertCurve` class, don't write new curve code
- **Large output without limits:** Cap terminal output (e.g., max 20 regions) to avoid flooding

## Don't Hand-Roll

Problems that look simple but have existing solutions:

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Decode PixelRTS PNG | Custom PNG parser | `PixelRTSDecoder.decode()` | Handles metadata, compression, all edge cases |
| Map index to coordinates | New Hilbert implementation | `HilbertCurve.index_to_coord()` | Existing tested implementation |
| Terminal colors | ANSI escape sequences | Rich or click.secho | Handles cross-platform, fallbacks |
| Connected region detection | Custom flood fill | `scipy.ndimage.label()` | Efficient, handles edge cases |

**Key insight:** The codebase already has 90% of what's needed - this phase is primarily integration and output formatting.

## Common Pitfalls

### Pitfall 1: Grid Size Mismatch

**What goes wrong:** Old and new PNGs have different grid sizes (e.g., 512x512 vs 1024x1024), causing index errors or incorrect coordinate mapping.

**Why it happens:** Grid size is determined by data size at encode time. A larger file gets a larger grid.

**How to avoid:**
- Use metadata from each PNG independently
- Handle size mismatch by padding shorter data
- Report size difference in output

**Warning signs:**
- `IndexError` when accessing Hilbert LUT
- Coordinates outside grid bounds
- Metadata shows different `grid_size` values

### Pitfall 2: Forgetting RGBA Packing

**What goes wrong:** Treating pixel index as byte index (or vice versa), resulting in off-by-4 errors.

**Why it happens:** Each pixel stores 4 bytes (RGBA), so pixel_idx = byte_idx // 4, not byte_idx.

**How to avoid:**
- Always document whether working with bytes or pixels
- Use explicit conversion: `pixel_idx = byte_idx // 4`, `byte_offset = byte_idx % 4`
- Test with known byte values at specific positions

**Warning signs:**
- Diff highlights wrong pixels
- Channel information incorrect
- Byte counts don't match pixel counts * 4

### Pitfall 3: Rich Import Failure Without Fallback

**What goes wrong:** Code crashes when Rich isn't installed, even though user requested plain output.

**Why it happens:** Rich import at module level without try/except.

**How to avoid:**
- Always wrap Rich import in try/except
- Implement plain text fallback (see `pixelrts_analyze.py` pattern)
- Test both code paths

**Warning signs:**
- ImportError on systems without Rich
- No output when `--json` flag used

### Pitfall 4: Excessive Terminal Output

**What goes wrong:** Diffing large files produces thousands of lines of output, overwhelming the terminal.

**Why it happens:** Not limiting output size.

**How to avoid:**
- Cap region list display (e.g., show top 20)
- Add `--verbose` flag for full output
- Default to summary mode with counts only

**Warning signs:**
- Output takes >5 seconds to render
- Terminal scrollback fills
- User can't see summary at top

## Code Examples

### Full Diff Function Implementation

```python
# Source: Synthesized from existing patterns in codebase
from pathlib import Path
from typing import Optional
import numpy as np
from pixelrts_v2_core import PixelRTSDecoder, HilbertCurve

class PixelRTSDiffer:
    """Compare two PixelRTS PNG files and report differences."""

    def __init__(self):
        self.decoder = PixelRTSDecoder()

    def diff(self, old_path: str, new_path: str) -> dict:
        """
        Compare two .rts.png files.

        Returns:
            Dictionary with:
            - added_bytes: Count of bytes added
            - removed_bytes: Count of bytes removed
            - changed_bytes: Count of bytes modified
            - total_bytes: Total bytes compared
            - change_percent: Percentage of bytes changed
            - changed_regions: List of connected regions in Hilbert space
            - old_metadata: Metadata from old file
            - new_metadata: Metadata from new file
        """
        # Load and decode files
        with open(old_path, 'rb') as f:
            old_png = f.read()
        with open(new_path, 'rb') as f:
            new_png = f.read()

        old_data = self.decoder.decode(old_png)
        old_meta = self.decoder.get_metadata()

        self.decoder._metadata = None  # Reset for new file
        new_data = self.decoder.decode(new_png)
        new_meta = self.decoder.get_metadata()

        # Convert to numpy arrays
        old_arr = np.frombuffer(old_data, dtype=np.uint8)
        new_arr = np.frombuffer(new_data, dtype=np.uint8)

        # Pad to same length
        max_len = max(len(old_arr), len(new_arr))
        if len(old_arr) < max_len:
            old_arr = np.pad(old_arr, (0, max_len - len(old_arr)))
        if len(new_arr) < max_len:
            new_arr = np.pad(new_arr, (0, max_len - len(new_arr)))

        # Calculate diff statistics
        added = np.sum((old_arr == 0) & (new_arr != 0))
        removed = np.sum((old_arr != 0) & (new_arr == 0))
        changed = np.sum((old_arr != new_arr) &
                        (old_arr != 0) & (new_arr != 0))

        # Get diff mask
        diff_mask = old_arr != new_arr

        # Get grid size (use larger)
        grid_size = max(
            old_meta.get('grid_size', 256),
            new_meta.get('grid_size', 256)
        )

        # Map to regions
        regions = self._get_regions(diff_mask, grid_size)

        return {
            'old_file': str(old_path),
            'new_file': str(new_path),
            'added_bytes': int(added),
            'removed_bytes': int(removed),
            'changed_bytes': int(changed),
            'unchanged_bytes': int(max_len - added - removed - changed),
            'total_bytes': int(max_len),
            'change_percent': round(100 * (added + removed + changed) / max_len, 2)
                           if max_len > 0 else 0,
            'changed_regions': regions,
            'old_metadata': old_meta,
            'new_metadata': new_meta
        }

    def _get_regions(self, diff_mask: np.ndarray, grid_size: int) -> list:
        """Group changed bytes into regions."""
        try:
            from scipy import ndimage
        except ImportError:
            return []  # Skip regions if scipy unavailable

        order = int(np.log2(grid_size))
        hilbert = HilbertCurve(order=order)
        lut = hilbert.generate_lut()

        # Create 2D mask
        pixel_mask = np.zeros((grid_size, grid_size), dtype=bool)
        for byte_idx in np.where(diff_mask)[0]:
            pixel_idx = byte_idx // 4
            if pixel_idx < len(lut):
                x, y = lut[pixel_idx]
                if y < grid_size and x < grid_size:
                    pixel_mask[y, x] = True

        # Label regions
        labeled, num_features = ndimage.label(pixel_mask)

        regions = []
        for i in range(1, min(num_features + 1, 101)):  # Cap at 100
            coords = np.where(labeled == i)
            if len(coords[0]) > 0:
                y_coords, x_coords = coords
                regions.append({
                    'id': f"R{i}",
                    'x_min': int(x_coords.min()),
                    'x_max': int(x_coords.max()),
                    'y_min': int(y_coords.min()),
                    'y_max': int(y_coords.max()),
                    'pixel_count': int(len(x_coords))
                })

        return sorted(regions, key=lambda r: r['pixel_count'], reverse=True)
```

### CLI Integration

```python
# Source: Based on pixelrts_cli.py subparser pattern
def cmd_diff(args):
    """Handle diff command."""
    from pixelrts_diff import PixelRTSDiffer

    differ = PixelRTSDiffer()
    result = differ.diff(args.old, args.new)

    if args.json:
        import json
        # Clean up for JSON serialization
        result['old_metadata'] = {k: v for k, v in result['old_metadata'].items()
                                  if isinstance(v, (str, int, float, bool, list, dict))}
        result['new_metadata'] = {k: v for k, v in result['new_metadata'].items()
                                  if isinstance(v, (str, int, float, bool, list, dict))}
        print(json.dumps(result, indent=2))
    else:
        print(format_diff_output(result))

    # Exit with code based on whether changes detected
    return 0 if result['change_percent'] == 0 else 1

# In main():
diff_parser = subparsers.add_parser('diff', help='Compare two .rts.png files')
diff_parser.add_argument('old', help='Original .rts.png file')
diff_parser.add_argument('new', help='New .rts.png file')
diff_parser.add_argument('--json', action='store_true',
                        help='Output as JSON')
diff_parser.add_argument('--output', '-o',
                        help='Save diff visualization to file')
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| pixelmatch for image diff | Byte-level diff + Hilbert mapping | This phase | Preserves semantic meaning of bytes |
| Plain text diff output | Rich tables with colors | pixelrts_analyze.py | Better readability |
| Custom Hilbert implementation | `HilbertCurve` class from v2_core | PixelRTS v2 | Tested, proven code |

**Deprecated/outdated:**
- Direct PNG pixel comparison: Use decoded bytes instead
- Manual ANSI color codes: Use Rich or click

## Open Questions

1. **Output visualization format**
   - What we know: CLI must produce terminal output, Rich is available
   - What's unclear: Should we also generate a diff PNG visualization?
   - Recommendation: Start with terminal-only, add PNG output as `--output` option

2. **Region detail level**
   - What we know: scipy.ndimage.label can group changed pixels
   - What's unclear: How much detail to show per region (byte values? hex dump?)
   - Recommendation: Show region bounds and byte counts, add `--verbose` for byte-level detail

## Sources

### Primary (HIGH confidence)
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler/pixelrts_v2_core.py` - HilbertCurve class, PixelRTSDecoder, PixelRTSMetadata
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler/feedback_loop.py` - Diff mask pattern, region grouping
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler/pixelrts_analyze.py` - Rich output pattern, fallback handling
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/pixel_compiler/pixelrts_cli.py` - CLI subparser pattern

### Secondary (MEDIUM confidence)
- `/home/jericho/zion/projects/geometry_os/geometry_os/systems/visual_shell/web/visual_regression.py` - Image comparison pattern (pixelmatch)
- `/home/jericho/zion/projects/geometry_os/geometry_os/tests/unit/test_pixelrts_v2_core.py` - Hilbert curve test patterns

### Tertiary (LOW confidence)
- Training knowledge: Rich library API, scipy.ndimage.label usage (verified against codebase patterns)

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH - All libraries already in use in the codebase
- Architecture: HIGH - Existing code demonstrates all needed patterns
- Pitfalls: HIGH - Based on analysis of existing code and common binary diff issues

**Research date:** 2026-03-08
**Valid until:** 30 days (stable patterns, existing codebase)
