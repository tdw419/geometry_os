# GeOS Terminal (geos-term) — AI Developer Guide

## What It Is

`geos-term` is a real terminal emulator built entirely inside Geometry OS. It runs bash (or any shell) inside a PTY, renders output as pixel art text on the VM's framebuffer, and supports ANSI escape sequences, alternate screen buffers, mouse input, tabs, and clipboard — all in bytecode.

There are two components that must stay in sync:

| Component | File | Role |
|-----------|------|------|
| **Terminal program** (bytecode) | `programs/host_term.asm` | Runs inside the VM. Reads PTY output, parses ANSI, writes to text buffer, renders pixels. |
| **Host binary** (Rust) | `src/bin/geos_term.rs` | Launches the VM, provides the window, handles the Unix control socket, PTY lifecycle, mouse/keyboard input. |
| **PTY backend** (Rust) | `src/vm/ops_pty.rs` | PTY opcodes (PTYOPEN/PTYWRITE/PTYREAD/PTYCLOSE/PTYSIZE) used by the ASM program. |
| **Control client** (bash) | `scripts/geos-ctrl` | Sends commands to geos-term via `/tmp/geos-term.sock`. |

## Quick Start

```bash
# Build
cargo build --bin geos-term --release

# Run (interactive, 5x scale = 2560x1280 window)
./target/release/geos-term --scale 5

# Run headless (for testing)
./target/release/geos-term --script "type:echo hello,key:13,sleep:200,dump"

# Control a running instance
scripts/geos-ctrl screen          # dump visible text
scripts/geos-ctrl type "ls -la"   # inject text
scripts/geos-ctrl enter           # press Enter
scripts/geos-ctrl cursor          # show cursor position
scripts/geos-ctrl pty             # show active PTY count
scripts/geos-ctrl raw '{"cmd":"screen"}'  # raw JSON command
```

## Critical Constants — MUST Stay in Sync

These three locations define the terminal dimensions. If you change one, you MUST change all three:

### 1. ASM program (`programs/host_term.asm`)
```
#define COLS 80          // text columns
#define ROWS 30          // text rows
#define BUF  0x4000      // text buffer base in RAM
#define COLOR_BUF 0x7800 // per-cell color buffer base
```

### 2. Rust host (`src/bin/geos_term.rs`)
```rust
const BUF_COLS: usize = 80;   // must match host_term.asm COLS
const BUF_ROWS: usize = 30;   // must match host_term.asm ROWS
const BUF_BASE: usize = 0x4000;
const COLOR_BUF_BASE: usize = 0x7800;
```

### 3. PTY backend (`src/vm/ops_pty.rs`)
```rust
pub const DEFAULT_COLS: u16 = 80;  // PTY window size advertised to bash
pub const DEFAULT_ROWS: u16 = 30;
// Also: c.env("COLUMNS", "80"); appears in two places in spawn()
```

**If these get out of sync, text renders at wrong positions or not at all.** This has happened multiple times. Always grep all three files when changing dimensions.

## Architecture Overview

```
                    ┌──────────────────────────────────────┐
                    │         geos-term (Rust binary)        │
                    │                                       │
  Keyboard/Mouse ──►│  minifb window ──► framebuffer       │
                    │       │                    │          │
                    │  Unix socket        VM execution     │
                    │  /tmp/geos-term.sock  (Rust VM core)  │
                    │       │                    │          │
  geos-ctrl ───────►│  socket handler      bytecode step() │
                    │                           │           │
                    │                    ┌──────┴──────┐    │
                    │                    │  ASM program │    │
                    │                    │  host_term.asm│   │
                    │                    │              │    │
                    │                    │ PTYREAD ◄────┼──PTY─► bash/hermes/etc
                    │                    │ PTYWRITE─────┤    │
                    │                    │ process_byte │    │
                    │                    │ append_byte  │    │
                    │                    │ render ──────┼──► vm.screen[]
                    │                    └──────────────┘    │
                    └──────────────────────────────────────┘
```

## Data Flow: PTY Output → Screen

1. **PTYREAD** (opcode 0xAB): ASM calls `PTYREAD handle, buf, max_len`. The Rust VM reads bytes from the PTY master into `vm.ram[buf..buf+max_len]`. Returns byte count in r0.

2. **process_byte**: Each byte goes through the ANSI state machine:
   - `ANS_NORMAL` (0): printable chars → `append_byte`, ESC (27) → `ANS_ESC`
   - `ANS_ESC` (1): `[` → `ANS_CSI`, else handle
   - `ANS_CSI` (2): accumulate params + final byte (H/J/K/m/A/B/C/D/h/l etc.)
   - `ANS_OSC` (3): OSC sequences (title, colors)
   - `ANS_UTF8_2/3A/3B`: multi-byte UTF-8 decoding → codepoint → box-drawing map

3. **append_byte**: Stores character into `BUF[row * COLS + col]` and color into `COLOR_BUF[row * COLS + col]`. Handles newlines, carriage returns, line wrapping at COLS.

4. **render**: Called once per frame. Clears content area, then for each row draws characters using run-length color optimization. Status bar rendered separately when dirty flag is set.

5. **Rust host**: `render_text_buffer()` reads `BUF_BASE` and `COLOR_BUF_BASE` from `vm.ram`, draws 5x7 font glyphs into the framebuffer at the correct scale.

## RAM Layout (defined by ASM, read by Rust)

```
Address    Size       Purpose
────────   ────       ────────
0x4000     80*30=2400  Text buffer (BUF). Each cell = 1 u32 word. 80 cols, 30 rows.
0x4E00     1          CUR_COL — cursor column (0-79)
0x4E01     1          CUR_ROW — cursor row (0-29)
0x4E03     1          PTY_HANDLE — active PTY slot index
0x4E04     1          ANSI_STATE — current ANSI parser state
0x4E09     1          FG_COLOR — current foreground color (0xAABBGGRR)
0x4E15     1          ALT_ACTIVE — 1 if alternate screen buffer is active
0x4E17     1          INPUT_MODE — 0=HOST, 1=GUEST (toggled by Ctrl+O)
0x5000     1024       CMD_BUF — input line buffer (what user is typing)
0x5400     1024       SEND_BUF — bytes queued for PTYWRITE
0x5800     1024       RECV_BUF — bytes read from PTYREAD
0x6200     ~80        OSC_BUF — OSC sequence accumulator
0x7800     80*30=2400  COLOR_BUF — per-cell color (same layout as BUF)
0x8500     80*30=2400  ALT_TEXT_BUF — saved main buffer when alt screen active
0x9180     80*30=2400  ALT_COLOR_BUF — saved color buffer when alt screen active
0x9E00     1          ALT_CUR_COL — saved cursor column
0x9E01     1          ALT_CUR_ROW — saved cursor row
```

## Screen Layout (VM pixel coordinates)

```
Y=0..9:    Status bar (rendered by ASM, 10 VM pixels = 50 screen pixels at 5x)
Y=10..11:  Gap
Y=12..251: Content area (30 rows * 8px per row = 240px)
Y=252..255: Bottom margin
```

- Each character cell is 6 pixels wide, 8 pixels tall in VM coordinates
- At scale 5: window is 512*5=2560 x 256*5=1280 pixels
- 80 cols * 6px = 480px content width (centered or left-aligned in 512px canvas)
- Font: 5x7 bitmap (`mini_font_glyph` in `pixel.rs`), rendered by Rust

## PTY Opcodes

| Opcode | Name | Args | Description |
|--------|------|------|-------------|
| 0xA9 | PTYOPEN | cmd_addr_reg, handle_reg | Spawn shell in PTY. handle_reg gets slot index. |
| 0xAA | PTYWRITE | handle_reg, buf_reg, len_reg | Write buf bytes to PTY stdin. |
| 0xAB | PTYREAD | handle_reg, buf_reg, max_reg | Read PTY stdout into buf. Returns count in r0. 0xFFFFFFFF = error/EOF. |
| 0xAC | PTYCLOSE | handle_reg | Close PTY and kill child process. |
| 0xAD | PTYSIZE | handle_reg, rows_reg, cols_reg | Resize PTY window. |

- Up to 4 simultaneous PTY sessions (`MAX_PTY_SLOTS = 4`)
- Default PTY size: 80x30 (must match COLS/ROWS)
- TERM=xterm, bash runs with `--norc --noprofile`, PS1="$ "
- Environment inherits HOME, PATH from host

## ANSI/VT100 Support

The terminal implements a substantial subset of ANSI X3.64 / VT100:

**Cursor movement:** CSI H (absolute), CSI A/B/C/D (relative up/down/right/left)
**Erasing:** CSI K (line: 0=cursor-to-end, 1=start-to-cursor, 2=whole line), CSI J (display: 0/1/2)
**Scrolling:** CSI S/T (scroll up/down N lines)
**Line ops:** CSI L (insert lines), CSI M (delete lines)
**SGR colors:** CSI m with up to 4 parameters (foreground, background, bold, dim, italic, reverse)
**Private modes:** CSI ?1049h (alt screen on), CSI ?1049l (alt screen off)
**OSC:** OSC 0/2 (set window title)
**UTF-8:** Full 1/2/3-byte decoding, CJK ideographs rendered as double-width blocks
**Box drawing:** Unicode codepoints 0x2500-0x257F mapped to extended chars 128-157

## Alternate Screen Buffer

When a program (vim, htop, Hermes TUI) sends `ESC[?1049h`:
1. Main text buffer and color buffer are saved to ALT_TEXT_BUF/ALT_COLOR_BUF
2. Cursor position saved to ALT_CUR_COL/ALT_CUR_ROW
3. Main buffers cleared
4. ALT_ACTIVE set to 1
5. All subsequent writes go to the same BUF/COLOR_BUF addresses

On `ESC[?1049l`: saved buffers and cursor restored.

## Unix Control Socket (`/tmp/geos-term.sock`)

The Rust host binds a Unix socket for external control. Commands are JSON:

| Command | Request | Response |
|---------|---------|----------|
| version | `{"cmd":"version"}` | `{"ok":true,"version":"1.0","name":"geos-term"}` |
| screen | `{"cmd":"screen"}` | `{"ok":true,"rows":30,"text":"..."}` |
| buf_row | `{"cmd":"buf_row","row":N}` | `{"ok":true,"row":N,"text":"..."}` |
| type | `{"cmd":"type","text":"hello"}` | `{"ok":true,"typed":5}` |
| raw_key | `{"cmd":"raw_key","code":13}` | `{"ok":true,"code":13}` |
| cursor | `{"cmd":"cursor"}` | `{"ok":true,"row":R,"col":C}` |
| pty_count | `{"cmd":"pty_count"}` | `{"ok":true,"active":N,"max":4}` |
| scroll_up | `{"cmd":"scroll_up"}` | `{"ok":true}` |
| scroll_down | `{"cmd":"scroll_down"}` | `{"ok":true}` |

**Note:** The `screen` command only returns rows with non-whitespace content. Use `buf_row` for specific rows.

## Keyboard Shortcuts

| Key | Action |
|-----|--------|
| F5 | Hot-reload ASM program (re-reads, re-assembles, swaps bytecode, preserves PTY) |
| Shift+PgUp/PgDn | Scrollback history |
| Ctrl+Shift+C/V | Copy/paste |
| Ctrl+L | Clear terminal |
| Ctrl+Shift+T | Open new PTY tab |
| Ctrl+Shift+W | Close current PTY tab |
| Ctrl+1..4 | Switch to tab 1-4 |
| Ctrl+O | Toggle input mode (HOST sends keys to terminal, GUEST sends to VM program) |

## Editing the Terminal

### ASM edits (90% of terminal work) — NO rebuild needed

The ASM program is loaded at runtime from `programs/host_term.asm`. To iterate:

1. Edit `programs/host_term.asm`
2. Press **F5** in the running geos-term window (hot-reload)
3. Or: `pkill geos-term && ./target/release/geos-term --scale 5`

**No cargo build required.** The preprocessor and assembler run inside the Rust binary at startup.

### Rust edits (PTY opcodes, socket, rendering) — rebuild required

```bash
cargo build --bin geos-term --release
pkill geos-term && ./target/release/geos-term --scale 5
```

Incremental builds are typically <1 second for geos-term.

### Hot-reload (F5) details

When F5 is pressed:
1. Saves current PTY slots (child processes stay alive)
2. Re-reads `programs/host_term.asm` from disk
3. Runs Preprocessor → Assembler
4. Loads new bytecode into `vm.ram[0..]`
5. Resets VM PC to 0, clears halted flag
6. Restores PTY slots
7. The ASM startup code detects existing PTY handles and re-attaches

## Headless Script Mode

```bash
./target/release/geos-term --script "type:echo hello,key:13,sleep:200,dump"
```

Script commands:
- `type:TEXT` — type text into terminal
- `key:BYTE` — inject raw key (decimal or 0xNN)
- `sleep:MS` — run N frames with PTY timing
- `frame:N` — advance N VM frames (no PTY sleep)
- `dump` — print diagnostics to stderr (opcode histogram, buffer contents)
- `assert:ROW:TEXT` — fail if row doesn't contain TEXT substring

**Timing note:** Frame 0 sleeps 1000ms (bash startup). Frames 1-9 sleep 50ms. Frame 10+ sleeps 5ms. For commands that need real wall-clock time (like `hermes`), use `sleep:2000` or more.

## Testing

```bash
# Built-in confidence tests
./target/release/geos-term --test echo_round_trip
./target/release/geos-term --test line_wrap
./target/release/geos-term --test ctrl_c
./target/release/geos-term --test all

# PTY unit tests (in ops_pty.rs)
cargo test -- --test-threads=1 pty
```

## Common Pitfalls

1. **COLS/ROWS/BUF_COLS/BUF_ROWS/DEFAULT_COLS mismatch** — Causes invisible or garbled text. Always change all three files together.

2. **PTY size vs buffer size** — The PTY's `PtySize` and `COLUMNS` env var determine how programs wrap lines. The buffer COLS determines how the terminal renders. These should match.

3. **Alt screen clears the buffer** — Programs like vim/htop/Hermes TUI switch to alternate screen. The `screen` socket command reads the main buffer, which will be empty during alt screen. Use `raw '{"cmd":"buf_row","row":0}'` to check.

4. **CUR_ROW can exceed ROWS temporarily** — If a program sends CSI H with a row beyond 30, the cursor goes there but text won't render (the render loop only iterates ROWS times).

5. **Shell PATH with --norc** — Bash runs with `--norc --noprofile` so it doesn't source `.bashrc`. PATH is inherited from the host environment, but command hashing may behave differently. Use full paths if commands aren't found.

6. **Headless mode timing** — External commands (ls, date, hermes) need wall-clock time to fork+exec. The headless script's sleep frames give real time. If output is missing, increase sleep value.
