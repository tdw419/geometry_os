# SPIR-V Compiler Evolution (Phase 47)

Target: **Self-Hosted Glyph → SPIR-V Compilation**

## Objective
Evolve glyph programs that compile to valid SPIR-V and execute on GPU without human intervention. The AI designs the language, the compiler, and the programs - all three evolve together.

## The Vision
```
Human-made WGSL ──────► Synthetic Silicon (50 lines, fixed)
                              │
                              ▼
           ┌──────────────────────────────────────┐
           │  Glyph Programs (AI-evolved)          │
           │  ├── infinite_map.glyph              │
           │  ├── window_manager.glyph            │
           │  └── self_compiler.glyph             │
           └──────────────────────────────────────┘
                              │
                              ▼
           ┌──────────────────────────────────────┐
           │  glyph_compiler (Rust → SPIR-V)      │
           │  Fitness: compilation success rate   │
           └──────────────────────────────────────┘
                              │
                              ▼
                    GPU Execution
```

## Metrics

| Metric | Target | Weight |
|--------|--------|--------|
| Compilation Success | 100% | 0.4 |
| SPIR-V Validity | magic=0x07230203 | 0.3 |
| Execution Fitness | > 0.5 | 0.2 |
| Opcode Coverage | all 200-227 | 0.1 |

## Experimentation Loop

LOOP FOREVER:

1. **Generate**: Create random glyph program using `GlyphMutator`
   ```python
   from systems.evolution_daemon.glyph_evolution import GlyphMutator, GlyphProgram
   mutator = GlyphMutator()
   program = mutator.mutate(seed_program)
   ```

2. **Compile**: Run through `glyph_compiler`
   ```bash
   echo '{"glyphs": [...]}' | cargo run --package glyph_compiler -- compile
   ```

3. **Validate**: Check SPIR-V output
   - Magic number: `0x07230203`
   - Word count: > 20
   - No errors

4. **Execute** (if GPU available): Run on GPU
   ```bash
   cargo run --package glyph_compiler -- execute
   ```

5. **Record**: Log to `apps/autoresearch/spirv_results.tsv`:
   ```
   timestamp   program_hash   spirv_size   fitness   status   description
   ```

6. **Evolve**: Keep programs with fitness > 0.5, discard others

## Success Criteria

- [ ] 100 programs compile successfully
- [ ] All opcodes 200-227 tested
- [ ] At least one program executes on GPU
- [ ] Fitness trend improves over 100 generations

## Current Opcode Set (from champion_shader.wgsl)

| Range | Category | Opcodes |
|-------|----------|---------|
| 200-203 | Arithmetic | ADD_M, SUB_M, MUL_M, DIV_M |
| 204-207 | Memory | LD, ST, MOV, CLR |
| 208-211 | Control | JMP, JZ, CALL_M, RET_M |
| 212, 215 | System | HALT, DRAW |
| 216-218 | Extended | ADD_MEM, SUB_MEM, INT_DISPATCH |
| 220-227 | AI-Native | BRANCH_PROB, CONFIDENCE, ALTERNATE, ATTENTION, MUTATE, SPAWN, EMBEDDING |

## New Opcodes for Infinite Map (230-236)

| Opcode | Name | Purpose |
|--------|------|---------|
| 230 | OP_CAMERA | Render viewport from Hilbert space |
| 231 | OP_HILBERT_D2XY | Convert D → (X,Y) |
| 232 | OP_HILBERT_XY2D | Convert (X,Y) → D |
| 233 | OP_TILE_LOAD | Load tile region |
| 234 | OP_TILE_EVICT | Evict tile region |
| 235 | OP_ZOOM | Set zoom level |
| 236 | OP_PAN | Pan camera |

## Files to Monitor

- `systems/glyph_compiler/src/spirv_mapping.rs` - Opcode → SPIR-V mapping
- `systems/glyph_compiler/src/binary_builder.rs` - SPIR-V generation
- `systems/evolution_daemon/glyph_evolution.py` - Evolution logic
- `apps/autoresearch/spirv_results.tsv` - Experiment log

## Success Definition
> "The glyphs compile themselves to GPU bytecode. The compiler is no longer written by humans - it's evolved by AI."
