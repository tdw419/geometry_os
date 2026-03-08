# Implementation Tasks

> **Full Proposal**: `PROPOSAL.md`
> **Target**: Visual Shell v2.0 - Native Glyph Rendering

## Phase 1: Core Infrastructure

### Task 1.1: Glyph Substrate (Rust) ✅ COMPLETE
- [x] Create `systems/visual_shell/src/glyph_substrate.rs`
- [x] Implement `GlyphSubstrate` struct with Hilbert indexing
- [x] Port `HilbertLUT.ts` algorithm to Rust
- [x] Add unit tests for Hilbert conversion
- [x] Benchmark spatial locality (target: 95% coherence)
- [x] Shape drawing primitives (rect, line, circle)
- [x] Dirty region tracking
- [x] GPU buffer access

### Task 1.2: FFI Layout Functions ✅ COMPLETE
- [x] Add Hilbert and layout functions to `visual-vm/ffi_registry.json` (IDs 300-311)
- [x] Create `visual-vm/ffi_layout_engine.py` with spiral and force-directed algorithms
- [x] Update `visual-vm/python_ffi_host.py` to support layout and hilbert modules
- [x] Enable complex return types (arrays/tuples) in `PythonFFIBridge.ts`
- [x] Add unit tests in `visual-vm/test_ffi_layout.test.ts`
- [x] Verify via FFI Bridge (all tests passing)

### Task 1.3: WGSL Glyph Renderer ✅ COMPLETE
- [x] Create `systems/hypervisor/src/glyph_renderer.wgsl`
- [x] Implement `render_glyphs` compute shader with batch processing
- [x] Implement `xy_to_hilbert` WGSL function for spatial locality
- [x] Handle opcodes: DRAW_RECT (0xC3), FILL_RECT (0xC4), DRAW_PIXEL (0xCF)
- [x] Test via existing WebGPU infrastructure (Vitest)
