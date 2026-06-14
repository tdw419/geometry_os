// cli.rs -- Headless CLI mode for Geometry OS

use crate::assembler;
use crate::canvas::list_asm_files;
use crate::hermes::{run_build_loop, run_hermes_loop};
use crate::preprocessor;
use crate::qemu::QemuBridge;
use crate::riscv::live::{spawn_vm_thread, GuestMode, VmThreadConfig};
use crate::save::{load_state, save_state};
use crate::vm;
use std::io::{self, Read, Write};
use std::path::{Path, PathBuf};
use std::time::Duration;

const SAVE_FILE: &str = "geometry_os.sav";

/// Scan config string for kernel=/path.rts.png or initrd=/path.rts.png
/// and auto-decode pixel images to temp files.
fn resolve_pixel_paths(config: &str) -> String {
    resolve_pixel_paths_with_vm(config, None)
}

/// Resolve pixel paths and building references in a QEMU config string.
/// Handles .rts.png PixelPack decoding and building:N references.
fn resolve_pixel_paths_with_vm(config: &str, vm: Option<&crate::vm::Vm>) -> String {
    let mut result = config.to_string();
    for key in &["kernel", "initrd", "dtb", "drive", "disk"] {
        // Find key=value in the config string
        if let Some(start) = result.find(&format!("{}=", key)) {
            let val_start = start + key.len() + 1;
            // Value runs until next space or end of string
            let val_end = result[val_start..]
                .find(' ')
                .map(|i| val_start + i)
                .unwrap_or(result.len());
            let value = &result[val_start..val_end];

            // Handle building:ID references
            if value.starts_with("building:") {
                if let Some(ref vm_ref) = vm {
                    let building_id_str = &value[9..]; // Skip "building:"
                    if let Ok(building_id) = building_id_str.parse::<u32>() {
                        if let Some(temp_path) = extract_binary_from_building(vm_ref, building_id) {
                            result.replace_range(val_start..val_end, &temp_path);
                            eprintln!(
                                "[hypervisor: resolved {}=building:{} -> {}]",
                                key, building_id, temp_path
                            );
                        } else {
                            eprintln!("[hypervisor: warning: building {} not found or has no binary data]", building_id);
                        }
                    }
                }
            }
            // Handle .rts.png pixel paths
            else if value.to_lowercase().ends_with(".rts.png") {
                match crate::pixel::decode_rts_to_temp(value) {
                    Ok(temp_path) => {
                        println!(
                            "[pixel] Decoded {} -> {} ({} bytes)",
                            value,
                            temp_path,
                            std::fs::metadata(&temp_path).map(|m| m.len()).unwrap_or(0)
                        );
                        result.replace_range(val_start..val_end, &temp_path);
                    },
                    Err(e) => {
                        eprintln!("[pixel] Failed to decode {}: {}", value, e);
                    },
                }
            }
        }
    }
    result
}

/// Extract binary from a building's metadata and write to temp file
/// Used by QEMU hypervisor path (QEMU needs real files).
/// NOTE: This is the ORIGINAL version in cli.rs. main.rs has its own copy.
fn extract_binary_from_building(vm: &crate::vm::Vm, building_id: u32) -> Option<String> {
    // Helper to write binary data to temp file
    let write_to_temp = |data: Vec<u8>| -> Option<String> {
        let mut temp_path = std::env::temp_dir();
        temp_path.push(&format!("geos_building_{}.bin", building_id));
        std::fs::write(&temp_path, &data).ok()?;
        Some(temp_path.to_string_lossy().to_string())
    };
    // Helper to extract from coordinate metadata
    let extract = |key: u64| -> Option<String> {
        let coord_meta = vm.coordinate_metadata.get(&key)?;
        let json = coord_meta.get("binary_data")?;
        let meta: crate::encoding::BinaryMetadata = serde_json::from_str(json).ok()?;
        let data = meta.to_binary().ok()?;
        write_to_temp(data)
    };
    // Try building's actual position first
    if let Some(b) = vm.buildings.get(building_id as usize) {
        if b.x != 0 || b.y != 0 || b.type_color != 0 {
            let k = ((b.x as u64) << 32) | (b.y as u32 as u64);
            if let Some(r) = extract(k) {
                return Some(r);
            }
        }
    }
    // Fallback: building ID key (import_binary stores here)
    extract(((building_id as u64) << 16) | 0)
}

/// Extract binary data from a building's metadata as raw bytes (no temp file).
pub fn extract_binary_bytes_from_building(vm: &crate::vm::Vm, building_id: u32) -> Option<Vec<u8>> {
    // First try: look up by building coordinates (building exists in Vec)
    if let Some(b) = vm.buildings.get(building_id as usize) {
        if b.x != 0 || b.y != 0 || b.type_color != 0 {
            let coord_key = ((b.x as u64) << 32) | (b.y as u32 as u64);
            if let Some(coord_metadata) = vm.coordinate_metadata.get(&coord_key) {
                if let Some(binary_json) = coord_metadata.get("binary_data") {
                    if let Ok(metadata) =
                        serde_json::from_str::<crate::encoding::BinaryMetadata>(binary_json)
                    {
                        if let Ok(data) = metadata.to_binary() {
                            return Some(data);
                        }
                    }
                }
            }
        }
    }
    // Second try: look up by building ID directly (import_binary stores at (building_id << 16) | 0)
    let coord_key = ((building_id as u64) << 16) | 0;
    if let Some(coord_metadata) = vm.coordinate_metadata.get(&coord_key) {
        if let Some(binary_json) = coord_metadata.get("binary_data") {
            if let Ok(metadata) =
                serde_json::from_str::<crate::encoding::BinaryMetadata>(binary_json)
            {
                return metadata.to_binary().ok();
            }
        }
    }
    None
}

use std::sync::Mutex;

// Global console output buffer for inter-thread access
static CONSOLE_BUF: Mutex<Vec<String>> = Mutex::new(Vec::new());
static HYPERVISOR_CONSOLE_BUF: Mutex<Vec<String>> = Mutex::new(Vec::new());

pub fn cli_main(extra_args: &[String]) {
    // Create Unix socket command channel (for MCP server)
    let cmd_sock_path = "/tmp/geo_cmd.sock";
    let _ = std::fs::remove_file(cmd_sock_path);
    let mut cmd_listener = std::os::unix::net::UnixListener::bind(cmd_sock_path).ok();
    if let Some(ref l) = cmd_listener {
        l.set_nonblocking(true).ok();
        println!("[geos] Command socket listening at {}", cmd_sock_path);
    } else {
        eprintln!("[geos] FAILED to bind command socket at {}", cmd_sock_path);
    }

    let mut vm = vm::Vm::new();
    let mut canvas_assembled = false;
    let mut loaded_file: Option<PathBuf> = None;
    let mut source_text = String::new(); // holds the currently loaded source
    let mut cli_breakpoints: Vec<u32> = Vec::new();
    let mut canvas_buffer: Vec<u32> = vec![0; 4096];
    let mut qemu_bridge: Option<QemuBridge> = None;
    let mut riscv_handle: Option<crate::riscv::live::RiscvVmHandle> = None;
    let boot_png_mode: bool;
    let boot_src_png_mode: bool;

    // Check for --boot-png, --boot-src-png, --boot, and HTTP server flags
    let mut riscv_user_path: Option<String> = None;
    let mut http_enabled = false;
    let mut http_port = 4242;
    let mut http_auth_token: Option<String> = None;
    let mut auto_boot = false;
    let mut load_path_arg: Option<String> = None;

    let mut i = 0;
    while i < extra_args.len() {
        if extra_args[i] == "--user" && i + 1 < extra_args.len() {
            riscv_user_path = Some(extra_args[i + 1].clone());
            i += 2;
        } else if extra_args[i] == "--http-server" {
            http_enabled = true;
            i += 1;
        } else if extra_args[i] == "--http-port" && i + 1 < extra_args.len() {
            if let Ok(port) = extra_args[i + 1].parse::<u16>() {
                http_port = port;
            }
            i += 2;
        } else if extra_args[i] == "--http-auth" && i + 1 < extra_args.len() {
            http_auth_token = Some(extra_args[i + 1].clone());
            i += 2;
        } else if extra_args[i] == "--boot" {
            auto_boot = true;
            i += 1;
        } else if extra_args[i] == "--load" && i + 1 < extra_args.len() {
            let load_path = extra_args[i + 1].clone();
            load_path_arg = Some(load_path.clone());
            match crate::save::load_state(&load_path) {
                Ok((saved_vm, saved_canvas, saved_assembled)) => {
                    vm = saved_vm;
                    let cb_len = vm.canvas_buffer.len().min(canvas_buffer.len());
                    canvas_buffer[..cb_len].copy_from_slice(&saved_canvas[..cb_len]);
                    canvas_assembled = saved_assembled;
                    loaded_file = Some(PathBuf::from(&load_path));
                    eprintln!("[geos] Loaded state from {}", load_path);
                },
                Err(e) => {
                    eprintln!("[geos] Error loading {}: {}", load_path, e);
                },
            }
            i += 2;
        } else {
            i += 1;
        }
    }

    let file_args: Vec<&String> = extra_args
        .iter()
        .filter(|a| {
            *a != "--boot-png"
                && *a != "--boot-src-png"
                && *a != "--user"
                && *a != "--load"
                && *a != "--boot"
        })
        .filter(|a| {
            // If it's the path following --user, skip it
            if let Some(ref p) = riscv_user_path {
                if *a == p {
                    return false;
                }
            }
            // If it's the path following --load, skip it
            if let Some(ref p) = load_path_arg {
                if *a == p {
                    return false;
                }
            }
            true
        })
        .collect();
    boot_png_mode = extra_args.iter().any(|a| a == "--boot-png");
    boot_src_png_mode = extra_args.iter().any(|a| a == "--boot-src-png");

    // If --user was provided, launch RISC-V VM immediately
    if let Some(ref path) = riscv_user_path {
        match std::fs::read(path) {
            Ok(elf_data) => {
                let config = VmThreadConfig {
                    mode: GuestMode::Elf(elf_data),
                    ram_size: 16 * 1024 * 1024,
                    initial_privilege: Some(crate::riscv::cpu::Privilege::User),
                    pixel_native: true,
                    ..Default::default()
                };
                match spawn_vm_thread(config) {
                    Ok(h) => {
                        riscv_handle = Some(h);
                        println!("[riscv] Auto-launched {} in User mode", path);
                    },
                    Err(e) => eprintln!("[riscv] Auto-launch error: {}", e),
                }
            },
            Err(e) => eprintln!("[riscv] Error reading {}: {}", path, e),
        }
    }

    // If extra args given (and not used for --user), treat first as a file to load
    if !file_args.is_empty() {
        let path_str = file_args[0];
        let path = PathBuf::from(path_str);

        // Phase 93: Auto-detect source PNG (geo_boot=source metadata)
        // Explicit --boot-src-png flag takes priority, then auto-detect by metadata
        if boot_src_png_mode || crate::pixel::is_source_png_file(path_str) {
            match crate::pixel::boot_source_png_to_ram(path_str, &mut canvas_buffer, &mut vm.ram) {
                Ok(result) => {
                    println!(
                        "[src-png-boot] Decoded {} chars ({} source bytes), assembled to {} bytecode words from {}",
                        result.char_count, result.source_len, result.bytecode_words, path_str
                    );
                    vm.canvas_buffer[..4096].copy_from_slice(&canvas_buffer[..4096]);
                    vm.pc = 0x1000;
                    vm.halted = false;
                    loaded_file = Some(path);
                    canvas_assembled = true;
                    // Auto-run the bytecode
                    for _ in 0..10_000_000 {
                        if !vm.step() {
                            break;
                        }
                    }
                    println!(
                        "[src-png-boot] Execution done. PC={:#X} Halted={}",
                        vm.pc, vm.halted
                    );
                },
                Err(e) => {
                    eprintln!("[src-png-boot] Error: {}", e);
                },
            }
        } else if boot_png_mode
            || crate::pixel::is_pixelpack_png(path_str)
            || crate::pixel::is_rts_png(path_str)
        {
            // Check for PNG bytecode boot (Phase 92) -- pixelpack or raw spatial
            let result = if crate::pixel::is_rts_png(path_str) {
                crate::pixel::boot_from_rts_png(path_str, &mut vm.ram, 0x1000)
            } else {
                crate::pixel::boot_from_png(path_str, &mut vm.ram, 0x1000)
            };
            match result {
                Ok(result) => {
                    let mode = if crate::pixel::is_rts_png(path_str) {
                        "rts"
                    } else {
                        "pixelpack"
                    };
                    println!(
                        "[pixel-boot:{} mode] Loaded {} bytes ({} RAM words) from {}",
                        mode, result.byte_count, result.ram_words, path_str
                    );
                    vm.pc = 0x1000;
                    vm.halted = false;
                    loaded_file = Some(path);
                    // Auto-run the bytecode
                    for _ in 0..10_000_000 {
                        if !vm.step() {
                            break;
                        }
                    }
                    println!(
                        "[pixel-boot] Execution done. PC={:#X} Halted={}",
                        vm.pc, vm.halted
                    );
                },
                Err(e) => {
                    eprintln!("[pixel-boot] Error: {}", e);
                },
            }
        } else {
            match std::fs::read_to_string(&path) {
                Ok(src) => {
                    source_text = src;
                    loaded_file = Some(path);
                },
                Err(e) => {
                    eprintln!("Error reading {}: {}", path_str, e);
                },
            }
        }
    }

    // -- Auto-boot from Memory Palace --
    // If --boot flag is set, check coordinate (0,0) for boot_config metadata
    // and automatically call riscv_boot with those parameters
    if auto_boot {
        let boot_config_key = 0u64; // coordinate (0,0)
        if let Some(coord_meta) = vm.coordinate_metadata.get(&boot_config_key) {
            if let Some(config_str) = coord_meta.get("boot_config") {
                eprintln!("[auto-boot] Found boot_config: {}", config_str);
                // Parse and execute boot config arguments
                let mut kernel_data: Option<Vec<u8>> = None;
                let mut initrd_data: Option<Vec<u8>> = None;
                let mut ram_mb = 256u32;
                let mut bootargs = "console=ttyS0".to_string();

                for part in config_str.split_whitespace() {
                    if let Some(building_str) = part.strip_prefix("kernel=building:") {
                        if let Ok(bid) = building_str.parse::<u32>() {
                            kernel_data = extract_binary_bytes_from_building(&vm, bid);
                            if kernel_data.is_none() {
                                eprintln!("[auto-boot] ERROR: kernel building {} not found", bid);
                            }
                        }
                    } else if let Some(building_str) = part.strip_prefix("initrd=building:") {
                        if let Ok(bid) = building_str.parse::<u32>() {
                            initrd_data = extract_binary_bytes_from_building(&vm, bid);
                            if initrd_data.is_none() {
                                eprintln!("[auto-boot] ERROR: initrd building {} not found", bid);
                            }
                        }
                    } else if let Some(val) = part.strip_prefix("ram=") {
                        ram_mb = val.parse().unwrap_or(256);
                    } else if let Some(val) = part.strip_prefix("bootargs=") {
                        bootargs = val.to_string();
                    }
                }

                if let Some(kernel) = kernel_data {
                    riscv_handle = None;
                    let config = crate::riscv::live::VmThreadConfig {
                        mode: crate::riscv::live::GuestMode::Linux {
                            kernel,
                            initrd: initrd_data,
                            bootargs,
                        },
                        ram_size: (ram_mb as usize) * 1024 * 1024,
                        ..Default::default()
                    };
                    match crate::riscv::live::spawn_vm_thread(config) {
                        Ok(h) => {
                            riscv_handle = Some(h);
                            eprintln!("[auto-boot] Booting Linux ({}MB ram)...", ram_mb);
                        },
                        Err(e) => {
                            eprintln!("[auto-boot] Error: {}", e);
                        },
                    }
                } else {
                    eprintln!("[auto-boot] ERROR: kernel=building:N required in boot_config");
                }
            } else {
                eprintln!("[auto-boot] No boot_config key found in coordinate (0,0) metadata");
            }
        } else {
            eprintln!("[auto-boot] No metadata found at coordinate (0,0)");
        }
    }

    println!("Geometry OS v1.0.0 CLI");
    println!("43 opcodes | 32 regs | 256x256");
    println!("Type 'help' for commands.");
    println!();

    #[cfg(feature = "http")]
    let _http_handle = if http_enabled {
        println!(
            "[http] Starting HTTP/WebSocket server on port {}...",
            http_port
        );
        let http_config = crate::http_server::HttpConfig {
            addr: "127.0.0.1".to_string(),
            port: http_port,
            auth_token: http_auth_token,
            enable_websocket: true,
        };

        // Spawn tokio runtime for HTTP server in a separate thread
        let handle = std::thread::spawn(move || {
            let rt = tokio::runtime::Runtime::new().unwrap();
            // Create a new VM for the HTTP server thread (architecture limitation: Vm is not thread-safe)
            let vm_for_http = vm::Vm::new();
            let server = crate::http_server::HttpServer::from_vm_arc(
                std::sync::Arc::new(tokio::sync::RwLock::new(vm_for_http)),
                http_config,
            );
            println!("[http] Server thread started");
            if let Err(e) = rt.block_on(server.start()) {
                eprintln!("[http] Server error: {}", e);
            }
        });

        Some(handle)
    } else {
        None
    };

    // Non-blocking stdin reader
    let (stdin_tx, stdin_rx) = std::sync::mpsc::channel::<String>();
    std::thread::spawn(move || {
        let stdin = io::stdin();
        let mut line = String::new();
        while stdin.read_line(&mut line).unwrap_or(0) > 0 {
            let _ = stdin_tx.send(line.clone());
            line.clear();
        }
    });

    // Socket command acceptor thread
    let (socket_cmd_tx, socket_cmd_rx) =
        std::sync::mpsc::channel::<(String, std::sync::mpsc::Sender<String>)>();
    if let Some(listener) = cmd_listener.take() {
        std::thread::spawn(move || {
            listener.set_nonblocking(false).ok();
            for mut stream in listener.incoming().flatten() {
                let mut buf = [0u8; 4096];
                if let Ok(n) = stream.read(&mut buf) {
                    let cmd = String::from_utf8_lossy(&buf[..n]).to_string();
                    let (resp_tx, resp_rx) = std::sync::mpsc::channel::<String>();
                    if socket_cmd_tx.send((cmd, resp_tx)).is_ok() {
                        if let Ok(resp) = resp_rx.recv_timeout(Duration::from_secs(5)) {
                            let _ = stream.write_all(resp.as_bytes());
                        }
                    }
                }
            }
        });
    }

    let mut prompt_shown = false;
    // QEMU screen render: use read_output with a proper canvas buffer
    let mut qemu_canvas: Vec<u32> =
        vec![0; crate::qemu::cursor::CANVAS_COLS * crate::qemu::cursor::CANVAS_MAX_ROWS];
    loop {
        // Poll QEMU output before showing prompt
        if let Some(ref mut bridge) = qemu_bridge {
            if bridge.is_alive() {
                let (_, output) = bridge.read_output(&mut qemu_canvas);
                if !output.is_empty() {
                    print!("{}", output);
                    let _ = io::stdout().flush();
                    if let Ok(mut buf) = HYPERVISOR_CONSOLE_BUF.lock() {
                        buf.push(output.clone());
                    }
                    // Write to VM ring buffer for Developer Console app
                    let mut write_off = vm.ram.get(0x4F00).copied().unwrap_or(0) as usize;
                    let read_off = vm.ram.get(0x4F01).copied().unwrap_or(0) as usize;
                    write_off = write_off.max(0).min(254);
                    for &byte in output.as_bytes() {
                        let slot = 0x4F02 + write_off;
                        if slot < vm.ram.len() {
                            vm.ram[slot] = byte as u32;
                        }
                        write_off = (write_off + 1) % 254;
                        // Reserve one slot: stop if next write would hit read_off
                        if (write_off + 1) % 254 == read_off {
                            break;
                        }
                    }
                    vm.ram[0x4F00] = write_off as u32;
                }
                // Route QEMU output into a floating WINSYS window
                let qemu_win_id = 1;
                let title = "QEMU Terminal";
                let title_addr = 0x4FA0;
                for (idx, ch) in title.chars().enumerate() {
                    if title_addr + idx < vm.ram.len() {
                        vm.ram[title_addr + idx] = ch as u32;
                    }
                }
                if title_addr + title.len() < vm.ram.len() {
                    vm.ram[title_addr + title.len()] = 0;
                }

                let has_win = vm.windows.iter().any(|w| w.id == qemu_win_id);
                if !has_win {
                    let mut win =
                        crate::vm::Window::new(qemu_win_id, 10, 10, 236, 220, title_addr as u32, 0);
                    win.active = true;
                    let max_z = vm.windows.iter().map(|w| w.z_order).max().unwrap_or(0);
                    win.z_order = max_z + 1;
                    vm.windows.push(win);
                }

                // Render visible rows from qemu_canvas onto the window offscreen buffer
                if let Some(ref mut win) = vm
                    .windows
                    .iter_mut()
                    .find(|w| w.id == qemu_win_id && w.active)
                {
                    // Clear window offscreen buffer to dark background
                    for p in win.offscreen_buffer.iter_mut() {
                        *p = 0x0A0A0A;
                    }

                    let char_w = crate::font::GLYPH_W + 1; // 8+1=9px
                    let char_h = crate::font::GLYPH_H + 1; // 8+1=9px
                    let win_w = win.w as usize;
                    let win_h = win.h as usize;
                    let cols = win_w / char_w;
                    let rows = win_h / char_h;

                    let cursor = bridge.cursor();
                    let start_row = if cursor.row > rows {
                        cursor.row - rows
                    } else {
                        0
                    };

                    for r in 0..rows {
                        let canvas_row = start_row + r;
                        if canvas_row >= crate::qemu::cursor::CANVAS_MAX_ROWS {
                            break;
                        }
                        let mut line = String::with_capacity(cols);
                        for c in 0..cols {
                            let idx = canvas_row * crate::qemu::cursor::CANVAS_COLS + c;
                            let ch = if idx < qemu_canvas.len() && qemu_canvas[idx] != 0 {
                                std::char::from_u32(qemu_canvas[idx]).unwrap_or(' ')
                            } else {
                                ' '
                            };
                            line.push(ch);
                        }
                        let trimmed = line.trim_end();
                        if !trimmed.is_empty() {
                            let y = r * char_h;
                            let mut cx = 0usize;
                            for ch in trimmed.chars() {
                                let code = ch as usize;
                                if code < 128 {
                                    let glyph = &crate::font::GLYPHS[code];
                                    for (gr, &glyph_row) in
                                        glyph.iter().enumerate().take(crate::font::GLYPH_H)
                                    {
                                        for gc in 0..crate::font::GLYPH_W {
                                            if glyph_row & (1 << (7 - gc)) != 0 {
                                                let px = cx + gc;
                                                let py = y + gr;
                                                if px < win_w && py < win_h {
                                                    let idx = py * win_w + px;
                                                    if idx < win.offscreen_buffer.len() {
                                                        win.offscreen_buffer[idx] = 0x44DD44;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                cx += char_w;
                                if cx >= win_w {
                                    break;
                                }
                            }
                        }
                    }
                }

                // Render beautiful radial-gradient desktop background
                for y in 0..256 {
                    let dy = (y as f32 - 128.0) / 128.0;
                    for x in 0..256 {
                        let dx = (x as f32 - 128.0) / 128.0;
                        let dist = (dx * dx + dy * dy).sqrt().min(1.0);
                        let r = (26.0 * (1.0 - dist) + 5.0 * dist) as u32;
                        let g = (26.0 * (1.0 - dist) + 5.0 * dist) as u32;
                        let b = (46.0 * (1.0 - dist) + 8.0 * dist) as u32;
                        vm.screen[y * 256 + x] = (r << 16) | (g << 8) | b;
                    }
                }

                // Blit active windows to screen
                vm.blit_windows();
            }
        }

        // Poll RISC-V output before showing prompt
        let mut console_data = Vec::new();
        let mut guest_halted = false;
        if let Some(ref handle) = riscv_handle {
            while let Ok(data) = handle.try_recv_console() {
                let s = String::from_utf8_lossy(&data).to_string();
                print!("{}", s);
                let _ = io::stdout().flush();
                console_data.push(s);
            }
            loop {
                match handle.try_recv_status() {
                    Ok(crate::riscv::live::VmStatus::Halted { reason, .. }) => {
                        println!("\n[riscv: halted: {}]", reason);
                        guest_halted = true;
                    },
                    Ok(_) => {},
                    Err(_) => break,
                }
            }
        }
        if guest_halted && riscv_user_path.is_some() {
            std::process::exit(0);
        }
        // Also buffer to global for socket access
        if !console_data.is_empty() {
            if let Ok(mut buf) = CONSOLE_BUF.lock() {
                buf.extend(console_data);
            }
        }

        // Process socket commands
        while let Ok((cmd, resp_tx)) = socket_cmd_rx.try_recv() {
            let resp = handle_socket_command(
                &cmd,
                &mut vm,
                &mut canvas_buffer,
                &mut canvas_assembled,
                &mut qemu_bridge,
                &mut riscv_handle,
                &mut source_text,
                &mut loaded_file,
                &mut cli_breakpoints,
            );
            let _ = resp_tx.send(resp);
        }

        let mut got_input = false;

        // Process stdin input
        match stdin_rx.try_recv() {
            Ok(line) => {
                got_input = true;
                prompt_shown = false;
                let cmd = line.trim();
                if cmd.is_empty() {
                    continue;
                }

                // If QEMU is running and user types a non-qemu command, forward to QEMU stdin
                if let Some(ref mut bridge) = qemu_bridge {
                    if bridge.is_alive()
                        && !cmd.starts_with("qemu")
                        && !cmd.starts_with("quit")
                        && !cmd.starts_with("exit")
                    {
                        // Forward the line to QEMU as stdin + newline
                        let _ = bridge.write_bytes(format!("{}\n", cmd).as_bytes());
                        // Give QEMU a moment to process
                        std::thread::sleep(std::time::Duration::from_millis(10));
                        // Read any output
                        let output = bridge.read_output_text();
                        if !output.is_empty() {
                            print!("{}", output);
                            let _ = io::stdout().flush();
                        }
                        continue;
                    }
                }

                let parts: Vec<&str> = cmd.split_whitespace().collect();
                if parts.is_empty() {
                    continue;
                }

                let command = parts[0].to_lowercase();
                match command.as_str() {
                    "help" | "?" => {
                        println!("Commands:");
                        println!("  list              List .asm programs");
                        println!("  load <file>       Load .asm source");
                        println!("  run               Assemble source & run VM");
                        println!("  regs              Show register dump");
                        println!("  peek <addr>       Read RAM[addr]");
                        println!("  poke <addr> <val> Write RAM[addr]");
                        println!("  screen <addr>     Dump 16 pixels from screen buffer");
                        println!("  reset             Reset VM state");
                        println!("  step              Step one instruction");
                        println!("  trace [n]         Execute n instructions with log");
                        println!("  bp [addr]         Toggle/list breakpoints");
                        println!("  who_wrote <x> <y> Pixel provenance: what wrote to (x,y)?");
                        println!("  steps_around <step> [radius]  Instruction trace around step");
                        println!("  bpc               Clear all breakpoints");
                        println!("  disasm [addr] [n] [--hex] [--labels]  Disassemble n instrs");
                        println!("  qemu boot <cfg>   Boot QEMU VM (e.g. qemu boot arch=riscv64 kernel=Image ram=256M)");
                        println!("  qemu kill         Kill running QEMU");
                        println!("  qemu status       Show QEMU status");
                        println!("  riscv run <path>  Launch RISC-V ELF on background thread");
                        println!("  riscv kill        Kill running RISC-V VM");
                        println!("  linux boot <cfg>  Boot Linux kernel natively (e.g. linux boot kernel=vmlinux)");
                        println!("  boot-png <file>   Load pixelpack PNG, decode to bytecode, run");
                        println!(
                            "  boot-src-png <file> Load source PNG, decode to text, assemble, run"
                        );
                        println!("  hermes <prompt>   Ask local LLM to write/run programs");
                        println!("  build <prompt>    Self-build: LLM modifies OS source code");
                        println!("  files             List Rust source files with line counts");
                        println!("  shell <command>   Run a host shell command");
                        println!("  readfile <path>   Read a host file");
                        println!("  quit              Exit");
                    },
                    "list" | "ls" => {
                        let files = list_asm_files("programs");
                        if files.is_empty() {
                            println!("  (no .asm files in programs/)");
                        } else {
                            for f in &files {
                                let name = Path::new(f)
                                    .file_name()
                                    .map(|n| n.to_string_lossy().to_string())
                                    .unwrap_or_else(|| f.clone());
                                println!("  {}", name);
                            }
                            println!("  {} programs", files.len());
                        }
                    },
                    "load" => {
                        if parts.len() < 2 {
                            println!("Usage: load <file.asm> or load <slot>");
                            continue;
                        }
                        let filename_arg = parts[1..].join(" ");
                        if filename_arg.ends_with(".asm")
                            || filename_arg.contains('/')
                            || filename_arg.contains('\\')
                        {
                            let filename = filename_arg.clone();
                            let path = Path::new(&filename);
                            let path = if path.exists() {
                                path.to_path_buf()
                            } else {
                                let prefixed = Path::new("programs").join(&filename);
                                if prefixed.exists() {
                                    prefixed
                                } else {
                                    println!("File not found: {}", filename);
                                    continue;
                                }
                            };
                            match std::fs::read_to_string(&path) {
                                Ok(src) => {
                                    let lines = src.lines().count();
                                    source_text = src;
                                    loaded_file = Some(path.clone());
                                    println!(
                                        "Loaded {} ({} lines)",
                                        path.file_name()
                                            .map(|n| n.to_string_lossy().into_owned())
                                            .unwrap_or_default(),
                                        lines
                                    );
                                },
                                Err(e) => {
                                    println!("Error: {}", e);
                                },
                            }
                        } else {
                            // Assume it's a state slot
                            let filename = format!("geometry_os_{}.sav", filename_arg);
                            match load_state(&filename) {
                                Ok((saved_vm, saved_canvas, saved_assembled)) => {
                                    vm = saved_vm;
                                    canvas_buffer = saved_canvas;
                                    canvas_assembled = saved_assembled;
                                    println!("Loaded state from {}", filename);
                                },
                                Err(_) => {
                                    // Fallback: try loading as .asm if slot not found
                                    let mut filename = filename_arg.clone();
                                    filename.push_str(".asm");
                                    let path = Path::new("programs").join(&filename);
                                    if path.exists() {
                                        if let Ok(src) = std::fs::read_to_string(&path) {
                                            source_text = src;
                                            loaded_file = Some(path.clone());
                                            println!("Loaded programs/{}", filename);
                                        } else {
                                            println!(
                                                "Slot {} not found and could not read .asm",
                                                filename_arg
                                            );
                                        }
                                    } else {
                                        println!("Slot or file {} not found", filename_arg);
                                    }
                                },
                            }
                        }
                    },
                    "boot-png" => {
                        if parts.len() < 2 {
                            println!("Usage: boot-png <file.png>");
                            println!(
                        "  Loads a pixelpack-encoded PNG (.png) or raw spatial PNG (.rts.png)."
                    );
                            continue;
                        }
                        let filename = parts[1..].join(" ");
                        let path = if Path::new(&filename).exists() {
                            filename.clone()
                        } else {
                            let prefixed = format!("programs/{}", filename);
                            if Path::new(&prefixed).exists() {
                                prefixed
                            } else {
                                println!("File not found: {}", filename);
                                continue;
                            }
                        };
                        // Route .rts.png to raw RGBA loader, everything else to pixelpack decoder
                        let result = if crate::pixel::is_rts_png(&path) {
                            crate::pixel::boot_from_rts_png(&path, &mut vm.ram, 0x1000)
                        } else {
                            crate::pixel::boot_from_png(&path, &mut vm.ram, 0x1000)
                        };
                        match result {
                            Ok(result) => {
                                let mode = if crate::pixel::is_rts_png(&path) {
                                    "rts"
                                } else {
                                    "pixelpack"
                                };
                                println!(
                                    "[pixel-boot:{} mode] Loaded {} bytes ({} RAM words) from {}",
                                    mode, result.byte_count, result.ram_words, path
                                );
                                vm.pc = 0x1000;
                                vm.halted = false;
                                loaded_file = Some(PathBuf::from(&path));
                                canvas_assembled = true;
                            },
                            Err(e) => {
                                println!("[pixel-boot] Error: {}", e);
                            },
                        }
                    },
                    "boot-src-png" => {
                        if parts.len() < 2 {
                            println!("Usage: boot-src-png <file.png>");
                            println!(
                                "  Loads a pixelpack-encoded source PNG, decodes to assembly text,"
                            );
                            println!("  writes to canvas, assembles to bytecode, and runs it.");
                            continue;
                        }
                        let filename = parts[1..].join(" ");
                        let path = if Path::new(&filename).exists() {
                            filename.clone()
                        } else {
                            let prefixed = format!("programs/{}", filename);
                            if Path::new(&prefixed).exists() {
                                prefixed
                            } else {
                                println!("File not found: {}", filename);
                                continue;
                            }
                        };
                        match crate::pixel::boot_source_png_to_ram(
                            &path,
                            &mut canvas_buffer,
                            &mut vm.ram,
                        ) {
                            Ok(result) => {
                                println!(
                            "[src-png-boot] Decoded {} chars ({} source bytes), assembled to {} bytecode words from {}",
                            result.char_count, result.source_len, result.bytecode_words, path
                        );
                                vm.canvas_buffer[..4096].copy_from_slice(&canvas_buffer[..4096]);
                                vm.pc = 0x1000;
                                vm.halted = false;
                                loaded_file = Some(PathBuf::from(&path));
                                canvas_assembled = true;
                            },
                            Err(e) => {
                                println!("[src-png-boot] Error: {}", e);
                            },
                        }
                    },
                    "run" => {
                        if source_text.is_empty() {
                            println!("No source loaded. Use 'load <file>' first.");
                            continue;
                        }
                        // Abstraction Layer: Preprocess macros and variables
                        let mut pp = preprocessor::Preprocessor::new();
                        let preprocessed_source = pp.preprocess(&source_text);

                        match assembler::assemble(&preprocessed_source, 0) {
                            Ok(asm_result) => {
                                // Store label map for label-aware disassembly
                                vm.set_label_map(&asm_result.labels, 0);

                                // Clear bytecode region (load at 0 so labels resolve correctly)
                                let ram_len = vm.ram.len();
                                let load_addr = 0usize;
                                for v in vm.ram[load_addr..ram_len.min(load_addr + 4096)].iter_mut()
                                {
                                    *v = 0;
                                }
                                for (i, &pixel) in asm_result.pixels.iter().enumerate() {
                                    let addr = load_addr + i;
                                    if addr < ram_len {
                                        vm.ram[addr] = pixel;
                                    }
                                }
                                vm.pc = load_addr as u32;
                                vm.halted = false;
                                // Phase 435: Store assembler labels
                                vm.populate_assembler_labels(&asm_result.labels, load_addr as u32);

                                println!(
                                    "Assembled {} bytes at 0x{:04X}",
                                    asm_result.pixels.len(),
                                    load_addr
                                );

                                // Phase 45: Sync canvas buffer TO VM before execution
                                vm.canvas_buffer.copy_from_slice(&canvas_buffer);

                                // Enable trace recording for pixel provenance
                                vm.trace_recording = true;

                                // Run the VM
                                let mut hit_bp = false;
                                for _ in 0..10_000_000 {
                                    if !vm.step() {
                                        break;
                                    }
                                    if vm.breakpoint_hit {
                                        hit_bp = true;
                                        break;
                                    }
                                    if cli_breakpoints.contains(&vm.pc) {
                                        hit_bp = true;
                                        break;
                                    }
                                }

                                // Phase 45: Sync canvas buffer FROM VM after execution
                                canvas_buffer.copy_from_slice(&vm.canvas_buffer);

                                // Disable trace recording after execution
                                vm.trace_recording = false;

                                if hit_bp {
                                    println!("BREAK @ PC=0x{:04X}", vm.pc);
                                } else if vm.halted {
                                    println!("Halted at PC=0x{:04X}", vm.pc);
                                } else {
                                    println!("Running... PC=0x{:04X}", vm.pc);
                                }
                                canvas_assembled = true;
                            },
                            Err(e) => {
                                println!("{}", e);
                            },
                        }
                    },
                    "regs" => {
                        for row_group in 0..4 {
                            let mut line = String::new();
                            for col in 0..8 {
                                let i = row_group * 8 + col;
                                line.push_str(&format!("r{:02}={:08X} ", i, vm.regs[i]));
                            }
                            println!("{}", line);
                        }
                        println!(
                            "PC={:04X} SP={:04X} LR={:04X}",
                            vm.pc, vm.regs[30], vm.regs[31]
                        );
                    },
                    "peek" => {
                        if parts.len() < 2 {
                            println!("Usage: peek <addr>");
                            continue;
                        }
                        match u32::from_str_radix(
                            parts[1].trim_start_matches("0x").trim_start_matches("0X"),
                            16,
                        ) {
                            Ok(addr) if (addr as usize) < vm.ram.len() => {
                                let val = vm.ram[addr as usize];
                                println!("RAM[0x{:04X}] = 0x{:08X}", addr, val);
                            },
                            Ok(addr) => {
                                println!("Address 0x{:04X} out of range", addr);
                            },
                            Err(_) => {
                                println!("Invalid address");
                            },
                        }
                    },
                    "poke" => {
                        if parts.len() < 3 {
                            println!("Usage: poke <addr> <val>");
                            continue;
                        }
                        let addr_str = parts[1].trim_start_matches("0x").trim_start_matches("0X");
                        let val_str = parts[2].trim_start_matches("0x").trim_start_matches("0X");
                        match (
                            u32::from_str_radix(addr_str, 16),
                            u32::from_str_radix(val_str, 16),
                        ) {
                            (Ok(addr), Ok(val)) if (addr as usize) < vm.ram.len() => {
                                vm.ram[addr as usize] = val;
                                println!("RAM[0x{:04X}] <- 0x{:08X}", addr, val);
                            },
                            _ => {
                                println!("Usage: poke <hex_addr> <hex_val>");
                            },
                        }
                    },
                    "screen" => {
                        // Dump 16 pixels from the screen buffer starting at addr
                        let start = if parts.len() >= 2 {
                            u32::from_str_radix(
                                parts[1].trim_start_matches("0x").trim_start_matches("0X"),
                                16,
                            )
                            .unwrap_or(0) as usize
                        } else {
                            0
                        };
                        for row in 0..4 {
                            let mut line = String::new();
                            for col in 0..4 {
                                let idx = start + row * 4 + col;
                                if idx < vm::SCREEN_SIZE {
                                    line.push_str(&format!("{:06X} ", vm.screen[idx] & 0xFFFFFF));
                                } else {
                                    line.push_str("------ ");
                                }
                            }
                            println!("{}", line);
                        }
                    },
                    "save" => {
                        let slot = parts.get(1).copied();
                        let filename = match slot {
                            Some(s) => format!("geometry_os_{}.sav", s),
                            None => SAVE_FILE.to_string(),
                        };
                        match save_state(&filename, &vm, &canvas_buffer, canvas_assembled) {
                            Ok(()) => println!("Saved state to {}", filename),
                            Err(e) => println!("Error saving state: {}", e),
                        }
                    },
                    "ppm" => {
                        let filename = if parts.len() >= 2 {
                            parts[1].to_string()
                        } else {
                            "output.ppm".to_string()
                        };
                        match std::fs::File::create(&filename) {
                            Ok(mut f) => {
                                // PPM P6 format
                                let header = "P6\n256 256\n255\n".to_string();
                                use std::io::Write;
                                if f.write_all(header.as_bytes()).is_err() {
                                    println!("Error writing PPM header");
                                    continue;
                                }
                                for pixel in &vm.screen {
                                    let r = (pixel >> 16) & 0xFF;
                                    let g = (pixel >> 8) & 0xFF;
                                    let b = pixel & 0xFF;
                                    if f.write_all(&[r as u8, g as u8, b as u8]).is_err() {
                                        println!("Error writing PPM data");
                                        break;
                                    }
                                }
                                println!("Saved screen to {}", filename);
                            },
                            Err(e) => println!("Error saving: {}", e),
                        }
                    },
                    "step" => {
                        if vm.halted {
                            println!("VM halted. Use reset to restart.");
                        } else {
                            // Phase 45: Sync canvas buffer TO VM before execution
                            vm.canvas_buffer.copy_from_slice(&canvas_buffer);

                            vm.step();

                            // Phase 45: Sync canvas buffer FROM VM after execution
                            canvas_buffer.copy_from_slice(&vm.canvas_buffer);

                            println!("step -> PC=0x{:04X}", vm.pc);
                        }
                    },
                    "bp" => {
                        if parts.len() < 2 {
                            if cli_breakpoints.is_empty() {
                                println!("  No breakpoints set");
                            } else {
                                for &addr in &cli_breakpoints {
                                    println!("  BP @ 0x{:04X}", addr);
                                }
                            }
                        } else {
                            match u32::from_str_radix(
                                parts[1].trim_start_matches("0x").trim_start_matches("0X"),
                                16,
                            ) {
                                Ok(addr) => {
                                    if let Some(pos) =
                                        cli_breakpoints.iter().position(|&a| a == addr)
                                    {
                                        cli_breakpoints.remove(pos);
                                        println!("Cleared BP @ 0x{:04X}", addr);
                                    } else {
                                        cli_breakpoints.push(addr);
                                        println!("Set BP @ 0x{:04X}", addr);
                                    }
                                },
                                Err(_) => println!("Invalid address"),
                            }
                        }
                    },
                    "bpc" => {
                        cli_breakpoints.clear();
                        println!("Breakpoints cleared");
                    },
                    "trace" => {
                        // trace [count] — execute N instructions, logging each one
                        let count = if parts.len() >= 2 {
                            parts[1].parse::<usize>().unwrap_or(20)
                        } else {
                            20
                        };
                        if vm.halted {
                            println!("VM halted. Use reset to restart.");
                        } else {
                            for i in 0..count {
                                let addr_before = vm.pc;
                                let (mnemonic, _len) = vm.disassemble_at(vm.pc);
                                if !vm.step() {
                                    println!(
                                        "{:04} {:04X} {:30} -> HALTED",
                                        i, addr_before, mnemonic
                                    );
                                    break;
                                }
                                // Show non-zero registers (up to 4 most interesting)
                                let mut reg_info = String::new();
                                let mut shown = 0;
                                // Always show PC and any regs that were likely modified
                                for r in 0..8 {
                                    if vm.regs[r] != 0 && shown < 4 {
                                        reg_info.push_str(&format!(" r{}={:X}", r, vm.regs[r]));
                                        shown += 1;
                                    }
                                }
                                if reg_info.is_empty() {
                                    reg_info = " (no regs changed)".to_string();
                                }
                                println!(
                                    "{:04} {:04X} {:30} -> {:04X}{}",
                                    i, addr_before, mnemonic, vm.pc, reg_info
                                );
                                if cli_breakpoints.contains(&vm.pc) {
                                    println!("BREAK @ PC=0x{:04X}", vm.pc);
                                    break;
                                }
                            }
                        }
                    },
                    "who_wrote" => {
                        // who_wrote <x> <y> -- pixel provenance query
                        if parts.len() < 3 {
                            println!("Usage: who_wrote <x> <y>");
                            continue;
                        }
                        let x: u16 = match parts[1].parse() {
                            Ok(v) if v < 256 => v,
                            _ => {
                                println!("x must be 0-255");
                                continue;
                            },
                        };
                        let y: u16 = match parts[2].parse() {
                            Ok(v) if v < 256 => v,
                            _ => {
                                println!("y must be 0-255");
                                continue;
                            },
                        };
                        let total_writes = vm.pixel_write_log.count_at(x, y);
                        let current_color = vm.screen[y as usize * 256 + x as usize];
                        let buffer_full = vm.pixel_write_log.is_full();
                        if total_writes == 0 {
                            if current_color != 0 {
                                println!(
                                    "Pixel ({},{}) has 0 recorded writes BUT is colored 0x{:08X}!",
                                    x, y, current_color
                                );
                                println!(
                                    "WARNING: pixel is colored but provenance data was evicted."
                                );
                            } else {
                                println!("Pixel ({},{}) was never written (black/initial)", x, y);
                            }
                            println!("  Current color: 0x{:08X}", current_color);
                        } else {
                            let caveat = if buffer_full {
                                " (buffer full -- earlier writes may exist)"
                            } else {
                                ""
                            };
                            println!(
                                "Pixel ({},{}) was written {} time(s){}:",
                                x, y, total_writes, caveat
                            );
                            let entries = vm.pixel_write_log.recent_at(x, y, 10);
                            for (i, entry) in entries.iter().enumerate() {
                                let op_name = crate::hermes::opcode_name(entry.opcode);
                                let label = if i == 0 { "last" } else { "prev" };
                                println!(
                                    "  [{}] {} at step {} wrote color 0x{:08X}",
                                    label,
                                    op_name,
                                    entry.step(),
                                    entry.color
                                );
                            }
                            println!("  Current color: 0x{:08X}", current_color);
                        }
                    },
                    "steps_around" => {
                        // steps_around <step> [radius=5]
                        if parts.len() < 2 {
                            println!("Usage: steps_around <step> [radius=5]");
                            continue;
                        }
                        let step: u64 = match parts[1].parse() {
                            Ok(v) => v,
                            Err(_) => {
                                println!("Invalid step");
                                continue;
                            },
                        };
                        let radius: u64 = if parts.len() >= 3 {
                            parts[2].parse().unwrap_or(5)
                        } else {
                            5
                        };
                        let entries = vm.trace_buffer.range_around(step, radius);
                        if entries.is_empty() {
                            let total = vm.trace_buffer.len();
                            if total == 0 {
                                println!("Trace buffer empty. Run a program first.");
                            } else {
                                println!(
                                    "No trace entries around step {}. Buffer has {} entries.",
                                    step, total
                                );
                            }
                            continue;
                        }
                        println!(
                            "=== Instruction trace around step {} (radius={}) ===",
                            step, radius
                        );
                        for entry in &entries {
                            let marker = if entry.step_number == step {
                                ">>>"
                            } else {
                                "   "
                            };
                            let name = crate::hermes::opcode_name(entry.opcode as u8);
                            println!(
                        "{} step {:5} PC=0x{:04X} {:10} r0={:08X} r1={:08X} r2={:08X} r3={:08X}",
                        marker,
                        entry.step_number,
                        entry.pc,
                        name,
                        entry.regs[0],
                        entry.regs[1],
                        entry.regs[2],
                        entry.regs[3]
                    );
                        }
                    },
                    "disasm" => {
                        // disasm [addr] [count] [--hex] [--labels]
                        // Flags: --hex = show raw bytecode, --labels = resolve labels
                        let mut flags: Vec<&str> = Vec::new();
                        let mut positional: Vec<&str> = Vec::new();
                        for p in &parts[1..] {
                            if p.starts_with("--") {
                                flags.push(p);
                            } else {
                                positional.push(p);
                            }
                        }
                        let show_hex = flags.contains(&"--hex");
                        let use_labels = flags.contains(&"--labels");
                        let start_addr = if !positional.is_empty() {
                            u32::from_str_radix(positional[0].trim_start_matches("0x"), 16)
                                .unwrap_or(vm.pc)
                        } else {
                            vm.pc
                        };
                        let count = if positional.len() >= 2 {
                            positional[1].parse::<usize>().unwrap_or(10)
                        } else {
                            10
                        };

                        if show_hex || use_labels {
                            // Use stored real labels if available, otherwise build synthetic ones
                            let labels = if use_labels {
                                if vm.assembler_labels.is_empty() {
                                    Some(vm.build_label_map())
                                } else {
                                    Some(vm.assembler_labels.clone())
                                }
                            } else {
                                None
                            };
                            let lines = vm.disassemble_range(start_addr, count, labels.as_ref());
                            for line in &lines {
                                println!("{}", line);
                            }
                        } else {
                            // Original simple mode
                            let mut addr = start_addr;
                            for _ in 0..count {
                                if addr as usize >= vm.ram.len() {
                                    break;
                                }
                                let (mnemonic, len) = vm.disassemble_at(addr);
                                let marker = if addr == vm.pc { ">" } else { " " };
                                println!(" {}{:04X} {}", marker, addr, mnemonic);
                                addr += len as u32;
                            }
                        }
                    },
                    "reset" => {
                        vm.reset();
                        canvas_assembled = false;
                        println!("VM reset");
                    },
                    "hermes" => {
                        if parts.len() < 2 {
                            println!("Usage: hermes <prompt>");
                            println!("  Starts an agent loop driven by a local LLM.");
                            println!("  The LLM can run geo> commands to accomplish tasks.");
                            println!("  Requires Ollama running locally (qwen3.5-tools).");
                            continue;
                        }
                        let user_prompt = parts[1..].join(" ");
                        run_hermes_loop(
                            &user_prompt,
                            &mut vm,
                            &mut source_text,
                            &mut loaded_file,
                            &mut canvas_assembled,
                        );
                    },
                    "build" => {
                        if parts.len() < 2 {
                            println!("Usage: build <prompt>");
                            println!(
                                "  Self-build: LLM reads Rust source, makes changes, runs tests."
                            );
                            println!("  The OS modifying itself from inside itself.");
                            println!("  Requires Ollama running locally (qwen3.5-tools).");
                            continue;
                        }
                        let user_prompt = parts[1..].join(" ");
                        run_build_loop(
                            &user_prompt,
                            &mut vm,
                            &mut source_text,
                            &mut loaded_file,
                            &mut canvas_assembled,
                        );
                    },
                    "qemu" => {
                        let subcmd = parts.get(1).copied().unwrap_or("");
                        match subcmd {
                            "boot" => {
                                if parts.len() < 3 {
                                    println!("Usage: qemu boot <config>");
                                    println!(
                                "  e.g. qemu boot arch=riscv64 kernel=/path/to/Image ram=256M"
                            );
                                    println!("  e.g. qemu boot arch=riscv64 kernel=Image initrd=initrd.gz append='console=ttyS0'");
                                    continue;
                                }
                                // Kill any existing QEMU first
                                if let Some(ref mut bridge) = qemu_bridge {
                                    let _ = bridge.kill();
                                }
                                qemu_bridge = None;

                                let mut config_str = parts[2..].join(" ");
                                // Auto-decode .rts.png files to temp files
                                config_str = resolve_pixel_paths(&config_str);
                                match QemuBridge::spawn(&config_str) {
                                    Ok(mut bridge) => {
                                        // Drain QEMU boot output. OpenSBI starts ~1s,
                                        // kernel+rootfs can take 5-10s for first output.
                                        let boot_start = std::time::Instant::now();
                                        let drain_timeout = std::time::Duration::from_secs(10);
                                        let mut got_output = false;
                                        while boot_start.elapsed() < drain_timeout {
                                            std::thread::sleep(std::time::Duration::from_millis(
                                                200,
                                            ));
                                            let output = bridge.read_output_text();
                                            if !output.is_empty() {
                                                print!("{}", output);
                                                let _ = io::stdout().flush();
                                                got_output = true;
                                                // Once we get output, keep draining for 2 more seconds
                                                let drain_more = std::time::Duration::from_secs(2);
                                                let drain_start = std::time::Instant::now();
                                                while drain_start.elapsed() < drain_more {
                                                    std::thread::sleep(
                                                        std::time::Duration::from_millis(100),
                                                    );
                                                    let more = bridge.read_output_text();
                                                    if !more.is_empty() {
                                                        print!("{}", more);
                                                        let _ = io::stdout().flush();
                                                    }
                                                }
                                                break;
                                            }
                                        }
                                        if !got_output {
                                            println!(
                                        "[qemu] No output after 10s -- QEMU may still be booting"
                                    );
                                        }
                                        qemu_bridge = Some(bridge);
                                        println!("[qemu] Booted: {}", config_str);
                                        let _ = io::stdout().flush();
                                    },
                                    Err(e) => {
                                        println!("[qemu] Error: {}", e);
                                    },
                                }
                            },
                            "kill" => {
                                if let Some(ref mut bridge) = qemu_bridge {
                                    match bridge.kill() {
                                        Ok(()) => println!("[qemu] Killed"),
                                        Err(e) => println!("[qemu] Kill error: {}", e),
                                    }
                                    qemu_bridge = None;
                                } else {
                                    println!("[qemu] No QEMU running");
                                }
                            },
                            "status" => match qemu_bridge {
                                Some(ref mut bridge) => {
                                    if bridge.is_alive() {
                                        let cursor = bridge.cursor();
                                        println!(
                                            "[qemu] Running (cursor: row={}, col={})",
                                            cursor.row, cursor.col
                                        );
                                    } else {
                                        println!("[qemu] Process exited");
                                        qemu_bridge = None;
                                    }
                                },
                                None => println!("[qemu] Not running"),
                            },
                            "traps" => {
                                let sub = parts.get(2).copied().unwrap_or("");
                                if sub == "analyze" || sub == "ai" {
                                    // ── AI-driven behavioral analysis ──
                                    let log_path = std::env::temp_dir().join("geo_qemu_trace.log");
                                    match std::fs::read_to_string(&log_path) {
                                        Ok(content) => {
                                            let lines: Vec<&str> = content.lines().collect();
                                            let total = lines.len();
                                            if total == 0 {
                                                println!("[qemu] Trace log is empty (boot with trace=int to enable)");
                                            } else {
                                                // Parse all entries
                                                let mut entries: Vec<TrapEntry> =
                                                    Vec::with_capacity(total);
                                                for line in &lines {
                                                    if let Some(r) = parse_trap_line(line) {
                                                        entries.push(r);
                                                    }
                                                }
                                                let n = entries.len();
                                                if n == 0 {
                                                    println!("[qemu] No parseable entries found");
                                                } else {
                                                    analyze_traps(&entries);
                                                }
                                            }
                                        },
                                        Err(_) => {
                                            println!(
                                        "[qemu] No trace log found (boot with trace=int to enable)"
                                    );
                                        },
                                    }
                                } else {
                                    // ── Raw trap view (original behavior) ──
                                    let n: usize =
                                        sub.parse().unwrap_or(if sub.is_empty() { 20 } else { 0 });
                                    let log_path = std::env::temp_dir().join("geo_qemu_trace.log");
                                    match std::fs::read_to_string(&log_path) {
                                        Ok(content) => {
                                            let lines: Vec<&str> = content.lines().collect();
                                            let total = lines.len();
                                            if total == 0 {
                                                println!("[qemu] Trace log is empty (boot with trace=int to enable)");
                                            } else {
                                                // Count trap types
                                                let mut counts: std::collections::HashMap<
                                                    &str,
                                                    usize,
                                                > = std::collections::HashMap::new();
                                                for line in &lines {
                                                    if let Some(idx) = line.find("desc=") {
                                                        let desc = &line[idx + 5..];
                                                        *counts.entry(desc).or_insert(0) += 1;
                                                    }
                                                }
                                                println!(
                                                    "[qemu] Trace log: {} entries, {} trap types",
                                                    total,
                                                    counts.len()
                                                );
                                                // Show top trap types
                                                let mut sorted: Vec<_> = counts.iter().collect();
                                                sorted.sort_by(|a, b| b.1.cmp(a.1));
                                                for (desc, count) in sorted.iter().take(5) {
                                                    println!("  {:>6}x {}", count, desc);
                                                }
                                                // Show last N entries
                                                println!("\nLast {} entries:", n.min(total));
                                                for line in lines.iter().rev().take(n).rev() {
                                                    if let Some(idx) = line.find("cause:") {
                                                        let short = &line[idx..];
                                                        println!("  {}", short);
                                                    } else {
                                                        println!("  {}", line);
                                                    }
                                                }
                                            }
                                        },
                                        Err(_) => {
                                            println!(
                                        "[qemu] No trace log found (boot with trace=int to enable)"
                                    );
                                        },
                                    }
                                }
                            },
                            _ => {
                                println!("Usage: qemu <boot|kill|status|traps>");
                                println!(
                                    "  qemu boot arch=riscv64 kernel=Image ram=256M [trace=int]"
                                );
                                println!(
                                    "  qemu traps [N]               -- show last N trap entries"
                                );
                                println!("  qemu traps analyze           -- AI-driven behavioral analysis");
                            },
                        }
                    },
                    "riscv" => {
                        let subcmd = parts.get(1).copied().unwrap_or("");
                        match subcmd {
                            "run" => {
                                let mut use_user_mode = false;
                                let mut ram_mb = 1u32;
                                let mut ram_base = 0x8000_0000u64;
                                let mut path: Option<&str> = None;

                                for &arg in &parts[2..] {
                                    if arg == "--user" {
                                        use_user_mode = true;
                                    } else if arg.starts_with("ram=") {
                                        let val = &arg["ram=".len()..];
                                        ram_mb = if val.ends_with('M') || val.ends_with('m') {
                                            val[..val.len() - 1].parse().unwrap_or(1)
                                        } else if val.ends_with('K') || val.ends_with('k') {
                                            val[..val.len() - 1].parse().unwrap_or(1) / 1024
                                        } else {
                                            val.parse().unwrap_or(1)
                                        };
                                    } else if arg.starts_with("base=") {
                                        let val = &arg["base=".len()..];
                                        ram_base = if val.starts_with("0x") || val.starts_with("0X")
                                        {
                                            u64::from_str_radix(&val[2..], 16)
                                                .unwrap_or(0x8000_0000)
                                        } else {
                                            val.parse().unwrap_or(0x8000_0000)
                                        };
                                    } else if path.is_none() && !arg.is_empty() {
                                        path = Some(arg);
                                    }
                                }

                                let Some(path) = path else {
                                    println!("Usage: riscv run [--user] [ram=<N>[M]] [base=<addr>] <path>");
                                    continue;
                                };
                                match std::fs::read(path) {
                                    Ok(elf_data) => {
                                        // Kill existing first
                                        riscv_handle = None;

                                        let mut config = VmThreadConfig {
                                            mode: GuestMode::Elf(elf_data),
                                            ram_size: (ram_mb as usize) * 1024 * 1024,
                                            ram_base,
                                            ..Default::default()
                                        };
                                        if use_user_mode {
                                            config.initial_privilege =
                                                Some(crate::riscv::cpu::Privilege::User);
                                        }
                                        match spawn_vm_thread(config) {
                                            Ok(h) => {
                                                riscv_handle = Some(h);
                                                println!(
                                            "[riscv] Launched {} (mode={} ram={}M base={:#x})",
                                            path,
                                            if use_user_mode { "User" } else { "Machine" },
                                            ram_mb,
                                            ram_base
                                        );
                                            },
                                            Err(e) => println!("[riscv] Error: {}", e),
                                        }
                                    },
                                    Err(e) => println!("Error reading {}: {}", path, e),
                                }
                            },
                            "kill" => {
                                if riscv_handle.is_some() {
                                    riscv_handle = None;
                                    println!("[riscv] Killed");
                                } else {
                                    println!("[riscv] Not running");
                                }
                            },
                            "input" => {
                                if parts.len() < 3 {
                                    println!("Usage: riscv input <text>");
                                } else if let Some(ref handle) = riscv_handle {
                                    let text = parts[2..].join(" ");
                                    for byte in text.bytes() {
                                        let _ = handle.send_input(byte);
                                    }
                                    let _ = handle.send_input(b'\n');
                                    println!("[sent {} bytes + newline]", text.len());
                                } else {
                                    println!("[no riscv VM running]");
                                }
                            },
                            "console" => {
                                if let Some(ref handle) = riscv_handle {
                                    let mut total = 0;
                                    while let Ok(data) = handle.try_recv_console() {
                                        if let Ok(s) = String::from_utf8(data) {
                                            print!("{}", s);
                                        }
                                        total += 1;
                                        if total > 200 {
                                            break;
                                        }
                                    }
                                    if total == 0 {
                                        println!("[no pending console output]");
                                    }
                                } else {
                                    println!("[no riscv VM running]");
                                }
                            },
                            _ => println!("Unknown riscv subcommand: {}", subcmd),
                        }
                    },
                    "linux" => {
                        let subcmd = parts.get(1).copied().unwrap_or("");
                        match subcmd {
                            "boot" => {
                                if parts.len() < 3 {
                                    println!("Usage: linux boot <cfg>");
                                    println!("  e.g. linux boot kernel=vmlinux initrd=initrd.cpio ram=128");
                                    continue;
                                }
                                let mut kernel_path = String::new();
                                let mut initrd_path = None;
                                let mut ram_mb = 768u32;
                                let mut bootargs = "console=ttyS0 nosmp".to_string();

                                for part in &parts[2..] {
                                    if part.starts_with("kernel=") {
                                        kernel_path = part["kernel=".len()..].to_string();
                                    } else if part.starts_with("initrd=") {
                                        initrd_path = Some(part["initrd=".len()..].to_string());
                                    } else if part.starts_with("ram=") {
                                        ram_mb = part["ram=".len()..].parse().unwrap_or(768);
                                    } else if part.starts_with("bootargs=") {
                                        bootargs = part["bootargs=".len()..].to_string();
                                    }
                                }

                                if kernel_path.is_empty() {
                                    // Default to embedded Pixel Linux kernel
                                    kernel_path = "vmlinux (embedded)".to_string();
                                    let kernel_data =
                                        crate::embed_vmlinux::PIXEL_LINUX_KERNEL.to_vec();
                                    let initrd_data = None;
                                    riscv_handle = None;
                                    let config = VmThreadConfig {
                                        mode: GuestMode::Linux {
                                            kernel: kernel_data,
                                            initrd: initrd_data,
                                            bootargs,
                                        },
                                        ram_size: (ram_mb as usize) * 1024 * 1024,
                                        ..Default::default()
                                    };
                                    match spawn_vm_thread(config) {
                                        Ok(h) => {
                                            riscv_handle = Some(h);
                                            println!("[linux] Booting embedded Pixel Linux kernel ({})...", crate::embed_vmlinux::KERNEL_SIZE);
                                        },
                                        Err(e) => println!("[linux] Error: {}", e),
                                    }
                                } else {
                                    match std::fs::read(&kernel_path) {
                                        Ok(kernel_data) => {
                                            let initrd_data = if let Some(ref p) = initrd_path {
                                                std::fs::read(p).ok()
                                            } else {
                                                None
                                            };
                                            // Kill existing
                                            riscv_handle = None;

                                            let config = VmThreadConfig {
                                                mode: GuestMode::Linux {
                                                    kernel: kernel_data,
                                                    initrd: initrd_data,
                                                    bootargs,
                                                },
                                                ram_size: (ram_mb as usize) * 1024 * 1024,
                                                ..Default::default()
                                            };

                                            match spawn_vm_thread(config) {
                                                Ok(h) => {
                                                    riscv_handle = Some(h);
                                                    println!("[linux] Booting {}...", kernel_path);
                                                },
                                                Err(e) => println!("[linux] Error: {}", e),
                                            }
                                        },
                                        Err(e) => {
                                            println!("Error reading kernel {}: {}", kernel_path, e)
                                        },
                                    }
                                }
                            },
                            _ => println!("Unknown linux subcommand: {}", subcmd),
                        }
                    },
                    "quit" | "exit" => {
                        // Clean up QEMU
                        if let Some(ref mut bridge) = qemu_bridge {
                            let _ = bridge.kill();
                        }
                        break;
                    },
                    "files" => {
                        let mut entries = Vec::new();
                        if let Ok(rd) = std::fs::read_dir("src") {
                            for entry in rd.flatten() {
                                let p = entry.path();
                                if p.extension().map(|e| e == "rs").unwrap_or(false) {
                                    if let Ok(content) = std::fs::read_to_string(&p) {
                                        let lines = content.lines().count();
                                        let name = p.file_name().unwrap().to_string_lossy();
                                        entries.push((name.to_string(), lines));
                                    }
                                }
                            }
                        }
                        entries.sort_by(|a, b| a.0.cmp(&b.0));
                        let mut total = 0;
                        for (name, lines) in &entries {
                            println!("  src/{:<25} {:>5} lines", name, lines);
                            total += lines;
                        }
                        println!("  {} source files, {} total lines", entries.len(), total);
                    },
                    "shell" => {
                        let cmd_rest = parts[1..].join(" ");
                        if cmd_rest.is_empty() {
                            println!("Usage: shell <command>");
                            continue;
                        }
                        match std::process::Command::new("sh")
                            .arg("-c")
                            .arg(&cmd_rest)
                            .current_dir(
                                std::env::current_dir()
                                    .unwrap_or_else(|_| std::path::PathBuf::from(".")),
                            )
                            .output()
                        {
                            Ok(out) => {
                                let stdout = String::from_utf8_lossy(&out.stdout);
                                let stderr = String::from_utf8_lossy(&out.stderr);
                                if !stdout.is_empty() {
                                    print!("{}", stdout);
                                }
                                if !stderr.is_empty() {
                                    eprint!("{}", stderr);
                                }
                                println!("[exit {}]", out.status.code().unwrap_or(-1));
                            },
                            Err(e) => println!("Shell error: {}", e),
                        }
                    },
                    "readfile" => {
                        if parts.len() < 2 {
                            println!("Usage: readfile <path>");
                            continue;
                        }
                        let path = parts[1..].join(" ");
                        match std::fs::read_to_string(&path) {
                            Ok(content) => {
                                let total_lines = content.lines().count();
                                let total_chars = content.len();
                                if content.len() > 3000 {
                                    let truncated: String = content.chars().take(3000).collect();
                                    println!("{}...", truncated);
                                    println!(
                                        "[{} lines, {} chars total, showing first 3000]",
                                        total_lines, total_chars
                                    );
                                } else {
                                    print!("{}", content);
                                }
                            },
                            Err(e) => println!("Error reading {}: {}", path, e),
                        }
                    },
                    _ => {
                        println!("Unknown: {} (try help)", command);
                    },
                }
            },
            Err(std::sync::mpsc::TryRecvError::Disconnected) => {
                // stdin closed (running headless via socket), continue processing socket commands
                std::thread::sleep(std::time::Duration::from_millis(10));
            },
            Err(std::sync::mpsc::TryRecvError::Empty) => {},
        }

        if !got_input {
            if !prompt_shown {
                print!("geo> ");
                let _ = io::stdout().flush();
                prompt_shown = true;
            }
            std::thread::sleep(Duration::from_millis(10));
        }
    }
}

fn handle_socket_command(
    cmd: &str,
    vm: &mut vm::Vm,
    canvas_buffer: &mut Vec<u32>,
    canvas_assembled: &mut bool,
    qemu_bridge: &mut Option<QemuBridge>,
    riscv_handle: &mut Option<crate::riscv::live::RiscvVmHandle>,
    source_text: &mut String,
    loaded_file: &mut Option<PathBuf>,
    cli_breakpoints: &mut Vec<u32>,
) -> String {
    let _ = loaded_file;
    let mut response = String::new();
    let line = cmd.trim();
    if line.is_empty() {
        return response;
    }

    let parts: Vec<&str> = line.split_whitespace().collect();
    if parts.is_empty() {
        return response;
    }

    let command = parts[0].to_lowercase();
    match command.as_str() {
        "status" => {
            response.push_str(&format!(
                "mode=cli running={} assembled={} pc=0x{:04X}\n",
                !vm.halted, *canvas_assembled, vm.pc
            ));
        },
        "run" => {
            if source_text.is_empty() {
                response.push_str("[no source loaded]\n");
            } else {
                let mut pp = crate::preprocessor::Preprocessor::new();
                let preprocessed_source = pp.preprocess(source_text);
                match crate::assembler::assemble(&preprocessed_source, 0) {
                    Ok(asm_result) => {
                        // Store label map for label-aware disassembly
                        vm.set_label_map(&asm_result.labels, 0);

                        let ram_len = vm.ram.len();
                        let load_addr = 0usize;
                        for v in vm.ram[load_addr..ram_len.min(load_addr + 4096)].iter_mut() {
                            *v = 0;
                        }
                        for (i, &pixel) in asm_result.pixels.iter().enumerate() {
                            let addr = load_addr + i;
                            if addr < ram_len {
                                vm.ram[addr] = pixel;
                            }
                        }
                        vm.pc = load_addr as u32;
                        vm.halted = false;
                        vm.populate_assembler_labels(&asm_result.labels, load_addr as u32);
                        let cb_len = vm.canvas_buffer.len().min(canvas_buffer.len());
                        vm.canvas_buffer[..cb_len].copy_from_slice(&canvas_buffer[..cb_len]);
                        vm.trace_recording = true;
                        let mut hit_bp = false;
                        for _ in 0..10_000_000 {
                            if !vm.step() {
                                break;
                            }
                            if vm.breakpoint_hit {
                                hit_bp = true;
                                break;
                            }
                            if cli_breakpoints.contains(&vm.pc) {
                                hit_bp = true;
                                break;
                            }
                        }
                        canvas_buffer[..cb_len].copy_from_slice(&vm.canvas_buffer[..cb_len]);
                        vm.trace_recording = false;
                        if hit_bp {
                            response.push_str(&format!("BREAK @ PC=0x{:04X}\n", vm.pc));
                        } else if vm.halted {
                            response.push_str(&format!("Halted at PC=0x{:04X}\n", vm.pc));
                        } else {
                            response.push_str(&format!("Running... PC=0x{:04X}\n", vm.pc));
                        }
                        *canvas_assembled = true;
                    },
                    Err(e) => {
                        response.push_str(&format!("ASM ERROR line {}: {}\n", e.line, e.message));
                    },
                }
            }
        },
        "run_program" => {
            let mut frames = 10000usize;
            let source = if parts.len() >= 3 {
                if let Ok(f) = parts.last().unwrap().parse::<usize>() {
                    frames = f;
                    parts[1..parts.len() - 1].join(" ")
                } else {
                    parts[1..].join(" ")
                }
            } else if parts.len() == 2 {
                parts[1].to_string()
            } else {
                String::new()
            };
            if source.is_empty() {
                response.push_str("[usage: run_program <source> [frames]]\n");
            } else {
                *source_text = source.replace("\\n", "\n");
                canvas_buffer.fill(0);
                let mut row = 0usize;
                let mut col = 0usize;
                const CLI_CANVAS_COLS: usize = 64;
                for ch in source_text.chars() {
                    if ch == '\n' {
                        row += 1;
                        col = 0;
                        if row >= canvas_buffer.len() / CLI_CANVAS_COLS {
                            break;
                        }
                    } else if col < CLI_CANVAS_COLS {
                        let idx = row * CLI_CANVAS_COLS + col;
                        if idx < canvas_buffer.len() {
                            canvas_buffer[idx] = ch as u32;
                        }
                        col += 1;
                    }
                }
                let mut pp = crate::preprocessor::Preprocessor::new();
                let preprocessed_source = pp.preprocess(source_text);
                match crate::assembler::assemble(&preprocessed_source, 0) {
                    Ok(asm_result) => {
                        let ram_len = vm.ram.len();
                        for v in vm.ram[..ram_len.min(4096)].iter_mut() {
                            *v = 0;
                        }
                        for (i, &pixel) in asm_result.pixels.iter().enumerate() {
                            if i < ram_len {
                                vm.ram[i] = pixel;
                            }
                        }
                        vm.pc = 0;
                        vm.halted = false;
                        vm.populate_assembler_labels(&asm_result.labels, 0);
                        let cb_len = vm.canvas_buffer.len().min(canvas_buffer.len());
                        vm.canvas_buffer[..cb_len].copy_from_slice(&canvas_buffer[..cb_len]);
                        let mut halted = false;
                        for _ in 0..frames {
                            if !vm.step() {
                                halted = true;
                                break;
                            }
                        }
                        canvas_buffer[..cb_len].copy_from_slice(&vm.canvas_buffer[..cb_len]);
                        let checksum: u64 = vm.screen.iter().map(|&v| v as u64).sum();
                        response
                            .push_str(&format!("status=pc=0x{:04X} halted={}\n", vm.pc, halted));
                        for i in 0..32 {
                            response.push_str(&format!("r{:02}={:08X}\n", i, vm.regs[i]));
                        }
                        response.push_str(&format!("screen_checksum={:016X}\n", checksum));
                        *canvas_assembled = true;
                    },
                    Err(e) => {
                        response.push_str(&format!("ASM ERROR line {}: {}\n", e.line, e.message));
                    },
                }
            }
        },
        "assemble" | "asm" | "asm_assemble" => {
            if source_text.is_empty() {
                response.push_str("[no source loaded]\n");
            } else {
                let mut pp = crate::preprocessor::Preprocessor::new();
                let preprocessed_source = pp.preprocess(source_text);
                match crate::assembler::assemble(&preprocessed_source, 0) {
                    Ok(asm_result) => {
                        let ram_len = vm.ram.len();
                        for v in vm.ram[..ram_len.min(4096)].iter_mut() {
                            *v = 0;
                        }
                        for (i, &pixel) in asm_result.pixels.iter().enumerate() {
                            if i < ram_len {
                                vm.ram[i] = pixel;
                            }
                        }
                        vm.pc = 0;
                        vm.halted = false;
                        vm.populate_assembler_labels(&asm_result.labels, 0);
                        *canvas_assembled = true;
                        response
                            .push_str(&format!("Assembled {} words\n", asm_result.pixels.len()));
                    },
                    Err(e) => {
                        response.push_str(&format!("ASM ERROR line {}: {}\n", e.line, e.message));
                    },
                }
            }
        },
        "load_asm" => {
            if parts.len() < 2 {
                response.push_str("[usage: load_asm <path> [base_addr]]\n");
            } else {
                let path = parts[1];
                let base_addr = if parts.len() >= 3 {
                    usize::from_str_radix(parts[2].trim_start_matches("0x"), 16).unwrap_or(0x1000)
                } else {
                    0x1000
                };
                match std::fs::read_to_string(path) {
                    Ok(source) => {
                        let mut pp = crate::preprocessor::Preprocessor::new();
                        let preprocessed = pp.preprocess(&source);
                        match crate::assembler::assemble(&preprocessed, base_addr) {
                            Ok(asm_result) => {
                                let clear_end = (base_addr + 4096).min(vm.ram.len());
                                for v in vm.ram[base_addr..clear_end].iter_mut() {
                                    *v = 0;
                                }
                                for (i, &pixel) in asm_result.pixels.iter().enumerate() {
                                    let addr = base_addr + i;
                                    if addr < vm.ram.len() {
                                        vm.ram[addr] = pixel;
                                    }
                                }
                                vm.pc = base_addr as u32;
                                vm.halted = false;
                                *canvas_assembled = true;
                                let line_count = source.lines().count();
                                response.push_str(&format!(
                                    "Loaded {} ({} lines, {} words at 0x{:04X})\n",
                                    path,
                                    line_count,
                                    asm_result.pixels.len(),
                                    base_addr
                                ));
                            },
                            Err(e) => {
                                response.push_str(&format!(
                                    "ASM ERROR line {}: {}\n",
                                    e.line, e.message
                                ));
                            },
                        }
                    },
                    Err(e) => {
                        response.push_str(&format!("[load_asm error: {}]\n", e));
                    },
                }
            }
        },
        "asm_load" => {
            let aliased = if parts.len() >= 2 {
                if parts.len() >= 3 {
                    format!("load_asm {} {}", parts[1], parts[2])
                } else {
                    format!("load_asm {}", parts[1])
                }
            } else {
                "load_asm".to_string()
            };
            return handle_socket_command(
                &aliased,
                vm,
                canvas_buffer,
                canvas_assembled,
                qemu_bridge,
                riscv_handle,
                source_text,
                loaded_file,
                cli_breakpoints,
            );
        },
        "assemble_region" | "asm_region" => {
            if parts.len() < 2 {
                response.push_str(
                    "[usage: assemble_region <src_byte_addr> [out_pixel_addr] [base_addr]]\n",
                );
            } else {
                let src_byte_addr = usize::from_str_radix(
                    parts[1].trim_start_matches("0x").trim_start_matches("0X"),
                    16,
                )
                .unwrap_or(0x10000);
                let out_pixel_addr = if parts.len() >= 3 {
                    usize::from_str_radix(
                        parts[2].trim_start_matches("0x").trim_start_matches("0X"),
                        16,
                    )
                    .unwrap_or(0x10000)
                } else {
                    0x10000
                };
                let base_addr = if parts.len() >= 4 {
                    usize::from_str_radix(
                        parts[3].trim_start_matches("0x").trim_start_matches("0X"),
                        16,
                    )
                    .unwrap_or(0)
                } else {
                    0
                };

                // Read source text from VM byte-addressable memory
                let mut source_bytes: Vec<u8> = Vec::new();
                let max_read = 65536;
                for i in 0..max_read {
                    let byte_addr = src_byte_addr + i;
                    let pixel_idx = byte_addr / 4;
                    if pixel_idx >= vm.ram.len() {
                        break;
                    }
                    let byte_off = (byte_addr % 4) as u32;
                    let byte = ((vm.ram[pixel_idx] >> (byte_off * 8)) & 0xFF) as u8;
                    if byte == 0 {
                        break;
                    }
                    source_bytes.push(byte);
                }

                if source_bytes.is_empty() {
                    response.push_str("[assemble_region: empty source at specified address]\n");
                } else {
                    let source = String::from_utf8_lossy(&source_bytes);
                    let mut pp = crate::preprocessor::Preprocessor::new();
                    let preprocessed_source = pp.preprocess(&source);
                    match crate::assembler::assemble(&preprocessed_source, base_addr) {
                        Ok(asm_result) => {
                            let ram_len = vm.ram.len();
                            let clear_end = (out_pixel_addr + 4096).min(ram_len);
                            for v in vm.ram[out_pixel_addr..clear_end].iter_mut() {
                                *v = 0;
                            }
                            for (i, &pixel) in asm_result.pixels.iter().enumerate() {
                                let addr = out_pixel_addr + i;
                                if addr < ram_len {
                                    vm.ram[addr] = pixel;
                                }
                            }
                            vm.pc = out_pixel_addr as u32;
                            vm.halted = false;
                            vm.populate_assembler_labels(&asm_result.labels, base_addr as u32);
                            *canvas_assembled = true;
                            response.push_str(&format!(
                                "[assemble_region: {} words from 0x{:04X} -> 0x{:04X}]\n",
                                asm_result.pixels.len(),
                                src_byte_addr,
                                out_pixel_addr
                            ));
                        },
                        Err(e) => {
                            response
                                .push_str(&format!("[ASM ERROR line {}: {}]\n", e.line, e.message));
                        },
                    }
                }
            }
        },
        "load_source" => {
            if line.len() > "load_source ".len() {
                let text = line["load_source ".len()..].replace("\\n", "\n");
                *source_text = text.clone();
                canvas_buffer.fill(0);
                let mut row = 0usize;
                let mut col = 0usize;
                const CLI_CANVAS_COLS: usize = 64;
                for ch in text.chars() {
                    if ch == '\n' {
                        row += 1;
                        col = 0;
                        if row >= canvas_buffer.len() / CLI_CANVAS_COLS {
                            break;
                        }
                    } else if col < CLI_CANVAS_COLS {
                        let idx = row * CLI_CANVAS_COLS + col;
                        if idx < canvas_buffer.len() {
                            canvas_buffer[idx] = ch as u32;
                        }
                        col += 1;
                    }
                }
                response.push_str(&format!("[loaded: {} chars]\n", source_text.len()));
            } else {
                response.push_str("[usage: load_source <text>]\n");
            }
        },
        "type" => {
            if line.len() > 5 {
                let text = line[5..].replace("\\n", "\n");
                source_text.push_str(&text);
                const CLI_CANVAS_COLS: usize = 64;
                let mut start_idx = 0usize;
                for (i, &v) in canvas_buffer.iter().enumerate().rev() {
                    if v != 0 {
                        start_idx = i + 1;
                        break;
                    }
                }
                let mut row = start_idx / CLI_CANVAS_COLS;
                let mut col = start_idx % CLI_CANVAS_COLS;
                for ch in text.chars() {
                    if ch == '\n' {
                        row += 1;
                        col = 0;
                        if row >= canvas_buffer.len() / CLI_CANVAS_COLS {
                            break;
                        }
                    } else if col < CLI_CANVAS_COLS {
                        let idx = row * CLI_CANVAS_COLS + col;
                        if idx < canvas_buffer.len() {
                            canvas_buffer[idx] = ch as u32;
                        }
                        col += 1;
                    }
                }
                response.push_str(&format!("[typed: {} chars]\n", text.len()));
            } else {
                response.push_str("[usage: type <text>]\n");
            }
        },
        "canvas" | "vm_canvas" => {
            const CLI_CANVAS_COLS: usize = 64;
            const CLI_CANVAS_ROWS: usize = 64;
            for row in 0..CLI_CANVAS_ROWS {
                let mut ln = String::new();
                for col in 0..CLI_CANVAS_COLS {
                    let val = canvas_buffer[row * CLI_CANVAS_COLS + col];
                    if val > 0 && val < 128 {
                        ln.push(val as u8 as char);
                    } else {
                        ln.push(' ');
                    }
                }
                let trimmed = ln.trim_end();
                if !trimmed.is_empty() {
                    response.push_str(&format!("{}|{}\n", row, trimmed));
                }
            }
        },
        "registers" | "regs" | "vm_registers" => {
            for i in 0..32 {
                response.push_str(&format!("r{:02}={:08X}\n", i, vm.regs[i]));
            }
        },
        "disasm" | "vm_disasm" => {
            let pc = vm.pc;
            let mut inst_starts: std::collections::BTreeSet<u32> =
                std::collections::BTreeSet::new();
            let bases = [0u32, 0x1000];
            for &base in &bases {
                if pc >= base && pc < base + 0x1000 {
                    let mut addr = base;
                    while addr <= pc + 30 {
                        if addr as usize >= vm.ram.len() {
                            break;
                        }
                        let op = vm.ram[addr as usize];
                        if op == 0 && addr > pc + 20 {
                            break;
                        }
                        inst_starts.insert(addr);
                        let (_, len) = vm.disassemble_at(addr);
                        if len == 0 {
                            break;
                        }
                        addr += len as u32;
                    }
                }
            }
            let mut display_addrs: Vec<u32> = Vec::new();
            let mut before: Vec<u32> = Vec::new();
            let mut after: Vec<u32> = Vec::new();
            for &a in &inst_starts {
                if a < pc {
                    before.push(a);
                    if before.len() > 4 {
                        before.remove(0);
                    }
                } else if a == pc {
                    // skip, add later
                } else {
                    after.push(a);
                    if after.len() >= 5 {
                        break;
                    }
                }
            }
            display_addrs.extend_from_slice(&before);
            if inst_starts.contains(&pc) {
                display_addrs.push(pc);
            }
            display_addrs.extend_from_slice(&after);
            // Phase 435: Label-aware disassembly
            let label_map = vm.build_label_map();
            for &addr in &display_addrs {
                let (mnemonic, _) = vm.disassemble_at(addr);
                let marker = if addr == pc { ">" } else { " " };
                let label_prefix = if let Some(name) = label_map.get(&addr) {
                    format!("{}:", name)
                } else {
                    String::new()
                };
                response.push_str(&format!(
                    "{}{:04X} {}{}\n",
                    marker, addr, label_prefix, mnemonic
                ));
            }
        },
        "peek" => {
            if parts.len() >= 2 {
                let addr_str = parts[1];
                let addr = if addr_str.starts_with("0x") {
                    usize::from_str_radix(&addr_str[2..], 16).unwrap_or(0)
                } else {
                    addr_str.parse::<usize>().unwrap_or(0)
                };
                if addr < vm.ram.len() {
                    response.push_str(&format!("0x{:08X}\n", vm.ram[addr]));
                } else {
                    response.push_str("[peek error: address out of bounds]\n");
                }
            } else {
                response.push_str("[usage: peek <addr>]\n");
            }
        },
        "poke" => {
            if parts.len() < 3 {
                response.push_str("[usage: poke <addr> <val>]\n");
            } else {
                let addr = usize::from_str_radix(
                    parts[1].trim_start_matches("0x").trim_start_matches("0X"),
                    16,
                )
                .or_else(|_| parts[1].parse::<usize>())
                .unwrap_or(usize::MAX);
                let val = u32::from_str_radix(
                    parts[2].trim_start_matches("0x").trim_start_matches("0X"),
                    16,
                )
                .or_else(|_| parts[2].parse::<u32>())
                .unwrap_or(u32::MAX);
                if addr < vm.ram.len() {
                    vm.ram[addr] = val;
                    if addr < vm.icache.len() {
                        vm.icache[addr] = None;
                    }
                    response.push_str(&format!("ok ram[0x{:04X}]={:08X}\n", addr, val));
                } else {
                    response.push_str(&format!("[poke error: addr 0x{:04X} out of range]\n", addr));
                }
            }
        },
        "poke_bulk" => {
            if parts.len() < 3 {
                response.push_str("[usage: poke_bulk <addr> <v1> <v2> ...]\n");
            } else {
                let base = usize::from_str_radix(
                    parts[1].trim_start_matches("0x").trim_start_matches("0X"),
                    16,
                )
                .or_else(|_| parts[1].parse::<usize>())
                .unwrap_or(usize::MAX);
                if base >= vm.ram.len() {
                    response.push_str(&format!(
                        "[poke_bulk error: addr 0x{:04X} out of range]\n",
                        base
                    ));
                } else {
                    let mut written = 0usize;
                    for (i, tok) in parts.iter().skip(2).enumerate() {
                        let addr = base + i;
                        if addr >= vm.ram.len() {
                            break;
                        }
                        let val = u32::from_str_radix(
                            tok.trim_start_matches("0x").trim_start_matches("0X"),
                            16,
                        )
                        .or_else(|_| tok.parse::<u32>());
                        match val {
                            Ok(v) => {
                                vm.ram[addr] = v;
                                if addr < vm.icache.len() {
                                    vm.icache[addr] = None;
                                }
                                written += 1;
                            },
                            Err(_) => {
                                response.push_str(&format!(
                                    "warn: skipping invalid value '{}' at offset {}\n",
                                    tok, i
                                ));
                            },
                        }
                    }
                    response.push_str(&format!("ok wrote {} words at 0x{:04X}\n", written, base));
                }
            }
        },
        "screen" | "screen_dump" => {
            let mut out = String::new();
            for y in 0..256 {
                let mut row = String::new();
                for x in 0..256 {
                    let px = vm.screen[y * 256 + x];
                    row.push_str(&format!("{:06x} ", px));
                }
                out.push_str(row.trim_end());
                out.push('\n');
            }
            response.push_str(&out);
        },
        "vmscreen" | "screen_ascii" | "vm_screen_ascii" => {
            let scale_x = 4;
            let scale_y = 8;
            for y in 0..32 {
                let mut row = String::new();
                for x in 0..64 {
                    let sx = x * scale_x;
                    let sy = y * scale_y;
                    let mut rr = 0u32;
                    let mut gg = 0u32;
                    let mut bb = 0u32;
                    let mut total = 0u32;
                    for dy in 0..scale_y {
                        for dx in 0..scale_x {
                            let py = sy + dy;
                            let px = sx + dx;
                            if py < 256 && px < 256 {
                                let c = vm.screen[py * 256 + px];
                                rr += (c >> 16) & 0xFF;
                                gg += (c >> 8) & 0xFF;
                                bb += c & 0xFF;
                                total += 1;
                            }
                        }
                    }
                    if total == 0 {
                        row.push(' ');
                        continue;
                    }
                    let r = rr / total;
                    let g = gg / total;
                    let b = bb / total;
                    let lum = (299 * r + 587 * g + 114 * b) / 1000;
                    let ch = if lum < 8 {
                        ' '
                    } else if r > 200 && g > 200 && b > 200 {
                        '"'
                    } else if r > 180 && g < 100 && b < 100 {
                        '^'
                    } else if r < 80 && g > 120 && b < 80 {
                        if lum > 140 {
                            '#'
                        } else if lum > 80 {
                            '+'
                        } else {
                            ':'
                        }
                    } else if r < 80 && g < 80 && b > 120 {
                        if lum > 120 {
                            '~'
                        } else if lum > 50 {
                            '='
                        } else {
                            '-'
                        }
                    } else if r > 150 && g > 100 && b < 60 {
                        '%'
                    } else if r > 100 && g < 80 && b > 100 {
                        'M'
                    } else if r < 60 && g > 100 && b > 100 {
                        '~'
                    } else if r > 180 && g > 180 && b < 100 {
                        '*'
                    } else if r < 30 && g < 30 && b < 30 {
                        '.'
                    } else if lum > 180 {
                        '@'
                    } else if lum > 100 {
                        '+'
                    } else {
                        ':'
                    };
                    row.push(ch);
                }
                response.push_str(&(row.trim_end().to_string() + "\n"));
            }
        },
        "screenshot" | "vm_screenshot" => {
            let path = parts.get(1).copied().unwrap_or("screenshot.ppm");
            match std::fs::File::create(path) {
                Ok(mut f) => {
                    let header = "P6\n256 256\n255\n".to_string();
                    if f.write_all(header.as_bytes()).is_err() {
                        response.push_str("[screenshot error: writing header]\n");
                    } else {
                        for pixel in &vm.screen {
                            let r = (pixel >> 16) & 0xFF;
                            let g = (pixel >> 8) & 0xFF;
                            let b = pixel & 0xFF;
                            if f.write_all(&[r as u8, g as u8, b as u8]).is_err() {
                                response.push_str("[screenshot error: writing pixel data]\n");
                                break;
                            }
                        }
                        response.push_str(&format!("[saved: {}]\n", path));
                    }
                },
                Err(e) => {
                    response.push_str(&format!("[screenshot error: {}]\n", e));
                },
            }
        },
        "save" => {
            let path = parts.get(1).copied().unwrap_or(SAVE_FILE);
            match crate::save::save_state(path, vm, canvas_buffer, *canvas_assembled) {
                Ok(()) => response.push_str(&format!("[saved: {}]\n", path)),
                Err(e) => response.push_str(&format!("[save error: {}]\n", e)),
            }
        },
        "restore" | "load_state" => {
            let path = parts.get(1).copied().unwrap_or(SAVE_FILE);
            match crate::save::load_state(path) {
                Ok((saved_vm, saved_canvas, saved_assembled)) => {
                    *vm = saved_vm;
                    let cb_len = canvas_buffer.len().min(saved_canvas.len());
                    canvas_buffer[..cb_len].copy_from_slice(&saved_canvas[..cb_len]);
                    *canvas_assembled = saved_assembled;
                    response.push_str(&format!("[restored: {}]\n", path));
                },
                Err(e) => {
                    response.push_str(&format!("[restore error: {}]\n", e));
                },
            }
        },
        "save_asm" | "vm_save_asm" => {
            if let Some(name) = parts.get(1) {
                let safe: String = name
                    .chars()
                    .filter(|c| c.is_alphanumeric() || *c == '_' || *c == '-')
                    .collect();
                if safe.is_empty() {
                    response.push_str("[error: empty name after sanitization]\n");
                } else {
                    let filename = format!("programs/{}.asm", safe);
                    let mut src = String::new();
                    const CLI_CANVAS_COLS: usize = 64;
                    const CLI_CANVAS_ROWS: usize = 64;
                    for row in 0..CLI_CANVAS_ROWS {
                        let mut ln = String::new();
                        for col in 0..CLI_CANVAS_COLS {
                            let val = canvas_buffer[row * CLI_CANVAS_COLS + col];
                            if val > 0 && val < 128 {
                                ln.push(val as u8 as char);
                            } else {
                                ln.push(' ');
                            }
                        }
                        let trimmed = ln.trim_end();
                        if !trimmed.is_empty() {
                            src.push_str(trimmed);
                            src.push('\n');
                        }
                    }
                    match std::fs::write(&filename, &src) {
                        Ok(()) => {
                            let lines = src.lines().count();
                            response.push_str(&format!(
                                "[saved: {} ({} lines, {} bytes)]\n",
                                filename,
                                lines,
                                src.len()
                            ));
                        },
                        Err(e) => {
                            response.push_str(&format!("[save_asm error: {}]\n", e));
                        },
                    }
                }
            } else {
                response.push_str("[usage: save_asm <name>]\n");
            }
        },
        "coord_set_binary" => {
            if parts.len() >= 5 {
                let x: u32 = match parts[1].parse() {
                    Ok(v) => v,
                    Err(_) => {
                        response.push_str("[error: invalid x]\n");
                        return response;
                    },
                };
                let y: u32 = match parts[2].parse() {
                    Ok(v) => v,
                    Err(_) => {
                        response.push_str("[error: invalid y]\n");
                        return response;
                    },
                };
                let format = parts[3];
                let file_path = parts[4];

                if file_path.is_empty() {
                    response.push_str("[error: file path required]\n");
                    return response;
                }

                match crate::encoding::BinaryMetadata::from_file(
                    std::path::Path::new(file_path),
                    format,
                    "base64",
                ) {
                    Ok(metadata) => {
                        let metadata_json = serde_json::to_string(&metadata)
                            .unwrap_or_else(|e| format!("[json error: {}]", e));

                        let coord_key = ((x as u64) << 16) | y as u64;
                        if vm.coordinate_metadata.contains_key(&coord_key) {
                            vm.coordinate_metadata
                                .get_mut(&coord_key)
                                .unwrap()
                                .insert("binary_data".to_string(), metadata_json);
                        } else {
                            let mut coord_meta = std::collections::HashMap::new();
                            coord_meta.insert("binary_data".to_string(), metadata_json);
                            vm.coordinate_metadata.insert(coord_key, coord_meta);
                        }

                        response.push_str(&format!(
                            "[stored: {} at ({}, {}) as {} ({} bytes, checksum {})]\n",
                            file_path, x, y, format, metadata.size_bytes, metadata.checksum
                        ));
                    },
                    Err(e) => {
                        response.push_str(&format!("[error: {}]\n", e));
                    },
                }
            } else {
                response.push_str("[usage: coord_set_binary <x> <y> <format> <file>]\n");
            }
        },
        "import_binary" => {
            if parts.len() >= 3 {
                let file_path = parts[1];
                let building_id: u32 = match parts[2].parse() {
                    Ok(id) => id,
                    Err(_) => {
                        response.push_str("[error: invalid building_id]\n");
                        return response;
                    },
                };
                let format = parts.get(3).copied().unwrap_or("raw");
                let encoding = parts.get(4).copied().unwrap_or("base64");

                match crate::encoding::BinaryMetadata::from_file(
                    std::path::Path::new(file_path),
                    format,
                    encoding,
                ) {
                    Ok(metadata) => {
                        let metadata_json = serde_json::to_string(&metadata)
                            .unwrap_or_else(|e| format!("[json error: {}]", e));

                        let coord_key = ((building_id as u64) << 16) | 0;
                        if vm.coordinate_metadata.contains_key(&coord_key) {
                            vm.coordinate_metadata
                                .get_mut(&coord_key)
                                .unwrap()
                                .insert("binary_data".to_string(), metadata_json);
                        } else {
                            let mut coord_meta = std::collections::HashMap::new();
                            coord_meta.insert("binary_data".to_string(), metadata_json);
                            vm.coordinate_metadata.insert(coord_key, coord_meta);
                        }

                        response.push_str(&format!(
                            "[imported: {} into building {} ({} bytes, checksum {})]\n",
                            file_path, building_id, metadata.size_bytes, metadata.checksum
                        ));
                    },
                    Err(e) => {
                        response.push_str(&format!("[error: {}]\n", e));
                    },
                }
            } else {
                response
                    .push_str("[usage: import_binary <path> <building_id> [format] [encoding]]\n");
            }
        },
        "set_boot_config" => {
            if parts.len() >= 2 {
                let config_str = parts[1..].join(" ");
                let coord_key = 0u64; // coordinate (0,0)
                if vm.coordinate_metadata.contains_key(&coord_key) {
                    vm.coordinate_metadata
                        .get_mut(&coord_key)
                        .unwrap()
                        .insert("boot_config".to_string(), config_str.clone());
                } else {
                    let mut coord_meta = std::collections::HashMap::new();
                    coord_meta.insert("boot_config".to_string(), config_str.clone());
                    vm.coordinate_metadata.insert(coord_key, coord_meta);
                }
                response.push_str(&format!("[boot_config set: {}]\n", config_str));
            } else {
                response.push_str("[usage: set_boot_config <kernel=building:N> [initrd=building:N] [ram=256] [bootargs=...]]\n");
            }
        },
        "show_boot_config" => {
            let coord_key = 0u64; // coordinate (0,0)
            if let Some(coord_meta) = vm.coordinate_metadata.get(&coord_key) {
                if let Some(config_str) = coord_meta.get("boot_config") {
                    response.push_str(&format!("boot_config: {}\n", config_str));
                } else {
                    response.push_str(
                        "[boot_config: not set (no boot_config key at coordinate (0,0))]\n",
                    );
                }
            } else {
                response.push_str("[boot_config: not set (no metadata at coordinate (0,0))]\n");
            }
        },
        "import_memory_palace" => {
            let strategy = if let Some(mode) = parts.get(1) {
                match mode.as_ref() {
                    "preserve" => crate::export::MergeStrategy::PreserveExisting,
                    "rename" => crate::export::MergeStrategy::RenameOnConflict,
                    "overwrite" => crate::export::MergeStrategy::Overwrite,
                    _ => {
                        response.push_str(
                            "[usage: import_memory_palace <path> [preserve|rename|overwrite]]\n",
                        );
                        return response;
                    },
                }
            } else {
                crate::export::MergeStrategy::PreserveExisting
            };

            if let Some(path) = parts.get(if parts.len() > 2 { 2 } else { 1 }) {
                match crate::export::import_from_file(vm, path, strategy) {
                    Ok(()) => {
                        response.push_str(&format!("[imported: {}]\n", path));
                    },
                    Err(e) => {
                        response.push_str(&format!("[error: {}]\n", e));
                    },
                }
            } else {
                response
                    .push_str("[usage: import_memory_palace <path> [preserve|rename|overwrite]]\n");
            }
        },
        "clear" => {
            canvas_buffer.fill(0);
            source_text.clear();
            response.push_str("[canvas cleared]\n");
        },
        "step" | "asm_step" => {
            if vm.halted {
                response.push_str("[VM halted]\n");
            } else {
                let cb_len = vm.canvas_buffer.len().min(canvas_buffer.len());
                vm.canvas_buffer[..cb_len].copy_from_slice(&canvas_buffer[..cb_len]);
                vm.step();
                canvas_buffer[..cb_len].copy_from_slice(&vm.canvas_buffer[..cb_len]);
                response.push_str(&format!("step -> PC=0x{:04X}\n", vm.pc));
            }
        },
        "asm_run" => {
            if !*canvas_assembled {
                response.push_str("[not assembled]\n");
            } else {
                let timeout_ms = if parts.len() >= 2 {
                    parts[1].parse::<u64>().unwrap_or(10000)
                } else {
                    10000
                };
                let start = std::time::Instant::now();
                let timeout = Duration::from_millis(timeout_ms);
                let cb_len = vm.canvas_buffer.len().min(canvas_buffer.len());
                vm.canvas_buffer[..cb_len].copy_from_slice(&canvas_buffer[..cb_len]);
                vm.halted = false;
                let mut halted = false;
                while start.elapsed() < timeout {
                    if !vm.step() {
                        halted = true;
                        break;
                    }
                }
                canvas_buffer[..cb_len].copy_from_slice(&vm.canvas_buffer[..cb_len]);
                response.push_str(&format!(
                    "status={} pc=0x{:04X}\n",
                    if halted { "halted" } else { "running" },
                    vm.pc
                ));
            }
        },
        "riscv_run" => {
            if parts.len() < 2 {
                response.push_str("[usage: riscv_run <path>]\n");
            } else {
                let path = parts[1];
                match std::fs::read(path) {
                    Ok(elf_data) => {
                        *riscv_handle = None;
                        let config = crate::riscv::live::VmThreadConfig {
                            mode: crate::riscv::live::GuestMode::Elf(elf_data),
                            ram_size: 8 * 1024 * 1024,
                            ..Default::default()
                        };
                        match crate::riscv::live::spawn_vm_thread(config) {
                            Ok(h) => {
                                *riscv_handle = Some(h);
                                response.push_str(&format!("[riscv] Launched {}\n", path));
                                // Drain initial console output
                                if let Some(ref handle) = riscv_handle {
                                    let mut drained = 0;
                                    while let Ok(data) = handle.try_recv_console() {
                                        if let Ok(s) = String::from_utf8(data) {
                                            response.push_str(&s);
                                        }
                                        drained += 1;
                                        if drained > 50 {
                                            break;
                                        }
                                    }
                                }
                            },
                            Err(e) => {
                                response.push_str(&format!("[riscv] Error: {}\n", e));
                            },
                        }
                    },
                    Err(e) => {
                        response.push_str(&format!("[riscv] Error reading {}: {}\n", path, e));
                    },
                }
            }
        },
        "riscv_boot" => {
            if parts.len() < 2 {
                response.push_str("[usage: riscv_boot kernel=building:N [initrd=building:N] [ram=256] [bootargs=...]]\n");
            } else {
                let mut kernel_data: Option<Vec<u8>> = None;
                let mut initrd_data: Option<Vec<u8>> = None;
                let mut ram_mb = 256u32;
                let mut bootargs = "console=ttyS0".to_string();

                for part in &parts[1..] {
                    if let Some(building_str) = part.strip_prefix("kernel=building:") {
                        if let Ok(bid) = building_str.parse::<u32>() {
                            kernel_data = extract_binary_bytes_from_building(vm, bid);
                            if kernel_data.is_none() {
                                response.push_str(&format!(
                                    "[error: kernel building {} not found]\n",
                                    bid
                                ));
                            }
                        }
                    } else if let Some(building_str) = part.strip_prefix("initrd=building:") {
                        if let Ok(bid) = building_str.parse::<u32>() {
                            initrd_data = extract_binary_bytes_from_building(vm, bid);
                            if initrd_data.is_none() {
                                response.push_str(&format!(
                                    "[error: initrd building {} not found]\n",
                                    bid
                                ));
                            }
                        }
                    } else if let Some(val) = part.strip_prefix("ram=") {
                        ram_mb = val.parse().unwrap_or(256);
                    } else if let Some(val) = part.strip_prefix("bootargs=") {
                        bootargs = val.to_string();
                    }
                }

                if let Some(kernel) = kernel_data {
                    *riscv_handle = None;
                    let config = crate::riscv::live::VmThreadConfig {
                        mode: crate::riscv::live::GuestMode::Linux {
                            kernel,
                            initrd: initrd_data,
                            bootargs,
                        },
                        ram_size: (ram_mb as usize) * 1024 * 1024,
                        ..Default::default()
                    };
                    match crate::riscv::live::spawn_vm_thread(config) {
                        Ok(h) => {
                            *riscv_handle = Some(h);
                            response.push_str(&format!(
                                "[riscv] Booting Linux ({}MB ram)...\n",
                                ram_mb
                            ));
                            // Drain initial console output
                            if let Some(ref handle) = riscv_handle {
                                let mut drained = 0;
                                while let Ok(data) = handle.try_recv_console() {
                                    if let Ok(s) = String::from_utf8(data) {
                                        response.push_str(&s);
                                    }
                                    drained += 1;
                                    if drained > 50 {
                                        break;
                                    }
                                }
                            }
                        },
                        Err(e) => {
                            response.push_str(&format!("[riscv] Error: {}\n", e));
                        },
                    }
                } else {
                    response.push_str("[error: kernel=building:N required]\n");
                }
            }
        },
        "riscv_kill" => {
            if riscv_handle.is_some() {
                *riscv_handle = None;
                response.push_str("[riscv] Killed\n");
            } else {
                response.push_str("[riscv] Not running\n");
            }
        },
        "riscv_console" => {
            // First read from global buffer (accumulated between commands)
            if let Ok(buf) = CONSOLE_BUF.lock() {
                for s in buf.iter() {
                    response.push_str(s);
                }
            }
            // Then drain any pending from the handle directly
            if let Some(ref handle) = riscv_handle {
                let mut total = 0;
                while let Ok(data) = handle.try_recv_console() {
                    if let Ok(s) = String::from_utf8(data) {
                        response.push_str(&s);
                    }
                    total += 1;
                    if total > 100 {
                        break;
                    } // safety limit
                }
                if response.is_empty() {
                    response.push_str("[no pending console output]\n");
                }
            } else {
                if response.is_empty() {
                    response.push_str("[no riscv VM running]\n");
                }
            }
            // Clear the buffer
            if let Ok(mut buf) = CONSOLE_BUF.lock() {
                buf.clear();
            }
        },
        "riscv_input" => {
            if parts.len() < 2 {
                response.push_str("[usage: riscv_input <text>]\n");
            } else if let Some(ref handle) = riscv_handle {
                let text = parts[1..].join(" ");
                // Send text followed by newline (shell needs Enter to execute)
                for byte in text.bytes() {
                    let _ = handle.send_input(byte);
                }
                let _ = handle.send_input(b'\n');
                response.push_str(&format!(
                    "[sent {} bytes + newline to riscv UART]\n",
                    text.len()
                ));
            } else {
                response.push_str("[no riscv VM running]\n");
            }
        },
        "hypervisor_boot" => {
            if parts.len() < 2 {
                response.push_str("[usage: hypervisor_boot <config>]\n");
            } else {
                if let Some(ref mut bridge) = qemu_bridge {
                    let _ = bridge.kill();
                }
                *qemu_bridge = None;
                let config_str = parts[1..].join(" ");
                let resolved_cfg = resolve_pixel_paths_with_vm(&config_str, Some(vm));
                match QemuBridge::spawn(&resolved_cfg) {
                    Ok(bridge) => {
                        *qemu_bridge = Some(bridge);
                        response.push_str(&format!("[qemu] Booted: {}]\n", config_str));
                    },
                    Err(e) => {
                        response.push_str(&format!("[qemu] Error: {}]\n", e));
                    },
                }
            }
        },
        "qemu" => {
            let subcmd = parts.get(1).copied().unwrap_or("");
            match subcmd {
                "boot" => {
                    if parts.len() < 3 {
                        response.push_str("[usage: qemu boot <config>]\n");
                    } else {
                        if let Some(ref mut bridge) = qemu_bridge {
                            let _ = bridge.kill();
                        }
                        *qemu_bridge = None;
                        let config_str = parts[2..].join(" ");
                        match QemuBridge::spawn(&config_str) {
                            Ok(bridge) => {
                                *qemu_bridge = Some(bridge);
                                response.push_str(&format!("[qemu] Booted: {}\n", config_str));
                            },
                            Err(e) => {
                                response.push_str(&format!("[qemu] Error: {}\n", e));
                            },
                        }
                    }
                },
                "kill" => {
                    if let Some(ref mut bridge) = qemu_bridge {
                        match bridge.kill() {
                            Ok(()) => {
                                response.push_str("[qemu] Killed\n");
                            },
                            Err(e) => {
                                response.push_str(&format!("[qemu] Kill error: {}\n", e));
                            },
                        }
                        *qemu_bridge = None;
                    } else {
                        response.push_str("[qemu] Not running\n");
                    }
                },
                "status" => match qemu_bridge {
                    Some(ref mut bridge) => {
                        if bridge.is_alive() {
                            let cursor = bridge.cursor();
                            response.push_str(&format!(
                                "[qemu] Running (cursor: row={}, col={})\n",
                                cursor.row, cursor.col
                            ));
                        } else {
                            response.push_str("[qemu] Process exited\n");
                            *qemu_bridge = None;
                        }
                    },
                    None => {
                        response.push_str("[qemu] Not running\n");
                    },
                },
                _ => {
                    response.push_str("[unknown qemu subcommand]\n");
                },
            }
        },
        "hypervisor_kill" => {
            if let Some(ref mut bridge) = qemu_bridge {
                match bridge.kill() {
                    Ok(()) => {
                        response.push_str("[qemu] Killed\n");
                    },
                    Err(e) => {
                        response.push_str(&format!("[qemu] Kill error: {}\n", e));
                    },
                }
                *qemu_bridge = None;
            } else {
                response.push_str("[qemu] Not running\n");
            }
        },
        "hypervisor_input" => {
            if parts.len() < 2 {
                response.push_str("[usage: hypervisor_input <text>]\n");
            } else {
                if let Some(ref mut bridge) = qemu_bridge {
                    let text = parts[1..].join(" ");
                    let mut bytes = text.into_bytes();
                    bytes.push(b'\n');
                    match bridge.write_bytes(&bytes) {
                        Ok(()) => {
                            response.push_str(&format!(
                                "[sent {} bytes to hypervisor]\n",
                                bytes.len() - 1
                            ));
                        },
                        Err(e) => {
                            response.push_str(&format!("[error sending input: {}]\n", e));
                        },
                    }
                } else {
                    response.push_str("[error: hypervisor is not running]\n");
                }
            }
        },
        "hypervisor_console" => {
            if let Ok(mut buf) = HYPERVISOR_CONSOLE_BUF.lock() {
                for s in buf.iter() {
                    response.push_str(s);
                }
                buf.clear();
            }
            if response.is_empty() {
                if qemu_bridge.is_some() {
                    response.push_str("[no pending console output]\n");
                } else {
                    response.push_str("[error: hypervisor is not running]\n");
                }
            }
        },
        "window_list" => {
            let active: Vec<&crate::vm::Window> = vm.windows.iter().filter(|w| w.active).collect();
            let mut windows = Vec::new();
            for w in &active {
                let mut title = String::new();
                if w.title_addr > 0 && (w.title_addr as usize) < vm.ram.len() {
                    for j in 0..32 {
                        let addr = w.title_addr as usize + j;
                        if addr >= vm.ram.len() {
                            break;
                        }
                        let ch = vm.ram[addr];
                        if ch == 0 || ch > 127 {
                            break;
                        }
                        title.push(ch as u8 as char);
                    }
                }
                windows.push(format!(
                    "{{\n  \"id\": {},\n  \"title\": \"{}\",\n  \"pid\": {},\n  \"x\": {},\n  \"y\": {},\n  \"w\": {},\n  \"h\": {},\n  \"z_order\": {}\n}}",
                    w.id, title, w.pid, w.x, w.y, w.w, w.h, w.z_order
                ));
            }
            response.push_str(&format!("[\n{}\n]\n", windows.join(",\n")));
        },
        "window_move" => {
            if let (Some(id_str), Some(x_str), Some(y_str)) =
                (parts.get(1), parts.get(2), parts.get(3))
            {
                let win_id = id_str.parse::<u32>().unwrap_or(0);
                let new_x = x_str.parse::<u32>().unwrap_or(0);
                let new_y = y_str.parse::<u32>().unwrap_or(0);
                if let Some(w) = vm.windows.iter_mut().find(|w| w.id == win_id && w.active) {
                    w.x = new_x;
                    w.y = new_y;
                    response.push_str(&format!("ok {}->{},{}\n", win_id, new_x, new_y));
                    // Force desktop redraw after move
                    vm.blit_windows();
                } else {
                    response.push_str(&format!("[window {} not found]\n", win_id));
                }
            } else {
                response.push_str("[usage: window_move <id> <x> <y>]\n");
            }
        },
        "window_close" => {
            if let Some(id_str) = parts.get(1) {
                let win_id = id_str.parse::<u32>().unwrap_or(0);
                if let Some(w) = vm.windows.iter_mut().find(|w| w.id == win_id && w.active) {
                    w.active = false;
                    response.push_str(&format!("ok closed {}\n", win_id));
                    vm.blit_windows();
                } else {
                    response.push_str(&format!("[window {} not found]\n", win_id));
                }
            } else {
                response.push_str("[usage: window_close <id>]\n");
            }
        },
        "window_resize" => {
            if let (Some(id_str), Some(w_str), Some(h_str)) =
                (parts.get(1), parts.get(2), parts.get(3))
            {
                let win_id = id_str.parse::<u32>().unwrap_or(0);
                let new_w = w_str.parse::<u32>().unwrap_or(32);
                let new_h = h_str.parse::<u32>().unwrap_or(32);
                if let Some(w) = vm.windows.iter_mut().find(|w| w.id == win_id && w.active) {
                    w.w = new_w;
                    w.h = new_h;
                    // Resize offscreen buffer
                    w.offscreen_buffer = vec![0; (new_w * new_h) as usize];
                    response.push_str(&format!("ok resize {}->{}x{}\n", win_id, new_w, new_h));
                    vm.blit_windows();
                } else {
                    response.push_str(&format!("[window {} not found]\n", win_id));
                }
            } else {
                response.push_str("[usage: window_resize <id> <w> <h>]\n");
            }
        },
        "qemu_input" | "qemu_send" => {
            if parts.len() < 2 {
                response.push_str("[usage: qemu_input <text>]\n");
            } else if let Some(ref mut bridge) = qemu_bridge {
                if bridge.is_alive() {
                    let text = parts[1..].join(" ");
                    let _ = bridge.write_bytes(format!("{}\n", text).as_bytes());
                    response.push_str(&format!(
                        "[sent {} bytes + newline to QEMU stdin]\n",
                        text.len()
                    ));
                } else {
                    response.push_str("[no QEMU VM running]\n");
                }
            } else {
                response.push_str("[no QEMU VM running]\n");
            }
        },
        "inject_key" => {
            // inject_key <keycode> [shift]
            // Injects a key event: sends to QEMU stdin if running, else to GeOS VM key buffer
            if let Some(keycode_str) = parts.get(1) {
                let keycode = keycode_str.parse::<u32>().unwrap_or_else(|_| {
                    // Try single character
                    let bytes = keycode_str.as_bytes();
                    if bytes.len() == 1 {
                        bytes[0] as u32
                    } else {
                        0
                    }
                });
                if let Some(ref mut bridge) = qemu_bridge {
                    if bridge.is_alive() {
                        // Send as byte to QEMU stdin
                        let _ = bridge.write_bytes(&[keycode as u8]);
                        response.push_str("ok\n");
                    } else {
                        response.push_str("[no QEMU VM running]\n");
                    }
                } else {
                    let ok = vm.push_key(keycode);
                    response.push_str(if ok { "ok\n" } else { "buffer_full\n" });
                }
            } else {
                response.push_str("[usage: inject_key <keycode>]\n");
            }
        },
        "inject_text" => {
            // inject_text <text>
            // Sends characters to QEMU stdin if running, else to GeOS VM key buffer
            if parts.len() > 1 {
                let text = parts[1..].join(" ");
                let mut count = 0u32;
                if let Some(ref mut bridge) = qemu_bridge {
                    if bridge.is_alive() {
                        for byte in text.bytes() {
                            let _ = bridge.write_bytes(&[byte]);
                            count += 1;
                        }
                        response.push_str(&format!("injected {} chars to QEMU stdin\n", count));
                    } else {
                        response.push_str("[no QEMU VM running]\n");
                    }
                } else {
                    for ch in text.chars() {
                        if !vm.push_key(ch as u32) {
                            break;
                        }
                        count += 1;
                    }
                    response.push_str(&format!("injected {} chars\n", count));
                }
            } else {
                response.push_str("[usage: inject_text <text>]\n");
            }
        },
        "write_pixels" => {
            if parts.len() < 3 {
                response.push_str("[usage: write_pixels <offset> <rrggbb hex values...>]\n");
            } else {
                let offset = match parts[1].parse::<usize>() {
                    Ok(v) => v,
                    Err(_) => {
                        response.push_str("[error: invalid offset]\n");
                        return response;
                    },
                };
                if offset >= vm.screen.len() {
                    response.push_str(&format!(
                        "[error: offset {} >= screen size {}]\n",
                        offset,
                        vm.screen.len()
                    ));
                    return response;
                }
                let mut count = 0usize;
                for (i, tok) in parts.iter().skip(2).enumerate() {
                    let idx = offset + i;
                    if idx >= vm.screen.len() {
                        break;
                    }
                    let rgb = u32::from_str_radix(tok.trim_start_matches("0x"), 16).unwrap_or(0);
                    vm.screen[idx] = (rgb << 8) | 0xFF; // RRGGBB → 0xRRGGBBFF (RGBA with A=255)
                    count += 1;
                }
                response.push_str(&format!("ok wrote {} pixels at offset {}\n", count, offset));
            }
        },
        "help" => {
            response.push_str("Socket commands: status run run_program assemble assemble_region load_asm asm_load load_source type canvas registers disasm peek poke poke_bulk screen vmscreen screenshot save restore save_asm clear step asm_run riscv_run riscv_kill riscv_console hypervisor_boot hypervisor_kill hypervisor_input hypervisor_console qemu status window_list window_move window_close window_resize qemu_input write_pixels help\n");
        },
        _ => {
            if command.starts_with("building_")
                || command.starts_with("desktop_")
                || (command.starts_with("window_")
                    && command != "window_list"
                    && command != "window_move"
                    && command != "window_close"
                    && command != "window_resize")
                || command.starts_with("player_")
                || command.starts_with("vision_")
                || command.starts_with("input_")
                || command == "process_kill"
                || command == "spawn_building"
                || command == "screenshot_b64"
                || command == "screenshot_annotated_b64"
                || command == "riscv_fb_dump"
                || command == "peek_pixel"
                || command == "region_checksum"
                || command == "render_log"
                || command == "rlog"
                || command == "ram"
                || command == "vm_state"
                || command == "vmstate"
                || command == "dashboard"
                || command == "dash"
            {
                response.push_str("[not available in CLI mode]\n");
            } else {
                response.push_str(&format!("[unknown command: {}]\n", command));
            }
        },
    }

    response
}

// ── Trap analysis helpers ──

struct TrapEntry {
    #[allow(dead_code)]
    cause: u64,
    epc: u64,
    tval: u64,
    desc: String,
}

/// Parse a single QEMU trap log line.
/// Format: riscv_cpu_do_interrupt: hart:0, async:0, cause:XXXXXXXX, epc:0xXXXX, tval:0xXXXX, desc=XXXX
fn parse_trap_line(line: &str) -> Option<TrapEntry> {
    let cause = line.find("cause:").and_then(|i| {
        let s = &line[i + 6..];
        let end = s.find(',').unwrap_or(s.len());
        u64::from_str_radix(s[..end].trim(), 16).ok()
    })?;
    let epc = line.find("epc:0x").and_then(|i| {
        let s = &line[i + 6..];
        let end = s.find(',').unwrap_or(s.len());
        u64::from_str_radix(s[..end].trim(), 16).ok()
    })?;
    let tval = line.find("tval:0x").and_then(|i| {
        let s = &line[i + 7..];
        let end = s.find(',').unwrap_or(s.len());
        u64::from_str_radix(s[..end].trim(), 16).ok()
    })?;
    let desc = line.find("desc=").map(|i| line[i + 5..].to_string())?;
    Some(TrapEntry {
        cause,
        epc,
        tval,
        desc,
    })
}

fn analyze_traps(entries: &[TrapEntry]) {
    use std::collections::HashMap;

    let n = entries.len();
    println!("[qemu] Analyzing {} trap entries...", n);

    // ── 1. Trap type distribution ──
    let mut desc_counts: HashMap<&str, usize> = HashMap::new();
    for e in entries {
        *desc_counts.entry(&e.desc).or_insert(0) += 1;
    }
    let mut sorted_descs: Vec<_> = desc_counts.iter().collect();
    sorted_descs.sort_by(|a, b| b.1.cmp(a.1));

    println!("\n  TRAP DISTRIBUTION");
    println!("  {:>10}  {:>6}  Type", "Count", "Pct");
    println!("  {}", "-".repeat(40));
    for (desc, count) in &sorted_descs {
        let pct = **count as f64 / n as f64 * 100.0;
        println!("  {:>10}  {:>5.1}%  {}", count, pct, desc);
    }

    // ── 2. Boot phase analysis (10 temporal windows) ──
    println!("\n  BOOT PHASES (temporal windows)");
    println!(
        "  {:>6}  {:>8}  {:>8}  {:>8}  {:>8}  {:>8}  {:>6}",
        "Phase", "user", "s_ecall", "store_pf", "load_pf", "exec_pf", "timer"
    );
    println!("  {}", "-".repeat(60));
    let windows = 10;
    let window_size = n / windows;
    for w in 0..windows {
        let start = w * window_size;
        let end = if w < windows - 1 {
            start + window_size
        } else {
            n
        };
        let chunk = &entries[start..end];
        let mut wc: HashMap<&str, usize> = HashMap::new();
        for e in chunk {
            *wc.entry(&e.desc).or_insert(0) += 1;
        }
        println!(
            "  {:>3}-{:<3}%  {:>8}  {:>8}  {:>8}  {:>8}  {:>8}  {:>6}",
            w * 10,
            (w + 1) * 10,
            wc.get("user_ecall").unwrap_or(&0),
            wc.get("supervisor_ecall").unwrap_or(&0),
            wc.get("store_page_fault").unwrap_or(&0),
            wc.get("load_page_fault").unwrap_or(&0),
            wc.get("exec_page_fault").unwrap_or(&0),
            wc.get("s_timer").unwrap_or(&0)
        );
    }

    // ── 3. Boot transition markers ──
    let first_user = entries.iter().position(|e| e.desc == "user_ecall");
    let first_timer = entries.iter().position(|e| e.desc == "s_timer");

    println!("\n  BOOT TRANSITIONS");
    if let Some(idx) = first_user {
        println!(
            "  First user_ecall at #{} ({:.1}%) -- userspace starts",
            idx,
            idx as f64 / n as f64 * 100.0
        );
        // Pre-userspace summary
        let pre: Vec<_> = entries[..idx].iter().collect();
        let mut pre_counts: HashMap<&str, usize> = HashMap::new();
        for e in &pre {
            *pre_counts.entry(&e.desc).or_insert(0) += 1;
        }
        let mut pre_sorted: Vec<_> = pre_counts.iter().collect();
        pre_sorted.sort_by(|a, b| b.1.cmp(a.1));
        let summary: Vec<String> = pre_sorted
            .iter()
            .map(|(k, v)| format!("{}x {}", v, k))
            .collect();
        println!("  Kernel phase: {}", summary.join(", "));
    }
    if let Some(idx) = first_timer {
        println!(
            "  First s_timer at #{} ({:.1}%) -- scheduler active",
            idx,
            idx as f64 / n as f64 * 100.0
        );
    }

    // ── 4. Top syscall hotspots (by 4K code page) ──
    let mut page_counts: HashMap<u64, usize> = HashMap::new();
    for e in entries {
        if e.desc == "user_ecall" {
            *page_counts.entry(e.epc & !0xFFF).or_insert(0) += 1;
        }
    }
    let mut top_pages: Vec<_> = page_counts.iter().collect();
    top_pages.sort_by(|a, b| b.1.cmp(a.1));

    println!("\n  SYSCALL HOTSPOTS (top 10 code pages)");
    println!("  {:>18}  {:>8}  Role", "Page", "Calls");
    println!("  {}", "-".repeat(50));
    for (page, count) in top_pages.iter().take(10) {
        let role = classify_address(**page);
        println!("  0x{:016X}  {:>8}  {}", page, count, role);
    }
    println!("  Total unique code pages: {}", page_counts.len());

    // ── 5. Supervisor ecall sites ──
    let mut s_epc_counts: HashMap<u64, usize> = HashMap::new();
    for e in entries {
        if e.desc == "supervisor_ecall" {
            *s_epc_counts.entry(e.epc).or_insert(0) += 1;
        }
    }
    let mut s_top: Vec<_> = s_epc_counts.iter().collect();
    s_top.sort_by(|a, b| b.1.cmp(a.1));

    if !s_top.is_empty() {
        println!("\n  SBI/SYSCALL ENTRY POINTS (supervisor_ecall)");
        for (epc, count) in s_top.iter().take(5) {
            println!("  0x{:016X}  {:>6}x", epc, count);
        }
    }

    // ── 6. Memory working set growth ──
    println!("\n  MEMORY WORKING SET GROWTH");
    println!(
        "  {:>6}  {:>12}  {:>12}",
        "Phase", "Total pages", "New pages"
    );
    println!("  {}", "-".repeat(36));
    let ws_windows = 20;
    let ws_size = n / ws_windows;
    let mut seen_pages: std::collections::HashSet<u64> = std::collections::HashSet::new();
    let mut prev = 0;
    for w in 0..ws_windows {
        let start = w * ws_size;
        let end = if w < ws_windows - 1 {
            start + ws_size
        } else {
            n
        };
        for e in &entries[start..end] {
            if e.desc.contains("page_fault") {
                seen_pages.insert(e.tval & !0xFFF);
            }
        }
        let total = seen_pages.len();
        println!(
            "  {:>3}%    {:>12}  {:>12}",
            (w + 1) * 5,
            total,
            total - prev
        );
        prev = total;
    }

    // ── 7. Anomalies ──
    println!("\n  ANOMALIES");

    // Illegal instructions
    let illegals: Vec<_> = entries
        .iter()
        .filter(|e| e.desc == "illegal_instruction")
        .collect();
    if !illegals.is_empty() {
        println!("  Illegal instructions: {}", illegals.len());
        for e in illegals.iter().take(5) {
            let opcode = (e.tval & 0x7F) as u8;
            println!(
                "    epc=0x{:016X}  tval=0x{:08X}  opcode=0x{:02X}",
                e.epc, e.tval, opcode
            );
        }
        if illegals.iter().any(|e| e.epc >= 0xFFFFFFFF80000000) {
            println!("    -> Kernel probes for unsupported CPU extensions");
        }
    }

    // Store page fault storms (5+ consecutive)
    let mut storm_count = 0;
    let mut i = 0;
    while i < entries.len() {
        if entries[i].desc == "store_page_fault" {
            let start = i;
            while i < entries.len() && entries[i].desc == "store_page_fault" {
                i += 1;
            }
            if i - start >= 5 {
                storm_count += 1;
            }
        } else {
            i += 1;
        }
    }
    if storm_count > 0 {
        println!(
            "  Store page fault storms (5+ consecutive): {}",
            storm_count
        );
    }

    // Breakpoints
    let bps: Vec<_> = entries.iter().filter(|e| e.desc == "breakpoint").collect();
    if !bps.is_empty() {
        println!("  Breakpoints: {}", bps.len());
        for e in &bps {
            println!("    epc=0x{:016X}", e.epc);
        }
    }

    if illegals.is_empty() && storm_count == 0 && bps.is_empty() {
        println!("  None detected");
    }
}

fn classify_address(addr: u64) -> &'static str {
    if addr >= 0xFFFFFFFF80000000 {
        "kernel (high mapping)"
    } else if addr >= 0xFFFFFF0000000000 {
        "kernel text"
    } else if (0x7FF000000000..=0x7FFFFFFFFFFF).contains(&addr) {
        "user library (libc/ld)"
    } else if (0x555500000000..=0x5556FFFFFFFF).contains(&addr) {
        "user binary (.text)"
    } else if addr < 0x100000000 {
        "lowmem"
    } else {
        "user process"
    }
}
