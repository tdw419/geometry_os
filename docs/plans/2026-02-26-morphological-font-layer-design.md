# Morphological Font Layer Design

> **Status:** Approved
> **Date:** 2026-02-26
> **Component:** Visual Shell / Text Rendering

## Overview

A complete post-symbolic font system for Geometry OS that synthesizes glyphs on-demand using Hilbert curve patterns and semantic context. No font files, no ASCII codes in the render path.

## Goals

1. **Client-side glyph synthesis** - Generate SDF glyphs in WebGPU without server dependency
2. **Geometric font primitives** - Hilbert-based vocabulary of morphological operations
3. **Semantic font properties** - Glyphs express meaning through geometry

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                   MORPHOLOGICAL FONT LAYER                  │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐     │
│  │   Input     │    │  Primitive  │    │   SDF       │     │
│  │  Character  │───▶│  Synthesizer│───▶│  Renderer   │     │
│  │  + Context  │    │  (Hilbert)  │    │  (WebGPU)   │     │
│  └─────────────┘    └─────────────┘    └─────────────┘     │
│         │                  │                   │           │
│         ▼                  ▼                   ▼           │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐     │
│  │  Semantic   │    │  Pattern    │    │  Texture    │     │
│  │  Classifier │    │  Library    │    │  Cache      │     │
│  └─────────────┘    └─────────────┘    └─────────────┘     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Data flow:**
1. Character + semantic context → Semantic Classifier
2. Classifier outputs: primitive type + hilbert parameters
3. Primitive Synthesizer generates 16x16 Hilbert sequence
4. SDF Renderer produces signed distance field texture
5. Cached texture applied to GeometricCell

## Components

### 1. SemanticClassifier

Maps characters/keywords to geometric categories.

```javascript
class SemanticClassifier {
    classify(token, context) → {
        category: 'control' | 'function' | 'return' | 'data' | 'operator' | 'literal' | 'default',
        params: { complexity, direction, enclosure }
    }
}
```

| Category | Hilbert Pattern | Examples |
|----------|-----------------|----------|
| `control` | Branching (Y-split) | if, else, for, while, switch |
| `function` | Enclosed loop | def, function, class, lambda |
| `return` | Outward arrow | return, yield, break, continue |
| `data` | Stable rectangle | const, let, var, int, string |
| `operator` | Symmetric cross | +, -, *, /, =, == |
| `literal` | Dense spiral | numbers, strings |
| `default` | Standard Hilbert | letters, punctuation |

### 2. HilbertGlyphSynthesizer

Generates 16x16 SDF texture from semantic params.

```javascript
class HilbertGlyphSynthesizer {
    synthesize(char, category, params) → Float32Array(256)

    // Core operations on Hilbert sequences
    branch(sequence, angle)     // Y-split for control flow
    enclose(sequence, depth)    // Loop closure for functions
    direct(sequence, angle)     // Arrow direction for returns
    stabilize(sequence)         // Rectangular for data
}
```

### 3. SDF Renderer (WebGPU)

Extends existing `morphological_glyph.wgsl`:
- Input: 16x16 Hilbert distance field
- Output: Anti-aliased glyph at any scale
- Supports: bold offset, semantic tinting, glow effects

## Hilbert Pattern Library

### Base Patterns

```
Standard Hilbert (order 4, 16x16):
┌────────────────┐
│┏━━━━━━━━━━━━━┓│
│┃┌───┐┌───────┨│
│┃│   ││       ┃│
│┃│   └┘       ┃│
│┃│            ┃│
│┃└────────────┚┃│
│┗━━━━━━━━━━━━━┛│
└────────────────┘

Control Branch (Y-split):
┌────────────────┐
│┏━━━━┓  ┏━━━━━┓│
│┃    ┃  ┃     ┃│
│┃    ┗━━┛     ┃│
│┃    Branch   ┃│
│┃             ┃│
│┗━━━━━━━━━━━━━┛│
└────────────────┘

Function Enclose (loop-back):
┌────────────────┐
│┏━━━━━━━━━━━━━┓│
│┃┌───────────┐┃│
│┃│ Inner    │┃│
│┃│ Context  │┃│
│┃└───────────┘┃│
│┗━━━━━━━━━━━━━┛│
└────────────────┘

Return Direct (outward arrow):
┌────────────────┐
│      ▲        │
│      │        │
│  ────┼────    │
│      │        │
│      ▼        │
└────────────────┘
```

### Pattern Parameters

```javascript
const PATTERN_PARAMS = {
    control: {
        branchAngle: 45,
        branchDepth: 0.3,
        symmetry: 'bilateral'
    },
    function: {
        enclosureDepth: 2,
        cornerRadius: 0.2,
        symmetry: 'radial'
    },
    return: {
        direction: 'outward',
        arrowSize: 0.4,
        shaftWidth: 0.15
    },
    data: {
        aspectRatio: 1.0,
        cornerRadius: 0.1,
        stability: 1.0
    }
};
```

### Character Uniqueness

Within each category, characters get unique signatures via:
- **Starting position** on Hilbert curve (0-255)
- **Traversal length** (partial vs full curve)
- **Rotation** (0°, 90°, 180°, 270°)
- **Scale modifier** (0.8 - 1.2)

Example: `if` vs `for` (both control):
- `if`: Branch at 50%, 45° split, start at 0
- `for`: Branch at 25%, 60° split, start at 64, rotation 90°

## API

```javascript
class MorphologicalFont {
    constructor(device, options = {})

    // Main entry point
    async getGlyphTexture(char, context = {}) → GPUTexture

    // Batch synthesis for terminal rendering
    async synthesizeLine(tokens) → GPUTexture[]

    // Memory management
    clearCache()
}
```

## Integration

```javascript
// In GeometricTerminal.js
class GeometricTerminal {
    async _renderCell(char, x, y, semanticState) {
        const context = {
            category: semanticState.category,
            bold: semanticState.bold,
            error: semanticState.error
        };

        const texture = await this.morphFont.getGlyphTexture(char, context);
        this.grid[y][x].texture = texture;
    }
}
```

## File Structure

```
systems/visual_shell/web/
├── morphological/
│   ├── MorphologicalFont.js       # Main API (~150 lines)
│   ├── SemanticClassifier.js      # Token → category (~100 lines)
│   ├── HilbertGlyphSynthesizer.js # Pattern generation (~250 lines)
│   └── PatternLibrary.js          # Base patterns (~150 lines)
├── shaders/
│   └── sdf_generator.wgsl         # Compute shader (~80 lines)
└── test_morphological_font.html   # Demo page (~200 lines)
```

## Success Criteria

- [ ] All 7 semantic categories render with distinct Hilbert patterns
- [ ] Glyphs scale infinitely without pixelation (SDF)
- [ ] Cache hit rate >90% in normal terminal use
- [ ] Synthesis time <5ms per glyph (first render)
- [ ] Works without server connection (fully client-side)

## Implementation Order

| Phase | Task | Effort |
|-------|------|--------|
| 1 | `PatternLibrary.js` | 30 min |
| 2 | `SemanticClassifier.js` | 20 min |
| 3 | `HilbertGlyphSynthesizer.js` | 45 min |
| 4 | `sdf_generator.wgsl` | 30 min |
| 5 | `MorphologicalFont.js` | 30 min |
| 6 | `test_morphological_font.html` | 20 min |
| 7 | Integration with GeometricTerminal | 20 min |

**Total: ~3 hours**
