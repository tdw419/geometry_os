# ANSI Parser Feature Parity Matrix

**Date:** 2026-05-01  
**Status:** ✅ FULL PARITY — Both parsers handle the same set of sequences.

## Parsers

| Parser | Language | Lines | Tests | Used By |
|--------|----------|-------|-------|---------|
| `qemu/ansi.rs` | Rust | 1403 | 71 | RISC-V bridge (QEMU hypervisor) |
| `host_term.asm` | ASM | 3970 | 32 | Host terminal (GeOS desktop) |

## CSI Sequences (ESC [ ... final)

| Final | Name | qemu/ansi.rs | host_term.asm | Notes |
|-------|------|:---:|:---:|-------|
| `A` | Cursor Up (CUU) | ✅ | ✅ | Clamped to scroll_top |
| `B` | Cursor Down (CUD) | ✅ | ✅ | Clamped to scroll_bottom |
| `C` | Cursor Right (CUF) | ✅ | ✅ | Clamped to CANVAS_COLS-1 |
| `D` | Cursor Left (CUB) | ✅ | ✅ | Clamped to 0 |
| `E` | Cursor Next Line (CNL) | ✅ | ✅ | Move N down, col=0 |
| `F` | Cursor Prev Line (CPL) | ✅ | ✅ | Move N up, col=0 |
| `G` | Cursor Horiz Absolute (CHA) | ✅ | ✅ | 1-based param |
| `H` | Cursor Position (CUP) | ✅ | ✅ | row;col, 1-based |
| `d` | Cursor Vert Absolute (VPA) | ✅ | ✅ | 1-based param |
| `f` | Horiz+Vert Position (HVP) | ✅ | ✅ | Same as H |
| `J` | Erase in Display (ED) | ✅ | ✅ | Modes 0/1/2/3 |
| `K` | Erase in Line (EL) | ✅ | ✅ | Modes 0/1/2 |
| `L` | Insert Lines (IL) | ✅ | ✅ | Shift rows down |
| `M` | Delete Lines (DL) | ✅ | ✅ | Shift rows up |
| `P` | Delete Characters (DCH) | ✅ | ✅ | Shift chars left |
| `@` | Insert Characters (ICH) | ✅ | ✅ | Shift chars right |
| `S` | Scroll Up (SU) | ✅ | ✅ | N lines, respects region |
| `T` | Scroll Down (SD) | ✅ | ✅ | N lines, respects region |
| `m` | SGR (color/style) | ✅ | ✅ | qemu ignores; host renders colors |
| `r` | Set Scroll Region (DECSTBM) | ✅ | ✅ | top;bottom, 1-based |
| `s` | Save Cursor (SCP) | ✅ | ✅ | CSI variant |
| `u` | Restore Cursor (RCP) | ✅ | ✅ | CSI variant |
| `g` | Tab Clear (TBC) | ✅ | ✅ | Modes 0/3 |
| `c` | RIS (Reset to Initial State) | — | ✅ | qemu uses ESC c instead |

## ESC Sequences (ESC char)

| Char | Name | qemu/ansi.rs | host_term.asm | Notes |
|------|------|:---:|:---:|-------|
| `[` | Begin CSI | ✅ | ✅ | → CSI state |
| `]` | Begin OSC | ✅ | ✅ | → OSC state |
| `7` | DEC Save Cursor (DECSC) | ✅ | ✅ | ESC variant |
| `8` | DEC Restore Cursor (DECRC) | ✅ | ✅ | ESC variant |
| `D` | Index (IND) | ✅ | ✅ | Move down, scroll if at bottom |
| `M` | Reverse Index (RI) | ✅ | ✅ | Move up, scroll if at top |
| `c` | RIS (Reset to Initial State) | ✅ | ✅ | Full terminal reset |
| `E` | Next Line (NEL) | ✅ | ✅ | CR + Index |
| `H` | HTS (Horiz Tab Set) | ✅ | ✅ | Set tab stop at cursor |

## Private CSI Sequences (ESC [ ? ...)

| Final | Name | qemu/ansi.rs | host_term.asm | Notes |
|-------|------|:---:|:---:|-------|
| `h` | Set Mode (SM) | ✅ | ✅ | Silently consumed |
| `l` | Reset Mode (RM) | ✅ | ✅ | Silently consumed |
| `J` | Erase Scrollback | ✅ | ✅ | Silently consumed |

## OSC Sequences (ESC ] ... BEL/ST)

| Type | qemu/ansi.rs | host_term.asm | Notes |
|------|:---:|:---:|-------|
| Title (0) | ✅ (consumed) | ✅ (consumed) | Both consume until BEL/ST |

## Implementation Differences

| Feature | qemu/ansi.rs | host_term.asm |
|---------|-------------|---------------|
| **CSI private dispatch** | Separate `CsiPrivate` state | Inline `?` prefix check in CSI param state |
| **RIS dispatch** | ESC `c` in Escape state | CSI `c` in CSI dispatch |
| **SGR rendering** | Ignored (text-only canvas) | Full color rendering via FG_COLOR/SGR state machine |
| **Tab stops** | `HashSet<usize>` (dynamic) | `tab_stops[]` array (32 entries max) |
| **Scroll region** | `scroll_top`/`scroll_bottom` fields | `SCROLL_TOP`/`SCROLL_BOT` RAM vars |
| **Color buffer** | None (single buffer) | Separate `COLOR_BUF` for per-cell colors |
| **Status bar** | None | Integrated status bar with DIRTY_STATUS flag |

## Test Coverage

| Parser | Test Count | Key Test Areas |
|--------|-----------|----------------|
| qemu/ansi.rs | 71 | Basic text, cursor movement, erase, scroll region, tabs, SGR stripping, private modes |
| host_term.asm | 32 | Text rendering, cursor movement, erase, scroll region, tabs, SGR colors, OSC, insert/delete |

## Conclusion

Both parsers are at **feature parity**. Every ANSI sequence handled by one is handled by the other. The only differences are implementation details (state machine structure, color rendering, data structures). No missing features to port.

Previously missing features that were added during phases 183-185:
- CSI `L` (Insert Lines) — added in phase 183
- CSI `M` (Delete Lines) — added in phase 184  
- CSI `r` (Scroll Region / DECSTBM) — added in phase 185
- CSI `@` (Insert Characters / ICH) — added in phase 186
