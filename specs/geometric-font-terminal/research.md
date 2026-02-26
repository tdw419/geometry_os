---
spec: geometric-font-terminal
phase: research
created: 2026-02-26T06:00:00Z
generated: auto
---

# Research: geometric-font-terminal

## Executive Summary
High feasibility. Core components already exist: GeometryFont.js (PixiJS v8 renderer + morphological compiler), FontExecutor.wgsl (WebGPU compute shader with 8 opcodes), FontExecutionSystem.js (GPU orchestration). Task is integration + UX enhancement, not greenfield.

## Codebase Analysis

### Existing Patterns

| Component | Path | Status |
|-----------|------|--------|
| GeometryFont.js | `systems/visual_shell/web/GeometryFont.js` | Complete - PixiJS v8 renderer, morphological compiler |
| FontExecutor.wgsl | `systems/visual_shell/web/shaders/FontExecutor.wgsl` | Complete - 8 opcodes, State struct, execution loop |
| FontExecutionSystem.js | `systems/visual_shell/web/FontExecutionSystem.js` | Complete - GPU pipeline, state/memory buffers |
| geo_term.html | `systems/visual_shell/web/geo_term.html` | Prototype - basic terminal UI exists |
| geo_edit.html | `systems/visual_shell/web/geo_edit.html` | Reference - visual editor pattern |

### Key Technical Details

**Opcode Mapping (from GeometryFont.js:94-102)**:
```
'+': 3 (ADD), '-': 4 (SUB), '>': 5 (JUMP), '!': 6 (PRINT),
'#': 7 (HALT), '?': 1 (LOAD), '=': 2 (STORE)
```

**Shader State Struct (FontExecutor.wgsl:6-11)**:
```wgsl
struct State {
    pc: u32,
    halted: u32,
    accumulator: i32,
    output_ptr: u32,
};
```

**Texture Format**: `rgba8uint` - R: Visual, G: Opcode, B: Operand, A: Executable flag

### Dependencies
- PixiJS v8.1.0 (already loaded via CDN)
- WebGPU API (browser support required)
- Universal Font Atlas (`assets/universal_font.rts.png`, `assets/glyph_info.json`)

### Constraints
- WebGPU not supported in all browsers (Chrome/Edge 113+)
- Atlas assets must exist in `assets/` directory
- Max 100 cycles per GPU dispatch (shader limitation)
- Memory buffer: 4MB (1M u32 values)

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | Core components complete, integration task |
| Effort Estimate | S | 4-6 tasks, mostly UX enhancement |
| Risk Level | Low | Existing working prototypes (geo_term.html, geo_edit.html) |

## Recommendations
1. Enhance existing geo_term.html rather than rebuild
2. Add real-time glyph visualization using GeometryFont.createText()
3. Display execution state panel (PC, accumulator, halted, output)
4. Support multi-line programs with proper PC handling
