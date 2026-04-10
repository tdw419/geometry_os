use minifb::{Key, KeyRepeat, Window, WindowOptions};
use geometry_os::vm::Vm;
use geometry_os::shell::{Shell, ShellAction};

mod font;

const WIDTH: usize = 1024;
const HEIGHT: usize = 768;

// ── Palette remapping ────────────────────────────────────────────────
fn palette_color(val: u32) -> u32 {
    let ascii_val = (val & 0xFF) as u8;
    if ascii_val < 32 || ascii_val > 126 {
        // Not a printable ASCII char, but might be a raw color.
        // If it looks like a full 24-bit color, use it.
        if val > 0xFF { return val; }
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
    let mut window = Window
        ::new(
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

    // Initialize VM
    let mut vm = Vm::new(CANVAS_COLS * CANVAS_ROWS);
    
    // ── Shell for keyboard input to TEXT rendering ─────────────────────
    let mut shell = Shell::new();
    let mut shell_cursor_x: usize = 0;  // Cursor position on VM screen
    let mut shell_cursor_y: usize = 0;  // Cursor position on VM screen
    let mut shell_scroll: usize = 0;    // Scroll offset for VM screen
    const CHAR_WIDTH: usize = 5;        // 5x7 font width
    const CHAR_HEIGHT: usize = 7;       // 5x7 font height
    const SCREEN_COLS: usize = 51;      // 256 / 5 = 51 columns
    const SCREEN_ROWS: usize = 36;      // 256 / 7 = 36 rows

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
            // Painting mode: only when VM is idle (prevents program corruption)
            if !is_running {
                if let Some(ch) = key_to_ascii(key) {
                    let idx = cursor_row * CANVAS_COLS + cursor_col;
                    vm.ram[idx] = ch as u32;
                    
                    cursor_col += 1;
                    if cursor_col >= CANVAS_COLS {
                        cursor_col = 0;
                        cursor_row += 1;
                        if cursor_row >= CANVAS_ROWS { cursor_row = 0; }
                    }
                    needs_redraw = true;
                }
            }

            match key {
                Key::F5 => {
                    // Toggle execution mode
                    if !is_running {
                        if vm.halted { vm.pc = 0; vm.halted = false; }
                        is_running = true;
                    } else {
                        is_running = false;
                    }
                    needs_redraw = true;
                }
                Key::F6 => {
                    // Load from programs/boot.rts
                    if let Ok(data) = std::fs::read("programs/boot.rts") {
                        let pixels: Vec<u32> = data.chunks_exact(4)
                            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
                            .collect();
                        for (i, &p) in pixels.iter().enumerate() {
                            if i < vm.ram.len() { vm.ram[i] = p; }
                        }
                        needs_redraw = true;
                    }
                }
                Key::F7 => {
                    // Save to programs/save.rts
                    let mut data = Vec::new();
                    for &p in &vm.ram {
                        data.extend_from_slice(&p.to_le_bytes());
                    }
                    let _ = std::fs::write("programs/save.rts", data);
                }
                Key::Backspace => {
                    if cursor_col > 0 { cursor_col -= 1; }
                    else if cursor_row > 0 { cursor_row -= 1; cursor_col = CANVAS_COLS - 1; }
                    vm.ram[cursor_row * CANVAS_COLS + cursor_col] = 0;
                    needs_redraw = true;
                }
                Key::Left => { if cursor_col > 0 { cursor_col -= 1; } needs_redraw = true; }
                Key::Right => { if cursor_col < CANVAS_COLS - 1 { cursor_col += 1; } needs_redraw = true; }
                Key::Up => { if cursor_row > 0 { cursor_row -= 1; } needs_redraw = true; }
                Key::Down => { if cursor_row < CANVAS_ROWS - 1 { cursor_row += 1; } needs_redraw = true; }
                _ => {}
            }
        }

        // ── Runtime Execution & Input ────────────────────────────────
        if is_running && !vm.halted {
            // Check for input keys to send to Port 1023
            let input_keys = window.get_keys_pressed(KeyRepeat::No);
            for k in input_keys {
                if let Some(ch) = key_to_ascii(k) {
                    // Write to keyboard port for VM programs
                    let last_idx = vm.ram.len() - 1;
                    vm.ram[last_idx] = ch as u32;

                    // Render the character on the VM screen directly
                    font::render_char(
                        &mut vm.screen, 256, 256,
                        ch,
                        text_x, text_y,
                        TEXT_SCALE,
                        0xFFFFFF, // white text
                        Some(0x0A0A1E), // dark background per char
                    );
                    text_x += TEXT_COL_ADVANCE;
                    if text_x > TEXT_MAX_X {
                        text_x = 0;
                        text_y += TEXT_ROW_ADVANCE;
                        if text_y > TEXT_MAX_Y {
                            // Scroll up: shift screen by one row
                            let shift = TEXT_ROW_ADVANCE * 256;
                            vm.screen.copy_within(shift..256*256, 0);
                            // Clear bottom row
                            for i in (256*256 - shift)..(256*256) {
                                vm.screen[i] = 0;
                            }
                            text_y = TEXT_MAX_Y;
                        }
                    }
                }
            }

            // Run a burst of cycles for this frame
            cycles_last_run = vm.run();
            
            // ── Forge Bridge ─────────────────────────────────────────
            let issues = vm.forge.drain();
            for issue in issues {
                println!("[FORGE ISSUE #{} (PC:{})] Tag: 0x{:08X} Payload: 0x{:08X} Priority: {:?}", 
                    issue.id, issue.origin_pc, issue.tag, issue.payload, issue.priority);
            }

            // ── Child VM Bridge ────────────────────────────────────────
            let new_children = vm.drain_children();
            for child_req in &new_children {
                let child = vm.spawn_child(child_req);
                child_vms.push(child);
                let cx = child_req.arg & 0xFFFF;
                let cy = (child_req.arg >> 16) & 0xFFFF;
                println!(
                    "[SPAWN] New child VM at ({}, {}) → PC={}  ({} children total)",
                    cx, cy, child_req.start_addr, child_vms.len()
                );
            }

            for child in &mut child_vms {
                if !child.is_halted() {
                    child.run();
                    vm.composite_screen(child);
                }
            }

            if vm.halted { is_running = false; }
            needs_redraw = true;
        }

        // ── Render ───────────────────────────────────────────────────
        if needs_redraw {
            buffer.fill(BG);

            // Status
            let status = if vm.halted { "HALTED" } else if is_running { "YIELDED/RUNNING" } else { "IDLE" };
            let header = format!("PC: {:04} | Status: {} | Cycles: {} | F5: RUN", vm.pc, status, cycles_last_run);
            font::render_str(&mut buffer, WIDTH, HEIGHT, &header, 16, 16, 2, 0x00FFBB, None);

            // Labels
            font::render_str(&mut buffer, WIDTH, HEIGHT, "PIXEL RAM (PROGRAM)", CANVAS_X, CANVAS_Y - 20, 1, 0x555566, None);
            font::render_str(&mut buffer, WIDTH, HEIGHT, "VM SCREEN", VM_SCREEN_X, VM_SCREEN_Y - 20, 1, 0x555566, None);
            font::render_str(&mut buffer, WIDTH, HEIGHT, "REGISTERS", REGS_X, REGS_Y - 20, 1, 0x555566, None);

            // Canvas (VM RAM)
            for row in 0..CANVAS_ROWS {
                for col in 0..CANVAS_COLS {
                    let idx = row * CANVAS_COLS + col;
                    let val = vm.ram[idx];
                    let x0 = CANVAS_X + col * CANVAS_SCALE;
                    let y0 = CANVAS_Y + row * CANVAS_SCALE;
                    let is_cursor = col == cursor_col && row == cursor_row;
                    let is_pc = idx == (vm.pc as usize);

                    let cell_color = if val != 0 { palette_color(val) } else { GRID_BG };

                    for dy in 0..CANVAS_SCALE {
                        for dx in 0..CANVAS_SCALE {
                            let px = x0 + dx;
                            let py = y0 + dy;
                            let is_border = dx == CANVAS_SCALE - 1 || dy == CANVAS_SCALE - 1;
                            let is_highlight = is_cursor || is_pc;
                            
                            let mut color = if is_border { GRID_LINE } else { cell_color };
                            if is_highlight && (dx == 0 || dy == 0 || dx == CANVAS_SCALE - 1 || dy == CANVAS_SCALE - 1) {
                                color = if is_pc { 0xFF00FF } else { CURSOR_COL };
                            }
                            buffer[py * WIDTH + px] = color;
                        }
                    }
                    if val != 0 && val < 128 {
                        font::render_char(&mut buffer, WIDTH, HEIGHT, val as u8, x0 + 4, y0 + 4, 1, 0x000000, None);
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
                font::render_str(&mut buffer, WIDTH, HEIGHT, &reg_str, REGS_X, REGS_Y + i * 14, 1, 0xAAAAAA, None);
                let val2 = vm.regs[i+16];
                let reg_str2 = format!("r{:02}: {:08X}", i+16, val2);
                font::render_str(&mut buffer, WIDTH, HEIGHT, &reg_str2, REGS_X + 160, REGS_Y + i * 14, 1, 0xAAAAAA, None);
            }

            // Opcode Reference
            let ref_x = REGS_X;
            let ref_y = REGS_Y + 240;
            font::render_str(&mut buffer, WIDTH, HEIGHT, "OPCODE REF", ref_x, ref_y - 20, 1, 0x555566, None);
            let opcodes_ref = [
                ("I:LDI", b'I'), ("A:ADD", b'A'), ("U:SUB", b'U'), ("J:JMP", b'J'),
                ("B:BRANCH", b'B'), ("C:CALL", b'C'), ("R:RET", b'R'), ("H:HALT", b'H'),
                ("P:PSET", b'P'), ("F:RECTF", b'F'), ("G:CIRC", b'G'), ("L:LOAD", b'L'),
                ("S:STOR", b'S'), ("M:MOV", b'M'), ("W:BLIT", b'W'), ("N:NOP", b'N'),
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

fn key_to_ascii(key: Key) -> Option<u8> {
    match key {
        Key::A => Some(b'A'), Key::B => Some(b'B'), Key::C => Some(b'C'), Key::D => Some(b'D'),
        Key::E => Some(b'E'), Key::F => Some(b'F'), Key::G => Some(b'G'), Key::H => Some(b'H'),
        Key::I => Some(b'I'), Key::J => Some(b'J'), Key::K => Some(b'K'), Key::L => Some(b'L'),
        Key::M => Some(b'M'), Key::N => Some(b'N'), Key::O => Some(b'O'), Key::P => Some(b'P'),
        Key::Q => Some(b'Q'), Key::R => Some(b'R'), Key::S => Some(b'S'), Key::T => Some(b'T'),
        Key::U => Some(b'U'), Key::V => Some(b'V'), Key::W => Some(b'W'), Key::X => Some(b'X'),
        Key::Y => Some(b'Y'), Key::Z => Some(b'Z'),
        Key::Key0 => Some(b'0'), Key::Key1 => Some(b'1'), Key::Key2 => Some(b'2'), Key::Key3 => Some(b'3'),
        Key::Key4 => Some(b'4'), Key::Key5 => Some(b'5'), Key::Key6 => Some(b'6'), Key::Key7 => Some(b'7'),
        Key::Key8 => Some(b'8'), Key::Key9 => Some(b'9'),
        Key::Space => Some(b' '), Key::Period => Some(b'.'), Key::Comma => Some(b','),
        Key::Semicolon => Some(b';'), Key::Apostrophe => Some(b'\''), Key::Slash => Some(b'/'),
        Key::Backslash => Some(b'\\'), Key::LeftBracket => Some(b'['), Key::RightBracket => Some(b']'),
        Key::Minus => Some(b'-'), Key::Equal => Some(b'='),
        _ => None,
    }
}
