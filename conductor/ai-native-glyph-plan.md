# Plan: AI-Native GlyphStratum Enhancements

## Objective
Propose and implement a set of "AI-Native" extensions to the Geometry OS GlyphStratum system. These enhancements aim to make the language more efficient for AI generation, more robust during execution, and more aligned with the probabilistic nature of LLMs.

## Key Files & Context
- **Opcodes Definition**: `systems/infinite_map_rs/shaders/glyph_opcodes.wgsl`
- **GPU Interpreter**: `systems/infinite_map_rs/shaders/glyph_microcode.wgsl`
- **Documentation**: `conductor/glyph-microcode-design.md`, `conductor/glyph-stratum-font-docs.md`
- **Reference**: `geoscript_transpiler.py`

## Proposed AI-Native Enhancements

### 1. Probabilistic Execution (Opcodes 220-222)
Introduce opcodes that handle uncertainty, allowing AIs to emit "alternative" paths that the system can evaluate or prune.
- **Opcode 220: `BRANCH_PROB`**: Branch based on a probability threshold (e.g., "Branch if random() < 0.87").
- **Opcode 221: `CONFIDENCE_MARK`**: Associate a confidence score with a block of glyphs.
- **Opcode 222: `ALTERNATE_PATH`**: Define fallback glyph clusters if a primary path fails or has low confidence.

### 2. Attention & Sparse Execution (Opcode 223)
Allow AIs to focus the GPU's "gaze" on specific spatial regions, optimizing performance for large maps.
- **Opcode 223: `ATTENTION_FOCUS`**: Mark a coordinate or range in the Glyph Stratum as "Active." The interpreter can skip execution for regions without attention.

### 3. Self-Modification Primitives (Opcodes 224-226)
Give AIs native tools to evolve their own code spatially.
- **Opcode 224: `GLYPH_MUTATE`**: Transform a glyph at a specific coordinate into another (e.g., change `ADD` to `SUB`).
- **Opcode 225: `SPATIAL_SPAWN`**: Create a new cluster of glyphs at a target coordinate (useful for recursive AI generation).
- **Opcode 226: `SEMANTIC_MERGE`**: Unify redundant glyph clusters (automated spatial refactoring).

### 4. Embedding-Native Memory (Opcode 227)
Bridge the gap between symbolic glyphs and neural embeddings.
- **Opcode 227: `LOAD_EMBEDDING`**: Load a vector (e.g., 768-dim) from the Substrate into a specialized embedding register.

## Implementation Plan

### Phase 1: Research & Specification
1. Verify the current unused opcode range (confirmed 220-254 are mostly available).
2. Define the exact binary/WGSL structure for these new opcodes.

### Phase 2: WGSL Interpreter Update
1. Update `systems/infinite_map_rs/shaders/glyph_microcode.wgsl` to implement the new 220-227 range.
2. Implement a simple "Attention Mask" buffer in the shader.

### Phase 3: Transpiler & Tooling Support
1. Update `geoscript_transpiler.py` to support new keywords/decorators for these opcodes (e.g., `@probabilistic`, `@attention`).
2. Update `glyph_bootstrap.py` to support "Spawning" and "Mutation" logic.

## Verification & Testing
- **Simulation Test**: Create a program that uses `BRANCH_PROB` to simulate a coin flip.
- **Spatial Test**: Verify that `SPATIAL_SPAWN` correctly writes new glyphs to the 2D stratum.
- **Performance Test**: Compare execution speed with and without `ATTENTION_FOCUS` on a large test stratum.
