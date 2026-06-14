# System Monitor — KOL Validation Application

## Tier Classification

**Substrate-Aware** (Tier 2). Uses GlyphGrid for display, keyboard for input, and runs as a native GeOS assembly program. No host filesystem access required. Fully KOL-compatible.

## Purpose

Validate the KOL bootstrap chain end-to-end by building a concrete tool **entirely through the literal assembler**. This is the first program where we type mnemonics into the notepad buffer, run literal_asm, and the result executes as a running application.

## Display Layout

32×32 glyph grid at 256×256 resolution. The monitor renders a fixed layout:

```
┌────────────────────────────────────┐
│  GeOS System Monitor  v0.1         │
│  ────────────────────────────      │
│                                    │
│  Mode: [STATS]                     │
│  Frame:     000,000                │
│  IPC Rate:  000,000 inst/s         │
│  Events:    00 pending             │
│                                    │
│  [SPACE] toggle mode               │
│  [Q] quit                          │
└────────────────────────────────────┘
```

### Alternatives Mode

Toggle via SPACE to show a different view:
- **STATS mode** (default): Frame count, IPC rate, event buffer occupancy
- **GRID mode**: Raw glyph grid cell map (heatmap of occupied cells)
- **REG mode**: Last 8 register values (r0-r7)

## Data Sources (all available from assembly)

| Metric | Source | How to Read |
|--------|--------|-------------|
| Frame count | Software counter | Increment a RAM word each FRAME opcode |
| IPC rate | Software | Count steps between frames, display running average |
| Events pending | Event buffer | Read RAM[0x7B40] (event count) |
| Glyph grid occupancy | Grid scan | Count non-zero char_code cells via LOAD loop |
| Keyboard | IKEY opcode | IKEY rD — returns ASCII if key pressed, 0 if none |

## Architecture

```
main_loop:
  1. Read keyboard (IKEY)
  2. If SPACE: toggle display mode
  3. If Q: HALT
  4. Render title bar (TEXTI)
  5. Render stats for current mode
  6. Increment frame counter
  7. FRAME
  8. JMP main_loop
```

### Memory Map

```
0x0000-0x03FF: Program code (~900 words)
0x1000-0x100F: Data area
  0x1000: frame_counter (u32)
  0x1001: display_mode (0=STATS, 1=GRID, 2=REG)
  0x1002: ipc_avg (running average)
  0x1003: cycle_count (for IPC measurement)
```

### Key Subroutines

- `render_stats` — TEXTI calls for statistics
- `render_grid` — Scans glyph grid, colors cells by occupancy
- `render_regs` — Reads r0-r7, displays values
- `read_keys` — Non-blocking IKEY poll
- `increment_frame` — Updates frame counter and IPC rate

## Rendering Approach

Use TEXTI (0x13) for all text — it renders inline without mailbox overhead.

Format: `TEXTI x, y, "string"`

For the title bar, draw a top border row of `─` characters using mailbox PUT commands with a border token, then TEXTI below.

## Implementation Plan

### Phase 1: Static Display (36 words)
- Initialize data area
- Render fixed title bar with TEXTI
- Render frame counter label
- FRAME and loop

### Phase 2: Live Metrics (+24 words)
- Increment frame counter each cycle
- Read event buffer count from 0x7B40
- Display both metrics with live values

### Phase 3: Keyboard Input (+18 words)
- IKEY poll each cycle
- SPACE toggles mode
- Q halts

### Phase 4: Mode Toggle (+30 words)
- STATS mode (default)
- GRID mode (scan cells, render occupancy)
- REG mode (display r0-r7)

## Test Plan

1. **Assembly test**: Assemble with host assembler, verify labels exist
2. **Static render test**: Load at 0x0000, run N frames, verify glyph grid has expected cells
3. **Frame counter test**: Run 10 frames, verify frame_counter == 10
4. **Keyboard test**: Inject IKEY, verify mode toggle

## Verification Criteria

- [ ] Assembles without errors (host assembler)
- [ ] Fits within ~0x400 words
- [ ] Renders readable text via TEXTI
- [ ] Frame counter increments correctly
- [ ] SPACE toggles display mode
- [ ] Q halts the program
- [ ] Runs through the full KOL bootstrap: hex → hex_loader → literal_asm → copy-to-zero → execute

---

*Spec v0.1 — ready for review before keying mnemonics.*
