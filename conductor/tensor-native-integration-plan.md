# Implementation Plan - Tensor-Native Architecture Integration

This plan outlines the steps to integrate the "Architectural Paradigms of Tensor-Native Systems" into Geometry OS, specifically focusing on Spatial Memory Management, Continuous Tensor Abstraction (CTA), and Visual Debugging.

## Objective
Evolve Geometry OS from a linear, byte-oriented system to a tensor-native, spatial paradigm as described in the reference document. This involves enhancing the current Glyph Allocator and PixelRTS Layout with hierarchical spatial partitioning and continuous addressing logic.

## Key Files & Context
- **`systems/glyph_allocator/src/lib.rs`**: Current best-fit linear allocator.
- **`systems/pixel_compiler/pixelrts_layout.py`**: Current zone-based spiral layout.
- **`systems/glyph_stratum/glyph_compiler.rs`**: Handles Hilbert mapping for programs.
- **`systems/pixel_compiler/pixelrts_v2_core.py`**: Core Hilbert mapping and GPU hot zone logic.

## Implementation Steps

### 1. Spatial Memory Partitioning (Quadtree Allocator)
Transition from the current `GlyphPool` (linear best-fit) to a `SpatialGlyphPool` using a Quadtree structure.
- **New Component**: `systems/glyph_allocator/src/quadtree.rs`
- **Logic**: Implement recursive subdivision of the 2D pixel grid.
- **Integration**: Update `GlyphPool` to use `Quadtree` for finding free spatial regions instead of linear offsets.
- **Benefit**: Faster spatial queries and reduced fragmentation for geometric workloads.

### 2. Continuous Tensor Abstraction (CTA) Interface
Implement a layer that allows addressing the pixel substrate using real-number coordinates, mapping them to the underlying discrete Hilbert grid.
- **New Component**: `systems/pixel_compiler/cta_mapper.py`
- **Logic**: Implement the "piecewise-constant tensor" function $A(x) = \sum a_i \mathbf{1}_{R_i}(x)$.
- **Integration**: Add `cta_read` and `cta_write` methods to `PixelRTSDecoder` and `PixelRTSEncoder`.
- **Benefit**: Allows AI models to "glance" at memory using continuous vectors instead of integer indices.

### 3. Visual RAM-as-Bitmap Debugger
Enhance the existing visual shell and spatial debugger to provide a real-time "Health Map" of memory.
- **New Component**: `systems/spatial_debugger/memory_canvas.py`
- **Logic**: Render the `GlyphPool` block states (allocated/free) directly to a specialized debug texture.
- **Integration**: Create a background daemon that periodically dumps the `GlyphPool` stats to a `.rts.png` for visual inspection in the Infinite Map.
- **Benefit**: Real-time visual identification of memory leaks (growing white blocks) and corruption (noise).

### 4. SIMD-Aligned Transport Optimization
Enforce 64-byte (cache-line) alignment across all binary-to-pixel conversions to unlock AVX-512 performance gains.
- **Modification**: `systems/pixel_compiler/pixelrts_v2_core.py`
- **Change**: Ensure `calculate_grid_size` and buffer allocations are 64-byte aligned.
- **Modification**: `systems/glyph_allocator/src/lib.rs`
- **Change**: Update `block_align` to 64 (or 512 bits) to match AVX-512 widths.

## Verification & Testing

### 1. Spatial Allocation Benchmarks
- Compare `Quadtree` allocation speed vs. existing `GlyphPool` best-fit for high-density fragmentation scenarios.
- Run `systems/glyph_allocator/src/main.rs` to verify fitness scores after the transition.

### 2. CTA Accuracy Test
- Verify that `cta_read(3.14)` correctly maps to the discrete pixel at the corresponding Hilbert coordinate.
- Test "glance" operations where a small 2D region is read via a single continuous query.

### 3. Visual Debugger Validation
- Manually trigger a "leak" (allocate without freeing) and verify it appears as a persistent white block on the memory canvas.
- Verify that 64-byte alignment results in measurable speedups during `pixelrts` encoding/decoding using `benchmark_pixelrts.py`.

## Phased Rollout
1. **Phase A**: SIMD alignment and 64-byte padding (✅ Complete).
2. **Phase B**: Quadtree implementation in `glyph_allocator` (✅ Complete).
3. **Phase C**: CTA mapping and Visual Debugger integration (✅ Complete).
