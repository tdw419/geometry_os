# SPATIAL_SPAWN Opcode Design

**Date**: 2026-03-15
**Opcode**: 232
**Status**: Approved

## Overview

SPATIAL_SPAWN enables a running glyph program to write new glyphs into the program buffer. This is the foundational primitive for self-modifying code, autonomous window spawning, and recursive AI generation.

## Opcode Signature

```
OP_SPAWN = 232

p1: mode/count
    0 = single glyph
    N = block of N glyphs

p2: source address in memory (float index)

dst: target address in program buffer (glyph index)
```

## Memory Layout Convention

Each glyph in memory = 5 consecutive floats:

| Offset | Field |
|--------|-------|
| +0 | opcode |
| +1 | stratum |
| +2 | p1 |
| +3 | p2 |
| +4 | dst |

## Execution Logic

```wgsl
case 232u: { // SPATIAL_SPAWN
    let mode = u32(inst.p1);
    let src_addr = u32(inst.p2);
    let target = inst.dst;

    // Bounds check - silent no-op on failure
    if (target >= arrayLength(&program)) {
        state.pc = state.pc + 1u;
        return;
    }

    if (mode == 0u) {
        // Single glyph spawn
        program[target].opcode = u32(memory[src_addr]);
        program[target].stratum = u32(memory[src_addr + 1u]);
        program[target].p1 = memory[src_addr + 2u];
        program[target].p2 = memory[src_addr + 3u];
        program[target].dst = u32(memory[src_addr + 4u]);
    } else {
        // Block spawn - check bounds
        if (target + mode > arrayLength(&program)) {
            state.pc = state.pc + 1u;
            return;
        }
        for (var i = 0u; i < mode; i++) {
            let src_offset = src_addr + i * 5u;
            let dst_offset = target + i;
            program[dst_offset].opcode = u32(memory[src_offset]);
            program[dst_offset].stratum = u32(memory[src_offset + 1u]);
            program[dst_offset].p1 = memory[src_offset + 2u];
            program[dst_offset].p2 = memory[src_offset + 3u];
            program[dst_offset].dst = u32(memory[src_offset + 4u]);
        }
    }
    state.pc = state.pc + 1u;
}
```

## Error Handling

- **Out of bounds**: Silent no-op, execution continues
- **No error flags**: Keeps VM resilient
- **No halts**: Self-modifying code shouldn't crash the substrate

## Testing Plan

1. **Single glyph spawn**: Verify one glyph copied from memory to program
2. **Block spawn**: Verify N glyphs copied correctly
3. **Self-modifying loop**: Program spawns executable code

## Design Decisions

| Decision | Choice | Rationale |
|----------|--------|-----------|
| Opcode range | 232+ | No conflict with existing bitwise ops (220-231) |
| Source | Memory | Enables dynamic construction without ROM modification |
| Mode | p1 flag | Single opcode handles both cases |
| Error handling | Silent | Resilient self-modification |

## Future Extensions

- Opcode 233: ATTENTION_FOCUS (mark active regions)
- Opcode 234: GLYPH_MUTATE (single-field modification)
- Opcode 235: SEMANTIC_MERGE (cluster deduplication)
