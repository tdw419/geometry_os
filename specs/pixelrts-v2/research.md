---
spec: pixelrts-v2
phase: research
created: 2026-02-08T20:00:00Z
generated: auto
---

# Research: PixelRTS v2 - Visual Bootable Container Format

## Executive Summary

PixelRTS v2 is technically feasible with Python 3.12+, Pillow (PNG), NumPy (vectorization), and PyYAML. The implementation leverages existing pixel_compiler patterns (rts_registry_manager.py, rts_boot_manager.py) and integrates seamlessly with the current RTS ecosystem. Hilbert curve LUT generation is well-documented; RGBA dense packing achieves 100% data density (4 bytes/pixel).

## Codebase Analysis

### Existing Patterns
- **RTS Registry**: `geometry_os/systems/pixel_compiler/rts_registry_manager.py` - JSON-based catalog with SHA256 verification, metadata storage
- **Boot Manager**: `geometry_os/systems/pixel_compiler/rts_boot_manager.py` - QEMU launching, unpacking logic
- **Test Structure**: `geometry_os/tests/unit/`, `geometry_os/tests/integration/` - pytest patterns with subprocess testing
- **CLI Pattern**: argparse-based with subcommands, `--help` epilog examples
- **Documentation**: `RTS_QUICKSTART.md` - workflow-driven documentation style

### Dependencies
- **Pillow**: PNG encoding/decoding with tEXt chunk support (built-in)
- **NumPy**: Available in codebase, used for vectorized pixel operations (10x speedup potential)
- **PyYAML**: Existing dependency for metadata handling
- **pytest**: Existing test framework

### Constraints
- PNG dimension must be power-of-2 (Hilbert curve requirement)
- Max grid size: 8192×8192 (256 MB capacity) due to memory constraints
- tEXt chunk size limit: ~2MB per chunk (metadata only, not data)
- WASM visualization requires opcode parsing (spec-defined tables)

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | All dependencies available, patterns established |
| Effort Estimate | M | 10 tasks, ~2-3 days implementation |
| Risk Level | Medium | Hilbert curve correctness critical; PNG format stable |
| Integration Risk | Low | Existing RTS registry/boot patterns compatible |

## Key Technical Decisions

### Hilbert Curve Algorithm
- **Algorithm**: Standard Hilbert space-filling curve (order-based)
- **Reference**: "Hilbert Curve" Wikipedia, existing `geometry_os/tests/cross_language/test_hilbert_consistency.py`
- **Implementation**: Recursive quadrant rotation with bitwise mapping

### PNG Metadata Storage
- **Primary**: PNG tEXt chunk with `PixelRTS` magic + JSON metadata
- **Backup**: Sidecar `.meta.json` file (matches existing RTS pattern)
- **Rationale**: Redundancy for provenance; existing codebase uses sidecar JSON

### Encoding Modes
1. **Standard Mode**: RGBA dense packing (100% density), no semantic coloring
2. **Code Mode**: WASM opcode-aware coloring (R=control flow, G=operand1, B=operand2, A=executable)
   - Control flow: 0x00-0x1F (unreachable, block, loop, if, br, return, call)
   - Arithmetic: 0x41-0x6A (i32.const, i32.add, etc.)
   - Memory: 0x20-0x3A (local.get, local.set, i32.load, i32.store)

### Performance Optimization
- **Baseline**: Pixel-by-pixel Python loop (~5s for 10MB)
- **Optimized**: NumPy vectorization (~0.5s for 10MB, 10x speedup)
- **Trade-off**: Code mode requires pixel-by-pixel for semantic coloring

## Recommendations

1. **Start with Hilbert LUT generator** - Critical path, test first
2. **Use existing RTS registry patterns** - Extend `rts_registry_manager.py` for PNG support
3. **Implement boot script generation** - High user value, low complexity
4. **Add comprehensive E2E tests** - Validates entire workflow
5. **Document integration points** - Update `RTS_QUICKSTART.md` with v2 section

## Risks & Mitigations

| Risk | Mitigation |
|------|------------|
| Hilbert curve bug causes data corruption | Unit test against known small grids (4×4, 8×8) |
| PNG tEXt chunk size limit | Store only metadata in tEXt; data in pixels |
| WASM opcode table incomplete | Support subset first; extensible design |
| Large file performance | NumPy optimization; progressive loading for future |

## Integration Points

- **rts_registry_manager.py**: Add `_register_pixelrts_v2()` method
- **rts_boot_manager.py**: Add `.rts.png` auto-extraction in `boot_cartridge()`
- **RTS_QUICKSTART.md**: Add "PixelRTS v2 - Visual Containers" section
- **Test structure**: Follow `test_sse_parser.py` pattern (pytest, clear test names)

## Next Steps

1. Implement HilbertCurve class with LUT generation
2. Add PixelRTSEncoder/Decoder classes
3. Create converter/extractor CLI tools
4. Integrate with existing RTS registry
5. Add comprehensive test coverage
