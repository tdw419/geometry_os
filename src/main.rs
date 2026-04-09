use minifb::{Key, KeyRepeat, Window, WindowOptions};

mod font;

const WIDTH: usize = 800;
const HEIGHT: usize = 600;

// ── Palette remapping ────────────────────────────────────────────────
// Raw ASCII hex values are too dark to see (all near-black blues).
// We remap through a palette that spreads visible color across the range.
// The logical pixel value stays as ASCII hex. The display color is different.

fn palette_color(ascii_val: u8) -> u32 {
    // Map 0x20-0x7E across a full-spectrum color wheel.
    // Hue rotates through the printable ASCII range.
    let t = ((ascii_val as f32) - 32.0_f32) / (94.0_f32);
    let t = t.max(0.0).min(1.0);

    // HSV with S=0.8, V=1.0, H = t * 360
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
// Left half: pixel canvas (each logical pixel = CANVAS_SCALE screen pixels)
// Right half: font display (characters rendered as bitmap glyphs)
// Top strip: status bar

const CANVAS_X: usize = 16;
const CANVAS_Y: usize = 48;
const CANVAS_SCALE: usize = 8;
const CANVAS_COLS: usize = 22; // fits in ~384px
const CANVAS_ROWS: usize = 24; // fits in ~240px

const FONT_X: usize = 420;
const FONT_Y: usize = 48;
const FONT_SCALE: usize = 6;
// Font display: type characters appear here as glyphs
// Each char = 5*6=30px wide + 6px gap = 36px per char
// At 380px wide, fits ~10 chars per line, 13 lines in 560px

const BG: u32 = 0x0A0A14;       // dark navy background
const GRID_BG: u32 = 0x101020;  // canvas cell background
const GRID_LINE: u32 = 0x1A1A30; // grid lines between cells
const CURSOR_COL: u32 = 0xFFFFFF; // cursor highlight

// ── Status bar text color ────────────────────────────────────────────
const STATUS_FG: u32 = 0x888899;

fn main() {
    let mut window = Window
        ::new(
            "Geometry OS -- Pixel Painter",
            WIDTH,
            HEIGHT,
            WindowOptions {
                resize: false,
                ..Default::default()
            },
        )
        .unwrap_or_else(|e| {
            eprintln!("Failed to open window: {}", e);
            std::process::exit(1);
        });

    let mut buffer = vec![BG; WIDTH * HEIGHT];

    // Canvas state: grid of pixel values (ASCII codes), cursor position
    let mut canvas = vec![0u8; CANVAS_COLS * CANVAS_ROWS];
    let mut cursor_col: usize = 0;
    let mut cursor_row: usize = 0;

    // Font display state: lines of typed characters
    let mut font_lines: Vec<String> = vec![String::new()];
    let mut font_line_idx: usize = 0;
    const FONT_MAX_LINES: usize = 13;

    // Last key info for status display
    let mut last_key_char: Option<u8> = None;
    let mut last_key_hex: u8 = 0;

    // Redraw everything
    let mut needs_redraw = true;

    while window.is_open() {
        // ── Process key input ────────────────────────────────────────
        let keys = window.get_keys_pressed(KeyRepeat::Yes);
        for key in keys {
            let ch = key_to_ascii(key);
            if let Some(ch) = ch {
                // Stamp pixel on canvas
                if cursor_col < CANVAS_COLS && cursor_row < CANVAS_ROWS {
                    let idx = cursor_row * CANVAS_COLS + cursor_col;
                    canvas[idx] = ch;

                    // Advance cursor
                    cursor_col += 1;
                    if cursor_col >= CANVAS_COLS {
                        cursor_col = 0;
                        cursor_row += 1;
                        if cursor_row >= CANVAS_ROWS {
                            cursor_row = 0;
                        }
                    }
                }

                // Add to font display
                if ch == b'\n' || ch == b'\r' {
                    font_line_idx += 1;
                    if font_line_idx >= FONT_MAX_LINES {
                        font_line_idx = FONT_MAX_LINES - 1;
                    }
                    while font_lines.len() <= font_line_idx {
                        font_lines.push(String::new());
                    }
                } else {
                    while font_lines.len() <= font_line_idx {
                        font_lines.push(String::new());
                    }
                    let line = &mut font_lines[font_line_idx];
                    line.push(ch as char);
                    // Wrap at ~10 chars
                    if line.len() >= 10 {
                        font_line_idx += 1;
                        if font_line_idx >= FONT_MAX_LINES {
                            font_line_idx = FONT_MAX_LINES - 1;
                        }
                        while font_lines.len() <= font_line_idx {
                            font_lines.push(String::new());
                        }
                    }
                }

                last_key_char = Some(ch);
                last_key_hex = ch;
                needs_redraw = true;
            }

            // Special keys
            if key == Key::Backspace {
                // Move cursor back
                if cursor_col > 0 {
                    cursor_col -= 1;
                } else if cursor_row > 0 {
                    cursor_row -= 1;
                    cursor_col = CANVAS_COLS - 1;
                }
                let idx = cursor_row * CANVAS_COLS + cursor_col;
                canvas[idx] = 0;
                // Also remove last char from font display
                if let Some(line) = font_lines.get_mut(font_line_idx) {
                    line.pop();
                }
                needs_redraw = true;
            }

            if key == Key::Enter {
                // New line on font display
                font_line_idx += 1;
                if font_line_idx >= FONT_MAX_LINES {
                    font_lines.remove(0);
                    font_line_idx = FONT_MAX_LINES - 1;
                }
                while font_lines.len() <= font_line_idx {
                    font_lines.push(String::new());
                }
                // Also advance canvas row
                cursor_col = 0;
                cursor_row += 1;
                if cursor_row >= CANVAS_ROWS {
                    cursor_row = 0;
                }
                needs_redraw = true;
            }

            if key == Key::Escape {
                break;
            }
        }

        // ── Render ───────────────────────────────────────────────────
        if needs_redraw {
            buffer.fill(BG);

            // ── Status bar ───────────────────────────────────────────
            if let Some(ch) = last_key_char {
                let label = format!("Key: '{}'  Hex: 0x{:02X}  ASCII: {}  Color: #{:06X}",
                    ch as char, ch, ch, palette_color(ch));
                font::render_str(&mut buffer, WIDTH, HEIGHT, &label, 16, 8, 2, STATUS_FG, None);

                // Show the raw pixel value (tiny, in corner)
                let raw_label = format!("Raw pixel: 0x{:02X} = #0000{:02X}", ch, ch);
                font::render_str(&mut buffer, WIDTH, HEIGHT, &raw_label, 16, 30, 1, 0x444455, None);
            } else {
                font::render_str(&mut buffer, WIDTH, HEIGHT, "Type any key to paint pixels", 16, 8, 2, STATUS_FG, None);
            }

            // ── Section labels ───────────────────────────────────────
            font::render_str(&mut buffer, WIDTH, HEIGHT, "PIXEL CANVAS", CANVAS_X, CANVAS_Y - 14, 1, 0x555566, None);
            font::render_str(&mut buffer, WIDTH, HEIGHT, "FONT DISPLAY", FONT_X, FONT_Y - 14, 1, 0x555566, None);

            // ── Canvas grid ──────────────────────────────────────────
            for row in 0..CANVAS_ROWS {
                for col in 0..CANVAS_COLS {
                    let idx = row * CANVAS_COLS + col;
                    let x0 = CANVAS_X + col * CANVAS_SCALE;
                    let y0 = CANVAS_Y + row * CANVAS_SCALE;

                    let is_cursor = col == cursor_col && row == cursor_row;

                    // Cell color: either the palette color or grid background
                    let cell_color = if canvas[idx] != 0 {
                        palette_color(canvas[idx])
                    } else {
                        GRID_BG
                    };

                    for dy in 0..CANVAS_SCALE {
                        for dx in 0..CANVAS_SCALE {
                            let px = x0 + dx;
                            let py = y0 + dy;
                            if px < WIDTH && py < HEIGHT {
                                // Border pixels = grid line, interior = cell color
                                let is_border = dx == CANVAS_SCALE - 1 || dy == CANVAS_SCALE - 1;
                                let is_cursor_border = is_cursor && (dx == 0 || dy == 0 || dx == CANVAS_SCALE - 1 || dy == CANVAS_SCALE - 1);

                                buffer[py * WIDTH + px] = if is_cursor_border {
                                    CURSOR_COL
                                } else if is_border {
                                    GRID_LINE
                                } else {
                                    cell_color
                                };
                            }
                        }
                    }

                    // If cell has a value, draw the character label inside (tiny, centered)
                    if canvas[idx] != 0 && CANVAS_SCALE >= 6 {
                        let ch = canvas[idx] as char;
                        let cx = x0 + CANVAS_SCALE / 2 - 2;
                        let cy = y0 + CANVAS_SCALE / 2 - 3;
                        font::render_char(&mut buffer, WIDTH, HEIGHT,
                            canvas[idx], cx, cy, 1, 0x000000, None);
                    }
                }
            }

            // ── Font display area ────────────────────────────────────
            // Draw a subtle border
            for y in FONT_Y..FONT_Y + FONT_MAX_LINES * (font::GLYPH_H * FONT_SCALE + 4) {
                if y < HEIGHT {
                    buffer[y * WIDTH + FONT_X - 2] = 0x222233;
                    buffer[y * WIDTH + FONT_X - 1] = 0x222233;
                }
            }

            for (i, line) in font_lines.iter().enumerate() {
                if i >= FONT_MAX_LINES { break; }
                let ly = FONT_Y + i * (font::GLYPH_H * FONT_SCALE + 4);
                if ly + font::GLYPH_H * FONT_SCALE >= HEIGHT { break; }

                // Render each character as a bitmap glyph
                let mut cx = FONT_X;
                for ch in line.bytes() {
                    let color = palette_color(ch);
                    font::render_char(&mut buffer, WIDTH, HEIGHT,
                        ch, cx, ly, FONT_SCALE, color, None);
                    cx += (font::GLYPH_W + 1) * FONT_SCALE;
                    if cx + font::GLYPH_W * FONT_SCALE >= WIDTH { break; }
                }
            }

            // ── Color swatch preview ─────────────────────────────────
            if let Some(ch) = last_key_char {
                let swatch_x = CANVAS_X;
                let swatch_y = CANVAS_Y + CANVAS_ROWS * CANVAS_SCALE + 16;
                let swatch_w = 80;
                let swatch_h = 20;

                // Raw color swatch
                let raw_color = 0x00000000 | ((ch as u32) & 0xFF);
                for dy in 0..swatch_h {
                    for dx in 0..swatch_w / 2 {
                        let px = swatch_x + dx;
                        let py = swatch_y + dy;
                        if px < WIDTH && py < HEIGHT {
                            buffer[py * WIDTH + px] = raw_color;
                        }
                    }
                }
                // Palette color swatch
                let pal = palette_color(ch);
                for dy in 0..swatch_h {
                    for dx in 0..swatch_w / 2 {
                        let px = swatch_x + swatch_w / 2 + dx;
                        let py = swatch_y + dy;
                        if px < WIDTH && py < HEIGHT {
                            buffer[py * WIDTH + px] = pal;
                        }
                    }
                }
                // Labels
                font::render_str(&mut buffer, WIDTH, HEIGHT, "raw",
                    swatch_x, swatch_y + swatch_h + 2, 1, 0x555555, None);
                font::render_str(&mut buffer, WIDTH, HEIGHT, "palette",
                    swatch_x + swatch_w / 2, swatch_y + swatch_h + 2, 1, 0x555555, None);
            }

            // ── Divider line ─────────────────────────────────────────
            let div_x = 404;
            for y in 0..HEIGHT {
                buffer[y * WIDTH + div_x] = 0x1A1A2E;
            }

            window.update_with_buffer(&buffer, WIDTH, HEIGHT).unwrap();
            needs_redraw = false;
        } else {
            window.update();
        }

        std::thread::sleep(std::time::Duration::from_millis(8));
    }
}

/// Convert minifb Key to ASCII byte value.
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
        _ => None,
    }
}
