# Proposal: Self-Hosting Text Editor

## Summary

Implement the Self-Hosting Text Editor - Milestone 10 on the Sovereignty Ladder. This combines the verified Full Assembler (Milestone 8) with the Window Manager (Milestone 9) to create an interactive development environment where the GPU edits, compiles, and runs code without CPU logic involvement.

## Motivation

The sovereignty ladder is 90% complete. The final milestone is an interactive text editor that can:
1. Edit its own source code in a text buffer
2. Compile the buffer using the self-hosting assembler
3. Execute the compiled output via SPATIAL_SPAWN

This is the moment the system becomes truly self-contained - a development environment that lives entirely on the GPU.

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    TEXT EDITOR VM                           │
├─────────────────────────────────────────────────────────────┤
│  0x100  │ Editor State (cursor, buffer_len, mode)          │
│  0x200  │ Input Mailbox (event_type, char, cursor)         │
│  0x1000 │ Text Buffer (source code)                        │
│  0x3000 │ Assembler Input (copied from buffer)             │
│  0x5000 │ Compiled Output                                   │
└─────────────────────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────────────────────┐
│                  EVENT FLOW                                  │
├─────────────────────────────────────────────────────────────┤
│  Keyboard → Mailbox → Editor → Buffer                       │
│                    → COMPILE → Assembler → Output           │
│                    → RUN → SPATIAL_SPAWN → Child VM         │
└─────────────────────────────────────────────────────────────┘
```

## Event Types

| Event | Code | Description |
|-------|------|-------------|
| INSERT | 1 | Insert char at cursor |
| DELETE | 2 | Backspace at cursor |
| CURSOR_LEFT | 3 | Move cursor left |
| CURSOR_RIGHT | 4 | Move cursor right |
| COMPILE | 5 | Trigger assembler |
| RUN | 6 | Spawn compiled output |

## Dependencies

- `test_self_hosting_quine` must pass (✅ verified)
- `test_compositor_window_manager` patterns used for event routing

## Success Criteria

1. `test_text_buffer_insert` passes
2. `test_text_buffer_delete` passes
3. `test_editor_compile_simple` passes
4. `test_edit_compile_execute_loop` passes
5. SOVEREIGNTY_LADDER.md updated with Milestone 10

## Estimated Effort

- 6 tasks
- 2-3 hours implementation
- 1 hour testing and documentation
