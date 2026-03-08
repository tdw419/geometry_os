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

**Dependencies**: HilbertLUT.ts (complete)

### Task 1.2: FFI Layout Functions ✅ COMPLETE
- [x] Add Hilbert and layout functions to `visual-vm/ffi_registry.json` (IDs 300-311)
- [x] Create `visual-vm/ffi_layout_engine.py` with spiral and force-directed algorithms
- [x] Update `visual-vm/python_ffi_host.py` to support layout and hilbert modules
- [x] Enable complex return types (arrays/tuples) in `PythonFFIBridge.ts`
- [x] Add unit tests in `visual-vm/test_ffi_layout.test.ts`
- [x] Verify via FFI Bridge (all tests passing)

**Dependencies**: PythonFFIBridge.ts (complete)

### Task 1.3: WGSL Glyph Renderer
- [ ] Create `systems/hypervisor/src/glyph_renderer.wgsl`
- [ ] Implement `render_glyphs` compute shader
- [ ] Implement `xy_to_hilbert` WGSL function
- [ ] Handle opcodes: SET_COLOR, DRAW_RECT, FILL_RECT, DRAW_PIXEL
- [ ] Test via existing WebGPU infrastructure

**Dependencies**: geometry_os.wgsl (exists)

---

## Phase 2: GeoASM Rasterizer

### Task 2.1: Glyph Library
- [ ] Create `systems/visual_shell/native/geoasm_glyphs.geoasm`
- [ ] Implement primitive shapes:
  - `GLYPH_DRAW_RECT`
  - `GLYPH_FILL_RECT`
  - `GLYPH_DRAW_CIRCLE`
  - `GLYPH_DRAW_LINE`
- [ ] Implement color management:
  - `GLYPH_SET_COLOR`
- [ ] Implement Hilbert utilities:
  - `GLYPH_HILBERT_XY_TO_INDEX`
  - `GLYPH_HILBERT_INDEX_TO_XY`
- [ ] Test with `geoasm-cli/geoasm_lib.py`

**Dependencies**: geoasm_lib.py (complete)

### Task 2.2: Composite Operations
- [ ] Implement `GLYPH_RENDER_ORB` (file visualization)
- [ ] Implement `GLYPH_RENDER_PANEL` (Glass Panel)
- [ ] Implement `GLYPH_RENDER_DESKTOP` (full desktop)
- [ ] Create test fixtures for each operation
- [ ] Benchmark rendering time

**Dependencies**: Task 2.1

---

## Phase 3: Integration Layer

### Task 3.1: Native Visual Shell API
- [ ] Create `systems/visual_shell/api/native_api.py`
- [ ] Implement `NativeVisualShellAPI` class
- [ ] Port WebSocket handlers to native rendering
- [ ] Implement glyph composition
- [ ] Test API endpoints

**Dependencies**: Task 1.1, 1.2, 2.1

### Task 3.2: Parallel Operation Mode
- [ ] Add config flag: `use_native_renderer: bool`
- [ ] Run both PixiJS and Native simultaneously
- [ ] Implement diff comparison for validation
- [ ] Log performance metrics
- [ ] Create comparison dashboard

**Dependencies**: Task 3.1

---

## Phase 4: Migration

### Task 4.1: Feature Parity
- [ ] Port Glass Panel system to native
- [ ] Port context menus to native
- [ ] Port keyboard shortcuts to native
- [ ] Port file orb interactions
- [ ] Verify all Phase 16 features work

**Dependencies**: Task 3.2

### Task 4.2: Switch Over
- [ ] Set native renderer as default
- [ ] Deprecate PixiJS dependency
- [ ] Update documentation
- [ ] Remove PixiJS code from active development
- [ ] Archive PixiJS implementation

**Dependencies**: Task 4.1

---

## Phase 5: Enhancement

### Task 5.1: 3D Spatial View
- [ ] Design 3D WGSL vertex shader
- [ ] Implement camera controls
- [ ] Add depth to glyph rendering
- [ ] Test with large datasets

**Dependencies**: Task 4.2

### Task 5.2: Evolution Visualization
- [ ] Connect to infinite_map_rs phylogeny
- [ ] Animate tile evolution in real-time
- [ ] Add fitness heatmap overlay
- [ ] Create species clustering visualization

**Dependencies**: Task 5.1

---

## Dependencies

```
Task 1.1 (Substrate) ──┐
                       ├──► Task 3.1 (Native API) ──► Task 3.2 (Parallel) ──► Task 4.1 (Parity)
Task 1.2 (FFI Layout) ─┤                                                              │
                       │                                                               ▼
Task 1.3 (WGSL) ───────┘                                                          Task 4.2 (Switch)
                                                                                       │
Task 2.1 (Glyph Lib) ─────► Task 2.2 (Composite) ─────────────────────────────────────┘
                                                                                       │
                                                                                       ▼
                                                                                  Task 5.1 (3D)
                                                                                       │
                                                                                       ▼
                                                                                  Task 5.2 (Evolution)
```

## Success Criteria

- [ ] 60 FPS at 10,000+ glyphs
- [ ] 95% Hilbert spatial coherence
- [ ] Zero external rendering dependencies
- [ ] All Phase 16 features working
- [ ] Self-hosting: Geometry OS renders itself

## Estimated Effort

| Phase | Tasks | Est. Hours |
|-------|-------|------------|
| Phase 1 | 3 | 16 |
| Phase 2 | 2 | 12 |
| Phase 3 | 2 | 10 |
| Phase 4 | 2 | 8 |
| Phase 5 | 2 | 14 |
| **Total** | **11** | **60** |

## Notes

- Leverage existing FFI Bridge infrastructure
- Reuse HilbertLUT algorithm (already tested)
- Maintain backward compatibility during migration
- Performance benchmarks at each phase
