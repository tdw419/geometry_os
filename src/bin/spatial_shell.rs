use geometry_os::assembler::assemble;
use geometry_os::keys::key_to_ascii_shifted;
use geometry_os::vm::Vm;
use minifb::{Key, KeyRepeat, Scale, Window, WindowOptions};
use std::fs::File;
use std::io::{BufReader, BufWriter};
use std::time::{Duration, Instant};

#[cfg(feature = "gpu")]
use geometry_os::kernel::active_substrate::ActiveSubstrate;

/// Decodes raw substrate pixels into human-readable colors for the visualizer.
fn visualize_substrate(raw: &[u32]) -> Vec<u32> {
    raw.iter()
        .map(|&p| {
            if p == 0 {
                return 0x050508;
            } // Deep cosmic background for empty

            let taxonomy = p >> 28;
            match taxonomy {
                1 => 0xFF0000,     // LOGIC: Red
                2 => 0xFF8800,     // ROUTER: Orange
                3 => 0xFFFF00,     // CLOCK: Yellow
                12 => 0x00FF00,    // SIGNAL: Neon Green
                13 => 0x444444,    // MATTER: Gray
                14 => 0x0088FF,    // WIRE: Blue
                15 => 0x00FFFF,    // WIRE_ACTIVE: Cyan
                _ => p & 0xFFFFFF, // Fallback to raw color
            }
        })
        .collect()
}

/// Packs raw 32-bit pixels into 8-bit RGBA for RTS PNG export.
fn pack_rgba(raw: &[u32]) -> Vec<u8> {
    let mut rgba = Vec::with_capacity(raw.len() * 4);
    for &p in raw {
        rgba.push(((p >> 24) & 0xFF) as u8); // R = Taxonomy + Dir
        rgba.push(((p >> 16) & 0xFF) as u8); // G = Color High / Weight
        rgba.push(((p >> 8) & 0xFF) as u8); // B = Color Mid
        rgba.push((p & 0xFF) as u8); // A = Color Low / Threshold
    }
    rgba
}

/// Unpacks RGBA bytes back into raw 32-bit pixels.
fn unpack_rgba(rgba: &[u8]) -> Vec<u32> {
    rgba.chunks(4)
        .map(|c| {
            ((c[0] as u32) << 24) | ((c[1] as u32) << 16) | ((c[2] as u32) << 8) | (c[3] as u32)
        })
        .collect()
}

/// A very simple 5x7 bitmap font for command echo.
fn draw_char(pixels: &mut [u32], ch: char, x: usize, y: usize, color: u32) {
    if x + 5 > 256 || y + 7 > 256 {
        return;
    }
    let glyph = match ch.to_ascii_uppercase() {
        'A' => 0x74631,
        'B' => 0x3CF4B,
        'C' => 0x1C213,
        'D' => 0x34653,
        'E' => 0x3C393,
        'F' => 0x3C390,
        'G' => 0x1C253,
        'H' => 0x22742,
        'I' => 0x1C41C,
        'J' => 0x08423,
        'K' => 0x22642,
        'L' => 0x20213,
        'M' => 0x22D42,
        'N' => 0x22662,
        'O' => 0x1C253,
        'P' => 0x34610,
        'Q' => 0x1C255,
        'R' => 0x34642,
        'S' => 0x1C183,
        'T' => 0x3C410,
        'U' => 0x22253,
        'V' => 0x22221,
        'W' => 0x22D52,
        'X' => 0x22142,
        'Y' => 0x22110,
        'Z' => 0x3C123,
        '0' => 0x1C253,
        '1' => 0x08422,
        '2' => 0x3C1C2,
        '3' => 0x3C1C3,
        '4' => 0x22311,
        '5' => 0x3C383,
        '6' => 0x1C393,
        '7' => 0x3C122,
        '8' => 0x1C393,
        '9' => 0x1C313,
        ' ' => 0x00000,
        ',' => 0x00001,
        '.' => 0x00002,
        '/' => 0x04210,
        ':' => 0x01040,
        '>' => 0x21084,
        _ => 0x3FFFF, // Block for unknown
    };

    for row in 0..7 {
        for col in 0..5 {
            let bit = 1 << (19 - (row * 5 + col));
            if glyph & bit != 0 {
                pixels[(y + row) * 256 + (x + col)] = color;
            }
        }
    }
}

fn draw_string(pixels: &mut [u32], s: &str, x: usize, y: usize, color: u32) {
    let mut cur_x = x;
    for c in s.chars() {
        draw_char(pixels, c, cur_x, y, color);
        cur_x += 6;
        if cur_x + 6 > 256 {
            break;
        }
    }
}

fn main() {
    let mut vm = Vm::new();

    // ── Phase R/S: The Spatial Shell & PM ────────────────────

    #[cfg(feature = "gpu")]
    {
        println!("[Shell] Initializing GPU Substrate...");
        let instance = wgpu::Instance::new(&wgpu::InstanceDescriptor::default());
        let adapter =
            pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions::default()))
                .expect("Failed to find wgpu adapter");
        let (device, queue) =
            pollster::block_on(adapter.request_device(&wgpu::DeviceDescriptor::default()))
                .expect("Failed to create wgpu device");

        let substrate = ActiveSubstrate::new(&device, &queue, 256, 256);
        vm.active_substrate = Some(substrate);
    }

    // 2. Compile the Spatial Shell assembly
    println!("[Shell] Compiling spatial_shell.asm...");
    let asm_path = "programs/spatial_shell.asm";
    let asm_src = std::fs::read_to_string(asm_path).expect("Failed to read spatial_shell.asm");
    let result = assemble(&asm_src, 0).expect("Failed to assemble spatial_shell.asm");

    for (i, &word) in result.pixels.iter().enumerate() {
        vm.ram[i] = word;
    }

    // 3. Setup GUI window
    let mut window = Window::new(
        "Geometry OS - Spatial Shell (Phase S)",
        256,
        256,
        WindowOptions {
            scale: Scale::X4,
            ..WindowOptions::default()
        },
    )
    .expect("Failed to create window");

    window.set_target_fps(60);
    println!("[Shell] Engine wired. Use 'Ctrl+M' to toggle substrate view.");

    let mut show_map = false;
    let mut bridge_active = true;
    let mut remaining_run_ticks = 0u32;
    let mut frame_start = Instant::now();
    let mut input_buffer = String::new();

    // 4. Main execution loop
    while window.is_open() && !window.is_key_down(Key::Escape) {
        let ctrl = window.is_key_down(Key::LeftCtrl) || window.is_key_down(Key::RightCtrl);
        let shift = window.is_key_down(Key::LeftShift) || window.is_key_down(Key::RightShift);

        // --- Host Keyboard Input ---
        let keys = window.get_keys_pressed(KeyRepeat::Yes);
        for key in keys {
            if key == Key::M && ctrl {
                show_map = !show_map;
                continue;
            }
            if key == Key::B && ctrl {
                bridge_active = !bridge_active;
                continue;
            }

            if let Some(ascii) = key_to_ascii_shifted(key, shift) {
                if bridge_active {
                    if ascii == 0x0D {
                        // Enter
                        let cmd = input_buffer.trim().to_lowercase();
                        if cmd == "help" {
                            println!("\n[Shell] Bridge Commands:");
                            println!("  map          - Toggle Substrate/Framebuffer view");
                            println!("  pulse <x> <y> - Inject 24-bit signal at coords");
                            println!("  clear        - Reset the active substrate");
                            println!("  step         - Advance substrate by 1 tick");
                            println!("  run <n>      - Advance substrate by N ticks (animated)");
                            println!("  export <f>   - Save substrate to PNG");
                            println!("  import <f>   - Load substrate from PNG");
                            println!("  Ctrl+M       - Quick View Toggle");
                            println!("  Ctrl+B       - Input Mode Toggle (Commands/VM)\n");
                        } else if cmd == "map" {
                            show_map = !show_map;
                        } else if cmd == "clear" {
                            #[cfg(feature = "gpu")]
                            if let Some(ref mut sub) = vm.active_substrate {
                                sub.set_substrate(&vec![0u32; 256 * 256]);
                            }
                        } else if cmd == "step" {
                            #[cfg(feature = "gpu")]
                            if let Some(ref mut sub) = vm.active_substrate {
                                sub.update(vm.frame_count, 1.0);
                                vm.frame_count += 1;
                            }
                        } else if cmd.starts_with("run ") {
                            remaining_run_ticks = cmd
                                .split_whitespace()
                                .nth(1)
                                .and_then(|n| n.parse().ok())
                                .unwrap_or(0);
                        } else if cmd.starts_with("pulse ") {
                            let parts: Vec<&str> = cmd.split_whitespace().collect();
                            if parts.len() == 3 {
                                let x = parts[1].parse().unwrap_or(128);
                                let y = parts[2].parse().unwrap_or(128);
                                #[cfg(feature = "gpu")]
                                if let Some(ref mut sub) = vm.active_substrate {
                                    sub.inject_signal(x, y, 12, 0, 0xFFFFFF);
                                }
                            }
                        }
                        // --- Phase S: Package Manager Commands ---
                        else if cmd.starts_with("export ") {
                            let filename =
                                cmd.split_whitespace().nth(1).unwrap_or("export.rts.png");
                            #[cfg(feature = "gpu")]
                            if let Some(ref mut sub) = vm.active_substrate {
                                let raw = pollster::block_on(sub.get_substrate());
                                let rgba = pack_rgba(&raw);
                                if let Ok(file) = File::create(filename) {
                                    let w = BufWriter::new(file);
                                    let mut encoder = png::Encoder::new(w, 256, 256);
                                    encoder.set_color(png::ColorType::Rgba);
                                    encoder.set_depth(png::BitDepth::Eight);
                                    if let Ok(mut writer) = encoder.write_header() {
                                        let _ = writer.write_image_data(&rgba);
                                        println!("[Shell] Exported to {}", filename);
                                    }
                                }
                            }
                        } else if cmd.starts_with("import ") {
                            let filename =
                                cmd.split_whitespace().nth(1).unwrap_or("export.rts.png");
                            #[cfg(feature = "gpu")]
                            if let Some(ref mut sub) = vm.active_substrate {
                                if let Ok(file) = File::open(filename) {
                                    let reader = BufReader::new(file);
                                    let decoder = png::Decoder::new(reader);
                                    if let Ok(mut reader) = decoder.read_info() {
                                        let mut buf = vec![0; 256 * 256 * 4];
                                        if let Ok(info) = reader.next_frame(&mut buf) {
                                            let pixels = unpack_rgba(&buf[..info.buffer_size()]);
                                            sub.set_substrate(&pixels);
                                            println!("[Shell] Imported from {}", filename);
                                        }
                                    }
                                }
                            }
                        }
                        input_buffer.clear();
                    } else if ascii >= 32 && ascii <= 126 {
                        input_buffer.push(ascii as char);
                    } else if ascii == 0x08 {
                        input_buffer.pop();
                    }
                } else {
                    vm.push_key(ascii as u32);
                }
            }
        }

        #[cfg(feature = "gpu")]
        if remaining_run_ticks > 0 {
            if let Some(ref mut sub) = vm.active_substrate {
                sub.update(vm.frame_count, 1.0);
                vm.frame_count += 1;
                remaining_run_ticks -= 1;
            }
        }

        vm.step();

        let mut final_view = if show_map {
            #[cfg(feature = "gpu")]
            if let Some(ref mut sub) = vm.active_substrate {
                let raw_pixels = pollster::block_on(sub.get_substrate());
                visualize_substrate(&raw_pixels)
            } else {
                vec![0u32; 256 * 256]
            }
            #[cfg(not(feature = "gpu"))]
            vec![0u32; 256 * 256]
        } else {
            vm.screen.clone()
        };

        for x in 0..256 {
            for y in 240..256 {
                final_view[y * 256 + x] = if bridge_active { 0x1a1a2e } else { 0x050508 };
            }
        }

        if bridge_active {
            let prompt = format!("COMMAND> {}", input_buffer);
            draw_string(&mut final_view, &prompt, 4, 244, 0x00FF00);
        } else {
            draw_string(
                &mut final_view,
                "INPUT MODE: VM (CTRL+B TO SWITCH)",
                4,
                244,
                0x888888,
            );
        }

        window.update_with_buffer(&final_view, 256, 256).unwrap();

        let elapsed = frame_start.elapsed();
        if elapsed < Duration::from_micros(16666) {
            std::thread::sleep(Duration::from_micros(16666) - elapsed);
        }
        frame_start = Instant::now();
    }
}
