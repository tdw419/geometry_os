# AI-Native Opcodes (232-235)

**Status:** Implemented with workaround
**Version:** 0.1.0
**Last Updated:** 2026-03-15

## Overview

The AI-native opcodes enable self-modifying code in the Glyph VM:
- GLYPH_WRITE (232): Copy glyphs between memory locations
- ATTENTION_FOCUS (233): Mark active VM regions for sparse scheduling
- GLYPH_MUTATE (234): Modify individual bytes of a glyph
- SEMANTIC_MERGE (235): Deduplicate identical glyphs

## Known Issue: GPU Texture Store Bug

**CRITICAL:** On Intel Graphics (ARL) with Vulkan, `textureStore` fails for addresses 10-4095.

### Workaround
Always use addresses >= 0x1000 (4096) for data storage:

```glyph
// CORRECT: Use high addresses
LDI r1, 0x1000
LDI r2, 0xCAFEBABE
STORE r1, r2    // Works ✓

// WRONG: Low addresses may fail
LDI r1, 100
STORE r1, r2    // May silently fail ✗
```

### Technical Details
- Affects: Intel Graphics (ARL) with Vulkan backend
- Does NOT affect: CPU-side writes via queue.write_texture
- Pattern: Addresses 0-9 work, 10-4095 fail, >= 4096 work
- Root cause: Suspected driver bug with storage texture writes

### Documentation
Full analysis: `docs/plans/2026-03-15-gpu-texture-bug.md`

## Working Opcodes

### STORE/LOAD (opcodes 3,4)
32-bit addresses via registers - FULL RANGE (with workaround)

```glyph
LDI r1, 0x100000   // 1MB address
LDI r2, 0xDEADBEEF
STORE r1, r2       // Works ✓
```

### GLYPH_WRITE (232)
8-bit addresses in encoding - LIMITED TO 0-255

Currently limited by encoding format. Use STORE/LOAD for full range.

## Test Files
- `systems/glyph_stratum/programs/ai_opcodes_demo.glyph`
- `systems/glyph_stratum/programs/self_modify_demo.glyph`
