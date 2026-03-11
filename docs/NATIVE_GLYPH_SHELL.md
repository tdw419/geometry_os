# Native Glyph Shell (G-Shell)

> AI-Native Terminal Interface with GPU-Accelerated Rendering

**Version:** 2.0.0  
**Last Updated:** 2026-03-11  
**Status:** Production Ready

---

## Overview

The Native Glyph Shell (G-Shell) is Geometry OS's high-performance terminal interface that combines traditional shell functionality with AI-native features and GPU-accelerated rendering. It provides zero-latency access to the ASCII Scene Graph and seamless integration with AI context injection systems.

### Key Features

| Feature | Description | Status |
|---------|-------------|--------|
| **GPU-Accelerated Rendering** | Numba JIT-compiled operations with 27.8x average speedup | ✅ Production |
| **Hilbert Curve Mapping** | Fractal space-filling curves for memory visualization (87x faster) | ✅ Production |
| **Foveated Rendering** | Focus-based GPU optimization (50%+ compute reduction) | ✅ Production |
| **AI Context Injection** | Seamless integration with Gemini and Claude | ✅ Production |
| **GNB State Sync** | Real-time state export to `.geometry/gnb_state.ascii` | ✅ Production |
| **Training Program** | Comprehensive 2-4 hour training with assessments | ✅ Available |

---

## Performance Metrics

### Recent Optimizations (v2.0)

The Native Glyph Shell has been extensively optimized using Numba JIT compilation and vectorized NumPy operations:

| Module | Operation | Baseline (µs) | Optimized (µs) | Speedup | Target |
|--------|-----------|---------------|----------------|---------|--------|
| **Hilbert** | Batch 1000 | 629.8 | 7.2 | **87x** | < 500 µs |
| **Pixel** | Premultiply 64K | 10,940 | 488 | **22x** | < 5000 µs |
| **Pixel** | Premultiply (Numba) | 10,654 | 35 | **303x** | < 500 µs |
| **Hilbert** | Single lookup | 0.91 | 0.14 | **6.5x** | < 1 µs |
| **Foveated** | Batch 10K | 15.53 | 5.51 | **2.8x** | < 100 µs |
| **Pipeline** | 100 cells | 138.50 | 20.78 | **6.7x** | < 200 µs |
| **Color** | Single blend | 0.67 | 0.15 | **4.5x** | < 1 µs |

**All 13 benchmarks pass performance targets with 100% success rate.**

### Rust Performance Optimizations

The Rust implementation includes additional low-level optimizations:

| Benchmark | Before | After | Improvement |
|-----------|--------|-------|-------------|
| `vshell_hilbert/xy2d_1k` | 7.10 µs | 6.99 µs | **-1.5%** |
| `vshell_hilbert/roundtrip_1k` | 13.7 µs | 13.2 µs | **-3.9%** |
| `vshell_glyph/get_cell` | 97 ps | 94 ps | **-3.4%** |
| `vshell_glyph/fill_all_80x24` | 1.78 µs | 1.75 µs | **-2.2%** |
| `vshell_pixel/rgba_to_bgra` | 19.2 µs | 18.8 µs | **-2.2%** |

---

## Installation

### Prerequisites

- **Python 3.10+** (3.12 recommended)
- **NumPy** (for vectorized operations)
- **Numba** (for JIT compilation)
- **Rust 1.70+** (optional, for native components)

```bash
# Clone the repository
git clone https://github.com/tdw419/geometry_os.git
cd geometry_os

# Install Python dependencies
pip install -r requirements.txt
pip install numba numpy

# (Optional) Build Rust components
cd systems/visual_shell
cargo build --release
```

---

## Quick Start

### Launch the G-Shell

```bash
# Method 1: Using the CLI (recommended)
python3 geometry_os_cli.py shell

# Method 2: Direct execution
python3 systems/visual_shell/geos_terminal.py

# Method 3: Enhanced UI version
python3 systems/visual_shell/enhanced_glyph_shell.py

# Method 4: Native optimized version
python3 systems/visual_shell/native_geos_terminal.py
```

### First Commands

```bash
# Check G-Shell is working
g help

# View current GNB state
cat .geometry/gnb_state.ascii

# List available Geometry OS commands
g --list

# Open command palette
# Press Ctrl+P
```

---

## Architecture

### Component Overview

```
┌─────────────────────────────────────────────────────────────┐
│              NATIVE GLYPH SHELL ARCHITECTURE                │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  ┌──────────────┐   ┌──────────────┐   ┌──────────────┐   │
│  │  Terminal    │──▶│  GNB Sync    │──▶│  ASCII Scene │   │
│  │  Interface   │   │  Engine      │   │  Graph       │   │
│  └──────────────┘   └──────────────┘   └──────────────┘   │
│         │                   │                    │           │
│         ▼                   ▼                    ▼           │
│  ┌──────────────┐   ┌──────────────┐   ┌──────────────┐   │
│  │  AI Context  │   │  Optimized   │   │  Foveated    │   │
│  │  Injection   │   │  Rendering   │   │  Renderer    │   │
│  └──────────────┘   └──────────────┘   └──────────────┘   │
│         │                   │                    │           │
│         └───────────────────┴────────────────────┘           │
│                             │                                 │
│                    ┌────────▼────────┐                       │
│                    │   GPU Kernel    │                       │
│                    │  (Numba/SPIR-V) │                       │
│                    └─────────────────┘                       │
└─────────────────────────────────────────────────────────────┘
```

### Key Modules

| Module | Location | Purpose |
|--------|----------|---------|
| `optimized_glyph_ops_v2.py` | `systems/visual_shell/native/` | Numba-accelerated rendering |
| `enhanced_glyph_shell.py` | `systems/visual_shell/` | Enhanced UI with keyboard navigation |
| `geos_terminal.py` | `systems/visual_shell/` | Basic terminal interface |
| `native_geos_terminal.py` | `systems/visual_shell/` | Optimized native terminal |
| `visual_shell.wgsl` | `systems/visual_shell/wgsl/` | WebGPU compute shaders |

---

## Optimized Operations

### 1. Hilbert Curve Mapping

The Hilbert curve mapper provides fractal space-filling curves for memory visualization:

```python
from systems.visual_shell.native.optimized_glyph_ops_v2 import HilbertCurveV2

# Initialize with caching
hilbert = HilbertCurveV2.get_cached(order=8)  # 256x256 grid

# Single coordinate conversion
x, y = hilbert.d_to_xy(12345)

# Batch conversion (87x faster than loop)
indices = np.arange(65536)
coords = hilbert.d_to_xy_batch(indices)  # Returns (N, 2) array
```

**Optimizations:**
- Pre-computed lookup tables for common orders (8, 9, 10)
- NumPy batch operations for vectorized processing
- Cache-friendly memory access patterns
- Unsigned arithmetic for better performance

### 2. Pixel Buffer Operations

High-performance pixel operations using Numba JIT:

```python
from systems.visual_shell.native.optimized_glyph_ops_v2 import (
    premultiply_alpha_2d,
    rgba_to_bgra_2d,
    blend_colors_batch_packed,
)

# Alpha premultiplication (303x faster)
rgba_array = np.random.randint(0, 256, (65536, 4), dtype=np.uint8)
premultiplied = premultiply_alpha_2d(rgba_array)

# Channel swapping (RGBA → BGRA)
bgra_array = rgba_to_bgra_2d(rgba_array)

# Batch color blending
fg_colors = np.array([0xFF0000FF, 0x00FF00FF], dtype=np.uint32)  # Packed R|G|B|A
bg_colors = np.array([0x000000FF, 0x000000FF], dtype=np.uint32)
blended = np.empty_like(fg_colors)
blend_colors_batch_packed(fg_colors, bg_colors, blended)
```

**Optimizations:**
- Numba parallel processing with `prange`
- SIMD-friendly packed integer representation
- Hybrid approach (NumPy for large buffers, direct loop for small)
- Integer math instead of float for alpha blending

### 3. Foveated Rendering

GPU-optimized rendering based on visual focus:

```python
from systems.visual_shell.native.optimized_glyph_ops_v2 import FoveatedRendererV2

# Initialize renderer
renderer = FoveatedRendererV2(
    foveal_radius=50.0,
    parafoveal_radius=150.0,
    peripheral_radius=500.0
)

# Classify batch of points
points = np.array([[x, y] for x in range(1920) for y in range(1080)])
regions = renderer.classify_batch(points, focus=(960.0, 540.0))

# Regions: 0=foveal, 1=parafoveal, 2=peripheral
foveal_mask = regions == 0
```

**Optimizations:**
- Vectorized distance computation
- Batch classification with single NumPy operation
- Pre-computed squared radii for fast comparison
- 50%+ GPU compute time reduction

### 4. Color Blending

Fast integer-based color blending:

```python
from systems.visual_shell.native.optimized_glyph_ops_v2 import (
    blend_colors_packed,
    blend_colors_rgba_batch,
)

# Single color blend (packed uint32)
fg = 0xFF0000C0  # Red with 75% alpha
bg = 0x0000FFFF  # Blue with 100% alpha
result = blend_colors_packed(fg, bg)

# Batch RGBA blending (in-place)
fg_array = np.random.randint(0, 256, (1000, 4), dtype=np.uint8)
bg_array = np.random.randint(0, 256, (1000, 4), dtype=np.uint8)
blend_colors_rgba_batch(fg_array, bg_array)  # Result in bg_array
```

**Optimizations:**
- Packed integer representation (R|G|B|A as uint32)
- Integer arithmetic instead of float
- Parallel processing with Numba
- In-place operations to reduce memory allocation

---

## AI Context Injection

The G-Shell provides seamless integration with AI assistants:

### Using Gemini

```bash
# Inject current GNB state into Gemini prompt
gemini "Analyze the current system state and suggest optimizations"

# The command automatically includes:
# - Current directory structure
# - GNB state from .geometry/gnb_state.ascii
# - Recent command history
# - System status
```

### Using Claude

```bash
# Inject context into Claude
claude "Review the visual shell rendering pipeline for bottlenecks"

# Context includes:
# - Visual shell code snippets
# - Performance metrics
# - Recent changes
```

### GNB State Synchronization

The Geometric Neural Buffer (GNB) automatically exports state to `.geometry/gnb_state.ascii`:

```
# GNB State Snapshot
# Generated: 2026-03-11 08:45:27
# Version: 2.0

[shell]
mode: interactive
terminal: /bin/bash
cwd: /home/user/geometry_os
history_size: 1000

[rendering]
foveal_radius: 50.0
parafoveal_radius: 150.0
focus_point: (960, 540)
fps: 60

[performance]
hilbert_cache_hits: 1523
hilbert_cache_misses: 12
avg_frame_time_us: 16.2
```

---

## Keyboard Navigation

### Essential Shortcuts

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Ctrl+P` | Command Palette | Open visual command selector |
| `Ctrl+H` | History Panel | Toggle command history |
| `Ctrl+L` | Clear Screen | Clear terminal buffer |
| `?` | Help Overlay | Show all keyboard shortcuts |
| `Esc` | Close Overlay | Dismiss any open panel |
| `Tab` | Autocomplete | Complete commands and paths |

### Navigation Shortcuts

| Shortcut | Action |
|----------|--------|
| `Ctrl+R` | Reverse search history |
| `Ctrl+A` | Move to line start |
| `Ctrl+E` | Move to line end |
| `Ctrl+U` | Clear line before cursor |
| `Ctrl+K` | Clear line after cursor |
| `Alt+B` | Move back one word |
| `Alt+F` | Move forward one word |

---

## Geometry OS Commands

All Geometry OS commands use the `g` prefix:

### System Commands

```bash
g help              # Show available commands
g status            # Display system status
g --list            # List all commands
g version           # Show version information
```

### Visualization Commands

```bash
g map               # Open Infinite Map viewer
g render [options]  # Render current state
g focus <x> <y>     # Set foveated rendering focus
```

### Performance Commands

```bash
g benchmark         # Run performance benchmarks
g profile           # Profile current operations
g optimize          # Apply optimizations
```

### AI Commands

```bash
g ai status         # Check AI integration status
g ai inject         # Manually inject context
```

---

## Training Program

### Comprehensive 2-4 Hour Training

The Native Glyph Shell includes a complete training program with:

- **7 Training Modules** covering all features
- **Hands-on Exercises** for skill reinforcement
- **Interactive Tutorial** with automatic feedback
- **Assessments** to measure progress
- **Quick Reference** for daily use

### Training Modules

| Module | Topic | Duration | File |
|--------|-------|----------|------|
| 1 | Getting Started | 15 min | [Module 1](training/modules/module_01_introduction.md) |
| 2 | Keyboard Navigation | 20 min | [Module 2](training/modules/module_02_basic_operations.md) |
| 3 | Geometry OS Commands | 30 min | [Module 3](training/modules/module_03_process_management.md) |
| 4 | AI Context Injection | 25 min | [Module 4](training/modules/module_04_advanced_features.md) |
| 5 | GNB State Synchronization | 20 min | [Module 5](training/modules/module_05_customization.md) |
| 6 | Advanced Features | 30 min | [Module 6](training/NATIVE_GLYPH_SHELL_TRAINING_PROGRAM.md) |
| 7 | Troubleshooting | 15 min | [Module 7](training/resources/troubleshooting_guide.md) |

**Total Duration:** ~2.5 hours

### Interactive Tutorial

```bash
# Start interactive tutorial
python3 scripts/glyph_shell_tutorial.py

# Start at specific module
python3 scripts/glyph_shell_tutorial.py --module 3

# Practice mode (no scoring)
python3 scripts/glyph_shell_tutorial.py --practice
```

### Quick Reference

Keep the quick reference handy:

```bash
cat docs/training/GLYPH_SHELL_QUICK_REFERENCE.md
```

---

## Performance Tuning

### Optimization Guidelines

1. **Use Batch Operations**
   ```python
   # Bad: Loop through individual operations
   for i in range(10000):
       x, y = hilbert.d_to_xy(i)
   
   # Good: Batch operation
   coords = hilbert.d_to_xy_batch(np.arange(10000))
   ```

2. **Reuse Cached Instances**
   ```python
   # Bad: Create new instance each time
   def render():
       hilbert = HilbertCurveV2(order=8)
       ...
   
   # Good: Use cached instance
   hilbert = HilbertCurveV2.get_cached(order=8)
   def render():
       ...
   ```

3. **Use Packed Integer Colors**
   ```python
   # Bad: Color objects
   color1 = Color(r=1.0, g=0.0, b=0.0, a=0.5)
   color2 = Color(r=0.0, g=0.0, b=1.0, a=1.0)
   result = color1.blend_over(color2)
   
   # Good: Packed integers
   result = blend_colors_packed(0xFF000080, 0x0000FFFF)
   ```

4. **Leverage Foveated Rendering**
   ```python
   # Only render high detail in foveal region
   regions = renderer.classify_batch(points, focus)
   
   # Use lower resolution for peripheral regions
   peripheral_points = points[regions == 2]
   # Render at 1:4 or 1:16 resolution
   ```

### Benchmarking

Run performance benchmarks:

```bash
# Quick benchmark suite
python3 systems/visual_shell/benches/quick_benchmark.py

# Comprehensive comparison
python3 systems/visual_shell/benches/optimization_comparison.py

# Verification
python3 systems/visual_shell/benches/verify_optimizations.py
```

### Performance Targets

| Operation | Target | Optimized | Status |
|-----------|--------|-----------|--------|
| Color blend single | < 1 µs | 0.15 µs | ✅ |
| Hilbert single | < 1 µs | 0.14 µs | ✅ |
| Hilbert batch (1000) | < 500 µs | 7.2 µs | ✅ |
| Premultiply (64K) | < 500 µs | 35 µs | ✅ |
| Foveated classify (10K) | < 100 µs | 5.5 µs | ✅ |
| Pipeline (100 cells) | < 200 µs | 20.8 µs | ✅ |

---

## Troubleshooting

### Common Issues

#### 1. Slow Performance

**Symptom:** Rendering is slow, frame rate drops below 60 FPS.

**Solution:**
```bash
# Check if optimizations are loaded
python3 -c "from systems.visual_shell.native.optimized_glyph_ops_v2 import HilbertCurveV2; print('OK')"

# Verify Numba is installed
pip install numba

# Run benchmarks
python3 systems/visual_shell/benches/quick_benchmark.py
```

#### 2. Numba Compilation Errors

**Symptom:** JIT compilation fails with errors.

**Solution:**
```bash
# Clear Numba cache
rm -rf ~/.cache/numba
rm -rf systems/visual_shell/native/__pycache__/*.nbc
rm -rf systems/visual_shell/native/__pycache__/*.nbi

# Reinstall Numba
pip uninstall numba
pip install numba
```

#### 3. GPU Memory Issues

**Symptom:** Out of memory errors during rendering.

**Solution:**
```bash
# Reduce foveal radius
# In your code:
renderer = FoveatedRendererV2(foveal_radius=30.0)  # Smaller radius

# Process in smaller batches
batch_size = 1000  # Instead of 10000
```

#### 4. GNB Sync Not Working

**Symptom:** `.geometry/gnb_state.ascii` not updating.

**Solution:**
```bash
# Check if directory exists
mkdir -p .geometry

# Verify permissions
chmod 755 .geometry

# Manually trigger sync
g status --sync
```

### Debug Mode

Enable debug logging:

```bash
# Enable debug mode
export GNB_DEBUG=1
python3 systems/visual_shell/enhanced_glyph_shell.py

# Check logs
tail -f /tmp/gnb_debug.log
```

---

## API Reference

### HilbertCurveV2

```python
class HilbertCurveV2:
    """Optimized Hilbert curve with pre-computed lookup tables."""
    
    @classmethod
    def get_cached(cls, order: int) -> 'HilbertCurveV2':
        """Get cached instance for given order."""
        
    def d_to_xy(self, d: int) -> tuple[int, int]:
        """Convert 1D index to 2D coordinates."""
        
    def d_to_xy_batch(self, indices: np.ndarray) -> np.ndarray:
        """Batch conversion (87x faster)."""
        
    def xy_to_d(self, x: int, y: int) -> int:
        """Convert 2D coordinates to 1D index."""
```

### FoveatedRendererV2

```python
class FoveatedRendererV2:
    """GPU-optimized foveated rendering."""
    
    def __init__(self, foveal_radius: float, parafoveal_radius: float, 
                 peripheral_radius: float):
        """Initialize renderer with region radii."""
        
    def classify_batch(self, points: np.ndarray, focus: tuple) -> np.ndarray:
        """Classify points into regions (0=foveal, 1=parafoveal, 2=peripheral)."""
        
    def get_foveal_indices(self, points: np.ndarray, focus: tuple) -> np.ndarray:
        """Get indices of points in foveal region."""
```

### Color Operations

```python
def blend_colors_packed(fg: int, bg: int) -> int:
    """Blend two packed colors (uint32 R|G|B|A)."""

def blend_colors_batch_packed(fg: np.ndarray, bg: np.ndarray, out: np.ndarray):
    """Parallel batch blending."""

def premultiply_alpha_2d(rgba: np.ndarray) -> np.ndarray:
    """Premultiply alpha for RGBA array (N, 4)."""

def rgba_to_bgra_2d(rgba: np.ndarray) -> np.ndarray:
    """Convert RGBA to BGRA."""
```

---

## Examples

### Example 1: Batch Hilbert Mapping

```python
import numpy as np
from systems.visual_shell.native.optimized_glyph_ops_v2 import HilbertCurveV2

# Initialize
hilbert = HilbertCurveV2.get_cached(order=8)

# Map 65536 memory addresses to 2D coordinates
addresses = np.arange(65536)
coords = hilbert.d_to_xy_batch(addresses)

# coords is (65536, 2) array with x, y coordinates
print(f"Address 1000 -> ({coords[1000, 0]}, {coords[1000, 1]})")
```

### Example 2: Foveated Rendering

```python
import numpy as np
from systems.visual_shell.native.optimized_glyph_ops_v2 import FoveatedRendererV2

# Initialize renderer
renderer = FoveatedRendererV2(
    foveal_radius=50.0,
    parafoveal_radius=150.0,
    peripheral_radius=500.0
)

# Classify all pixels in 1920x1080 display
x_coords = np.arange(1920)
y_coords = np.arange(1080)
points = np.array([[x, y] for x in x_coords for y in y_coords])

regions = renderer.classify_batch(points, focus=(960, 540))

# Render at different detail levels
foveal_points = points[regions == 0]      # Full resolution
parafoveal_points = points[regions == 1]  # Half resolution
peripheral_points = points[regions == 2]  # Quarter resolution
```

### Example 3: Pixel Processing Pipeline

```python
import numpy as np
from systems.visual_shell.native.optimized_glyph_ops_v2 import (
    premultiply_alpha_2d,
    rgba_to_bgra_2d,
    blend_colors_batch_packed,
)

# Load image data (RGBA)
image_rgba = np.random.randint(0, 256, (1920 * 1080, 4), dtype=np.uint8)

# Premultiply alpha
premultiplied = premultiply_alpha_2d(image_rgba)

# Convert to BGRA for GPU
bgra = rgba_to_bgra_2d(premultiplied)

# Blend with background
fg_packed = bgra.view(np.uint32)
bg_packed = np.full(len(fg_packed), 0x000000FF, dtype=np.uint32)
blended = np.empty_like(fg_packed)
blend_colors_batch_packed(fg_packed, bg_packed, blended)
```

---

## Integration with Visual Shell

The Native Glyph Shell integrates seamlessly with the broader Visual Shell system:

### ASCII Scene Graph

```python
# G-Shell exports state to ASCII Scene Graph
# Location: .geometry/gnb_state.ascii
# Auto-synced on each command
```

### Geometric Native Browser (GNB)

```python
# Zero-latency native interface
# Location: systems/visual_shell/gnb.py
# Provides direct access to ASCII Scene Graph
```

### Enhanced Glyph Shell

```python
# Full-featured UI with keyboard navigation
# Location: systems/visual_shell/enhanced_glyph_shell.py
# Features: Command palette, history, help overlay
```

---

## Future Roadmap

### Planned Features (v2.1)

- [ ] **Eye Tracking Support** - Hardware eye tracking for dynamic foveated rendering
- [ ] **GPU Compute Shaders** - WebGPU compute shaders for batch operations
- [ ] **SIMD Intrinsics** - AVX2/NEON optimizations for pixel operations
- [ ] **Parallel Rayon** - Rust parallel processing with rayon
- [ ] **WASM Bridge** - WebAssembly compilation for browser support

### Experimental Features

- [ ] **Machine Learning Models** - On-device ML for predictive rendering
- [ ] **Haptic Feedback** - Force feedback for interactive elements
- [ ] **3D Visualization** - Stereoscopic rendering for depth perception

---

## Contributing

### Code Contributions

1. **Follow Performance Guidelines**
   - Use batch operations
   - Profile before optimizing
   - Maintain test coverage

2. **Add Benchmarks**
   - Create benchmark in `benches/` directory
   - Set realistic performance targets
   - Document optimization techniques

3. **Update Documentation**
   - Keep API reference current
   - Add examples for new features
   - Update training materials

### Testing

```bash
# Run all tests
pytest systems/visual_shell/tests/

# Run benchmarks
python3 systems/visual_shell/benches/quick_benchmark.py

# Verify optimizations
python3 systems/visual_shell/benches/verify_optimizations.py
```

---

## References

### Internal Documentation

- [Training Program](training/NATIVE_GLYPH_SHELL_TRAINING_PROGRAM.md) - Complete training materials
- [Quick Reference](training/GLYPH_SHELL_QUICK_REFERENCE.md) - Essential commands
- [Performance Report](../systems/visual_shell/benches/results/PERFORMANCE_REPORT.md) - Detailed benchmarks
- [Optimization Summary](../systems/visual_shell/benches/results/OPTIMIZATION_SUMMARY.md) - Optimization details

### External Resources

- [Numba Documentation](https://numba.pydata.org/)
- [Hilbert Curves](https://en.wikipedia.org/wiki/Hilbert_curve)
- [Foveated Rendering](https://en.wikipedia.org/wiki/Foveated_rendering)

---

## Support

- **In-shell help**: Press `?` or type `g help`
- **Documentation**: `docs/` directory
- **Community**: Discord `discord.gg/geometry-os`
- **Issues**: GitHub Issues

---

## Changelog

### v2.0.0 (2026-03-11)

**Added:**
- Numba JIT compilation for all hot paths
- Packed integer color representation
- Pre-computed Hilbert curve lookup tables
- Batch operations for all rendering operations
- Comprehensive training program (7 modules)
- Interactive tutorial with automatic feedback
- Quick reference guide
- Performance benchmarking suite

**Optimized:**
- Hilbert curve mapping: 87x faster batch operations
- Alpha premultiplication: 303x faster (Numba)
- Foveated rendering: 2.8x faster batch classification
- Color blending: 4.5x faster with packed integers
- Overall pipeline: 6.7x faster

**Documentation:**
- Complete API reference
- Performance tuning guide
- Troubleshooting section
- 20+ code examples

### v1.0.0 (2026-02-XX)

- Initial release with basic terminal interface
- GNB state synchronization
- AI context injection
- Keyboard navigation

---

*Last Updated: 2026-03-11*  
*Maintained by: Geometry OS Team*
