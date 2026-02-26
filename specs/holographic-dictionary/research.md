---
spec: holographic-dictionary
phase: research
created: 2026-02-26
generated: auto
---

# Research: Holographic Dictionary

## Executive Summary

Feasibility: HIGH. Foundation exists: Resonance Glyph System (holographic encoding), GlyphExecutor (GPU bridge), existing GeometricDictionary class (semantic tokens). New work: define Word abstraction layer atop glyphs, implement Standard Library at (0,0), create Word-to-glyph-sequence compiler.

## Codebase Analysis

### Existing Patterns

| Pattern | Location | Reuse |
|---------|----------|-------|
| GlyphExecutor.registerGlyph() | `web/GlyphExecutor.js:198` | Core registration pattern |
| SemanticToken class | `web/holographic_dictionary.js:17` | Token model for dictionary |
| GeometricDictionary.loadFromManifest() | `web/holographic_dictionary.js:157` | Dictionary loading |
| Holographic encode_instruction() | `holographic_encoder.py:37` | 32-bit -> 16x16 encoding |
| Walsh-Hadamard BASIS_MAP | `holographic_encoder.py:16` | 64 basis functions |
| Symmetry contracts | `resonance-glyph-system-design.md:66` | Shape-logic binding |

### Dependencies

| Dependency | Purpose | Status |
|------------|---------|--------|
| GlyphExecutor | Register/place glyphs on map | Implemented |
| holographic_encoder.py | Encode instructions as interference patterns | Implemented |
| infinite_map.js | Place sprites on map | Implemented |
| visual_cpu_riscv_morph.wgsl | GPU decoder/executor | Implemented |
| GeometricDictionary | Semantic token lookup | Implemented |

### Constraints

1. **Glyph Size**: 16x16 pixels fixed - Words must be multiple of this
2. **Max Cores**: 64 concurrent glyphs on GlyphExecutor
3. **Instruction Width**: 32-bit RISC-V only
4. **Atlas Layout**: Universal font atlas at `/assets/universal_font.rts.png`
5. **Damage Tolerance**: 50% pixel loss tolerance from holographic encoding

## Linguistic Hierarchy Mapping

```
Glyph     = Letter      (atomic 32-bit instruction, 16x16 pixel)
Ligature  = Morpheme    (64-bit instruction pair, fused)
Word      = Function    (named sequence of glyphs, stored on map)
Dictionary = Library    (collection of Words at coordinate)
Software  = Literature  (composed of many Dictionaries)
```

## Existing Implementations

### GeometricDictionary (holographic_dictionary.js)

Already implements semantic token expansion:
- `SemanticToken.instructions` -> Uint32Array of RISC-V
- `getInstructionsFromPixel(r,g,b)` -> instruction expansion
- `exportForWebGPU()` -> GPU-ready buffer

**Gap**: Tokens are single-pixel semantic units, not multi-glyph Words at map coordinates.

### What's Missing

| Component | Status | Needed |
|-----------|--------|--------|
| Glyph (Letter) | DONE | Resonance Glyph System |
| Ligature (Morpheme) | PROTOTYPE | LW+ADD, CALL+RET fusion |
| Word (Function) | MISSING | Named glyph sequence at coordinate |
| Dictionary (Library) | PARTIAL | Collection at (0,0) on map |
| Word Compiler | MISSING | Text -> glyph sequence |

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | Foundation complete, clear extension path |
| Effort Estimate | M | ~4-6 tasks for POC |
| Risk Level | Low | No new infrastructure needed |

## Standard Library Candidates

| Word | Glyphs | Purpose |
|------|--------|---------|
| `add` | ADD | Register addition |
| `sub` | SUB | Register subtraction |
| `mul` | MUL | Register multiplication |
| `load` | LW | Load from memory |
| `store` | SW | Store to memory |
| `jump` | JAL | Unconditional jump |
| `branch-z` | BEQ | Branch if zero |
| `call` | CALL | Function call |
| `ret` | RET | Return from call |

## Recommendations

1. **Extend GeometricDictionary** with Word abstraction (multi-glyph sequences)
2. **Add map coordinate** to Word definition (Words live at (0,0+offset))
3. **Create WordCompiler** that transforms Word definitions to placed glyphs
4. **Implement Standard Library** as initial Dictionary at (0,0)
5. **Add Word call semantics** - one Word can invoke another by coordinate
