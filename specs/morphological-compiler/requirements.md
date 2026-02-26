---
spec: morphological-compiler
phase: requirements
created: 2026-02-25
generated: auto
---

# Requirements: morphological-compiler

## Summary

Create GeoASM language and morphological compiler that transforms geometric text scripts into executable RGBA textures - human-readable AND machine-executable.

## User Stories

### US-1: Write Geometric Assembly Code
As a developer, I want to write scripts using GeoASM symbols so that my code is both readable and executable.

**Acceptance Criteria**:
- AC-1.1: Parser recognizes 12 symbol opcodes ($ + - * < > ! ? @ ~ . #)
- AC-1.2: Parser handles numeric operands (0-65535)
- AC-1.3: Parser skips comments (lines starting with #)
- AC-1.4: Parser reports errors with line/column info

### US-2: Compile to Executable Textures
As a developer, I want to compile GeoASM to PNG so that Visual CPU can execute it.

**Acceptance Criteria**:
- AC-2.1: Output is RGBA PNG with 16x16 pixel glyphs
- AC-2.2: R channel contains opcode (0x00-0xFF)
- AC-2.3: G/B channels contain 16-bit operand
- AC-2.4: A channel contains morphological intensity from font synthesis
- AC-2.5: Texture width = num_instructions * 16

### US-3: Verify Compilation Output
As a developer, I want to verify compiled textures so that I can debug encoding issues.

**Acceptance Criteria**:
- AC-3.1: Verify function decodes pixels back to instructions
- AC-3.2: Roundtrip (parse→compile→verify) is lossless
- AC-3.3: CLI supports `-v` flag for verification output

### US-4: Use Example Scripts
As a developer, I want example scripts so that I can learn GeoASM syntax.

**Acceptance Criteria**:
- AC-4.1: counter.geo demonstrates memory operations
- AC-4.2: fibonacci.geo demonstrates sequence computation
- AC-4.3: arithmetic.geo demonstrates basic math

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | Parse GeoASM symbol characters to opcodes | Must | US-1 |
| FR-2 | Parse numeric operands (0-65535) | Must | US-1 |
| FR-3 | Skip comment lines | Must | US-1 |
| FR-4 | Report parse errors with location | Should | US-1 |
| FR-5 | Encode opcode in R channel | Must | US-2 |
| FR-6 | Encode operand in GB channels (16-bit) | Must | US-2 |
| FR-7 | Encode morphological intensity in A channel | Must | US-2 |
| FR-8 | Output RGBA PNG with 16x16 glyphs | Must | US-2 |
| FR-9 | Decode pixels back to instructions | Must | US-3 |
| FR-10 | CLI with input/output paths | Should | US-3 |
| FR-11 | Include example .geo files | Must | US-4 |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | Compilation time < 1s for 100 instructions | Performance |
| NFR-2 | Glyphs must be human-readable when viewed | Usability |
| NFR-3 | Alpha channel must match Visual CPU execution mask | Compatibility |

## Out of Scope

- 32-bit operands (future: 4-pixel encoding)
- Control flow jumps (future: relative addressing)
- Higher-level GeoScript language
- Browser-based REPL compiler

## Dependencies

- `systems/intelligence/geometric_text/universal_font_demo.py` (UniversalMorphologicalFont)
- `systems/intelligence/geometric_text/data/synthesizer_v2.pth` (model weights)
- `systems/intelligence/geometric_text/data/charset_v2.json` (char mapping)
- `systems/prts_toolchain/src/prts_toolchain/hilbert.py` (HilbertCurve)
