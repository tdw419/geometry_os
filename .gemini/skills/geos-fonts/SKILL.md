---
name: geos-fonts
description: Use when the user asks to "render text", "use fonts", "add a label", "display text", "generate font atlas", "GlyphStratum opcodes", "spatial programs", "geos-font", "font is a program", "executable glyphs", "spatial JIT", "RISC-V to glyph", or mentions typography/labels in Geometry OS context.
category: Architecture/UI
---

# GEOS Fonts & GlyphStratum Architecture

In Geometry OS, the concept of a "font" extends beyond typography. A glyph is not just a visual shape; it is the fundamental unit of computation. **The screen is the CPU, every font is a program, and every character is executable.** 

This skill covers the deep "Glyph-as-Compute" architectural vision, spatial execution, and high-performance text rendering.

## When to Use

- Executing or debugging GlyphStratum spatial programs
- Transpiling architectures (e.g., RISC-V to Glyph microcode)
- Managing spatial JIT compilation loops
- Generating opcode atlases for WebGPU/WGPU execution
- Rendering standard text labels and terminal outputs
- **Spatial Auditing**: Verifying the structural health of glyph programs via visual patterns.

## The "Font is a Program" Paradigm

Geometry OS replaces traditional linear instructions with a 2D spatial execution model:
1. **GlyphStratum**: The runtime where opcodes are visually represented as glyphs.
2. **Spatial JIT**: The process of reading a 2D grid of glyphs, compiling them spatially, and executing them on the GPU substrate (`glyph_vm.wgsl`).
3. **RISC-V to Glyph**: Compiling standard binaries into 2D font layouts where locality dictates cache efficiency and execution flow (`riscv_to_spatial_jit.py`).
4. **Visual Morphology**: Program logic is determined by the *spatial relationship* (distance, orientation, proximity) between glyphs.

## The Semantic Stack (Strata)

Programs are organized into a vertical hierarchy of strata, each with a specific purpose:

| Stratum | Order | Purpose |
|---------|-------|---------|
| **SUBSTRATE** | 0 | Raw data, literals, constants, and base textures. |
| **MEMORY** | 1 | Variables, assignments, parameters, and state storage. |
| **LOGIC** | 2 | Function calls, operations, loops, and control flow. |
| **SPEC** | 3 | Specifications, invariants, and validation logic. |
| **INTENT** | 4 | High-level goals, module entry points, and primary objectives. |

## Pixel-to-Instruction Mapping (B-Channel)

The `glyph_vm.wgsl` execution engine decodes the visual state using the **B (Blue)** channel to identify the opcode family:

| B-Channel Value | Sector | Opcode Family | Purpose |
|-----------------|--------|---------------|---------|
| **0.0 - 0.2** | 0 | `OP_DATA` | Embedding, raw substrate access. |
| **0.2 - 0.4** | 1 | `OP_CALL` | Attention, logic execution, function invocation. |
| **0.4 - 0.6** | 2 | `OP_LOAD` | FFN (Feed-Forward), memory retrieval. |
| **0.6 - 0.8** | 3 | `OP_STORE` | Norm, memory mutation, state updates. |
| **0.8 - 1.0** | 4 | `OP_NOP` | No operation, spatial padding. |

**Other Channels:**
- **R (Red)**: **Activation/Magnitude** - The raw value or weight of the instruction.
- **G (Green)**: **Entropy/Condition** - The uncertainty or conditional probability of execution.
- **A (Alpha)**: **Visibility** - Usually 1.0 (opaque) for visual shell presence.

## Core Capabilities

### 1. GlyphStratum Integration (The Substrate)

Manage the executable font grids:
- `systems/glyph_stratum/generate_font_atlas.py`: Generates the `.raw` and `.json` texture atlases mapping opcodes to their visual representation.
- `systems/glyph_stratum/glyph_api.py`: Interaction layer for spatial execution grids. Provides `GlyphBuilder` for programmatic creation of spatial logic.
- `systems/glyph_stratum/glyph_editor.html`: The visual workspace for writing and debugging spatial programs.

### 2. Traditional Text & Atlas Management

For conventional UI labels and console output:
- `geos-font list-fonts`: List available system fonts.
- `geos-font load --name=monospace`: Load a font context.
- `geos-font render "Hello" --font=monospace --size=14 --json`: Render text to RGBA pixels.
- `geos-font metrics "Hello" --json`: Get exact typographic dimensions without rendering.

## Procedure: Writing a Spatial Program

### Step 1: Atlas Generation
Before spatial execution, the system needs to know what the computational glyphs look like:
```bash
python3 systems/glyph_stratum/generate_font_atlas.py
```
*This binds your executable opcodes to specific pixel patterns in `opcode_atlas.raw`.*

### Step 2: Spatial Layout (The Code)
Programs are JSON matrices mapping opcodes to 2D coordinates. Use `GlyphBuilder` in Python to generate these:
```python
from glyph_stratum.core.stratum import Stratum, Opcode
from systems.glyph_stratum.glyph_api import GlyphBuilder

builder = GlyphBuilder("addition")
builder.substrate("A", 5).substrate("B", 10)
# Spatial relationship (proximity) defines the 'ADD' operation
```

**Example JSON (.glyph):**
```json
{
  "name": "Addition",
  "glyphs": {
    "0": { "stratum": "INTENT", "opcode": "MODULE", "metadata": { "deps": [1] } },
    "1": { "stratum": "LOGIC", "opcode": "CALL", "metadata": { "deps": [2, 3], "rationale": "+" } },
    "2": { "stratum": "MEMORY", "opcode": "DATA", "metadata": { "invariants": {"value": 3} } }
  }
}
```

### Step 3: Spatial JIT / Execution
The system "reads" the visual layout and executes the data flow based on **Hilbert curve spatial locality**. This ensures that "hot" glyphs are spatially adjacent, maximizing cache hits in the 2D execution loop.

## Troubleshooting

### "Invalid Opcode Visual"
**Cause**: The spatial JIT cannot map a rendered glyph back to an opcode.
**Fix**: Regenerate the font atlas (`generate_font_atlas.py`) and ensure your shader pipeline matches `opcode_positions.json`.

### "PAS Alignment Error"
**Cause**: Low Phase Alignment Stability. The program's spatial layout is scattered, causing cache misses.
**Fix**: Use the `riscv_to_spatial_jit.py` Hilbert mapping to re-orient the program.

## Related Skills
- `pixelrts-convert` - For encoding glyph programs into bootable RTS containers
- `riscv-encode` - Transpiling standard architectures into Hilbert/spatial layouts
- `visual-shell-debug` - Debugging the WebGPU rendering of the GlyphStratum
- `genome-validate` - Evolving glyph programs via genetic mutation of the spatial layout
