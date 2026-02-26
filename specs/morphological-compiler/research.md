---
spec: morphological-compiler
phase: research
created: 2026-02-25
generated: auto
---

# Research: morphological-compiler

## Executive Summary

Feasibility: **High**. All components exist - UniversalMorphologicalFont synthesizes glyphs, Visual CPU (WGSL) defines opcodes, channel encoding is straightforward. Task is pure integration work.

## Codebase Analysis

### Existing Patterns

| Component | Path | Status |
|-----------|------|--------|
| UniversalMorphologicalFont | `systems/intelligence/geometric_text/universal_font_demo.py` | Ready - 95 ASCII chars, 16x16 glyphs |
| MorphologicalSynthesizerV2 | `systems/intelligence/geometric_text/morphological_synthesizer_v2.py` | Ready - neural glyph generation |
| Visual CPU Opcodes | `systems/visual_shell/web/shaders/visual_cpu.wgsl` | Ready - 13 opcodes defined |
| HilbertCurve | `systems/prts_toolchain/src/prts_toolchain/hilbert.py` | Ready - 1D↔2D mapping |

### Opcode Mapping (from visual_cpu.wgsl)

```
OP_NOP=0x01, OP_BLOCK=0x02, OP_LOOP=0x03, OP_CALL=0x10
OP_DROP=0x1A, OP_SELECT=0x1B, OP_LOCAL_GET=0x20, OP_LOCAL_SET=0x21
OP_I32_CONST=0x41, OP_I32_EQZ=0x45, OP_I32_ADD=0x6A, OP_I32_SUB=0x6B, OP_I32_MUL=0x6C
```

### Dependencies

- **PyTorch**: Already used by MorphologicalSynthesizerV2
- **PIL**: Image creation
- **NumPy**: Array manipulation
- **HilbertCurve**: 1D→2D glyph conversion

### Constraints

1. **16-bit operand limit**: GB channels encode 2 bytes, max 65535
2. **Glyph size fixed**: 16x16 pixels per instruction
3. **Alpha = execution mask**: Visual CPU only executes where alpha > 0
4. **Model dependency**: Requires `synthesizer_v2.pth` and `charset_v2.json`

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | All components exist, pure integration |
| Effort Estimate | M | 6 tasks, ~4-6 hours |
| Risk Level | Low | No new architecture, just wiring |

## Recommendations

1. **Reuse UniversalMorphologicalFont directly** - no new synthesis needed
2. **Match WGSL opcode constants exactly** - use hex values from visual_cpu.wgsl
3. **Test with Visual CPU** - verify compiled textures actually execute
4. **Keep parser simple** - stack-based, no complex AST needed

## Next Steps

1. Create `geoasm_opcodes.py` with symbol→opcode mapping
2. Create `geoasm_parser.py` with simple tokenizer
3. Create `morphological_compiler.py` with RGBA encoder
4. Add tests and example scripts
