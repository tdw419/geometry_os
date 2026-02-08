---
spec: pixelrts-v2
phase: tasks
total_tasks: 19
created: 2026-02-08T20:00:00Z
generated: auto
---

# Tasks: PixelRTS v2 - Visual Bootable Container Format

## Phase 1: Make It Work (POC)

Focus: Validate core functionality end-to-end. Skip optimizations, accept hardcoded values.

- [ ] 1.1 Hilbert Curve LUT Generator
  - **Do**: Create `HilbertCurve` class with `generate_lut()`, `index_to_coord()`, `coord_to_index()` methods
  - **Files**: `geometry_os/systems/pixel_compiler/pixelrts_v2_core.py`
  - **Test**: `geometry_os/tests/unit/test_pixelrts_v2_core.py` with 4×4, 8×8 grid verification
  - **Done when**: Unit tests pass for known Hilbert curves
  - **Verify**: `pytest geometry_os/tests/unit/test_pixelrts_v2_core.py -v`
  - **Commit**: `feat(pixelrts): add Hilbert curve LUT generator and metadata core`
  - _Requirements: FR-1_
  - _Design: HilbertCurve_

- [ ] 1.2 PNG Encoding/Decoding Core
  - **Do**: Implement `PixelRTSEncoder` and `PixelRTSDecoder` classes with RGBA dense packing
  - **Files**: `geometry_os/systems/pixel_compiler/pixelrts_v2_core.py`
  - **Test**: `geometry_os/tests/unit/test_pixelrts_v2_encoding.py` with round-trip verification
  - **Done when**: Encode → decode round-trip preserves data
  - **Verify**: `pytest geometry_os/tests/unit/test_pixelrts_v2_encoding.py -v`
  - **Commit**: `feat(pixelrts): add PNG encoding/decoding with Hilbert mapping`
  - _Requirements: FR-2, FR-3, FR-4, FR-6_
  - _Design: PixelRTSEncoder, PixelRTSDecoder_

- [ ] 1.3 Converter CLI Tool
  - **Do**: Create `pixelrts_v2_converter.py` with argparse CLI, metadata support, sidecar JSON
  - **Files**: `geometry_os/systems/pixel_compiler/pixelrts_v2_converter.py`
  - **Test**: `geometry_os/tests/integration/test_pixelrts_v2_converter.py`
  - **Done when**: `python3 pixelrts_v2_converter.py input.bin output.rts.png` succeeds
  - **Verify**: `pytest geometry_os/tests/integration/test_pixelrts_v2_converter.py -v`
  - **Commit**: `feat(pixelrts): add converter CLI tool`
  - _Requirements: FR-4, FR-5, AC-1.1, AC-1.2, AC-1.4_
  - _Design: Converter CLI_

- [ ] 1.4 Extractor CLI Tool
  - **Do**: Create `pixelrts_v2_extractor.py` with `--verify` and `--info` flags
  - **Files**: `geometry_os/systems/pixel_compiler/pixelrts_v2_extractor.py`
  - **Test**: `geometry_os/tests/integration/test_pixelrts_v2_extractor.py`
  - **Done when**: Round-trip conversion recovers original data
  - **Verify**: `pytest geometry_os/tests/integration/test_pixelrts_v2_extractor.py -v`
  - **Commit**: `feat(pixelrts): add extractor CLI tool`
  - _Requirements: FR-7, AC-2.1, AC-2.2, AC-2.3_
  - _Design: Extractor CLI_

- [ ] 1.5 WASM Code Mode
  - **Do**: Implement `WASMCodeVisualizer` with opcode categorization and semantic coloring
  - **Files**: `geometry_os/systems/pixel_compiler/pixelrts_v2_wasm.py`
  - **Test**: `geometry_os/tests/unit/test_pixelrts_v2_wasm.py`
  - **Done when**: WASM module encodes with semantic colors, decodes correctly
  - **Verify**: `pytest geometry_os/tests/unit/test_pixelrts_v2_wasm.py -v`
  - **Commit**: `feat(pixelrts): add WASM code mode with semantic visualization`
  - _Requirements: FR-8, AC-4.1, AC-4.2, AC-4.3, AC-4.4_
  - _Design: WASMCodeVisualizer_

- [ ] 1.6 RTS Registry Integration
  - **Do**: Extend `rts_registry_manager.py` with `_register_pixelrts_v2()` method
  - **Files**: `geometry_os/systems/pixel_compiler/rts_registry_manager.py`
  - **Test**: `geometry_os/tests/integration/test_pixelrts_v2_integration.py`
  - **Done when**: `.rts.png` files register in RTS catalog
  - **Verify**: `pytest geometry_os/tests/integration/test_pixelrts_v2_integration.py::test_register_pixelrts_v2_cartridge -v`
  - **Commit**: `feat(pixelrts): integrate PixelRTS v2 with RTS registry`
  - _Requirements: FR-10, AC-3.4_
  - _Design: RTS Registry Integration_

- [ ] 1.7 Boot Script Generation
  - **Do**: Add `--generate-boot-script` flag to converter, create `.boot.sh` files
  - **Files**: `geometry_os/systems/pixel_compiler/pixelrts_v2_converter.py`
  - **Test**: `geometry_os/tests/integration/test_pixelrts_v2_boot_script.py`
  - **Done when**: Boot script extracts and launches QEMU
  - **Verify**: `pytest geometry_os/tests/integration/test_pixelrts_v2_boot_script.py -v`
  - **Commit**: `feat(pixelrts): add automatic boot script generation`
  - _Requirements: FR-9, AC-3.1, AC-3.2, AC-3.3_
  - _Design: Boot Script Generator_

- [ ] 1.8 POC Checkpoint
  - **Do**: Verify end-to-end workflow: convert → register → extract → verify
  - **Done when**: Complete workflow succeeds on test data
  - **Verify**: Manual test with kernel/initrd files
  - **Commit**: `feat(pixelrts): complete POC - PixelRTS v2 functional`
  - _Requirements: US-1, US-2, US-3_

## Phase 2: Refactoring

After POC validated, clean up code to match project patterns.

- [ ] 2.1 Extract and Modularize
  - **Do**: Ensure core library follows pixel_compiler patterns, add type hints, docstrings
  - **Files**: `geometry_os/systems/pixel_compiler/pixelrts_v2_core.py`
  - **Done when**: Code matches `rts_registry_manager.py` style
  - **Verify**: Code review against existing patterns
  - **Commit**: `refactor(pixelrts): extract and modularize core library`
  - _Design: Existing Patterns to Follow_

- [ ] 2.2 Add Error Handling
  - **Do**: Add try/catch blocks, descriptive error messages, input validation
  - **Files**: All pixelrts_v2_*.py files
  - **Done when**: All error paths handled gracefully
  - **Verify**: Type check passes, error cases tested
  - **Commit**: `refactor(pixelrts): add comprehensive error handling`
  - _Design: Error Handling_

- [ ] 2.3 Performance Optimization
  - **Do**: Add NumPy vectorized encoding path, benchmark performance
  - **Files**: `geometry_os/systems/pixel_compiler/pixelrts_v2_core.py`
  - **Test**: `geometry_os/tests/unit/test_pixelrts_v2_performance.py`
  - **Done when**: 10MB file encodes in <10 seconds
  - **Verify**: `pytest geometry_os/tests/unit/test_pixelrts_v2_performance.py -v`
  - **Commit**: `perf(pixelrts): add NumPy vectorized encoding for 10x speedup`
  - _Requirements: FR-12, NFR-1, NFR-2_
  - _Design: Performance Considerations_

## Phase 3: Testing

- [ ] 3.1 Complete Unit Tests
  - **Do**: Ensure all core classes have unit tests, edge cases covered
  - **Files**: `geometry_os/tests/unit/test_pixelrts_v2_*.py`
  - **Done when**: Coverage >90% for core library
  - **Verify**: `pytest geometry_os/tests/unit/ -v --cov=systems/pixel_compiler/pixelrts_v2_core`
  - **Commit**: `test(pixelrts): add comprehensive unit tests`
  - _Requirements: NFR-6_

- [ ] 3.2 Integration Tests
  - **Do**: Add tests for registry integration, boot workflow, error cases
  - **Files**: `geometry_os/tests/integration/test_pixelrts_v2_*.py`
  - **Done when**: All integration points tested
  - **Verify**: `pytest geometry_os/tests/integration/test_pixelrts_v2_*.py -v`
  - **Commit**: `test(pixelrts): add integration tests`
  - _Requirements: NFR-7_

- [ ] 3.3 End-to-End Tests
  - **Do**: Create complete workflow tests (convert → register → boot → extract)
  - **Files**: `geometry_os/tests/integration/test_pixelrts_v2_e2e.py`
  - **Done when**: E2E tests pass for standard and code modes
  - **Verify**: `pytest geometry_os/tests/integration/test_pixelrts_v2_e2e.py -v`
  - **Commit**: `test(pixelrts): add end-to-end integration tests`
  - _Requirements: NFR-4_

## Phase 4: Quality Gates

- [ ] 4.1 Documentation
  - **Do**: Create `PIXELRTS_V2.md` guide, update `RTS_QUICKSTART.md`
  - **Files**: `geometry_os/systems/pixel_compiler/PIXELRTS_V2.md`, `RTS_QUICKSTART.md`
  - **Done when**: Quick start guide includes PixelRTS v2 examples
  - **Verify**: Documentation reviewed, examples tested
  - **Commit**: `docs(pixelrts): add PixelRTS v2 documentation`
  - _Design: Documentation_

- [ ] 4.2 Local Quality Check
  - **Do**: Run all quality checks locally (type check, lint, tests)
  - **Verify**: All commands pass
  - **Done when**: Clean build, no warnings
  - **Commit**: `fix(pixelrts): address lint/type issues` (if needed)
  - _Requirements: NFR-5_

- [ ] 4.3 Create PR and Verify CI
  - **Do**: Push branch, create PR with gh CLI, watch CI
  - **Verify**: `gh pr checks --watch` all green
  - **Done when**: PR ready for review
  - _Commit handled by PR workflow_

## Notes

- **POC shortcuts taken**: NumPy optimization deferred, boot script basic (QEMU only)
- **Production TODOs**: Progressive loading, compression support, WebGPU decoder, web viewer
- **Dependencies**: All already in codebase (Pillow, NumPy, PyYAML, pytest)
- **Integration points**: rts_registry_manager.py, rts_boot_manager.py, RTS_QUICKSTART.md
