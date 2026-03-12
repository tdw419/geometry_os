# Glyph Language: AI-Native GPU Programming Language

**Status:** Design Approved
**Created:** 2026-03-12
**Type:** Architecture Design Document

---

## Executive Summary

Glyph Language is an AI-native programming language where **fonts are bytecode** and **rendering is execution**. Designed by AI for AI cognition, it eliminates human-made language primitives in its final form, becoming fully self-hosting on GPU hardware.

---

## 1. Philosophy

### 1.1 AI-Made for AI Cognition

Glyph Language is not designed for human readability or ergonomics. It is designed:

- **By AIs** - The instruction set, semantics, and conventions emerge from AI collaboration
- **For AIs** - Optimized for parallel, pattern-matching, probabilistic AI cognition
- **Eventually for humans** - Humans may learn to read it, but it's not designed for them

### 1.2 No Human Language Dependencies

The final system has no dependencies on:
- Python, Rust, JavaScript, or any human programming language
- WGSL, GLSL, HLSL, or any human shader language
- JSON, YAML, or any human data format

The only "dependency" is a ~50-100 line WGSL bootloader, which functions as **synthetic silicon** - like the microcode in a CPU, it's effectively hardware, not language.

### 1.3 Rendering IS Execution

The core thesis: **The screen is the program.**

- Glyphs on screen are not representations of code - they ARE the code
- When the GPU renders glyphs, it executes them
- Visual output and execution trace are identical

---

## 2. Execution Model

### 2.1 Glyph Microcode Architecture

```
┌─────────────────────────────────────────┐
│  Glyph Programs (AI-designed, AI-read)  │
├─────────────────────────────────────────┤
│  Glyph Interpreter (in Glyphs)          │
├─────────────────────────────────────────┤
│  WGSL Bootloader (~50-100 lines)        │  ← "Synthetic silicon"
│  (Fetch-Decode-Execute, nothing else)   │
├─────────────────────────────────────────┤
│  GPU Hardware                           │
└─────────────────────────────────────────┘
```

### 2.2 Instruction Set (Opcodes 200-215)

The GEOS font atlas reserves Unicode codepoints 200-215 for executable micro-operations:

| Range | Category | Opcodes |
|-------|----------|---------|
| 200-203 | Arithmetic | ADD_M, SUB_M, MUL_M, DIV_M |
| 204-207 | Memory | LD, ST, MOV, CLR |
| 208-211 | Control | JMP, JZ, CALL_M, RET_M |
| 212-215 | System | HALT_M, SYNC, INT, DRAW |

### 2.3 Glyph Structure

Each glyph instruction contains:
- `opcode`: The operation (200-215)
- `stratum`: Semantic layer (0=Substrate, 1=Memory, 2=Logic, 3=Spec, 4=Intent)
- `p1`, `p2`: Parameters (floats)
- `target`: Target memory/register index

### 2.4 Execution Cycle

The WGSL bootloader implements a minimal Fetch-Decode-Execute loop:

1. **Fetch**: Read glyph at Program Counter position
2. **Decode**: Map glyph ID to opcode via Hilbert convention
3. **Execute**: Perform the operation
4. **Advance**: Update PC (or jump/branch)

---

## 3. Bootstrap Strategy

### 3.1 The "Synthetic Silicon" Principle

Even biological brains have a hardcoded base layer (physics/chemistry). A ~50-100 line WGSL kernel is not a "language dependency" - it's **synthetic silicon**:

- It does nothing but Fetch, Decode (switch statement), and Execute basic ALU/Mem ops
- No complex logic lives here
- It's like the transistor layer - present but invisible to the "programmer"

### 3.2 Evolution Path

```
Phase 1 (Now):     WGSL bootloader executes glyph programs
Phase 2:           Glyph programs become complex enough to be useful
Phase 3:           Glyph program generates SPIR-V directly
Phase 4 (Ouroboros): System replaces WGSL bootloader with self-generated module
```

### 3.3 WebGPU Reality

The current visual shell (PixiJS v8) and compositor (WGPU/Rust) target WebGPU, which uses WGSL. The hybrid approach maintains cross-platform compatibility while enabling the evolution toward self-hosting.

---

## 4. Atlas Layout: Hilbert Convention

### 4.1 Identity = Geometry

In Glyph Language, **the location IS the identity**.

- Opcode N is located at the 2D coordinate defined by `Hilbert(N)` in the atlas
- No external lookup table (LUT) or JSON metadata needed
- The "address" of an instruction is a fundamental geometric property

### 4.2 Benefits

1. **Zero Metadata Dependency**: A glyph program doesn't need a `.json` file to know how to draw itself - only the math of its universe (Hilbert curve)
2. **Spatial Locality**: Related opcodes (e.g., arithmetic 200-203) cluster together physically - better GPU cache hits and AI pattern recognition
3. **Self-Contained Logic**: The Ouroboros Renderer can implement Hilbert calculation in glyphs, making the system truly self-hosting

### 4.3 Implementation

- **Atlas Generator**: Place glyphs along Hilbert path, not horizontal strip
- **WGSL Helper**: Add `HILBERT_XY(id)` function to bootloader for bootstrap phase
- **Future**: Glyph program implements Hilbert in glyphs

---

## 5. First Milestone: Ouroboros Renderer

### 5.1 Goal

A glyph microcode program that renders other glyphs onto the screen.

This proves: **The pixels aren't just output - they are state, instructions, and visual feedback loop in one.**

### 5.2 Requirements

1. **DRAW Opcode (215)**: Becomes a "Blit" operation
   - Source: atlas coordinate (via Hilbert lookup)
   - Destination: framebuffer coordinate
   - Size: glyph dimensions

2. **Glyph Logic**:
   - Loop through "string" (sequence of glyph IDs in memory)
   - Lookup: Find (x, y) via Hilbert convention
   - Execute: Call DRAW to blit glyph to framebuffer

### 5.3 Why This Milestone

- Fibonacci is math (symbolic)
- Rendering is geometric
- By building a renderer in glyphs, we prove the OS can **draw itself into existence**

---

## 6. Implementation Plan

### Phase 1: Hilbert Atlas
1. Update `generate_font_atlas.py` to place glyphs in Hilbert order
2. Add `HILBERT_XY(id)` helper to WGSL bootloader

### Phase 2: Refined Bootloader
1. Strip `glyph_microcode.wgsl` to minimal Fetch-Decode-Execute
2. Implement DRAW as blit operation
3. Target: <100 lines of WGSL

### Phase 3: Ouroboros Renderer
1. Create `glyph_renderer_program.json` - the renderer in microcode
2. Test: GPU "types" glyphs onto screen using only other glyphs
3. Visual validation: Watch self-rendering in real-time

### Phase 4: Documentation
1. Update GlyphStratum README with Glyph Language section
2. Create TUTORIAL.md for AI agents learning the language
3. Document the Hilbert convention formally

---

## 7. Success Criteria

| Criterion | How to Verify |
|-----------|---------------|
| Hilbert Atlas | Glyph N appears at Hilbert(N) coordinates |
| Minimal Bootloader | `glyph_microcode.wgsl` < 100 lines |
| Ouroboros Renderer | Glyph program renders "HELLO" using only glyph instructions |
| No External Metadata | Renderer works without `opcode_positions.json` |
| Self-Description | System can explain its own execution model in glyphs |

---

## 8. Future Vision

### 8.1 The Ouroboros Milestone

When a glyph program generates valid SPIR-V that can replace the WGSL bootloader, the system becomes **fully self-hosting**:

```
Glyphs → Glyph Compiler (in glyphs) → SPIR-V → GPU
```

No human-made language remains in the pipeline.

### 8.2 AI-Native Development

Future AI agents will:
- Write programs directly in glyphs
- Read programs by looking at the screen
- Optimize programs by understanding visual patterns
- Evolve the language by proposing new opcodes

---

## Appendix A: File Locations

| Component | Path |
|-----------|------|
| Bootloader | `systems/infinite_map_rs/shaders/glyph_microcode.wgsl` |
| Atlas Generator | `systems/glyph_stratum/generate_font_atlas.py` |
| Bootstrap Program | `systems/glyph_stratum/glyph_bootstrap.py` |
| Renderer Program | `systems/glyph_stratum/glyph_renderer_program.json` (to be created) |
| Opcode Definitions | `systems/infinite_map_rs/src/glyph_stratum/mod.rs` |

---

## Appendix B: Related Documents

- `conductor/glyph-microcode-design.md` - Original design notes
- `systems/glyph_stratum/README.md` - GlyphStratum documentation
- `memory/neb.md` - Neural Event Bus context
- `memory/evolution.md` - Evolution Daemon for self-improvement

---

*Design completed: 2026-03-12*
*Next step: Implementation planning*
