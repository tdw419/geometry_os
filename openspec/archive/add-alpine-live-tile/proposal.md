# Alpine Linux Live Tile

## Summary

Integrate Alpine Linux as an interactive terminal tile on the Infinite Map using PixelRTS v3 as the native execution format.

## Motivation

The Infinite Map currently supports static tiles and visualizations. Adding a live, interactive terminal tile enables:
- Direct shell access from the spatial computing environment
- AI agents to execute commands programmatically
- A functional shell node for the Geometry OS ecosystem

## Scope

### In Scope
- Convert Alpine Linux to PixelRTS v3 format (`alpine_v3.rts.png`)
- Memory-mapped terminal I/O (80x24 character grid)
- Hybrid input routing (click-to-focus, HUD palette, agent WebSocket)
- Adaptive framebuffer updates (1-15 FPS)
- LiveTileService integration with v3 format support
- Neural memory event capture for commands

### Out of Scope
- Graphical/desktop mode (terminal only for v1)
- Multi-tile networking
- Persistent storage across sessions

## Design Reference

Full design document: `docs/plans/2026-02-20-alpine-live-tile-design.md`

## Key Specifications

### PixelRTS v3 Substrate Layout
- **Grid**: 1024x1024 Hilbert-mapped
- **Boot Sector**: Hilbert (0,0) → (255,255) - 64KB kernel loader
- **Kernel Entry**: Hilbert (256,0) → (511,255) - 64KB native v3 ops
- **Terminal I/O**: Hilbert (512,0) → (767,255) - 64KB memory-mapped
- **Heap/Stack**: Hilbert (768,0) → (1023,255) - 64KB runtime data

### Memory-Mapped Terminal I/O
| Offset | Purpose | R/W | Format |
|--------|---------|-----|--------|
| 0x0000 | Keyboard buffer | R | ASCII char |
| 0x0001 | Keyboard ready | R | 0x01=key waiting |
| 0x0002 | Framebuffer X | R/W | Cursor X (0-79) |
| 0x0003 | Framebuffer Y | R/W | Cursor Y (0-23) |
| 0x0004 | Console char out | W | ASCII to display |
| 0x0005 | Console flush | W | 0x01=flush line |
| 0x0010+ | Framebuffer data | R/W | 80x24 char grid |

### Terminal Opcodes
| Opcode | Name | Description |
|--------|------|-------------|
| 0x40 | PRINT | Output char at cursor position |
| 0x41 | SCAN | Read char from keyboard buffer |
| 0x42 | CURSOR | Set cursor position (X, Y) |
| 0x43 | CLEAR | Clear terminal screen |
| 0x44 | SCROLL | Scroll screen up one line |

### Adaptive Framebuffer
| State | FPS | Trigger |
|-------|-----|---------|
| IDLE | 1 | No input for 5+ seconds |
| FOCUSED | 15 | User clicked on tile |
| TYPING | 10 | Input received in last 500ms |
| BACKGROUND | 0.5 | Tile not visible in viewport |

## Implementation Tasks

1. **AlpineV3Builder** - ISO to PixelRTS v3 conversion
2. **Terminal Opcodes** - PRINT, SCAN, CURSOR, CLEAR, SCROLL
3. **InputPixelMapper** - Keyboard events to pixel coordinates
4. **Extend LiveTileInstance** - v3 format support
5. **Adaptive Screenshot Loop** - FPS-based capture
6. **WebSocket Handlers** - alpine_input, alpine_output, alpine_focus, alpine_stats
7. **LiveTile.js Terminal Mode** - 80x24 char grid rendering
8. **Neural Memory Events** - Command logging

## Success Criteria

- [ ] Alpine boots in v3 format (`alpine_v3.rts.png` loads and executes)
- [ ] Terminal displays (80x24 char grid renders in LiveTile)
- [ ] Keyboard input works (typing in focused tile appears in shell)
- [ ] Agent can send commands (WebSocket `alpine_input` executes commands)
- [ ] Adaptive FPS works (Idle=1fps, Focused=15fps, Background=0.5fps)
- [ ] Neural memory captures commands

## Risks

| Risk | Impact | Mitigation |
|------|--------|------------|
| Alpine kernel too large for v3 grid | High | Use compressed kernel, extend grid |
| Input latency too high | Medium | Optimize WebSocket path, predict typing |
| Terminal rendering slow | Low | Use WebGL, cache character glyphs |
