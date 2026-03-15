# Self-Modification Protocol

> How the Geometry OS scheduler modifies its own code at runtime.

## Overview

The meta-circular scheduler (scheduler.glyph running as VM 0) can modify its own code using the GLYPH_WRITE trap operation. This enables:

- **Hot-patching**: Fix bugs without restarting
- **Self-optimization**: Brain agent can improve scheduling algorithms
- **Adaptive behavior**: Modify dispatch logic based on workload

## Memory Layout

| Address | Purpose |
|---------|---------|
| 0x03F0 | SELF_MODIFY_TRIGGER - Write action code to request modification |
| 0x03F4 | SELF_MODIFY_SOURCE - Source address of new code |
| 0x03F8 | SELF_MODIFY_TARGET - Target address in scheduler code |
| 0x03FC | SELF_MODIFY_COUNT - Number of glyphs (4-byte words) to copy |
| 0x03FE | SELF_MODIFY_STATUS - 0=idle, 1=requested, 2=complete |

## Action Codes

| Code | Constant | Description |
|------|----------|-------------|
| 0 | SELF_MOD_ACTION_NONE | No action pending |
| 1 | SELF_MOD_ACTION_PATCH | Apply code patch |
| 2 | SELF_MOD_ACTION_HOTFIX | Emergency fix |

## Protocol Flow

1. **Prepare new code**: Write new glyph instructions to a staging area
2. **Set parameters**: Write source, target, count to 0x03F4-0x03FC
3. **Trigger**: Write action code (1 or 2) to 0x03F0
4. **Wait**: Scheduler polls and processes request
5. **Complete**: Status becomes 2, trigger cleared to 0

## GLYPH_WRITE Trap

The scheduler uses the GLYPH_WRITE trap (opcode 8) to copy glyphs:

```
TRAP_OP = 8              // GLYPH_WRITE
TRAP_ARG0 = target_addr  // Where to write
TRAP_ARG1 = source_addr  // Where to read from
TRAP_ARG2 = count        // Number of glyphs
TRAP_STATUS = 1          // PENDING
```

## Safety Considerations

- **Validation**: Only trusted agents (brain_bridge) should trigger self-modification
- **Bounds checking**: Target address must be within scheduler code region
- **Atomicity**: Modification completes before scheduler resumes

## Example

See `systems/glyph_stratum/programs/test_self_modify.glyph` for a complete example.

## Related

- [GPU Daemon API](gpu-daemon-api.md)
- [Trap Interface](../architecture/trap-interface.md)
- [Brain Bridge Protocol](brain-bridge-protocol.md)
