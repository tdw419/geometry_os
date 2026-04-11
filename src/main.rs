use geometry_os::assembler;
use geometry_os::opcodes;
use geometry_os::shell::{Shell, ShellAction};
use geometry_os::vm::Vm;
use minifb::{Key, KeyRepeat, Window, WindowOptions};

mod font;

const WIDTH: usize = 1024;
const HEIGHT: usize = 768;

// ── Palette remapping ────────────────────────────────────────────────
fn palette_color(val: u32) -> u32 {
    let ascii_val = (val & 0xFF) as u8;
    if ascii_val < 32 || ascii_val > 126 {
        // Not a printable ASCII char, but might be a raw color.
        // If it looks like a full 24-bit color, use it.
        if val > 0xFF {
            return val;
        }
        // Otherwise, some default dark gray for "null" or non-char
        return 0x222233;
    }

    let t = ((ascii_val as f32) - 32.0_f32) / (94.0_f32);
    let t = t.max(0.0).min(1.0);

    let h = t * 360.0;
    let s = 0.8;
    let v = 1.0;
    hsv_to_rgb(h, s, v)
}

fn hsv_to_rgb(h: f32, s: f32, v: f32) -> u32 {
    let c = v * s;
    let x = c * (1.0 - ((h / 60.0) % 2.0 - 1.0).abs());
    let m = v - c;
    let (r, g, b) = if h < 60.0 {
        (c, x, 0.0)
    } else if h < 120.0 {
        (x, c, 0.0)
    } else if h < 180.0 {
        (0.0, c, x)
    } else if h < 240.0 {
        (0.0, x, c)
    } else if h < 300.0 {
        (x, 0.0, c)
    } else {
        (c, 0.0, x)
    };
    let ri = ((r + m) * 255.0) as u32;
    let gi = ((g + m) * 255.0) as u32;
    let bi = ((b + m) * 255.0) as u32;
    (ri << 16) | (gi << 8) | bi
}

// ── Layout constants ─────────────────────────────────────────────────
const CANVAS_X: usize = 16;
const CANVAS_Y: usize = 64;
const CANVAS_SCALE: usize = 16;
const CANVAS_COLS: usize = 32;
const CANVAS_ROWS: usize = 32;

const VM_SCREEN_X: usize = 640;
const VM_SCREEN_Y: usize = 64;
const VM_SCREEN_SCALE: usize = 1; // 256x256 at 1:1

const REGS_X: usize = 640;
const REGS_Y: usize = 340;

// ── Self-hosting memory map ──────────────────────────────────────────
// RAM is 4096 cells. The canvas renders the first 1024 (32×32 grid).
// High memory is invisible on canvas but fully addressable by the VM.
const RAM_SIZE: usize = 4096;
const TEXT_BUF_ADDR: usize = 0x400; // 1024 — text input buffer for micro-asm
const MICRO_ASM_ADDR: usize = 0x800; // 2048 — VM-resident assembler lives here
const KEY_PORT: usize = 0xFFF; // 4095 — memory-mapped keyboard register
//   host writes ASCII keycode on each keypress
//   program reads it; write 0 to acknowledge

const BG: u32 = 0x050508;
const GRID_BG: u32 = 0x0A0A14;
const GRID_LINE: u32 = 0x141420;
const CURSOR_COL: u32 = 0x00FFFF;
const CURSOR_BLOCK: u32 = 0x00FFFF; // Blinking block cursor color
const STATUS_FG: u32 = 0x888899;

// ── Text buffer constants ───────────────────────────────────────────
const TEXT_BUFFER_SIZE: usize = 4096; // Configurable text buffer size
const CURSOR_BLINK_INTERVAL: u64 = 500; // Cursor blink interval in milliseconds

fn main() {
    let mut window = Window::new(
        "Geometry OS -- Pixel Painter & VM",
        WIDTH,
        HEIGHT,
        WindowOptions {
            resize: false,
            ..Default::default()
        },
    )
    .unwrap();

    let mut buffer = vec![BG; WIDTH * HEIGHT];

    // Initialize VM with expanded RAM (canvas = first 1024 cells)
    let mut vm = Vm::new(RAM_SIZE);

    // Auto-load micro-assembler into RAM[0x800..] at startup
    let mut micro_asm_loaded = false;
    if let Ok(src) = std::fs::read_to_string("programs/micro-asm.asm") {
        if let Ok(result) = assembler::assemble(&src) {
            for (i, &pixel) in result.pixels.iter().enumerate() {
                if i >= MICRO_ASM_ADDR && i < vm.ram.len() {
                    vm.ram[i] = pixel;
                }
            }
            micro_asm_loaded = true;
        }
    }

    // ── Shell for keyboard input to TEXT rendering ─────────────────────
    let mut shell = Shell::new();
    let mut shell_cursor_x: usize = 0; // Cursor position on VM screen
    let mut shell_cursor_y: usize = 0; // Cursor position on VM screen
    let mut shell_scroll: usize = 0; // Scroll offset for VM screen
    const CHAR_WIDTH: usize = 5; // 5x7 font width
    const CHAR_HEIGHT: usize = 7; // 5x7 font height
    const SCREEN_COLS: usize = 51; // 256 / 5 = 51 columns
    const SCREEN_ROWS: usize = 36; // 256 / 7 = 36 rows

    // Cursor blink state
    let mut cursor_visible = true;
    let mut last_blink_time = std::time::Instant::now();

    // Painter cursor position
    let mut cursor_col: usize = 0;
    let mut cursor_row: usize = 0;

    // Text cursor on VM screen (for runtime typing)
    let mut text_x: usize = 0;
    let mut text_y: usize = 0;
    const TEXT_SCALE: usize = 2; // 2x = 10x14 per char, fits ~25 cols on 256px screen
    const TEXT_COL_ADVANCE: usize = (font::GLYPH_W + 1) * TEXT_SCALE; // 12px per char
    const TEXT_ROW_ADVANCE: usize = (font::GLYPH_H + 1) * TEXT_SCALE; // 16px per row
    const TEXT_MAX_X: usize = 256 - TEXT_COL_ADVANCE;
    const TEXT_MAX_Y: usize = 256 - TEXT_ROW_ADVANCE;

    let mut cycles_last_run: u32 = 0;
    let mut is_running = false;
    let mut single_stepping = false;

    // ── View mode (disasm / spreadsheet) ────────────────────────────
    #[derive(PartialEq, Clone, Copy)]
    enum PanelView {
        Disassembly,
        Spreadsheet,
    }
    let mut panel_view = PanelView::Disassembly;

    // -- HEX input mode (Tab to toggle) --
    // In hex mode, keystrokes are two-char hex pairs: type `4` then `1` → writes 0x41.
    // `hex_nibble` holds the pending high nibble (0-15) while waiting for the low nibble.
    let mut hex_mode = false;
    let mut hex_nibble: Option<u8> = None; // Some(hi) = waiting for low nibble

    // -- ASM input mode (backtick to toggle) --
    let mut asm_mode = false;
    let mut asm_input = String::new();

    // ── Inline code editor (F9 to open) ─────────────────────────────
    // Full-screen overlay. Arrow keys navigate, Enter adds a line,
    // Backspace deletes, F8 assembles+loads, Escape cancels.
    let mut editor_mode = false;
    let mut editor_lines: Vec<String> = vec![String::new()];
    let mut editor_cursor_line: usize = 0;
    let mut editor_cursor_col: usize = 0;
    let mut editor_scroll: usize = 0;
    const EDITOR_VISIBLE_LINES: usize = 38;
    const EDITOR_MAX_COL: usize = 90;

    // ── REPL mode (F6) ──────────────────────────────────────────────
    // Pixel REPL: type one instruction, see it execute, registers update.
    // Each Enter: assemble → write bytecode to RAM → step → snapshot regs.
    let mut repl_mode = false;
    let mut repl_input = String::new();
    // History: (source text, register snapshot after execution, error?)
    let mut repl_history: Vec<(String, [u32; 32], Option<String>)> = Vec::new();
    let mut repl_write_addr: usize = 0; // where next instruction goes in RAM
    // Bookmarks: @name → address. Type `@loop` to tag, then use @loop in JMP.
    let mut repl_bookmarks: std::collections::HashMap<String, usize> =
        std::collections::HashMap::new();

    // ── Persistent child VMs ────────────────────────────────────────
    // Children spawned by the parent VM persist across frames.
    // Each frame: parent runs → children collected → new children created →
    //             all children run → child screens composited onto parent.
    let mut child_vms: Vec<Vm> = Vec::new();

    let mut needs_redraw = true;

    while window.is_open() && !window.is_key_down(Key::Escape) {
        // ── Cursor blink logic ────────────────────────────────────────
        let now = std::time::Instant::now();
        if now.duration_since(last_blink_time).as_millis() >= CURSOR_BLINK_INTERVAL as u128 {
            cursor_visible = !cursor_visible;
            last_blink_time = now;
            needs_redraw = true;
        }

        // ── Input ────────────────────────────────────────────────────
        let keys = window.get_keys_pressed(KeyRepeat::Yes);
        for key in keys {
            // ── Code editor mode: intercepts all input ───────────────
            if editor_mode {
                let shift =
                    window.is_key_down(Key::LeftShift) || window.is_key_down(Key::RightShift);
                let ctrl = window.is_key_down(Key::LeftCtrl) || window.is_key_down(Key::RightCtrl);
                match key {
                    Key::Escape => {
                        editor_mode = false;
                        needs_redraw = true;
                    }
                    Key::F8 => {
                        // Rust assembler: full mnemonic syntax, labels, etc.
                        let src = editor_lines.join("\n");
                        match assembler::assemble(&src) {
                            Ok(asm_result) => {
                                // Clear canvas area only (preserve high RAM / micro-asm)
                                let ram_len = vm.ram.len();
                                for v in vm.ram[..MICRO_ASM_ADDR.min(ram_len)].iter_mut() {
                                    *v = 0;
                                }
                                for (i, &pixel) in asm_result.pixels.iter().enumerate() {
                                    if i < MICRO_ASM_ADDR && i < ram_len {
                                        vm.ram[i] = pixel;
                                    }
                                }
                                vm.pc = 0;
                                vm.halted = false;
                                is_running = false;
                                child_vms.clear();
                                cursor_col = 0;
                                cursor_row = 0;
                                editor_mode = false;
                            }
                            Err(e) => {
                                let msg = format!("; ERROR line {}: {}", e.line, e.message);
                                editor_lines.insert(0, msg);
                                editor_cursor_line = 0;
                                editor_scroll = 0;
                            }
                        }
                        needs_redraw = true;
                    }
                    Key::F5 if micro_asm_loaded => {
                        // VM micro-assembler: single-char syntax ($XX hex escapes)
                        let src = editor_lines.join("\n");
                        // Clear text buffer and write source text
                        let ram_len = vm.ram.len();
                        for v in vm.ram[TEXT_BUF_ADDR..MICRO_ASM_ADDR.min(ram_len)].iter_mut() {
                            *v = 0;
                        }
                        for (i, byte) in src.bytes().enumerate() {
                            let addr = TEXT_BUF_ADDR + i;
                            if addr < MICRO_ASM_ADDR && addr < ram_len {
                                vm.ram[addr] = byte as u32;
                            }
                        }
                        // Clear canvas/output area
                        for v in vm.ram[..TEXT_BUF_ADDR.min(ram_len)].iter_mut() {
                            *v = 0;
                        }
                        // Run micro-assembler
                        vm.pc = MICRO_ASM_ADDR as u32;
                        vm.halted = false;
                        is_running = true;
                        child_vms.clear();
                        editor_mode = false;
                        needs_redraw = true;
                    }
                    Key::V if ctrl => {
                        if let Some(text) = read_clipboard() {
                            for line in text.lines() {
                                if editor_lines[editor_cursor_line].len() + line.len()
                                    <= EDITOR_MAX_COL
                                {
                                    editor_lines[editor_cursor_line].push_str(line);
                                } else {
                                    editor_lines[editor_cursor_line].push_str(line);
                                }
                                editor_cursor_col = editor_lines[editor_cursor_line].len();
                                let next = editor_cursor_line + 1;
                                editor_lines.insert(next, String::new());
                                editor_cursor_line = next;
                            }
                            // Remove trailing empty line from paste
                            if editor_cursor_line > 0 && editor_lines[editor_cursor_line].is_empty()
                            {
                                editor_lines.remove(editor_cursor_line);
                                editor_cursor_line -= 1;
                            }
                            editor_cursor_col = editor_lines[editor_cursor_line].len();
                        }
                        needs_redraw = true;
                    }
                    Key::L if ctrl => {
                        // Load programs/boot.asm into the editor
                        // (symlink or copy your target file to boot.asm)
                        if let Ok(src) = std::fs::read_to_string("programs/boot.asm") {
                            editor_lines = src.lines().map(|l| l.to_string()).collect();
                            if editor_lines.is_empty() {
                                editor_lines.push(String::new());
                            }
                            editor_cursor_line = 0;
                            editor_cursor_col = 0;
                            editor_scroll = 0;
                        } else {
                            editor_lines = vec!["; programs/boot.asm not found".to_string()];
                            editor_cursor_line = 0;
                        }
                        needs_redraw = true;
                    }
                    Key::Enter => {
                        let rest = editor_lines[editor_cursor_line].split_off(editor_cursor_col);
                        let next = editor_cursor_line + 1;
                        editor_lines.insert(next, rest);
                        editor_cursor_line = next;
                        editor_cursor_col = 0;
                        if editor_cursor_line >= editor_scroll + EDITOR_VISIBLE_LINES {
                            editor_scroll += 1;
                        }
                        needs_redraw = true;
                    }
                    Key::Backspace => {
                        if editor_cursor_col > 0 {
                            editor_cursor_col -= 1;
                            editor_lines[editor_cursor_line].remove(editor_cursor_col);
                        } else if editor_cursor_line > 0 {
                            let line = editor_lines.remove(editor_cursor_line);
                            editor_cursor_line -= 1;
                            editor_cursor_col = editor_lines[editor_cursor_line].len();
                            editor_lines[editor_cursor_line].push_str(&line);
                            if editor_cursor_line < editor_scroll {
                                editor_scroll = editor_cursor_line;
                            }
                        }
                        needs_redraw = true;
                    }
                    Key::Up => {
                        if editor_cursor_line > 0 {
                            editor_cursor_line -= 1;
                            editor_cursor_col =
                                editor_cursor_col.min(editor_lines[editor_cursor_line].len());
                            if editor_cursor_line < editor_scroll {
                                editor_scroll = editor_cursor_line;
                            }
                        }
                        needs_redraw = true;
                    }
                    Key::Down => {
                        if editor_cursor_line + 1 < editor_lines.len() {
                            editor_cursor_line += 1;
                            editor_cursor_col =
                                editor_cursor_col.min(editor_lines[editor_cursor_line].len());
                            if editor_cursor_line >= editor_scroll + EDITOR_VISIBLE_LINES {
                                editor_scroll += 1;
                            }
                        }
                        needs_redraw = true;
                    }
                    Key::Left => {
                        if editor_cursor_col > 0 {
                            editor_cursor_col -= 1;
                        } else if editor_cursor_line > 0 {
                            editor_cursor_line -= 1;
                            editor_cursor_col = editor_lines[editor_cursor_line].len();
                            if editor_cursor_line < editor_scroll {
                                editor_scroll = editor_cursor_line;
                            }
                        }
                        needs_redraw = true;
                    }
                    Key::Right => {
                        if editor_cursor_col < editor_lines[editor_cursor_line].len() {
                            editor_cursor_col += 1;
                        } else if editor_cursor_line + 1 < editor_lines.len() {
                            editor_cursor_line += 1;
                            editor_cursor_col = 0;
                            if editor_cursor_line >= editor_scroll + EDITOR_VISIBLE_LINES {
                                editor_scroll += 1;
                            }
                        }
                        needs_redraw = true;
                    }
                    Key::Home => {
                        editor_cursor_col = 0;
                        needs_redraw = true;
                    }
                    Key::End => {
                        editor_cursor_col = editor_lines[editor_cursor_line].len();
                        needs_redraw = true;
                    }
                    _ => {
                        if let Some(ch) = key_to_ascii_shifted(key, shift) {
                            if editor_lines[editor_cursor_line].len() < EDITOR_MAX_COL {
                                editor_lines[editor_cursor_line]
                                    .insert(editor_cursor_col, ch as char);
                                editor_cursor_col += 1;
                                needs_redraw = true;
                            }
                        }
                    }
                }
                continue; // consume key — don't fall through to paint/ASM handlers
            }

            // ── REPL mode: intercepts all input ─────────────────────
            if repl_mode {
                let shift =
                    window.is_key_down(Key::LeftShift) || window.is_key_down(Key::RightShift);
                match key {
                    Key::Escape => {
                        if repl_input.is_empty() {
                            repl_mode = false;
                        } else {
                            repl_input.clear();
                        }
                        needs_redraw = true;
                    }
                    Key::Backspace => {
                        repl_input.pop();
                        needs_redraw = true;
                    }
                    Key::Enter => {
                        if !repl_input.is_empty() {
                            let src = repl_input.clone();
                            // ── @name bookmark: tag current write address ──
                            if src.starts_with('@') && !src.contains(' ') {
                                // `@loop` — bookmark this address as "loop"
                                let name = src[1..].trim().to_lowercase();
                                if !name.is_empty() {
                                    repl_bookmarks.insert(name.clone(), repl_write_addr);
                                    let msg = format!("@{} = {:04X}", name, repl_write_addr);
                                    let mut snap = [0u32; 32];
                                    snap.copy_from_slice(&vm.regs[..32]);
                                    repl_history.push((src.clone(), snap, Some(msg)));
                                }
                            // ── ?? hex-dump: ?? [addr] → 16-byte dump ──
                            } else if src.starts_with("??") {
                                let arg = src[2..].trim();
                                let base = if arg.is_empty() {
                                    repl_write_addr.saturating_sub(8) & !0xF // align to 16
                                } else {
                                    let hex = arg.trim_start_matches("0x").trim_start_matches("0X");
                                    usize::from_str_radix(hex, 16)
                                        .or_else(|_| arg.parse::<usize>())
                                        .unwrap_or(repl_write_addr)
                                        & !0xF // align to 16
                                };
                                let mut lines = Vec::new();
                                for row in 0..4usize {
                                    let row_addr = base + row * 16;
                                    if row_addr >= vm.ram.len() {
                                        break;
                                    }
                                    let bytes: Vec<String> = (0..16)
                                        .map(|col| {
                                            let a = row_addr + col;
                                            if a < vm.ram.len() {
                                                let mark =
                                                    if a == repl_write_addr { ">" } else { " " };
                                                format!("{}{:02X}", mark, vm.ram[a] & 0xFF)
                                            } else {
                                                "   ".to_string()
                                            }
                                        })
                                        .collect();
                                    lines.push(format!("{:04X}: {}", row_addr, bytes.join(" ")));
                                }
                                let dump = lines.join(" | ");
                                let mut snap = [0u32; 32];
                                snap.copy_from_slice(&vm.regs[..32]);
                                repl_history.push((format!("?? {:04X}", base), snap, Some(dump)));
                            // ── ? inspect command: ? r5 or ? 0x1A ──
                            } else if src.starts_with('?') {
                                let arg = src[1..].trim();
                                let result = if arg.starts_with('r') || arg.starts_with('R') {
                                    // Register inspect: ? r5
                                    if let Ok(ri) = arg[1..].parse::<usize>() {
                                        if ri < 32 {
                                            format!("r{} = {:08X}", ri, vm.regs[ri])
                                        } else {
                                            format!(
                                                "ERR: register index {} out of range (0-31)",
                                                ri
                                            )
                                        }
                                    } else {
                                        "ERR: usage: ? r<N>  (e.g. ? r5)".to_string()
                                    }
                                } else {
                                    // RAM address inspect: ? 0x1A or ? 42
                                    let addr_str =
                                        arg.trim_start_matches("0x").trim_start_matches("0X");
                                    if let Ok(addr) = usize::from_str_radix(addr_str, 16)
                                        .or_else(|_| usize::from_str_radix(addr_str, 10))
                                        .or_else(|_| arg.parse::<usize>())
                                    {
                                        if addr < vm.ram.len() {
                                            format!("ram[{:04X}] = {:08X}", addr, vm.ram[addr])
                                        } else {
                                            format!(
                                                "ERR: address {:04X} out of range (0-{:04X})",
                                                addr,
                                                vm.ram.len() - 1
                                            )
                                        }
                                    } else {
                                        "ERR: usage: ? <addr> or ? r<N>".to_string()
                                    }
                                };
                                // Snapshot live registers so diff stays clean
                                let mut snap = [0u32; 32];
                                snap.copy_from_slice(&vm.regs[..32]);
                                repl_history.push((format!("? {}", arg), snap, Some(result)));
                            // ── ! run command: ! 100 → run 100 cycles from PC ──
                            } else if src.starts_with('!') {
                                let count_str = src[1..].trim();
                                let max_steps = if count_str.is_empty() {
                                    256 // default run length
                                } else {
                                    count_str.parse::<usize>().unwrap_or(256).min(10000)
                                };
                                let start_pc = vm.pc;
                                vm.halted = false;
                                let mut steps = 0usize;
                                while steps < max_steps && !vm.halted {
                                    vm.step();
                                    steps += 1;
                                }
                                let msg = if vm.halted {
                                    format!("ran {} steps (PC {:04X}→halted)", steps, start_pc)
                                } else {
                                    format!(
                                        "ran {} steps (PC {:04X}→{:04X})",
                                        steps, start_pc, vm.pc
                                    )
                                };
                                let mut snap = [0u32; 32];
                                snap.copy_from_slice(&vm.regs[..32]);
                                repl_history.push((format!("! {}", max_steps), snap, Some(msg)));
                            } else {
                                // Expand @bookmark references before assembling
                                let mut expanded = src.clone();
                                for (name, addr) in &repl_bookmarks {
                                    let tag = format!("@{}", name);
                                    if expanded.contains(&tag) {
                                        expanded =
                                            expanded.replace(&tag, &format!("0x{:04X}", addr));
                                    }
                                }
                                match assembler::assemble(&expanded) {
                                    Ok(asm_result) => {
                                        // Write bytecode into RAM at current write address
                                        let instr_len = asm_result.pixels.len();
                                        for (i, &pixel) in asm_result.pixels.iter().enumerate() {
                                            let addr = repl_write_addr + i;
                                            if addr < vm.ram.len() {
                                                vm.ram[addr] = pixel;
                                            }
                                        }
                                        // Point PC at just-written instruction and step
                                        vm.pc = repl_write_addr as u32;
                                        vm.halted = false;
                                        vm.step();
                                        repl_write_addr += instr_len;
                                        // Snapshot register state
                                        let mut snap = [0u32; 32];
                                        snap.copy_from_slice(&vm.regs[..32]);
                                        repl_history.push((src, snap, None));
                                    }
                                    Err(e) => {
                                        let err_msg = format!("ERR: {}", e.message);
                                        repl_history.push((src, [0u32; 32], Some(err_msg)));
                                    }
                                }
                            } // close else (non-? path)
                            repl_input.clear();
                            needs_redraw = true;
                        }
                    }
                    Key::F6 => {
                        // F6 again exits REPL mode
                        repl_mode = false;
                        needs_redraw = true;
                    }
                    Key::R
                        if window.is_key_down(Key::LeftCtrl)
                            || window.is_key_down(Key::RightCtrl) =>
                    {
                        // Ctrl+R: zero all registers (fresh register state)
                        vm.regs = [0u32; 32];
                        repl_history.push((
                            "[Ctrl+R: registers cleared]".to_string(),
                            [0u32; 32],
                            None,
                        ));
                        needs_redraw = true;
                    }
                    Key::N
                        if window.is_key_down(Key::LeftCtrl)
                            || window.is_key_down(Key::RightCtrl) =>
                    {
                        // Ctrl+N: new session (wipe RAM + registers + bookmarks)
                        let ram_len = vm.ram.len();
                        for v in vm.ram[..MICRO_ASM_ADDR.min(ram_len)].iter_mut() {
                            *v = 0;
                        }
                        repl_write_addr = 0;
                        vm.regs = [0u32; 32];
                        vm.pc = 0;
                        vm.halted = false;
                        repl_bookmarks.clear();
                        repl_history.push(("[Ctrl+N: new session]".to_string(), [0u32; 32], None));
                        needs_redraw = true;
                    }
                    _ => {
                        if let Some(ch) = key_to_ascii_shifted(key, shift) {
                            if repl_input.len() < 60 {
                                repl_input.push(ch as char);
                                needs_redraw = true;
                            }
                        }
                    }
                }
                continue; // consume key
            }

            // Painting mode: only when VM is idle (prevents program corruption)
            if !is_running {
                if hex_mode {
                    // Two-keystroke hex compose: first key = high nibble, second = low nibble.
                    // A-F and 0-9 are hex digits; any other key cancels the pending nibble.
                    if let Some(nib) = key_to_hex_digit(key) {
                        if let Some(hi) = hex_nibble.take() {
                            // Second digit: commit the byte
                            let byte = (hi << 4) | nib;
                            let idx = cursor_row * CANVAS_COLS + cursor_col;
                            vm.ram[idx] = byte as u32;
                            cursor_col += 1;
                            if cursor_col >= CANVAS_COLS {
                                cursor_col = 0;
                                cursor_row += 1;
                                if cursor_row >= CANVAS_ROWS {
                                    cursor_row = 0;
                                }
                            }
                        } else {
                            // First digit: store high nibble, wait
                            hex_nibble = Some(nib);
                        }
                        needs_redraw = true;
                    } else if key == Key::Escape {
                        hex_nibble = None;
                        needs_redraw = true;
                    }
                    // Don't fall through to normal painting in hex mode
                } else if let Some(ch) = key_to_pixel(key, false) {
                    // Normal mode: keystroke = ASCII byte
                    let idx = cursor_row * CANVAS_COLS + cursor_col;
                    vm.ram[idx] = ch as u32;
                    cursor_col += 1;
                    if cursor_col >= CANVAS_COLS {
                        cursor_col = 0;
                        cursor_row += 1;
                        if cursor_row >= CANVAS_ROWS {
                            cursor_row = 0;
                        }
                    }
                    needs_redraw = true;
                }
            }

            // ASM mode input: intercept all typing keys
            if asm_mode {
                let ctrl = window.is_key_down(Key::LeftCtrl) || window.is_key_down(Key::RightCtrl);
                match key {
                    Key::V if ctrl => {
                        if let Some(text) = read_clipboard() {
                            let trimmed = text.trim_end_matches('\n');
                            if trimmed.contains('\n') {
                                // Multi-line: assemble the whole program and commit at cursor
                                match assembler::assemble(trimmed) {
                                    Ok(asm_result) => {
                                        let start = cursor_row * CANVAS_COLS + cursor_col;
                                        for (i, &pixel) in asm_result.pixels.iter().enumerate() {
                                            let addr = start + i;
                                            if addr < vm.ram.len() {
                                                vm.ram[addr] = pixel;
                                            }
                                        }
                                        let advance = asm_result.pixels.len();
                                        cursor_col += advance;
                                        while cursor_col >= CANVAS_COLS {
                                            cursor_col -= CANVAS_COLS;
                                            cursor_row += 1;
                                            if cursor_row >= CANVAS_ROWS {
                                                cursor_row = 0;
                                            }
                                        }
                                        asm_mode = false;
                                        asm_input = format!("[OK: {} bytes]", advance);
                                    }
                                    Err(e) => {
                                        asm_input = format!("[ERR: {}]", e.message);
                                    }
                                }
                            } else {
                                // Single line: append printable chars to asm_input
                                for ch in trimmed.chars() {
                                    if (ch.is_ascii_graphic() || ch == ' ') && asm_input.len() < 60
                                    {
                                        asm_input.push(ch);
                                    }
                                }
                            }
                        }
                        needs_redraw = true;
                    }
                    Key::Enter => {
                        // Assemble and commit to RAM at cursor
                        if !asm_input.is_empty() {
                            match assembler::assemble(&asm_input) {
                                Ok(asm_result) => {
                                    let start = cursor_row * CANVAS_COLS + cursor_col;
                                    for (i, &pixel) in asm_result.pixels.iter().enumerate() {
                                        let addr = start + i;
                                        if addr < vm.ram.len() {
                                            vm.ram[addr] = pixel;
                                        }
                                    }
                                    // Advance cursor by instruction width
                                    let advance = asm_result.pixels.len();
                                    cursor_col += advance;
                                    while cursor_col >= CANVAS_COLS {
                                        cursor_col -= CANVAS_COLS;
                                        cursor_row += 1;
                                        if cursor_row >= CANVAS_ROWS {
                                            cursor_row = 0;
                                        }
                                    }
                                    asm_input.clear();
                                }
                                Err(_e) => {
                                    // Show error briefly - for now just don't commit
                                    // Could flash the input red
                                }
                            }
                        }
                        needs_redraw = true;
                    }
                    Key::Escape => {
                        asm_mode = false;
                        asm_input.clear();
                        needs_redraw = true;
                    }
                    Key::Backspace => {
                        asm_input.pop();
                        needs_redraw = true;
                    }
                    _ => {
                        if let Some(ch) = key_to_ascii(key) {
                            if asm_input.len() < 60 {
                                asm_input.push(ch as char);
                                needs_redraw = true;
                            }
                        }
                    }
                }
            } else {
                match key {
                    Key::Tab => {
                        hex_mode = !hex_mode;
                        hex_nibble = None; // cancel any pending nibble on mode switch
                        needs_redraw = true;
                    }
                    Key::F2 => {
                        panel_view = match panel_view {
                            PanelView::Disassembly => PanelView::Spreadsheet,
                            PanelView::Spreadsheet => PanelView::Disassembly,
                        };
                        needs_redraw = true;
                    }
                    Key::Backquote => {
                        asm_mode = true;
                        asm_input.clear();
                        needs_redraw = true;
                    }
                    Key::F9 => {
                        editor_mode = true;
                        // Pre-populate editor with current program disassembly as comments
                        // so the screen isn't blank on first open.
                        if editor_lines.iter().all(|l| l.is_empty()) {
                            editor_lines = vec![
                                String::from("; Geometry OS inline assembler"),
                                String::from(
                                    "; F8: assemble + load   Escape: cancel   Ctrl+V: paste",
                                ),
                                String::new(),
                            ];
                            editor_cursor_line = 2;
                            editor_cursor_col = 0;
                        }
                        needs_redraw = true;
                    }
                    Key::Space => {
                        // Single-step: execute one instruction while paused
                        if !is_running && !vm.halted {
                            vm.step();
                            single_stepping = true;
                            needs_redraw = true;
                        }
                    }
                    Key::F5 => {
                        // Toggle execution mode
                        if !is_running {
                            if vm.halted {
                                vm.pc = 0;
                                vm.halted = false;
                            }
                            is_running = true;
                        } else {
                            is_running = false;
                        }
                        needs_redraw = true;
                    }
                    Key::F6 => {
                        // Enter REPL mode: pixel REPL for live instruction execution
                        repl_mode = true;
                        repl_input.clear();
                        // Fresh REPL session: wipe canvas RAM, preserve micro-asm
                        let ram_len = vm.ram.len();
                        for v in vm.ram[..MICRO_ASM_ADDR.min(ram_len)].iter_mut() {
                            *v = 0;
                        }
                        repl_write_addr = 0;
                        repl_history.clear();
                        vm.pc = 0;
                        vm.halted = false;
                        // Don't reset registers — let user bring state in
                        is_running = false;
                        needs_redraw = true;
                    }
                    Key::F7 => {
                        // Save to programs/save.rts
                        let mut data = Vec::new();
                        for &p in &vm.ram {
                            data.extend_from_slice(&p.to_le_bytes());
                        }
                        let _ = std::fs::write("programs/save.rts", data);
                    }
                    Key::F8 => {
                        // Assemble programs/boot.asm and load to RAM
                        match std::fs::read_to_string("programs/boot.asm") {
                            Ok(src) => match assembler::assemble(&src) {
                                Ok(asm_result) => {
                                    for v in vm.ram.iter_mut() {
                                        *v = 0;
                                    }
                                    for (i, &pixel) in asm_result.pixels.iter().enumerate() {
                                        if i < vm.ram.len() {
                                            vm.ram[i] = pixel;
                                        }
                                    }
                                    vm.pc = 0;
                                    vm.halted = false;
                                    is_running = false;
                                    child_vms.clear();
                                    cursor_col = 0;
                                    cursor_row = 0;
                                }
                                Err(e) => {
                                    eprintln!("[F8 ASM ERROR] line {}: {}", e.line, e.message);
                                }
                            },
                            Err(e) => {
                                eprintln!("[F8] could not read programs/boot.asm: {}", e);
                            }
                        }
                        needs_redraw = true;
                    }
                    Key::Backspace => {
                        if cursor_col > 0 {
                            cursor_col -= 1;
                        } else if cursor_row > 0 {
                            cursor_row -= 1;
                            cursor_col = CANVAS_COLS - 1;
                        }
                        vm.ram[cursor_row * CANVAS_COLS + cursor_col] = 0;
                        needs_redraw = true;
                    }
                    Key::Left => {
                        if cursor_col > 0 {
                            cursor_col -= 1;
                        }
                        needs_redraw = true;
                    }
                    Key::Right => {
                        if cursor_col < CANVAS_COLS - 1 {
                            cursor_col += 1;
                        }
                        needs_redraw = true;
                    }
                    Key::Up => {
                        if cursor_row > 0 {
                            cursor_row -= 1;
                        }
                        needs_redraw = true;
                    }
                    Key::Down => {
                        if cursor_row < CANVAS_ROWS - 1 {
                            cursor_row += 1;
                        }
                        needs_redraw = true;
                    }
                    _ => {}
                }
            } // end else (non-asm mode)
        }

        // ── Runtime Execution & Input ────────────────────────────────
        if is_running && !vm.halted {
            // Check for input keys to send to Port 1023
            let input_keys = window.get_keys_pressed(KeyRepeat::No);
            for k in input_keys {
                if let Some(ch) = key_to_ascii(k) {
                    // Write to keyboard port (RAM[KEY_PORT]) for VM programs
                    vm.ram[KEY_PORT] = ch as u32;

                    // Render the character on the VM screen directly
                    font::render_char(
                        &mut vm.screen,
                        256,
                        256,
                        ch,
                        text_x,
                        text_y,
                        TEXT_SCALE,
                        0xFFFFFF,       // white text
                        Some(0x0A0A1E), // dark background per char
                    );
                    text_x += TEXT_COL_ADVANCE;
                    if text_x > TEXT_MAX_X {
                        text_x = 0;
                        text_y += TEXT_ROW_ADVANCE;
                        if text_y > TEXT_MAX_Y {
                            // Scroll up: shift screen by one row
                            let shift = TEXT_ROW_ADVANCE * 256;
                            vm.screen.copy_within(shift..256 * 256, 0);
                            // Clear bottom row
                            for i in (256 * 256 - shift)..(256 * 256) {
                                vm.screen[i] = 0;
                            }
                            text_y = TEXT_MAX_Y;
                        }
                    }
                }
            }

            // ── Update mouse registers from host ─────────────────────
            if let Some((mx, my)) = window.get_mouse_pos(minifb::MouseMode::Clamp) {
                // Map window pixel coords to 256x256 screen coords
                // The VM screen area starts at VM_SCREEN_X (640), VM_SCREEN_Y (64)
                let sx = (mx as i32 - VM_SCREEN_X as i32).max(0).min(255) as u32;
                let sy = (my as i32 - VM_SCREEN_Y as i32).max(0).min(255) as u32;
                vm.mouse_x = sx;
                vm.mouse_y = sy;
            }
            let mut btns = 0u32;
            if window.get_mouse_down(minifb::MouseButton::Left) {
                btns |= 1;
            }
            if window.get_mouse_down(minifb::MouseButton::Right) {
                btns |= 2;
            }
            if window.get_mouse_down(minifb::MouseButton::Middle) {
                btns |= 4;
            }
            vm.mouse_buttons = btns;

            // Run a burst of cycles for this frame
            cycles_last_run = vm.run();

            // ── Forge Bridge ─────────────────────────────────────────
            let issues = vm.forge.drain();
            for issue in issues {
                println!(
                    "[FORGE ISSUE #{} (PC:{})] Tag: 0x{:08X} Payload: 0x{:08X} Priority: {:?}",
                    issue.id, issue.origin_pc, issue.tag, issue.payload, issue.priority
                );
            }

            // ── Child VM Bridge (Sprite System) ──────────────────────────
            let new_children = vm.drain_children();
            for child_req in &new_children {
                let child = vm.spawn_child(child_req);
                child_vms.push(child);
                println!(
                    "[SPAWN] New sprite at ({}, {}) size {}x{} → PC={}  ({} sprites total)",
                    child_req.x,
                    child_req.y,
                    if child_req.w == 0 { 256 } else { child_req.w },
                    if child_req.h == 0 { 256 } else { child_req.h },
                    child_req.start_addr,
                    child_vms.len()
                );
            }

            // Auto-update: run each sprite for a limited number of cycles per frame
            const SPRITE_CYCLE_BUDGET: u32 = 100;
            for child in &mut child_vms {
                if !child.is_halted() {
                    child.run_with_limit(SPRITE_CYCLE_BUDGET);
                }
            }

            // Composite sprites onto parent screen (positional blitting)
            for child_vm in &child_vms {
                if !child_vm.is_halted() {
                    // For now, find the ChildVm metadata that matches.
                    // We store sprite info at spawn time; since child_vms are 1:1
                    // with the spawn order, we can check screen content directly.
                    // Use full-screen composite for legacy SPAWN, positional for SPATIAL_SPAWN.
                    vm.composite_screen(child_vm);
                }
            }

            // Remove halted children
            child_vms.retain(|c| !c.is_halted());

            if vm.halted {
                is_running = false;
            }
            needs_redraw = true;
        }

        // ── Render ───────────────────────────────────────────────────
        if needs_redraw {
            buffer.fill(BG);

            // ── Code editor overlay (F9) ─────────────────────────────
            if editor_mode {
                // Dark overlay
                for px in buffer.iter_mut() {
                    *px = 0x03030A;
                }

                // Header
                let ed_hdr = if micro_asm_loaded {
                    "EDITOR  F8:asm+load  F5:VM-asm+run  Ctrl+V:paste  Ctrl+L:load  Esc:cancel"
                } else {
                    "EDITOR  F8:assemble+load   Ctrl+V:paste   Esc:cancel"
                };
                font::render_str(&mut buffer, WIDTH, HEIGHT, ed_hdr, 8, 4, 1, 0x00FFBB, None);

                // Line count info
                let info = format!(
                    "Line {}/{}  Col {}",
                    editor_cursor_line + 1,
                    editor_lines.len(),
                    editor_cursor_col + 1
                );
                font::render_str(
                    &mut buffer,
                    WIDTH,
                    HEIGHT,
                    &info,
                    WIDTH - 200,
                    4,
                    1,
                    0x888899,
                    None,
                );

                // Code lines
                let line_h = 11;
                let gutter_w = 36; // space for 3-digit line number + gap
                let code_x = 8 + gutter_w;
                let first_y = 18;

                for vis_idx in 0..EDITOR_VISIBLE_LINES {
                    let abs_line = editor_scroll + vis_idx;
                    if abs_line >= editor_lines.len() {
                        break;
                    }

                    let y = first_y + vis_idx * line_h;
                    let is_current = abs_line == editor_cursor_line;

                    // Highlight current line background
                    if is_current {
                        for dy in 0..line_h {
                            for dx in 0..(WIDTH - 16) {
                                let idx = (y + dy) * WIDTH + 8 + dx;
                                if idx < buffer.len() {
                                    buffer[idx] = 0x0A0A1E;
                                }
                            }
                        }
                    }

                    // Gutter: line number
                    let num_str = format!("{:3}", abs_line + 1);
                    let num_color = if is_current { 0x555577 } else { 0x333344 };
                    font::render_str(
                        &mut buffer,
                        WIDTH,
                        HEIGHT,
                        &num_str,
                        8,
                        y,
                        1,
                        num_color,
                        None,
                    );

                    // Code text
                    let line = &editor_lines[abs_line];
                    let text_color = if line.trim_start().starts_with(';') {
                        0x447744 // comments: green
                    } else if is_current {
                        0xFFFFFF
                    } else {
                        0xCCCCDD
                    };
                    font::render_str(
                        &mut buffer,
                        WIDTH,
                        HEIGHT,
                        line,
                        code_x,
                        y,
                        1,
                        text_color,
                        None,
                    );

                    // Cursor
                    if is_current && cursor_visible {
                        let cx = code_x + editor_cursor_col * 6;
                        if cx + 1 < WIDTH {
                            for dy in 0..line_h {
                                let idx = (y + dy) * WIDTH + cx;
                                if idx < buffer.len() {
                                    buffer[idx] = 0x00FFFF;
                                }
                            }
                        }
                    }
                }

                // Scroll indicator
                if editor_lines.len() > EDITOR_VISIBLE_LINES {
                    let bar_h = HEIGHT - 24;
                    let thumb_frac = editor_scroll as f32
                        / (editor_lines.len() - EDITOR_VISIBLE_LINES).max(1) as f32;
                    let thumb_y = 18 + (thumb_frac * bar_h as f32) as usize;
                    for dy in 0..4 {
                        let idx = (thumb_y + dy).min(HEIGHT - 1) * WIDTH + WIDTH - 4;
                        if idx < buffer.len() {
                            buffer[idx] = 0x444466;
                        }
                    }
                }

                window.update_with_buffer(&buffer, WIDTH, HEIGHT).unwrap();
                needs_redraw = false;
                continue;
            }

            // ── REPL overlay ─────────────────────────────────────────
            if repl_mode {
                // Dark background
                for px in buffer.iter_mut() {
                    *px = 0x02020A;
                }

                // Header
                let repl_hdr = format!(
                    "PIXEL REPL  addr:{:04X}  PC:{:04X}  Enter:exec  !N:run  ?:inspect  ??:dump  @name:bookmark  F6:exit",
                    repl_write_addr, vm.pc
                );
                font::render_str(
                    &mut buffer,
                    WIDTH,
                    HEIGHT,
                    &repl_hdr,
                    8,
                    4,
                    1,
                    0xFF8800,
                    None,
                );

                // Register display — two columns of 16
                let reg_panel_x = WIDTH - 340;
                let reg_panel_y = 18;
                font::render_str(
                    &mut buffer,
                    WIDTH,
                    HEIGHT,
                    "REGISTERS",
                    reg_panel_x,
                    reg_panel_y - 12,
                    1,
                    0x555566,
                    None,
                );
                for i in 0..16 {
                    let v0 = vm.regs[i];
                    let v1 = vm.regs[i + 16];
                    let s0 = format!("r{:02}:{:08X}", i, v0);
                    let s1 = format!("r{:02}:{:08X}", i + 16, v1);
                    let c0 = if v0 != 0 { 0x00FF88 } else { 0x444455 };
                    let c1 = if v1 != 0 { 0x00FF88 } else { 0x444455 };
                    font::render_str(
                        &mut buffer,
                        WIDTH,
                        HEIGHT,
                        &s0,
                        reg_panel_x,
                        reg_panel_y + i * 12,
                        1,
                        c0,
                        None,
                    );
                    font::render_str(
                        &mut buffer,
                        WIDTH,
                        HEIGHT,
                        &s1,
                        reg_panel_x + 170,
                        reg_panel_y + i * 12,
                        1,
                        c1,
                        None,
                    );
                }

                // Canvas — still visible on left (shows bytecode appearing in RAM)
                for row in 0..CANVAS_ROWS {
                    for col in 0..CANVAS_COLS {
                        let idx = row * CANVAS_COLS + col;
                        let val = vm.ram[idx];
                        let x0 = CANVAS_X + col * (CANVAS_SCALE / 2); // half-size in REPL
                        let y0 = 220 + row * (CANVAS_SCALE / 2);
                        let scale = CANVAS_SCALE / 2;
                        let is_repl_pc = idx == repl_write_addr;
                        let cell_color = if val != 0 {
                            palette_color(val)
                        } else {
                            0x080810
                        };
                        for dy in 0..scale {
                            for dx in 0..scale {
                                let px = x0 + dx;
                                let py = y0 + dy;
                                if px < WIDTH && py < HEIGHT {
                                    let color = if is_repl_pc && (dx == 0 || dy == 0) {
                                        0xFF8800
                                    } else {
                                        cell_color
                                    };
                                    buffer[py * WIDTH + px] = color;
                                }
                            }
                        }
                    }
                }
                font::render_str(
                    &mut buffer,
                    WIDTH,
                    HEIGHT,
                    "RAM (bytecode)",
                    CANVAS_X,
                    208,
                    1,
                    0x333344,
                    None,
                );

                // History — most recent at bottom, scrollable in spirit
                let hist_x = 8;
                let hist_bottom_y = 210;
                let line_h = 11;
                let max_hist_lines = 17;
                let start = if repl_history.len() > max_hist_lines {
                    repl_history.len() - max_hist_lines
                } else {
                    0
                };
                for (i, (src, snap, err)) in repl_history[start..].iter().enumerate() {
                    let y = hist_bottom_y - (repl_history[start..].len() - 1 - i) * line_h;
                    if let Some(e) = err {
                        let line = format!("> {} → {}", src, e);
                        // Cyan for ?, green for !, gold for @, red for actual errors
                        let color = if src.starts_with("??") || src.starts_with('?') {
                            0x44DDFF
                        } else if src.starts_with('!') {
                            0x44FF88
                        } else if src.starts_with('@') {
                            0xFFCC44
                        } else {
                            0xFF4444
                        };
                        font::render_str(
                            &mut buffer,
                            WIDTH,
                            HEIGHT,
                            &line,
                            hist_x,
                            y,
                            1,
                            color,
                            None,
                        );
                    } else {
                        // Show instruction + changed registers
                        let prev_snap: Option<&[u32; 32]> = if start + i > 0 {
                            Some(&repl_history[start + i - 1].1)
                        } else {
                            None
                        };
                        let changed: Vec<String> = snap
                            .iter()
                            .enumerate()
                            .filter(|(ri, v)| {
                                **v != 0 || prev_snap.map_or(false, |p| p[*ri] != **v)
                            })
                            .take(4)
                            .map(|(ri, v)| format!("r{}={:X}", ri, v))
                            .collect();
                        let reg_summary = if changed.is_empty() {
                            String::new()
                        } else {
                            format!(" → {}", changed.join("  "))
                        };
                        let line = format!("> {}{}", src, reg_summary);
                        font::render_str(
                            &mut buffer,
                            WIDTH,
                            HEIGHT,
                            &line,
                            hist_x,
                            y,
                            1,
                            0xCCCCDD,
                            None,
                        );
                    }
                }

                // Input prompt
                let prompt_y = 220;
                // Draw prompt background
                for dy in 0..13 {
                    for dx in 0..(WIDTH / 2 - 16) {
                        let idx = (prompt_y + dy) * WIDTH + 8 + dx;
                        if idx < buffer.len() {
                            buffer[idx] = 0x0A0A20;
                        }
                    }
                }
                let prompt = format!("REPL> {}", repl_input);
                font::render_str(
                    &mut buffer,
                    WIDTH,
                    HEIGHT,
                    &prompt,
                    8,
                    prompt_y + 2,
                    1,
                    0xFFFFFF,
                    None,
                );
                // Cursor
                if cursor_visible {
                    let cx = 8 + (prompt.len()) * 6;
                    for dy in 0..9 {
                        let idx = (prompt_y + 2 + dy) * WIDTH + cx;
                        if idx < buffer.len() {
                            buffer[idx] = 0xFF8800;
                        }
                    }
                }
                // Live preview (with @bookmark expansion)
                if !repl_input.is_empty() {
                    let mut preview_src = repl_input.clone();
                    for (name, addr) in &repl_bookmarks {
                        let tag = format!("@{}", name);
                        if preview_src.contains(&tag) {
                            preview_src = preview_src.replace(&tag, &format!("0x{:04X}", addr));
                        }
                    }
                    match assembler::assemble(&preview_src) {
                        Ok(r) => {
                            let preview: Vec<String> = r
                                .pixels
                                .iter()
                                .map(|p| format!("{:02X}", p & 0xFF))
                                .collect();
                            let pstr = format!(
                                "bytes: {} @ addr {:04X}",
                                preview.join(" "),
                                repl_write_addr
                            );
                            font::render_str(
                                &mut buffer,
                                WIDTH,
                                HEIGHT,
                                &pstr,
                                8,
                                prompt_y + 13,
                                1,
                                0x44FF88,
                                None,
                            );
                        }
                        Err(e) => {
                            font::render_str(
                                &mut buffer,
                                WIDTH,
                                HEIGHT,
                                &format!("ERR: {}", e.message),
                                8,
                                prompt_y + 13,
                                1,
                                0xFF4444,
                                None,
                            );
                        }
                    }
                }

                window.update_with_buffer(&buffer, WIDTH, HEIGHT).unwrap();
                needs_redraw = false;
                continue;
            }

            // Status
            let status = if vm.halted {
                "HALTED"
            } else if is_running {
                "RUNNING"
            } else if single_stepping {
                "STEPPING"
            } else {
                "IDLE"
            };
            let asm_tag = if micro_asm_loaded {
                "uASM:OK"
            } else {
                "uASM:--"
            };
            let key_val = vm.ram[KEY_PORT];
            let key_str = if key_val > 0 {
                format!("KEY:{:02X}", key_val)
            } else {
                "KEY:--".into()
            };
            let header = format!(
                "PC:{:04} | {} | {} | {} | Cyc:{} | F5:run Spc:step F6:REPL F8:asm F9:edit",
                vm.pc, status, asm_tag, key_str, cycles_last_run
            );
            font::render_str(
                &mut buffer,
                WIDTH,
                HEIGHT,
                &header,
                16,
                16,
                2,
                0x00FFBB,
                None,
            );

            // Labels
            font::render_str(
                &mut buffer,
                WIDTH,
                HEIGHT,
                "PIXEL RAM (PROGRAM)",
                CANVAS_X,
                CANVAS_Y - 20,
                1,
                0x555566,
                None,
            );
            font::render_str(
                &mut buffer,
                WIDTH,
                HEIGHT,
                "VM SCREEN",
                VM_SCREEN_X,
                VM_SCREEN_Y - 20,
                1,
                0x555566,
                None,
            );
            font::render_str(
                &mut buffer,
                WIDTH,
                HEIGHT,
                "REGISTERS",
                REGS_X,
                REGS_Y - 20,
                1,
                0x555566,
                None,
            );

            // Canvas (VM RAM)
            for row in 0..CANVAS_ROWS {
                for col in 0..CANVAS_COLS {
                    let idx = row * CANVAS_COLS + col;
                    let val = vm.ram[idx];
                    let x0 = CANVAS_X + col * CANVAS_SCALE;
                    let y0 = CANVAS_Y + row * CANVAS_SCALE;
                    let is_cursor = col == cursor_col && row == cursor_row;
                    let is_pc = idx == (vm.pc as usize);

                    // If this is the cursor cell and a hex nibble is pending,
                    // show the partial value as an orange tint so the user sees
                    // "I've typed the high nibble, waiting for the low."
                    let pending_here = is_cursor && hex_nibble.is_some();
                    let cell_color = if pending_here {
                        0xFF6600 // orange: pending high nibble
                    } else if val != 0 {
                        palette_color(val)
                    } else {
                        GRID_BG
                    };

                    for dy in 0..CANVAS_SCALE {
                        for dx in 0..CANVAS_SCALE {
                            let px = x0 + dx;
                            let py = y0 + dy;
                            let is_border = dx == CANVAS_SCALE - 1 || dy == CANVAS_SCALE - 1;
                            let is_highlight = is_cursor || is_pc;

                            let mut color = if is_border { GRID_LINE } else { cell_color };
                            if is_highlight
                                && (dx == 0
                                    || dy == 0
                                    || dx == CANVAS_SCALE - 1
                                    || dy == CANVAS_SCALE - 1)
                            {
                                color = if is_pc {
                                    0xFF00FF
                                } else if pending_here {
                                    0xFF6600
                                } else {
                                    CURSOR_COL
                                };
                            }
                            buffer[py * WIDTH + px] = color;
                        }
                    }
                    // Draw the pending nibble digit in the cell
                    if pending_here {
                        if let Some(hi) = hex_nibble {
                            let ch = if hi < 10 { b'0' + hi } else { b'A' + hi - 10 };
                            font::render_char(
                                &mut buffer,
                                WIDTH,
                                HEIGHT,
                                ch,
                                x0 + 4,
                                y0 + 4,
                                1,
                                0xFFFFFF,
                                None,
                            );
                        }
                    } else if val != 0 && val < 128 {
                        font::render_char(
                            &mut buffer,
                            WIDTH,
                            HEIGHT,
                            val as u8,
                            x0 + 4,
                            y0 + 4,
                            1,
                            0x000000,
                            None,
                        );
                    }
                }
            }

            // ── Live Decode Panel ───────────────────────────────────────
            // Show the instruction being composed at the cursor position.
            // This is the key UX bridge: painting becomes programming
            // because you SEE what your pixels MEAN as you type them.
            let cursor_addr = cursor_row * CANVAS_COLS + cursor_col;
            if !is_running && !asm_mode && !repl_mode && !editor_mode {
                if let Some(decode) = live_decode_at(&vm.ram, cursor_addr) {
                    let decode_y = CANVAS_Y + CANVAS_ROWS * CANVAS_SCALE + 4;

                    // Background bar for the live decode
                    for dy in 0..24 {
                        for dx in 0..550 {
                            let px = CANVAS_X + dx;
                            let py = decode_y + dy;
                            if px < WIDTH && py < HEIGHT {
                                buffer[py * WIDTH + px] = 0x0A0A1E;
                            }
                        }
                    }

                    // Instruction address
                    let addr_str = format!("{:03}:", decode.start);
                    font::render_str(
                        &mut buffer,
                        WIDTH,
                        HEIGHT,
                        &addr_str,
                        CANVAS_X + 4,
                        decode_y + 3,
                        1,
                        0x555566,
                        None,
                    );

                    // Decoded text — bright white for complete, orange for partial
                    let decode_color = if decode.is_complete {
                        0x44FF88
                    } else {
                        0xFF8844
                    };
                    font::render_str(
                        &mut buffer,
                        WIDTH,
                        HEIGHT,
                        &decode.text,
                        CANVAS_X + 40,
                        decode_y + 3,
                        1,
                        decode_color,
                        None,
                    );

                    // Hint — what to type next
                    let hint_color = if decode.is_complete {
                        0x44FF88
                    } else {
                        0xFFCC44
                    };
                    font::render_str(
                        &mut buffer,
                        WIDTH,
                        HEIGHT,
                        &decode.hint,
                        CANVAS_X + 250,
                        decode_y + 3,
                        1,
                        hint_color,
                        None,
                    );

                    // Cell-level highlighting on the canvas:
                    // dim the instruction's cells slightly to show they belong together
                    for cell in &decode.cells {
                        let cell_col = cell.addr % CANVAS_COLS;
                        let cell_row = cell.addr / CANVAS_COLS;
                        let cx = CANVAS_X + cell_col * CANVAS_SCALE;
                        let cy = CANVAS_Y + cell_row * CANVAS_SCALE;

                        // Draw a small marker at bottom of cell
                        let marker_color = match cell.role {
                            CellRole::Opcode => 0xFFFFFF,
                            CellRole::ArgFilled => 0x44FF88,
                            CellRole::ArgPending => 0xFF4444,
                        };
                        // 2px tall bar at bottom of the cell
                        for dx in 2..(CANVAS_SCALE - 2) {
                            let px = cx + dx;
                            let py = cy + CANVAS_SCALE - 3;
                            if px < WIDTH && py < HEIGHT {
                                buffer[py * WIDTH + px] = marker_color;
                            }
                        }
                    }
                }
            }

            // VM Screen
            for y in 0..256 {
                for x in 0..256 {
                    let color = vm.screen[y * 256 + x];
                    let px = VM_SCREEN_X + x;
                    let py = VM_SCREEN_Y + y;
                    buffer[py * WIDTH + px] = color;
                }
            }
            // Screen border
            for i in 0..258 {
                buffer[(VM_SCREEN_Y - 1) * WIDTH + (VM_SCREEN_X - 1 + i)] = 0x222233;
                buffer[(VM_SCREEN_Y + 256) * WIDTH + (VM_SCREEN_X - 1 + i)] = 0x222233;
                buffer[(VM_SCREEN_Y - 1 + i) * WIDTH + (VM_SCREEN_X - 1)] = 0x222233;
                buffer[(VM_SCREEN_Y - 1 + i) * WIDTH + (VM_SCREEN_X + 256)] = 0x222233;
            }

            // Registers
            for i in 0..16 {
                let val = vm.regs[i];
                let reg_str = format!("r{:02}: {:08X}", i, val);
                font::render_str(
                    &mut buffer,
                    WIDTH,
                    HEIGHT,
                    &reg_str,
                    REGS_X,
                    REGS_Y + i * 14,
                    1,
                    0xAAAAAA,
                    None,
                );
                let val2 = vm.regs[i + 16];
                let reg_str2 = format!("r{:02}: {:08X}", i + 16, val2);
                font::render_str(
                    &mut buffer,
                    WIDTH,
                    HEIGHT,
                    &reg_str2,
                    REGS_X + 160,
                    REGS_Y + i * 14,
                    1,
                    0xAAAAAA,
                    None,
                );
            }

            // -- Bottom Panel (Disassembly, Spreadsheet, or ASM input) --
            {
                let panel_x = CANVAS_X;
                let panel_y = CANVAS_Y + CANVAS_ROWS * CANVAS_SCALE + 16;
                let cursor_idx = cursor_row * CANVAS_COLS + cursor_col;

                if asm_mode {
                    // ASM input mode: show prompt + live preview
                    font::render_str(
                        &mut buffer,
                        WIDTH,
                        HEIGHT,
                        "ASM  [Esc=CANCEL]",
                        panel_x,
                        panel_y,
                        1,
                        0xFFAA00,
                        None,
                    );
                    let prompt = format!("ASM> {}", asm_input);
                    font::render_str(
                        &mut buffer,
                        WIDTH,
                        HEIGHT,
                        &prompt,
                        panel_x,
                        panel_y + 12,
                        1,
                        0xFFFFFF,
                        None,
                    );
                    // Cursor blink
                    if cursor_visible {
                        let cx = panel_x + 5 * (asm_input.len() + 5);
                        for dy in 0..7 {
                            buffer[(panel_y + 12 + dy) * WIDTH + cx] = 0x00FFFF;
                        }
                    }
                    // Live byte preview
                    if !asm_input.is_empty() {
                        match assembler::assemble(&asm_input) {
                            Ok(asm_result) => {
                                let preview: Vec<String> = asm_result
                                    .pixels
                                    .iter()
                                    .map(|p| format!("{:02X}", p & 0xFF))
                                    .collect();
                                let preview_str = format!("-> {}", preview.join(" "));
                                font::render_str(
                                    &mut buffer,
                                    WIDTH,
                                    HEIGHT,
                                    &preview_str,
                                    panel_x + 400,
                                    panel_y + 12,
                                    1,
                                    0x44FF44,
                                    None,
                                );
                                let addr_str =
                                    format!("@ addr {}", cursor_row * CANVAS_COLS + cursor_col);
                                font::render_str(
                                    &mut buffer,
                                    WIDTH,
                                    HEIGHT,
                                    &addr_str,
                                    panel_x + 400,
                                    panel_y + 22,
                                    1,
                                    0x888888,
                                    None,
                                );
                            }
                            Err(e) => {
                                font::render_str(
                                    &mut buffer,
                                    WIDTH,
                                    HEIGHT,
                                    &format!("ERR: {}", e.message),
                                    panel_x + 400,
                                    panel_y + 12,
                                    1,
                                    0xFF4444,
                                    None,
                                );
                            }
                        }
                    }
                } else {
                    let mode_str_owned: String = if hex_mode {
                        if let Some(hi) = hex_nibble {
                            format!("[HEX: {:X}_  type low nibble  Esc=cancel]", hi)
                        } else {
                            "[HEX: type 2 hex digits (0-9 A-F) per cell  Tab=exit]".to_string()
                        }
                    } else {
                        "[Tab=HEX full-byte mode]".to_string()
                    };
                    let mode_str = mode_str_owned.as_str();
                    match panel_view {
                        PanelView::Disassembly => {
                            font::render_str(
                                &mut buffer,
                                WIDTH,
                                HEIGHT,
                                "DISASSEMBLY  [F2:SPREADSHEET]  [`:ASM]",
                                panel_x,
                                panel_y,
                                1,
                                0x555566,
                                None,
                            );
                            font::render_str(
                                &mut buffer,
                                WIDTH,
                                HEIGHT,
                                mode_str,
                                panel_x + 250,
                                panel_y,
                                1,
                                0x888800,
                                None,
                            );
                            let mut addr: usize = 0;
                            let max_lines = 14;
                            let mut lines_shown = 0;
                            while addr < vm.ram.len() && lines_shown < max_lines {
                                let val = vm.ram[addr];
                                let byte = (val & 0xFF) as u8;
                                if byte == 0 {
                                    addr += 1;
                                    continue;
                                }
                                let w = opcodes::width(byte);
                                let name = opcodes::name(byte);
                                let is_at_cursor = addr == cursor_idx;
                                let mut disasm = format!("{:03}: {}", addr, name);
                                for a in 1..w {
                                    if addr + a < vm.ram.len() {
                                        let arg_byte = (vm.ram[addr + a] & 0xFF) as u8;
                                        if arg_byte >= 0x30 && arg_byte <= 0x39 {
                                            disasm.push_str(&format!(" r{}", arg_byte - 0x30));
                                        } else {
                                            disasm.push_str(&format!(" {:02X}", arg_byte));
                                        }
                                    }
                                }
                                let color = if is_at_cursor {
                                    0x00FFFF
                                } else if opcodes::is_valid(byte) {
                                    0xAAAACC
                                } else {
                                    0x664444
                                };
                                font::render_str(
                                    &mut buffer,
                                    WIDTH,
                                    HEIGHT,
                                    &disasm,
                                    panel_x,
                                    panel_y + 10 + lines_shown * 9,
                                    1,
                                    color,
                                    None,
                                );
                                lines_shown += 1;
                                addr += w;
                            }
                        }
                        PanelView::Spreadsheet => {
                            let cursor_val = (vm.ram[cursor_idx] & 0xFF) as u8;
                            let cell_name = cell_addr_name(cursor_col, cursor_row);
                            let cell_info = if cursor_val >= 32 && cursor_val < 127 {
                                format!(
                                    "CELL [{}] = 0x{:02X} ({})",
                                    cell_name, cursor_val, cursor_val as char
                                )
                            } else {
                                format!("CELL [{}] = 0x{:02X}", cell_name, cursor_val)
                            };
                            font::render_str(
                                &mut buffer,
                                WIDTH,
                                HEIGHT,
                                "SPREADSHEET  [F2:DISASM]  [`:ASM]",
                                panel_x,
                                panel_y,
                                1,
                                0x555566,
                                None,
                            );
                            font::render_str(
                                &mut buffer,
                                WIDTH,
                                HEIGHT,
                                mode_str,
                                panel_x + 260,
                                panel_y,
                                1,
                                0x888800,
                                None,
                            );
                            font::render_str(
                                &mut buffer,
                                WIDTH,
                                HEIGHT,
                                &cell_info,
                                panel_x,
                                panel_y + 10,
                                1,
                                0x00FFFF,
                                None,
                            );
                            let max_lines = 12;
                            let mut lines_shown = 0;
                            for idx in 0..vm.ram.len() {
                                if lines_shown >= max_lines {
                                    break;
                                }
                                let val = (vm.ram[idx] & 0xFF) as u8;
                                if val == 0 {
                                    continue;
                                }
                                let col = idx % CANVAS_COLS;
                                let row = idx / CANVAS_COLS;
                                let name = cell_addr_name(col, row);
                                let cell_str = if val >= 32 && val < 127 {
                                    format!("{} = 0x{:02X} ({})", name, val, val as char)
                                } else {
                                    format!("{} = 0x{:02X}", name, val)
                                };
                                let is_cursor = idx == cursor_idx;
                                let color = if is_cursor { 0x00FFFF } else { 0xAAAACC };
                                font::render_str(
                                    &mut buffer,
                                    WIDTH,
                                    HEIGHT,
                                    &cell_str,
                                    panel_x,
                                    panel_y + 20 + lines_shown * 9,
                                    1,
                                    color,
                                    None,
                                );
                                lines_shown += 1;
                            }
                        }
                    }
                }
            }

            // Opcode Reference
            let ref_x = REGS_X;
            let ref_y = REGS_Y + 240;
            font::render_str(
                &mut buffer,
                WIDTH,
                HEIGHT,
                "OPCODE REF",
                ref_x,
                ref_y - 20,
                1,
                0x555566,
                None,
            );
            let opcodes_ref = [
                ("I:LDI", b'I'),
                ("A:ADD", b'A'),
                ("U:SUB", b'U'),
                ("J:JMP", b'J'),
                ("B:BRANCH", b'B'),
                ("C:CALL", b'C'),
                ("R:RET", b'R'),
                ("H:HALT", b'H'),
                ("P:PSET", b'P'),
                ("F:RECTF", b'F'),
                ("G:CIRC", b'G'),
                ("L:LOAD", b'L'),
                ("S:STOR", b'S'),
                ("M:MOV", b'M'),
                ("W:BLIT", b'W'),
                ("N:NOP", b'N'),
            ];
            for (i, (name, ch)) in opcodes_ref.iter().enumerate() {
                let ox = ref_x + (i % 4) * 80;
                let oy = ref_y + (i / 4) * 20;
                let color = palette_color(*ch as u32);
                font::render_str(&mut buffer, WIDTH, HEIGHT, name, ox, oy, 1, color, None);
            }

            window.update_with_buffer(&buffer, WIDTH, HEIGHT).unwrap();
            needs_redraw = false;
        } else {
            window.update();
        }
        std::thread::sleep(std::time::Duration::from_millis(16));
    }
}

/// Spreadsheet-style column name: 0->A, 1->B, ..., 25->Z, 26->AA, 27->AB, ..., 31->AF
fn col_name(col: usize) -> String {
    if col < 26 {
        format!("{}", (b'A' + col as u8) as char)
    } else {
        format!("A{}", (b'A' + (col as u8 - 26)) as char)
    }
}

/// Full cell address like "A0", "B3", "AF31"
fn cell_addr_name(col: usize, row: usize) -> String {
    format!("{}{}", col_name(col), row)
}

fn key_to_ascii(key: Key) -> Option<u8> {
    match key {
        Key::A => Some(b'A'),
        Key::B => Some(b'B'),
        Key::C => Some(b'C'),
        Key::D => Some(b'D'),
        Key::E => Some(b'E'),
        Key::F => Some(b'F'),
        Key::G => Some(b'G'),
        Key::H => Some(b'H'),
        Key::I => Some(b'I'),
        Key::J => Some(b'J'),
        Key::K => Some(b'K'),
        Key::L => Some(b'L'),
        Key::M => Some(b'M'),
        Key::N => Some(b'N'),
        Key::O => Some(b'O'),
        Key::P => Some(b'P'),
        Key::Q => Some(b'Q'),
        Key::R => Some(b'R'),
        Key::S => Some(b'S'),
        Key::T => Some(b'T'),
        Key::U => Some(b'U'),
        Key::V => Some(b'V'),
        Key::W => Some(b'W'),
        Key::X => Some(b'X'),
        Key::Y => Some(b'Y'),
        Key::Z => Some(b'Z'),
        Key::Key0 => Some(b'0'),
        Key::Key1 => Some(b'1'),
        Key::Key2 => Some(b'2'),
        Key::Key3 => Some(b'3'),
        Key::Key4 => Some(b'4'),
        Key::Key5 => Some(b'5'),
        Key::Key6 => Some(b'6'),
        Key::Key7 => Some(b'7'),
        Key::Key8 => Some(b'8'),
        Key::Key9 => Some(b'9'),
        Key::Space => Some(b' '),
        Key::Period => Some(b'.'),
        Key::Comma => Some(b','),
        Key::Semicolon => Some(b';'),
        Key::Apostrophe => Some(b'\''),
        Key::Slash => Some(b'/'),
        Key::Backslash => Some(b'\\'),
        Key::LeftBracket => Some(b'['),
        Key::RightBracket => Some(b']'),
        Key::Minus => Some(b'-'),
        Key::Equal => Some(b'='),
        Key::Enter => Some(0x0D),     // carriage return
        Key::Backspace => Some(0x08), // backspace
        Key::Left => Some(0x01),      // custom: left arrow
        Key::Right => Some(0x02),     // custom: right arrow
        Key::Up => Some(0x03),        // custom: up arrow
        Key::Down => Some(0x04),      // custom: down arrow
        _ => None,
    }
}

/// Like key_to_ascii but handles Shift for lowercase/symbols in the editor.
fn key_to_ascii_shifted(key: Key, shift: bool) -> Option<u8> {
    // Letters: shift → uppercase, no shift → lowercase
    let letter = match key {
        Key::A => Some((b'a', b'A')),
        Key::B => Some((b'b', b'B')),
        Key::C => Some((b'c', b'C')),
        Key::D => Some((b'd', b'D')),
        Key::E => Some((b'e', b'E')),
        Key::F => Some((b'f', b'F')),
        Key::G => Some((b'g', b'G')),
        Key::H => Some((b'h', b'H')),
        Key::I => Some((b'i', b'I')),
        Key::J => Some((b'j', b'J')),
        Key::K => Some((b'k', b'K')),
        Key::L => Some((b'l', b'L')),
        Key::M => Some((b'm', b'M')),
        Key::N => Some((b'n', b'N')),
        Key::O => Some((b'o', b'O')),
        Key::P => Some((b'p', b'P')),
        Key::Q => Some((b'q', b'Q')),
        Key::R => Some((b'r', b'R')),
        Key::S => Some((b's', b'S')),
        Key::T => Some((b't', b'T')),
        Key::U => Some((b'u', b'U')),
        Key::V => Some((b'v', b'V')),
        Key::W => Some((b'w', b'W')),
        Key::X => Some((b'x', b'X')),
        Key::Y => Some((b'y', b'Y')),
        Key::Z => Some((b'z', b'Z')),
        _ => None,
    };
    if let Some((lo, hi)) = letter {
        return Some(if shift { hi } else { lo });
    }

    // Numbers and their shifted symbols
    match key {
        Key::Key0 => Some(if shift { b')' } else { b'0' }),
        Key::Key1 => Some(if shift { b'!' } else { b'1' }),
        Key::Key2 => Some(if shift { b'@' } else { b'2' }),
        Key::Key3 => Some(if shift { b'#' } else { b'3' }),
        Key::Key4 => Some(if shift { b'$' } else { b'4' }),
        Key::Key5 => Some(if shift { b'%' } else { b'5' }),
        Key::Key6 => Some(if shift { b'^' } else { b'6' }),
        Key::Key7 => Some(if shift { b'&' } else { b'7' }),
        Key::Key8 => Some(if shift { b'*' } else { b'8' }),
        Key::Key9 => Some(if shift { b'(' } else { b'9' }),
        Key::Space => Some(b' '),
        Key::Period => Some(if shift { b'>' } else { b'.' }),
        Key::Comma => Some(if shift { b'<' } else { b',' }),
        Key::Semicolon => Some(if shift { b':' } else { b';' }),
        Key::Apostrophe => Some(if shift { b'"' } else { b'\'' }),
        Key::Slash => Some(if shift { b'?' } else { b'/' }),
        Key::Backslash => Some(if shift { b'|' } else { b'\\' }),
        Key::LeftBracket => Some(if shift { b'{' } else { b'[' }),
        Key::RightBracket => Some(if shift { b'}' } else { b']' }),
        Key::Minus => Some(if shift { b'_' } else { b'-' }),
        Key::Equal => Some(if shift { b'+' } else { b'=' }),
        _ => None,
    }
}

/// Read text from the system clipboard (Linux: tries xclip then xsel).
fn read_clipboard() -> Option<String> {
    std::process::Command::new("xclip")
        .args(["-selection", "clipboard", "-o"])
        .output()
        .ok()
        .filter(|o| o.status.success())
        .and_then(|o| String::from_utf8(o.stdout).ok())
        .or_else(|| {
            std::process::Command::new("xsel")
                .args(["--clipboard", "--output"])
                .output()
                .ok()
                .filter(|o| o.status.success())
                .and_then(|o| String::from_utf8(o.stdout).ok())
        })
}

/// Convert key to pixel value in normal (non-hex) mode: keystroke = ASCII byte.
fn key_to_pixel(key: Key, _hex_mode: bool) -> Option<u8> {
    key_to_ascii(key)
}

// ── Live instruction decode ──────────────────────────────────────────
// Scans RAM to find the instruction boundary at or before the cursor,
// then decodes whatever's been painted so far (complete or partial).
// Returns (instruction_start_addr, formatted_decode_string, hint_string).

struct LiveDecode {
    start: usize,      // address of the opcode pixel
    text: String,      // decoded text like "LDI r0, 33"
    hint: String,      // what to type next, e.g. "need: reg val" or "complete"
    is_complete: bool, // all arguments filled
    // Byte-level breakdown for cell highlighting
    cells: Vec<DecodedCell>,
}

struct DecodedCell {
    addr: usize,
    role: CellRole,
    text: String, // short label for this cell
}

#[derive(Clone, Copy, PartialEq)]
enum CellRole {
    Opcode,
    ArgFilled,
    ArgPending,
}

fn live_decode_at(ram: &[u32], cursor_addr: usize) -> Option<LiveDecode> {
    // Scan backwards to find the start of the instruction containing
    // (or just before) the cursor.
    //
    // Strategy: walk instructions forward from address 0 (or last zero)
    // until we cross or land on the cursor. This handles the case where
    // the cursor is in the middle of a partially-typed instruction.

    if cursor_addr >= ram.len() || cursor_addr == 0 {
        // Check if there's already an opcode at 0
        if cursor_addr == 0 && ram[0] != 0 {
            // Fall through to decode it
        } else {
            return None;
        }
    }

    // Find the instruction boundary by scanning forward from 0.
    // Track the start of each instruction as we go.
    let mut scan = 0usize;
    let mut instr_start = 0usize;
    loop {
        let byte = (ram[scan] & 0xFF) as u8;
        if byte == 0 {
            // Empty cell — if cursor is here, the previous instruction
            // was complete. Cursor is at a fresh position.
            if scan == cursor_addr {
                // Check if we're right after a complete instruction
                if scan > 0 {
                    let prev_byte = (ram[scan - 1] & 0xFF) as u8;
                    if prev_byte != 0 && opcodes::is_valid(prev_byte) {
                        let prev_w = opcodes::width(prev_byte);
                        if scan == instr_start + prev_w {
                            // Previous instruction complete, cursor is at start of next
                            return None;
                        }
                    }
                }
                return None;
            }
            scan += 1;
            if scan > cursor_addr {
                return None;
            }
            instr_start = scan;
            continue;
        }

        let w = if opcodes::is_valid(byte) {
            opcodes::width(byte)
        } else {
            1 // unknown byte, skip
        };

        let instr_end = scan + w;

        if instr_start <= cursor_addr && cursor_addr < instr_end {
            // Cursor is within this instruction (complete or partial)
            break;
        }
        if cursor_addr == instr_end {
            // Cursor is right after this instruction — it's complete,
            // and cursor is at a fresh position for the next one.
            return None;
        }

        scan = instr_end;
        if scan > cursor_addr {
            return None;
        }
        instr_start = scan;
    }

    // Decode the instruction at instr_start
    let opcode_byte = (ram[instr_start] & 0xFF) as u8;
    if !opcodes::is_valid(opcode_byte) {
        return None;
    }

    let w = opcodes::width(opcode_byte);
    let kinds = opcodes::arg_kinds(opcode_byte);
    let name = opcodes::name(opcode_byte);

    let mut cells = vec![DecodedCell {
        addr: instr_start,
        role: CellRole::Opcode,
        text: name.to_string(),
    }];

    let mut parts = vec![name.to_string()];
    let mut hint_parts = Vec::new();
    let mut is_complete = true;

    for i in 0..kinds.len() {
        let arg_addr = instr_start + 1 + i;
        if arg_addr >= ram.len() {
            is_complete = false;
            hint_parts.push(opcodes::arg_label(kinds[i]).to_string());
            parts.push("???".to_string());
            cells.push(DecodedCell {
                addr: cursor_addr.min(ram.len() - 1),
                role: CellRole::ArgPending,
                text: format!("?{}", opcodes::arg_label(kinds[i])),
            });
            continue;
        }

        let arg_val = ram[arg_addr];
        let arg_byte = (arg_val & 0xFF) as u8;

        if arg_val == 0 && arg_addr >= cursor_addr {
            // This cell hasn't been written yet — cursor hasn't reached it
            is_complete = false;
            hint_parts.push(opcodes::arg_label(kinds[i]).to_string());
            parts.push("???".to_string());
            cells.push(DecodedCell {
                addr: arg_addr,
                role: CellRole::ArgPending,
                text: format!("?{}", opcodes::arg_label(kinds[i])),
            });
        } else {
            // Cell has been written — decode it
            parts.push(opcodes::format_arg(kinds[i], arg_val));
            cells.push(DecodedCell {
                addr: arg_addr,
                role: CellRole::ArgFilled,
                text: opcodes::format_arg(kinds[i], arg_val),
            });
        }
    }

    let text = parts.join(" ");
    let hint = if is_complete {
        "complete".to_string()
    } else {
        format!("need: {}", hint_parts.join(" "))
    };

    Some(LiveDecode {
        start: instr_start,
        text,
        hint,
        is_complete,
        cells,
    })
}

/// Convert a key to a hex nibble (0-15). Used by the two-keystroke hex compose mode.
/// 0-9 → 0-9, A-F (and a-f) → 10-15. Returns None for any non-hex key.
fn key_to_hex_digit(key: Key) -> Option<u8> {
    match key {
        Key::Key0 => Some(0x0),
        Key::Key1 => Some(0x1),
        Key::Key2 => Some(0x2),
        Key::Key3 => Some(0x3),
        Key::Key4 => Some(0x4),
        Key::Key5 => Some(0x5),
        Key::Key6 => Some(0x6),
        Key::Key7 => Some(0x7),
        Key::Key8 => Some(0x8),
        Key::Key9 => Some(0x9),
        Key::A => Some(0xA),
        Key::B => Some(0xB),
        Key::C => Some(0xC),
        Key::D => Some(0xD),
        Key::E => Some(0xE),
        Key::F => Some(0xF),
        _ => None,
    }
}
