---
spec: holographic-dictionary
phase: requirements
created: 2026-02-26
generated: auto
---

# Requirements: Holographic Dictionary

## Summary

Define Words (named glyph sequences) that form the Geometry OS Standard Library at map coordinate (0,0). Words are composed of Resonance Glyphs and are executable via the Motherboard.

## User Stories

### US-1: Define a Word

As a Geometry OS developer, I want to define named Words composed of glyph sequences so that I can build reusable computational units.

**Acceptance Criteria**:
- AC-1.1: Word definition includes name, glyph sequence, and coordinate
- AC-1.2: Words are stored as JSON manifest at dictionary coordinate
- AC-1.3: Word name is human-readable (e.g., "add", "multiply")

### US-2: Place Dictionary on Map

As a system architect, I want the Standard Library Dictionary placed at (0,0) so that all code can reference it as the origin of vocabulary.

**Acceptance Criteria**:
- AC-2.1: Dictionary manifest at `/.geometry/dictionary/standard.json`
- AC-2.2: Words placed at (0, y) where y = word index
- AC-2.3: Dictionary loaded on InfiniteMap initialization

### US-3: Execute Words

As a GlyphExecutor, I want to execute Words by expanding glyphs so that named functions run correctly.

**Acceptance Criteria**:
- AC-3.1: Word expansion produces glyph sequence
- AC-3.2: Each glyph registered with GlyphExecutor
- AC-3.3: Execution produces same result as raw glyph sequence

### US-4: Compose Words

As a developer, I want Words to call other Words so that I can build complex programs from simple ones.

**Acceptance Criteria**:
- AC-4.1: Word can reference another Word by coordinate
- AC-4.2: Call/return semantics preserve execution flow
- AC-4.3: Recursion supported (with depth limit)

### US-5: Visualize Dictionary

As a user, I want to see the Dictionary on the map so that I can visually browse available Words.

**Acceptance Criteria**:
- AC-5.1: Dictionary region visually distinct (e.g., labeled)
- AC-5.2: Words shown as glyph sequences
- AC-5.3: Hover shows Word name and signature

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | Word definition format: `{name, glyphs[], coordinate}` | Must | US-1 |
| FR-2 | Dictionary stored at map coordinate (0,0) | Must | US-2 |
| FR-3 | Words placed in row at (0, 1..N) | Must | US-2 |
| FR-4 | Word expansion to glyph sequence | Must | US-3 |
| FR-5 | GlyphExecutor integration for Word execution | Must | US-3 |
| FR-6 | Cross-Word calls via coordinate reference | Should | US-4 |
| FR-7 | Standard Library: add, sub, mul, load, store, jump | Must | US-2 |
| FR-8 | Dictionary manifest JSON schema | Must | FR-2 |
| FR-9 | Word-to-atlas-index mapping | Must | FR-4 |
| FR-10 | Visual label for Dictionary region | Should | US-5 |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | Word expansion < 1ms for 10-glyph Words | Performance |
| NFR-2 | Dictionary manifest < 64KB for Standard Library | Size |
| NFR-3 | 50% damage tolerance inherited from glyphs | Reliability |
| NFR-4 | Symmetry contracts enforced on Word glyphs | Security |

## Data Structures

### Word Definition

```typescript
interface Word {
  name: string;           // "add", "multiply"
  signature?: string;     // "(a: i32, b: i32) -> i32"
  glyphs: GlyphRef[];     // Sequence of glyphs
  coordinate: [number, number]; // [x, y] on map
}

interface GlyphRef {
  opcode: string;         // "ADD", "LW"
  atlasX: number;         // Column in atlas
  atlasY: number;         // Row in atlas
  instruction: number;    // 32-bit RISC-V
}
```

### Dictionary Manifest

```typescript
interface DictionaryManifest {
  version: string;
  name: string;           // "standard"
  coordinate: [number, number]; // [0, 0]
  words: Word[];
  created: string;        // ISO timestamp
}
```

## Out of Scope

- Dynamic Word creation at runtime (Phase 2)
- Word optimization/compaction (Phase 2)
- Multi-Dictionary linking (Phase 2)
- Word versioning (Phase 2)

## Dependencies

- Resonance Glyph System (glyphs, atlas)
- GlyphExecutor (registration, execution)
- InfiniteMap (placement, visualization)
- holographic_encoder.py (instruction encoding)
