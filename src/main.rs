// main.rs -- Geometry OS Canvas Text Surface
//
// The canvas grid IS a text editor. Type assembly, press F8 to assemble,
// press F5 to run. Each keystroke writes a colored pixel glyph.
//
// Build: cargo run
// Test:  cargo test

use geometry_os::assembler;
use geometry_os::audio;
#[cfg(feature = "native")]
use geometry_os::camera;
use geometry_os::canvas;
use geometry_os::cli;
use geometry_os::encoding;
use geometry_os::export;
use geometry_os::hermes;
use geometry_os::keys;
use geometry_os::palace_device::PalaceDevice;
use geometry_os::pixel;
use geometry_os::preprocessor;
use geometry_os::qemu;
use geometry_os::render;
use geometry_os::riscv;
use geometry_os::save;
use geometry_os::scrollback;
use geometry_os::vm;

use qemu::QemuBridge;

use minifb::{Key, KeyRepeat, MouseButton, MouseMode, Window, WindowOptions};
use std::collections::{HashSet, VecDeque};
use std::io::Write;
use std::path::{Path, PathBuf};

use audio::play_beep;
use canvas::*;
use cli::cli_main;
use hermes::{run_build_canvas, run_hermes_canvas};
use keys::{key_ctrl_num, key_ctrl_shift, key_to_ascii, key_to_ascii_shifted};
use render::*;
use riscv::live::{spawn_vm_thread, Frame, GuestMode, RiscvVmHandle, VmStatus, VmThreadConfig};
use save::{load_state, save_full_buffer_png, save_screen_png, save_state};

// ── Memory map ───────────────────────────────────────────────────
const KEYS_BITMASK_PORT: usize = 0xFFB;
const NET_PORT: usize = 0xFFC;
#[allow(dead_code)]
const TICKS_PORT: usize = 0xFFE;
#[allow(dead_code)]
const KEY_PORT: usize = 0xFFF;
const NOTIFICATION_PORT: usize = 0xFFA; // write addr of message to push notification
const HOTRELOAD_VERB_PORT: usize = 0xFF5; // host reload verb (0=noop, 1=edit, 2=reload)
const HOTRELOAD_PATH_PORT: usize = 0xFF6; // RAM addr of null-terminated filename
const NOTIFICATION_QUEUE_BASE: usize = 0x7600; // up to 32 notifications, each 4 words (addr, timestamp, 0, 0)
const NOTIFICATION_QUEUE_MAX: usize = 32;

use std::sync::Mutex;
static HYPERVISOR_CONSOLE_BUF: Mutex<Vec<String>> = Mutex::new(Vec::new());

// ── Desktop polish: host notification state ───────────────────────
#[allow(dead_code)]
struct HostNotification {
    message: String,
    timestamp_secs: u64,
}

fn get_host_notifications() -> Vec<HostNotification> {
    // Read system notifications from /proc or systemd
    // For now: return empty -- populated by VM programs via NOTIFICATION_PORT writes
    Vec::new()
}

/// Read current time as HH:MM string
fn get_clock_string() -> String {
    let now = std::time::SystemTime::now();
    let duration = now
        .duration_since(std::time::UNIX_EPOCH)
        .unwrap_or_default();
    let total_secs = duration.as_secs();
    let hours = ((total_secs / 3600) + 0) % 24; // UTC; adjust for timezone if needed
    let minutes = (total_secs / 60) % 60;
    format!("{:02}:{:02}", hours, minutes)
}

/// Read current time as HH:MM string in local timezone
fn get_local_clock_string() -> String {
    // Try to get local time via `date` command (portable, no deps)
    if let Ok(output) = std::process::Command::new("date").arg("+%H:%M").output() {
        let s = String::from_utf8_lossy(&output.stdout).trim().to_string();
        if s.len() == 5 && s.contains(':') {
            return s;
        }
    }
    get_clock_string()
}

/// Read battery percentage from /sys (Linux)
fn get_battery_percent() -> Option<u8> {
    // Try common battery paths
    for path in &[
        "/sys/class/power_supply/BAT0/capacity",
        "/sys/class/power_supply/BAT1/capacity",
        "/sys/class/power_supply/battery/capacity",
    ] {
        if let Ok(content) = std::fs::read_to_string(path) {
            if let Ok(pct) = content.trim().parse::<u8>() {
                return Some(pct);
            }
        }
    }
    None
}

/// Read network connection status
fn get_network_status() -> &'static str {
    if std::path::Path::new("/sys/class/net/wlan0/operstate").exists() {
        if let Ok(state) = std::fs::read_to_string("/sys/class/net/wlan0/operstate") {
            if state.trim() == "up" {
                return "WiFi";
            }
        }
    }
    if std::path::Path::new("/sys/class/net/eth0/operstate").exists() {
        if let Ok(state) = std::fs::read_to_string("/sys/class/net/eth0/operstate") {
            if state.trim() == "up" {
                return "Eth";
            }
        }
    }
    "NoNet"
}

/// Read audio volume percentage from ALSA/PulseAudio/PipeWire.
/// Tries PipeWire first (via wpctl), then PulseAudio (pactl), then ALSA mixer.
fn get_volume_percent() -> Option<u8> {
    // Method 1: PipeWire via wpctl
    if let Ok(output) = std::process::Command::new("wpctl")
        .args(["get-volume", "@DEFAULT_AUDIO_SINK@"])
        .output()
    {
        let s = String::from_utf8_lossy(&output.stdout);
        // Output format: "Volume: 0.65" or "Volume: 0.65 [MUTED]"
        if let Some(vol_part) = s.strip_prefix("Volume:") {
            let vol_str = vol_part.trim();
            if vol_str.contains("MUTED") {
                return Some(0); // muted = 0%
            }
            if let Ok(f) = vol_str.parse::<f32>() {
                return Some((f * 100.0).min(100.0) as u8);
            }
        }
    }

    // Method 2: PulseAudio via pactl
    if let Ok(output) = std::process::Command::new("pactl")
        .args(["get-sink-volume", "@DEFAULT_SINK@"])
        .output()
    {
        let s = String::from_utf8_lossy(&output.stdout);
        // Parse "Volume: front-left: 32768 /  50% ..."
        for part in s.split('/') {
            let trimmed = part.trim();
            if trimmed.ends_with('%') {
                if let Ok(pct) = trimmed.trim_end_matches('%').trim().parse::<u8>() {
                    return Some(pct);
                }
            }
        }
    }

    // Method 3: ALSA mixer via amixer
    if let Ok(output) = std::process::Command::new("amixer")
        .args(["get", "Master"])
        .output()
    {
        let s = String::from_utf8_lossy(&output.stdout);
        for line in s.lines() {
            if line.contains('[') && line.contains('%') {
                // Parse "[50%]" or "[50%] [on]"
                let start = line.find('[').unwrap_or(0);
                let end = line.find('%').unwrap_or(0);
                if start < end {
                    let num = &line[start + 1..end];
                    if let Ok(pct) = num.parse::<u8>() {
                        // Check for mute
                        if line.contains("[off]") {
                            return Some(0);
                        }
                        return Some(pct);
                    }
                }
            }
        }
    }

    None
}

// ── Save file ───────────────────────────────────────────────────
const SAVE_FILE: &str = "geometry_os.sav";

// ── Terminal mode ──────────────────────────────────────────────────
#[derive(Clone, Copy, PartialEq, Debug)]
enum Mode {
    Terminal,
    Editor,
}

/// Auto-decode .rts.png pixel paths in a QEMU config string.
/// Replaces kernel=/initrd=.rts.png with temp file paths.
/// Also resolves building references like kernel=building:42
fn resolve_qemu_pixel_paths(config: &str, vm: &crate::vm::Vm) -> String {
    let mut result = config.to_string();
    for key in &["kernel", "initrd", "disk", "drive", "dtb"] {
        if let Some(start) = result.find(&format!("{}=", key)) {
            let val_start = start + key.len() + 1;
            let val_end = result[val_start..]
                .find(' ')
                .map(|i| val_start + i)
                .unwrap_or(result.len());
            let value = &result[val_start..val_end];

            // Handle building:ID references
            if value.starts_with("building:") {
                let building_id_str = &value[9..]; // Skip "building:"
                if let Ok(building_id) = building_id_str.parse::<u32>() {
                    // Find building coordinate and extract binary
                    if let Some(temp_path) = extract_binary_from_building(vm, building_id) {
                        result.replace_range(val_start..val_end, &temp_path);
                        eprintln!(
                            "[hypervisor: resolved {}=building:{} -> {}]",
                            key, building_id, temp_path
                        );
                    } else {
                        eprintln!(
                            "[hypervisor: warning: building {} not found or has no binary data]",
                            building_id
                        );
                    }
                }
            }
            // Handle .rts.png pixel paths
            else if value.to_lowercase().ends_with(".rts.png") {
                if let Ok(temp_path) = geometry_os::pixel::decode_rts_to_temp(value) {
                    result.replace_range(val_start..val_end, &temp_path);
                }
            }
        }
    }
    result
}

/// Extract binary from a building's metadata and write to temp file
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
        let meta: geometry_os::encoding::BinaryMetadata = serde_json::from_str(json).ok()?;
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

/// Detect the primary monitor resolution via xrandr.
/// Falls back to 1920x1080 if detection fails.
fn detect_monitor_resolution() -> (usize, usize) {
    if let Ok(output) = std::process::Command::new("xrandr").arg("--query").output() {
        for line in String::from_utf8_lossy(&output.stdout).lines() {
            if line.contains(" connected") || line.contains(" connected primary") {
                // Parse: "eDP-1 connected primary 2560x1600+0+0 ..."
                if let Some(_star_idx) = line.find('*') {
                    // Active resolution has * marker in mode list
                }
                // First format: "NAME connected primary WxH+X+Y ..."
                let parts: Vec<&str> = line.split_whitespace().collect();
                for part in parts {
                    if part.contains('x')
                        && part.chars().next().map_or(false, |c| c.is_ascii_digit())
                    {
                        let dims: Vec<&str> = part.split('x').collect();
                        if dims.len() == 2 {
                            if let (Ok(w), Ok(h)) =
                                (dims[0].parse::<usize>(), dims[1].parse::<usize>())
                            {
                                return (w, h);
                            }
                        }
                    }
                }
            }
        }
    }
    // Fallback: 1920x1080
    (1920, 1080)
}

/// Scale the internal 1024x768 render buffer into a fullscreen buffer
/// using nearest-neighbor scaling, centered with black bars.
fn scale_buffer_to_fullscreen(
    src: &[u32],
    src_w: usize,
    src_h: usize,
    dst: &mut [u32],
    dst_w: usize,
    dst_h: usize,
) {
    // Clear destination
    dst.fill(0);

    // Compute scale factor (fit to screen, maintain aspect ratio)
    let scale_x = dst_w as f64 / src_w as f64;
    let scale_y = dst_h as f64 / src_h as f64;
    let scale = scale_x.min(scale_y);
    let scaled_w = (src_w as f64 * scale) as usize;
    let scaled_h = (src_h as f64 * scale) as usize;

    // Center offset
    let ox = (dst_w - scaled_w) / 2;
    let oy = (dst_h - scaled_h) / 2;

    // Nearest-neighbor scale
    for dy in 0..scaled_h {
        let sy = dy * src_h / scaled_h;
        let dst_row = (dy + oy) * dst_w + ox;
        let src_row = sy * src_w;
        for dx in 0..scaled_w {
            let sx = dx * src_w / scaled_w;
            dst[dst_row + dx] = src[src_row + sx];
        }
    }
}

fn main() {
    // ── CLI mode: headless geo> prompt on stdin/stdout ─────────────
    let args: Vec<String> = std::env::args().collect();
    if args.len() > 1 && args[1] == "--cli" {
        cli_main(&args[2..]);
        return;
    }

    // Networking setup
    let mut local_port = 9000;
    let mut remote_port = 9001;
    let mut boot_mode = false;
    let mut fullscreen_mode = false;
    let mut terminal_mode = false;
    let mut desktop_mode = false;
    let mut camera_mode = false;
    let mut vcc_check_mode = false;
    let mut expected_vcc: Option<String> = None;
    let mut camera_device = "/dev/video0".to_string();
    let mut input_file: Option<String> = None;
    let mut riscv_user_elf: Option<String> = None;
    let mut load_editor: bool = false;
    let mut framebuffer_mode = false;
    let mut i = 1;
    while i < args.len() {
        if args[i] == "--local-port" && i + 1 < args.len() {
            local_port = args[i + 1].parse().unwrap_or(9000);
            i += 2;
        } else if args[i] == "--remote-port" && i + 1 < args.len() {
            remote_port = args[i + 1].parse().unwrap_or(9000);
            i += 2;
        } else if args[i] == "--boot" {
            boot_mode = true;
            i += 1;
        } else if args[i] == "--load-editor" {
            load_editor = true;
            i += 1;
        } else if args[i] == "--framebuffer" || args[i] == "--fb" {
            framebuffer_mode = true;
            i += 1;
        } else if args[i] == "--vcc-check" {
            vcc_check_mode = true;
            i += 1;
        } else if args[i] == "--expected-vcc" && i + 1 < args.len() {
            expected_vcc = Some(args[i + 1].clone());
            i += 2;
        } else if args[i] == "--user" && i + 1 < args.len() {
            riscv_user_elf = Some(args[i + 1].clone());
            i += 2;
        } else if args[i] == "--fullscreen" {
            fullscreen_mode = true;
            i += 1;
        } else if args[i] == "--terminal" {
            terminal_mode = true;
            i += 1;
        } else if args[i] == "--desktop" {
            desktop_mode = true;
            i += 1;
        } else if args[i] == "--camera" {
            camera_mode = true;
            i += 1;
        } else if args[i] == "--camera-device" && i + 1 < args.len() {
            camera_device = args[i + 1].clone();
            camera_mode = true;
            i += 2;
        } else if !args[i].starts_with("--") {
            input_file = Some(args[i].clone());
            i += 1;
        } else {
            i += 1;
        }
    }

    // ── VCC Check Mode ──────────────────────────────────────────
    if vcc_check_mode {
        if let Some(ref path_str) = input_file {
            println!("[vcc] Performing hash check on {}", path_str);
            // Load file into a temporary VM to check its visual output
            let mut check_vm = vm::Vm::new();
            match pixel::boot_from_png(path_str, &mut check_vm.ram, 0x1000) {
                Ok(_) => {
                    // For VCC, we often check the "boot appearance" (first frame)
                    // or just the raw bytecode layout hash.
                    // Here we'll compute the hash of the 256x256 RAM region that
                    // corresponds to the screen buffer if mapped.
                    let hash = geometry_os::vision::canvas_checksum(&check_vm.screen);
                    let hash_str = format!("{:08X}", hash);
                    println!("[vcc] Actual Checksum: {}", hash_str);

                    if let Some(ref expected) = expected_vcc {
                        if hash_str.eq_ignore_ascii_case(expected) {
                            println!("[vcc] PASS: Checksum matches expected value.");
                            std::process::exit(0);
                        } else {
                            println!("[vcc] FAIL: Checksum mismatch!");
                            println!("[vcc]   Expected: {}", expected);
                            std::process::exit(1);
                        }
                    }
                    std::process::exit(0);
                },
                Err(e) => {
                    eprintln!("[vcc] Error loading file: {}", e);
                    std::process::exit(1);
                },
            }
        } else {
            eprintln!("[vcc] Error: --vcc-check requires an input file.");
            std::process::exit(1);
        }
    }

    let socket = std::net::UdpSocket::bind(format!("127.0.0.1:{}", local_port)).ok();
    if let Some(ref s) = socket {
        let _ = s.set_nonblocking(true);
    }

    // ── Phase 94: BIOS Pixel detection ───────────────────────────
    // If the input file is a PNG starting with a BIOS pixel (bit 31 set),
    // parse it to configure the VM before window/VM allocation.
    let mut bios_pixel: Option<pixel::BootPixel> = None;
    let mut bios_skip: usize = 0;
    if let Some(ref path_str) = input_file {
        if pixel::is_pixelpack_png(path_str) {
            if let Ok(seed) = pixel::peek_first_pixel(path_str) {
                if let Some(bios) = pixel::BootPixel::parse(seed) {
                    println!("[BIOS] {}", bios.summary());
                    bios_pixel = Some(bios);
                    bios_skip = 1;
                }
            }
        }
    }

    // Detect monitor resolution for fullscreen mode
    let (win_w, win_h, win_opts) = if fullscreen_mode {
        let (mw, mh) = detect_monitor_resolution();
        (
            mw,
            mh,
            WindowOptions {
                borderless: true,
                title: false,
                resize: false,
                topmost: false,
                ..Default::default()
            },
        )
    } else {
        // Override window size from BIOS resolution if present
        let (w, h) = match bios_pixel.map(|b| b.resolution) {
            Some(pixel::BiosResolution::Size512) => (512, 512),
            Some(pixel::BiosResolution::TextGrid128x32) => (128, 32),
            Some(pixel::BiosResolution::Headless) => {
                // Headless BIOS in GUI mode: use minimal window
                println!("[BIOS] Headless mode requested; using fallback window");
                (WIDTH, HEIGHT)
            },
            _ => (WIDTH, HEIGHT),
        };
        (
            w,
            h,
            WindowOptions {
                resize: false,
                ..Default::default()
            },
        )
    };

    let mut window = geometry_os::window_wrapper::GeOsWindow::new(
        "Geometry OS -- Canvas Text Surface",
        win_w,
        win_h,
        win_opts,
        framebuffer_mode,
    )
    .expect("Failed to initialize display/framebuffer.");

    // Apply BIOS FPS lock (0 = uncapped)
    if let Some(ref bios) = bios_pixel {
        window.set_target_fps(bios.fps as usize);
    } else {
        window.set_target_fps(60);
    }

    let mut buffer: Vec<u32> = vec![0; WIDTH * HEIGHT];

    // ── /dev/palace kernel buffer ────────────────────────────────
    // Try to mmap the kernel pixel buffer for zero-copy access.
    // When available, this replaces the Python FUSE socket bridge.
    let palace_device = PalaceDevice::open();
    if palace_device.is_available() {
        eprintln!("[main] /dev/palace: zero-copy pixel buffer active");
    } else {
        eprintln!("[main] /dev/palace not available — using legacy pixel store");
    }

    // Fullscreen: create a second buffer at monitor resolution
    let mut fs_buffer: Vec<u32> = if fullscreen_mode {
        vec![0; win_w * win_h]
    } else {
        Vec::new()
    };
    let fs_win_w = win_w;
    let fs_win_h = win_h;

    // ── State ────────────────────────────────────────────────────
    let mut vm = vm::Vm::new();

    // Load pre-assembled editor if --load-editor flag is set
    if load_editor {
        let home_dir = std::env::var("HOME").unwrap_or_else(|_| ".".to_string());
        let editor_path = std::path::PathBuf::from(home_dir)
            .join(".geometry_os")
            .join("programs")
            .join("editor.bin");

        match std::fs::read(&editor_path) {
            Ok(bytecode_bytes) => {
                // Convert bytes to u32 words (little-endian)
                if bytecode_bytes.len() % 4 == 0 {
                    let word_count = bytecode_bytes.len() / 4;
                    println!(
                        "[load-editor] Loading {} words from {}",
                        word_count,
                        editor_path.display()
                    );

                    for i in 0..word_count {
                        let byte_start = i * 4;
                        let word = u32::from_le_bytes([
                            bytecode_bytes[byte_start],
                            bytecode_bytes[byte_start + 1],
                            bytecode_bytes[byte_start + 2],
                            bytecode_bytes[byte_start + 3],
                        ]);
                        // Load at 0x1000 (standard program base address)
                        vm.ram[0x1000 + i] = word;
                    }

                    println!("[load-editor] Successfully loaded editor bytecode");
                    // Set PC to start of editor
                    vm.pc = 0x1000;
                } else {
                    eprintln!(
                        "[load-editor] Error: bytecode file size is not a multiple of 4 bytes"
                    );
                }
            },
            Err(e) => {
                eprintln!(
                    "[load-editor] Warning: could not read {}: {}",
                    editor_path.display(),
                    e
                );
                eprintln!("[load-editor] Tip: Run: ./target/debug/assemble_bin programs/editor.asm ~/.geometry_os/programs/editor.bin");
            },
        }
    }

    // Channel for background vision inspection results (Phase 35)
    let (inspection_tx, inspection_rx) = std::sync::mpsc::channel::<(
        usize,
        Vec<geometry_os::kernel::area_manager::DiagnosticIssue>,
    )>();

    // Initialize infinite tile map with EPL persistence
    {
        let map_dir = std::env::var("HOME")
            .map(|h| std::path::PathBuf::from(h).join(".geometry_os"))
            .unwrap_or_else(|_| std::path::PathBuf::from("/tmp"));
        let _ = std::fs::create_dir_all(&map_dir);
        let epl_path = map_dir.join("tile_store.epl");
        vm.tile_store = geometry_os::tile_store::TileStore::with_epl(
            epl_path.to_str().unwrap_or("/tmp/tile_store.epl"),
        );
    }

    let mut is_running = false;

    // ── RISC-V live VM state (Phase B) ───────────────────────────
    let mut riscv_handle: Option<RiscvVmHandle> = None;
    let mut riscv_latest_frame: Option<Frame> = None;

    if let Some(ref path) = riscv_user_elf {
        match std::fs::read(path) {
            Ok(elf_data) => {
                let config = VmThreadConfig {
                    mode: GuestMode::Elf(elf_data),
                    ram_size: 16 * 1024 * 1024,
                    ram_base: 0,
                    initial_privilege: Some(riscv::cpu::Privilege::User),
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

    // ── Active Substrate (Phase: Spatial Computing) ──────────────
    #[cfg(feature = "gpu")]
    {
        if let Some((device, queue)) = pollster::block_on(async {
            let instance = wgpu::Instance::new(&wgpu::InstanceDescriptor::default());
            let adapter = instance
                .request_adapter(&wgpu::RequestAdapterOptions::default())
                .await
                .ok()?;
            let (device, queue) = adapter
                .request_device(&wgpu::DeviceDescriptor::default())
                .await
                .ok()?;
            Some((device, queue))
        }) {
            let sub = geometry_os::kernel::active_substrate::ActiveSubstrate::new(
                &device, &queue, 256, 256,
            );
            vm.active_substrate = Some(sub);
        }
    }

    // ── Camera feed: host-side webcam → bottom compositor layer ──
    // The camera is the robot's "eyes" -- pixels injected before WINSYS
    // windows (the robot's "thoughts"). Pixel real estate = attention budget.
    #[cfg(feature = "native")]
    let mut camera_handle: Option<camera::CameraHandle> = None;
    #[cfg(feature = "native")]
    let mut camera_latest_frame: Option<camera::CameraFrame> = None;
    let mut canvas_assembled = false;
    let mut breakpoints: HashSet<u32> = HashSet::new();
    let mut hit_breakpoint = false;
    let mut recording = false;
    let mut frame_id = 0;

    // Visual Debugger state
    let mut ram_intensity = vec![0.0f32; vm::RAM_SIZE];
    let mut ram_kind = vec![vm::MemAccessKind::Read; vm::RAM_SIZE];
    let mut pc_history: VecDeque<u32> = VecDeque::with_capacity(64);
    let mut ram_view_base: usize = 0x2000;

    // Phase 200: File watcher state (path, last modified time)
    let mut watch_file: Option<(std::path::PathBuf, Option<std::time::SystemTime>)> = None;

    // Cursor position on canvas (logical coordinates, can exceed visible area)
    let mut cursor_row: usize;
    let mut cursor_col: usize;

    // Scroll offset: which logical row is at the top of the visible window
    let mut scroll_offset: usize;

    // Canvas backing buffer (separate from VM RAM to allow > 32 rows
    // without overlapping bytecode at 0x1000)
    let mut canvas_buffer: Vec<u32> = vec![0; CANVAS_MAX_ROWS * CANVAS_COLS];

    // Building icon cache: load pixelpack PNGs as scaled thumbnails
    let mut icon_cache = render::BuildingIconCache::new();
    {
        // (building_name, primary_asm_file)
        let desktop_apps = [
            ("snake", "snake"),
            ("ball", "ball"),
            ("plasma", "plasma"),
            ("painter", "painter"),
            ("colors", "colors"),
            ("fire", "fire"),
            ("init", "init"),
            ("shell", "shell"),
            ("linux", "linux_building"),
            ("tetris", "tetris"),
            ("smart_term", "smart_term"),
            ("oracle", "oracle"),
            ("ai_terminal", "ai_terminal"),
            ("hermes", "hermes_term"),
            ("host", "host_term"),
            ("memory_palace", "memory_palace"),
        ];
        for (app_name, asm_name) in &desktop_apps {
            let pxpk_path = format!("{}.pxpk.png", app_name);
            let asm_path = format!("programs/{}.asm", asm_name);
            // Try loading pixelpack PNG first, fall back to generating from .asm
            if icon_cache.load_icon(app_name, &pxpk_path, 24, 32) {
                // loaded from existing pxpk.png
            } else if let Ok(source) = std::fs::read_to_string(&asm_path) {
                // Generate icon from assembly source on the fly
                let bytes = source.as_bytes();
                if let Ok(pxpk_data) = crate::pixel::encode_pixelpack_png(bytes) {
                    if !pxpk_data.is_empty() {
                        let _ = icon_cache.load_icon_from_data(app_name, &pxpk_data, 24, 32);
                    }
                }
            }
        }
    }

    // Status bar message
    let mut status_msg = String::from("[TERM: type commands, Enter=run]");
    let mut current_boot_seeds: Option<Vec<u32>> = None;

    // ── Camera init (deferred: needs status_msg) ────────────────
    #[cfg(feature = "native")]
    if camera_mode {
        match camera::open_camera(&camera_device) {
            Ok(handle) => {
                camera_handle = Some(handle);
                status_msg = format!("[camera: {} active]", camera_device);
            },
            Err(e) => {
                eprintln!("[camera] {}", e);
                status_msg = format!("[camera: {}]", e);
            },
        }
    }

    // Last loaded file (for Ctrl+F8 reload)
    let mut loaded_file: Option<PathBuf> = None;

    // Double-click detection for building launch
    let mut last_click_time: std::time::Instant = std::time::Instant::now();
    let mut last_click_screen: (f32, f32) = (-1.0, -1.0);
    let mut click_count: u8 = 0;
    let mut prev_mouse_down: bool = false;
    let double_click_threshold_ms: u64 = 500;
    let double_click_dist: f32 = 8.0; // max pixels between two clicks

    // ── Fullscreen Map Mode ─────────────────────────────────────
    // When a map/desktop program is running, the VM screen fills the window.
    let mut fullscreen_map: bool = false;
    let mut mouse_drag_active: bool = false;
    let mut drag_start: (f32, f32) = (0.0, 0.0);
    let mut drag_cam_start: (i32, i32) = (0, 0);
    // Zoom: 2 = default (4px tiles), 0-1 = zoomed out, 3-4 = zoomed in
    let mut zoom_level: u32 = 2;

    // ── Font Mode (Phase 159) ────────────────────────────────────
    let mut font_mode: FontMode = FontMode::Normal;
    // Last launched app name (for detecting return to map)
    let mut launched_from_map: Option<String> = None;

    // ── Alt-Tab window switcher state ─────────────────────────────
    let mut alt_tab_active: bool = false;
    let mut alt_tab_index: usize = 0;
    let mut alt_held: bool = false;

    // ── Windowed App Execution (Phase 107) ──────────────────────
    // Multiple apps can run simultaneously in world-space windows.
    // Each app gets its own process with bytecode in a private RAM region.
    /// Base address for app bytecode (each app gets 8K = 0x2000 cells)
    const APP_CODE_BASE: usize = 0x4000;
    /// Size of each app's code region
    const APP_CODE_SIZE: usize = 0x2000;
    /// Maximum concurrent windowed apps
    const MAX_WINDOWED_APPS: usize = 4;
    // Track which app slots are in use: (slot_index, pid, app_name)
    let mut active_apps: Vec<(usize, u32, String)> = Vec::new();

    // ── Window Drag (Phase 107) ────────────────────────────────
    let mut window_drag_active: bool = false;
    let mut window_drag_id: u32 = 0; // window id being dragged
    let mut window_drag_start: (f32, f32) = (0.0, 0.0);
    let mut window_drag_world_start: (i32, i32) = (0, 0);
    // ── Window double-click maximize (Phase 153) ────────────
    let mut win_dbl_click_id: u32 = 0;
    let mut win_dbl_click_time: std::time::Instant = std::time::Instant::now();
    let mut win_dbl_click_pos: (f32, f32) = (0.0, 0.0);

    // ── Terminal Scrollback (Phase 156) ──────────────────────────
    let mut scrollback = scrollback::ScrollbackBuffer::new();
    let mut in_scrollback: bool = false;
    let mut scrollback_offset: usize = 0;
    // Track how many scrollback lines existed before current command output
    let mut _scrollback_pre_cmd: usize = 0;

    // ── Cursor Improvements (Phase 162) ──────────────────────────
    let mut cursor_style: render::CursorStyle = render::CursorStyle::Block;
    let mut cursor_blink_on: bool = true;
    let mut cursor_blink_timer: std::time::Instant = std::time::Instant::now();

    // ── Quick Launch Bar (Phase 158) ──────────────────────────
    let mut launcher_active: bool = false;
    let mut launcher_input: String = String::new();
    // Save the top 3 canvas rows so we can restore them after launcher closes
    let mut launcher_saved_rows: [Vec<u32>; 3] = [
        vec![0u32; CANVAS_COLS],
        vec![0u32; CANVAS_COLS],
        vec![0u32; CANVAS_COLS],
    ];

    // ── Text Selection & Clipboard (Phase 157) ──────────────────
    let mut text_sel_active: bool = false; // currently dragging a selection
    let mut text_sel_start: (usize, usize) = (0, 0); // (row, col) of drag start
    let mut text_sel_end: (usize, usize) = (0, 0); // (row, col) of drag end (updated live)
    let mut text_sel_anchor: Option<((usize, usize), (usize, usize))> = None; // persisted selection (after drag ends)
    let mut clipboard: String = String::new(); // internal clipboard

    // If --boot flag, perform boot sequence: load init.asm as PID 1
    if boot_mode {
        match vm.boot() {
            Ok(pid) => {
                status_msg = format!("[BOOT] init started as PID {}", pid);
                is_running = true;
            },
            Err(e) => {
                status_msg = format!("[BOOT FAILED] {}", e);
            },
        }
    }

    // ── Mode state ──────────────────────────────────────────────
    let mut mode = Mode::Terminal;
    // In terminal mode, track which row the prompt is on
    let mut term_prompt_row: usize;
    // The "output row" for terminal -- where next line goes
    let mut term_output_row: usize;

    // ── QEMU bridge state ───────────────────────────────────────
    let mut qemu_bridge: Option<QemuBridge> = None;
    let mut qemu_active: bool = false;
    let mut qemu_exited: bool = false;

    // Boot: write welcome banner + first prompt into canvas
    {
        term_output_row = write_line_to_canvas(&mut canvas_buffer, 0, "Geometry OS v1.0.0");
        term_output_row = write_line_to_canvas(
            &mut canvas_buffer,
            term_output_row,
            "167 opcodes | 32 regs | 256x256",
        );
        term_output_row = write_line_to_canvas(
            &mut canvas_buffer,
            term_output_row,
            "WASD/arrows=move  /=commands  Esc=terminal",
        );
        term_output_row = write_line_to_canvas(&mut canvas_buffer, term_output_row, "");
        term_prompt_row = term_output_row;
        let _ = write_line_to_canvas(&mut canvas_buffer, term_output_row, "geo> ");
        // Position cursor after "geo> "
        cursor_row = term_prompt_row;
        cursor_col = 5; // after "geo> "
        scroll_offset = 0;
        // Record initial banner to scrollback
        scrollback.push_canvas_rows(&canvas_buffer, 0, term_output_row);
        _scrollback_pre_cmd = scrollback.len();
    }

    // File input mode (Ctrl+F8 activates this)
    let mut file_input_mode = false;
    let mut file_input_buf = String::new();
    let mut file_completions: Vec<String> = Vec::new();
    let mut file_completion_idx: usize = 0;

    // ── Desktop mode: --desktop flag loads world_desktop.asm ──────
    if desktop_mode && input_file.is_none() {
        input_file = Some("programs/world_desktop.asm".to_string());
    }

    // Load file from command-line argument at startup
    if let Some(path_str) = input_file.as_ref() {
        let path = PathBuf::from(&path_str);
        if pixel::is_pixelpack_png(path_str) {
            // Phase 94: BIOS-aware PNG boot
            match bios_pixel.map(|b| b.mode) {
                Some(pixel::BootMode::AsmSource) => {
                    match pixel::boot_source_png_to_ram_skip(
                        path_str,
                        &mut canvas_buffer,
                        &mut vm.ram,
                        bios_skip,
                    ) {
                        Ok(result) => {
                            vm.canvas_buffer[..4096].copy_from_slice(&canvas_buffer[..4096]);
                            vm.pc = 0x1000;
                            vm.halted = false;
                            is_running = true;
                            canvas_assembled = true;
                            status_msg = format!(
                                "[BIOS src-boot] {} chars -> {} words from {}",
                                result.char_count,
                                result.bytecode_words,
                                path.display()
                            );
                            loaded_file = Some(path);
                        },
                        Err(e) => {
                            status_msg = format!("[PNG source boot failed] {}", e);
                        },
                    }
                },
                Some(pixel::BootMode::RawBytecode) | Some(pixel::BootMode::PixelpackCompressed) => {
                    match pixel::boot_from_png_skip(path_str, &mut vm.ram, 0x1000, bios_skip) {
                        Ok(result) => {
                            vm.pc = 0x1000;
                            vm.halted = false;
                            is_running = true;
                            status_msg = format!(
                                "[BIOS bytecode-boot] {} bytes -> {} words from {}",
                                result.byte_count,
                                result.ram_words,
                                path.display()
                            );
                            loaded_file = Some(path);
                        },
                        Err(e) => {
                            status_msg = format!("[PNG bytecode boot failed] {}", e);
                        },
                    }
                },
                Some(pixel::BootMode::NeuralSubstrate) => {
                    status_msg = String::from("[BIOS] Neural substrate boot not yet implemented");
                },
                Some(pixel::BootMode::ChainBoot) => {
                    match pixel::load_seeds_from_png(path_str) {
                        Ok(seeds) => {
                            current_boot_seeds = Some(seeds.clone());
                            match pixel::BootChain::parse(&seeds) {
                                Ok(chain) => {
                                    println!("[BIOS] Chain boot: {}", chain.summary());

                                    // Check for Linux kernel regions (hypervisor path)
                                    let mut kernel_data: Option<Vec<u8>> = None;
                                    let mut initrd_data: Option<Vec<u8>> = None;
                                    let mut has_geos_payload = false;

                                    for (i, region) in chain.regions.iter().enumerate() {
                                        match region.region_type {
                                            pixel::ChainRegionType::LinuxKernel => {
                                                if let Ok(data) = chain.resolve_region(&seeds, i) {
                                                    println!(
                                                        "[BIOS] Extracted Linux kernel: {} bytes",
                                                        data.len()
                                                    );
                                                    kernel_data = Some(data);
                                                }
                                            },
                                            pixel::ChainRegionType::LinuxInitrd => {
                                                if let Ok(data) = chain.resolve_region(&seeds, i) {
                                                    println!(
                                                        "[BIOS] Extracted initrd: {} bytes",
                                                        data.len()
                                                    );
                                                    initrd_data = Some(data);
                                                }
                                            },
                                            _ => {
                                                has_geos_payload = true;
                                            },
                                        }
                                    }

                                    if has_geos_payload {
                                        // Standard GeOS chain boot (ASM + bytecode)
                                        let mut asm_loaded = false;
                                        for i in 0..chain.regions.len() {
                                            let region = &chain.regions[i];
                                            match region.region_type {
                                                pixel::ChainRegionType::AsmSource => {
                                                    if let Ok(data) =
                                                        chain.resolve_region(&seeds, i)
                                                    {
                                                        let source = String::from_utf8_lossy(&data);
                                                        // Load into canvas for editing
                                                        load_source_to_canvas(
                                                            &mut canvas_buffer,
                                                            &source,
                                                            &mut cursor_row,
                                                            &mut cursor_col,
                                                        );

                                                        // Assemble if it's the first ASM region
                                                        if !asm_loaded {
                                                            let mut pp = crate::preprocessor::Preprocessor::new();
                                                            let preprocessed =
                                                                pp.preprocess(&source);
                                                            match crate::assembler::assemble(
                                                                &preprocessed,
                                                                0x1000,
                                                            ) {
                                                                Ok(asm_result) => {
                                                                    // Store label map for label-aware disassembly
                                                                    vm.set_label_map(
                                                                        &asm_result.labels,
                                                                        0x1000,
                                                                    );
                                                                    for (j, &word) in asm_result
                                                                        .pixels
                                                                        .iter()
                                                                        .enumerate()
                                                                    {
                                                                        if 0x1000 + j < vm.ram.len()
                                                                        {
                                                                            vm.ram[0x1000 + j] =
                                                                                word;
                                                                        }
                                                                    }
                                                                    vm.pc = 0x1000;
                                                                    asm_loaded = true;
                                                                    canvas_assembled = true;
                                                                },
                                                                Err(e) => {
                                                                    println!("[BIOS] ASM assembly failed: {}", e);
                                                                    println!("[BIOS] Corrupted ASM source:\n{}", preprocessed);
                                                                },
                                                            }
                                                        }
                                                    }
                                                },
                                                pixel::ChainRegionType::RawBytecode
                                                | pixel::ChainRegionType::PixelpackCompressed => {
                                                    // Delegate binary types to load_into_vm
                                                    // Wait, load_into_vm already handles these and sets PC.
                                                    // If we already loaded ASM, we might not want binary to overwrite PC.
                                                },
                                                _ => {},
                                            }
                                        }

                                        match chain.load_into_vm(&seeds, &mut vm) {
                                            Ok(_) => {
                                                is_running = true;
                                                if asm_loaded {
                                                    vm.pc = 0x1000; // Restore ASM PC if it was first
                                                }
                                                vm.halted = false;
                                                status_msg = format!(
                                                    "[BIOS chain-boot] {} regions from {}",
                                                    chain.regions.len(),
                                                    path.display()
                                                );
                                                loaded_file = Some(path);
                                            },
                                            Err(e) => {
                                                status_msg = format!("[Chain load failed] {}", e);
                                            },
                                        }
                                    } else if kernel_data.is_some() {
                                        // Launch RISC-V hypervisor with extracted kernel (direct boot)
                                        let kernel = kernel_data.unwrap();
                                        let initrd_slice = initrd_data;
                                        // 768MB: covers vmalloc identity mapping at PA 0xA0000000.
                                        // The kernel's setup_vm() creates identity-mapped megapages
                                        // for the vmalloc region (VA 0xA0000000 → PA 0xA0000000).
                                        // With only 256MB RAM (0x80000000-0x8FFFFFFF), PA 0xA0000000
                                        // is outside RAM and causes LOAD_ACCESS_FAULT.
                                        let ram_mb = 768u32;
                                        let bootargs =
                                            "console=sbi earlycon=sbi lpj=400000".to_string();
                                        println!(
                                            "[BIOS] Launching RISC-V hypervisor: kernel={}B, initrd={}B, ram={}MB",
                                            kernel.len(),
                                            initrd_slice.as_ref().map(|d| d.len()).unwrap_or(0),
                                            ram_mb
                                        );

                                        // Kill existing RISC-V VM if any
                                        if riscv_handle.is_some() {
                                            riscv_handle = None;
                                            riscv_latest_frame = None;
                                        }

                                        let config = VmThreadConfig {
                                            mode: GuestMode::Linux {
                                                kernel,
                                                initrd: initrd_slice,
                                                bootargs,
                                            },
                                            ram_size: (ram_mb as usize) * 1024 * 1024,
                                            ..Default::default()
                                        };

                                        match spawn_vm_thread(config) {
                                            Ok(h) => {
                                                riscv_handle = Some(h);
                                                vm.hypervisor_active = true;
                                                status_msg = format!(
                                                    "[BIOS] Linux hypervisor booted from pixel chain ({})",
                                                    path.display()
                                                );
                                                loaded_file = Some(path);
                                            },
                                            Err(e) => {
                                                status_msg =
                                                    format!("[Hypervisor spawn failed] {}", e);
                                            },
                                        }
                                    } else {
                                        status_msg =
                                            String::from("[Chain boot] No loadable regions found");
                                    }
                                },
                                Err(e) => {
                                    status_msg = format!("[Chain manifest parse failed] {}", e);
                                },
                            }
                        },
                        Err(e) => {
                            status_msg = format!("[PNG seed load failed] {}", e);
                        },
                    }
                },
                Some(pixel::BootMode::Directory) => {
                    // Directory boot pixels mark spatial FS entries, not executable payloads
                    status_msg = String::from(
                        "[BIOS] Directory boot pixel -- spatial FS entry, not executable",
                    );
                },
                None => {
                    // No BIOS pixel: fall back to geo_boot metadata detection
                    if pixel::is_source_png_file(path_str) {
                        match pixel::boot_source_png_to_ram_skip(
                            path_str,
                            &mut canvas_buffer,
                            &mut vm.ram,
                            bios_skip,
                        ) {
                            Ok(result) => {
                                vm.canvas_buffer[..4096].copy_from_slice(&canvas_buffer[..4096]);
                                vm.pc = 0x1000;
                                vm.halted = false;
                                is_running = true;
                                canvas_assembled = true;
                                status_msg = format!(
                                    "[src-png-boot] {} chars -> {} words from {}",
                                    result.char_count,
                                    result.bytecode_words,
                                    path.display()
                                );
                                loaded_file = Some(path);
                            },
                            Err(e) => {
                                status_msg = format!("[PNG source boot failed] {}", e);
                            },
                        }
                    } else {
                        match pixel::boot_from_png_skip(path_str, &mut vm.ram, 0x1000, bios_skip) {
                            Ok(result) => {
                                vm.pc = 0x1000;
                                vm.halted = false;
                                is_running = true;
                                status_msg = format!(
                                    "[bytecode-png-boot] {} bytes -> {} words from {}",
                                    result.byte_count,
                                    result.ram_words,
                                    path.display()
                                );
                                loaded_file = Some(path);
                            },
                            Err(e) => {
                                status_msg = format!("[PNG bytecode boot failed] {}", e);
                            },
                        }
                    }
                },
            }
        } else if let Ok(source) = std::fs::read_to_string(&path) {
            load_source_to_canvas(
                &mut canvas_buffer,
                &source,
                &mut cursor_row,
                &mut cursor_col,
            );
            scroll_offset = 0;
            status_msg = format!("[loaded: {}]", path.display());
            loaded_file = Some(path);
        } else {
            status_msg = format!("[error: could not read {}]", path_str);
        }
    }

    // Restore saved state on startup (only if no command-line arg and no desktop mode)
    let mut _state_restored = false;
    if input_file.is_none() && !desktop_mode {
        if let Ok((saved_vm, saved_canvas, saved_assembled)) = load_state(SAVE_FILE) {
            vm = saved_vm;
            canvas_buffer = saved_canvas;
            canvas_assembled = saved_assembled;
            // Re-initialize tile store with persistence
            let map_dir = std::env::var("HOME")
                .map(|h| std::path::PathBuf::from(h).join(".geometry_os"))
                .unwrap_or_else(|_| std::path::PathBuf::from("/tmp"));
            let epl_path = map_dir.join("tile_store.epl");
            vm.tile_store = geometry_os::tile_store::TileStore::with_epl(
                epl_path.to_str().unwrap_or("/tmp/tile_store.epl"),
            );
            status_msg = String::from("[state restored from geometry_os.sav]");
            _state_restored = true;
        }
    }

    // ── Auto-showcase: if no args, no saved state, no desktop, auto-run the terminal ──
    // First-run experience: someone clones and `cargo run` sees the pixel terminal
    if input_file.is_none() && !_state_restored && !desktop_mode {
        let showcase_path = PathBuf::from("programs/terminal.asm");
        if let Ok(source) = std::fs::read_to_string(&showcase_path) {
            // Load source into canvas buffer for display in editor
            load_source_to_canvas(
                &mut canvas_buffer,
                &source,
                &mut cursor_row,
                &mut cursor_col,
            );
            loaded_file = Some(showcase_path.clone());

            // Assemble directly from source file (avoids canvas blank-line stripping)
            let mut pp = preprocessor::Preprocessor::new();
            let preprocessed = pp.preprocess(&source);
            match assembler::assemble(&preprocessed, CANVAS_BYTECODE_ADDR) {
                Ok(asm_result) => {
                    // Store label map for label-aware disassembly
                    vm.set_label_map(&asm_result.labels, CANVAS_BYTECODE_ADDR as u32);
                    let ram_len = vm.ram.len();
                    for v in vm.ram[CANVAS_BYTECODE_ADDR..ram_len.min(CANVAS_BYTECODE_ADDR + 8192)]
                        .iter_mut()
                    {
                        *v = 0;
                    }
                    for (i, &pixel) in asm_result.pixels.iter().enumerate() {
                        let addr = CANVAS_BYTECODE_ADDR + i;
                        if addr < ram_len {
                            vm.ram[addr] = pixel;
                        }
                    }
                    canvas_assembled = true;
                    vm.pc = CANVAS_BYTECODE_ADDR as u32;
                    vm.halted = false;
                    is_running = true;
                    status_msg = String::from(
                        "[Geometry OS Terminal — type 'help' for commands, 'quit' to exit]",
                    );
                },
                Err(_e) => {
                    // Fallback: try canvas pipeline (for diagnostics)
                    canvas_assemble(
                        &canvas_buffer,
                        &mut vm,
                        &mut canvas_assembled,
                        &mut status_msg,
                    );
                    if canvas_assembled {
                        is_running = true;
                        status_msg =
                            String::from("[Geometry OS Terminal — type 'help' for commands]");
                    }
                },
            }
        }
    }

    // ── Desktop mode: auto-assemble and run world_desktop.asm ──────
    if desktop_mode && !is_running {
        if let Some(ref path) = loaded_file {
            if let Ok(source) = std::fs::read_to_string(path) {
                let mut pp = preprocessor::Preprocessor::new();
                let preprocessed = pp.preprocess(&source);
                match assembler::assemble(&preprocessed, CANVAS_BYTECODE_ADDR) {
                    Ok(asm_result) => {
                        // Store label map for label-aware disassembly
                        vm.set_label_map(&asm_result.labels, CANVAS_BYTECODE_ADDR as u32);
                        let ram_len = vm.ram.len();
                        for v in vm.ram
                            [CANVAS_BYTECODE_ADDR..ram_len.min(CANVAS_BYTECODE_ADDR + 8192)]
                            .iter_mut()
                        {
                            *v = 0;
                        }
                        for (i, &pixel) in asm_result.pixels.iter().enumerate() {
                            let addr = CANVAS_BYTECODE_ADDR + i;
                            if addr < ram_len {
                                vm.ram[addr] = pixel;
                            }
                        }
                        canvas_assembled = true;
                        vm.pc = CANVAS_BYTECODE_ADDR as u32;
                        vm.halted = false;
                        is_running = true;
                        fullscreen_map = true; // start in map mode
                        status_msg = String::from("[Geometry OS Desktop Mode]");
                    },
                    Err(e) => {
                        status_msg = format!("[Desktop assembly failed: {}]", e);
                    },
                }
            }
        }
    }

    // ── Terminal boot: --terminal flag skips map, boots host_term directly ──
    // Loads host_term.asm as the primary program instead of world_desktop.asm.
    // When bash exits (host_term halts), the process quits gracefully.
    let mut terminal_direct_mode = false;
    if terminal_mode {
        let term_path = "programs/host_term.asm";
        if let Ok(source) = std::fs::read_to_string(term_path) {
            let mut pp = preprocessor::Preprocessor::new();
            let preprocessed = pp.preprocess(&source);
            match assembler::assemble(&preprocessed, CANVAS_BYTECODE_ADDR) {
                Ok(asm_result) => {
                    let ram_len = vm.ram.len();
                    for v in vm.ram[CANVAS_BYTECODE_ADDR..ram_len.min(CANVAS_BYTECODE_ADDR + 8192)]
                        .iter_mut()
                    {
                        *v = 0;
                    }
                    for (i, &pixel) in asm_result.pixels.iter().enumerate() {
                        let addr = CANVAS_BYTECODE_ADDR + i;
                        if addr < ram_len {
                            vm.ram[addr] = pixel;
                        }
                    }
                    canvas_assembled = true;
                    vm.pc = CANVAS_BYTECODE_ADDR as u32;
                    vm.halted = false;
                    is_running = true;
                    terminal_direct_mode = true;
                    fullscreen_map = false;
                    status_msg = String::from(
                        "[Geometry OS Terminal -- bash shell, Ctrl+D or exit to quit]",
                    );
                },
                Err(e) => {
                    status_msg = format!("[terminal boot failed: {}]", e);
                },
            }
        } else {
            status_msg = String::from("[terminal boot failed: host_term.asm not found]");
        }
    }

    // ── Unix socket command channel (for AI/remote control) ─────
    let cmd_sock_path = "/tmp/geo_cmd.sock";
    let _ = std::fs::remove_file(cmd_sock_path);
    let cmd_listener = std::os::unix::net::UnixListener::bind(cmd_sock_path).ok();
    if let Some(ref l) = cmd_listener {
        l.set_nonblocking(true).ok();
        println!("[geos] Command socket listening at {}", cmd_sock_path);
    } else {
        println!("[geos] FAILED to bind command socket at {}", cmd_sock_path);
    }

    // ── HTTP API server (Phase 203) ─────────────────────────────
    let http_port = 8080;
    let http_listener = std::net::TcpListener::bind(format!("0.0.0.0:{}", http_port)).ok();
    if let Some(ref l) = http_listener {
        l.set_nonblocking(true).ok();
        println!(
            "[geos] HTTP API listening at http://localhost:{}",
            http_port
        );
    }

    // ── Main loop ────────────────────────────────────────────────
    let mut should_quit = false;
    while window.is_open() && !should_quit {
        // Drain background vision inspection results (Phase 35)
        while let Ok((agent_id, issues)) = inspection_rx.try_recv() {
            vm.area_manager.process_inspection_results(agent_id, issues);
            if let Some(a) = vm.area_manager.get_agent(agent_id) {
                println!(
                    "[area] Agent {} inspection complete: {} issues found",
                    a.id,
                    a.issues_found.len()
                );
            }
        }
        // ── Handle input ─────────────────────────────────────────
        if is_running {
            let mut mask: u32 = 0;
            if window.is_key_down(Key::Up) || window.is_key_down(Key::W) {
                mask |= 1 << 0;
            }
            if window.is_key_down(Key::Down) || window.is_key_down(Key::S) {
                mask |= 1 << 1;
            }
            if window.is_key_down(Key::Left) || window.is_key_down(Key::A) {
                mask |= 1 << 2;
            }
            if window.is_key_down(Key::Right) || window.is_key_down(Key::D) {
                mask |= 1 << 3;
            }
            if window.is_key_down(Key::Space) {
                mask |= 1 << 4;
            }
            if window.is_key_down(Key::Enter) {
                mask |= 1 << 5;
            }
            vm.key_bitmask = mask;

            // ── Networking ───────────────────────────────────────
            if let Some(ref s) = socket {
                let val = vm.ram[NET_PORT];
                if val != 0 {
                    // VM wrote something, send it
                    let _ = s.send_to(&val.to_le_bytes(), format!("127.0.0.1:{}", remote_port));
                    vm.ram[NET_PORT] = 0; // clear after send
                } else {
                    // Port is empty, try to receive
                    let mut buf = [0u8; 4];
                    if let Ok((amt, _src)) = s.recv_from(&mut buf) {
                        if amt == 4 {
                            vm.ram[NET_PORT] = u32::from_le_bytes(buf);
                        }
                    }
                }
            }
        }

        // ── Alt-Tab window switcher key handling ──────────────────────
        let alt_now = window.is_key_down(Key::LeftAlt) || window.is_key_down(Key::RightAlt);
        if alt_now && !alt_held {
            // Alt just pressed
            alt_held = true;
        }
        if !alt_now && alt_held {
            // Alt released
            alt_held = false;
            if alt_tab_active {
                // Select the highlighted window
                let wins: Vec<_> = vm.windows.iter().collect();
                if alt_tab_index < wins.len() {
                    let win_id = wins[alt_tab_index].id;
                    let win_title_addr = wins[alt_tab_index].title_addr;
                    // Compute new z_order (max + 1) from immutable borrow first
                    let max_z = vm.windows.iter().map(|w| w.z_order).max().unwrap_or(0);
                    let new_z = max_z + 1;
                    // Read title from RAM for status message
                    let mut t = String::new();
                    let addr = win_title_addr as usize;
                    for j in 0..32 {
                        if addr + j < vm.ram.len() {
                            let ch = vm.ram[addr + j];
                            if ch == 0 {
                                break;
                            }
                            if let Some(c) = char::from_u32(ch) {
                                t.push(c);
                            }
                        }
                    }
                    if t.is_empty() {
                        t = format!("Win#{}", win_id);
                    }
                    // Now do the mutable update
                    if let Some(w) = vm.windows.iter_mut().find(|w| w.id == win_id) {
                        w.z_order = new_z;
                        status_msg = format!("[focused: {}]", t);
                    }
                }
                alt_tab_active = false;
                alt_tab_index = 0;
            }
        }

        for key in window.get_keys_pressed(KeyRepeat::No) {
            // Alt+Tab: cycle through open windows
            if alt_held && key == Key::Tab {
                if !alt_tab_active {
                    alt_tab_active = true;
                    alt_tab_index = 0;
                } else {
                    alt_tab_index = (alt_tab_index + 1) % vm.windows.len().max(1);
                }
                continue;
            }
            // Escape cancels alt-tab
            if alt_tab_active && key == Key::Escape {
                alt_tab_active = false;
                alt_tab_index = 0;
                continue;
            }

            if is_running {
                // Runtime: send keys to VM key ring buffer
                let ctrl = window.is_key_down(Key::LeftCtrl) || window.is_key_down(Key::RightCtrl);
                let shift =
                    window.is_key_down(Key::LeftShift) || window.is_key_down(Key::RightShift);
                // Check Ctrl+Shift combos first (highest priority)
                if ctrl && shift {
                    if let Some(ch) = key_ctrl_shift(key) {
                        vm.push_key(ch as u32);
                        continue;
                    }
                }
                // Check Ctrl+number combos (tab switching)
                if ctrl && !shift {
                    if let Some(ch) = key_ctrl_num(key) {
                        vm.push_key(ch as u32);
                        continue;
                    }
                }
                // Check Alt+number combos (0xA0-0xA3 = Alt+1/2/3/4 for tab switching)
                let alt = window.is_key_down(Key::LeftAlt) || window.is_key_down(Key::RightAlt);
                if alt {
                    match key {
                        Key::Key1 => {
                            vm.push_key(0xA0);
                            continue;
                        },
                        Key::Key2 => {
                            vm.push_key(0xA1);
                            continue;
                        },
                        Key::Key3 => {
                            vm.push_key(0xA2);
                            continue;
                        },
                        Key::Key4 => {
                            vm.push_key(0xA3);
                            continue;
                        },
                        _ => {},
                    }
                }
                // Normal key mapping
                // When a RISC-V program is running AND no windowed app has focus,
                // keystrokes go to the guest UART. When a windowed app IS focused
                // (focused_pid != 0), keystrokes go to the GeOS VM so the app can
                // read them via IKEY and forward them as needed via HYPERVISOR_SEND.
                if let Some(ch) = key_to_ascii_shifted(key, shift) {
                    if let Some(ref riscv) = riscv_handle {
                        if vm.focused_pid == 0 {
                            riscv.send_input(ch);
                        } else {
                            vm.push_key(ch as u32);
                        }
                    } else {
                        vm.push_key(ch as u32);
                    }
                } else if let Some(ch) = key_to_ascii(key) {
                    if let Some(ref riscv) = riscv_handle {
                        if vm.focused_pid == 0 {
                            riscv.send_input(ch);
                        } else {
                            vm.push_key(ch as u32);
                        }
                    } else {
                        vm.push_key(ch as u32);
                    }
                }
                continue;
            }

            // ── QEMU exited: any key returns to terminal ──────────────
            if qemu_exited {
                qemu_exited = false;
                // Restore normal canvas
                canvas_buffer.fill(0);
                term_output_row = write_line_to_canvas(&mut canvas_buffer, 0, "geo> ");
                term_prompt_row = 0;
                cursor_row = 0;
                cursor_col = 5;
                scroll_offset = 0;
                status_msg = String::from("[TERM: type commands, Enter=run]");
                continue;
            }

            // ── QEMU mode: forward all keys to QEMU stdin ────────────
            if qemu_active {
                if key == Key::Escape {
                    // Exit QEMU mode
                    if let Some(ref mut bridge) = qemu_bridge {
                        let _ = bridge.kill();
                    }
                    qemu_bridge = None;
                    qemu_active = false;
                    font_mode = FontMode::Normal;
                    status_msg = String::from("[QEMU] Exited");
                    // Restore normal canvas
                    canvas_buffer.fill(0);
                    term_output_row = write_line_to_canvas(&mut canvas_buffer, 0, "geo> ");
                    term_prompt_row = 0;
                    cursor_row = 0;
                    cursor_col = 5;
                    scroll_offset = 0;
                    continue;
                }
                // Forward printable characters and Enter to QEMU
                if let Some(ref mut bridge) = qemu_bridge {
                    let shift =
                        window.is_key_down(Key::LeftShift) || window.is_key_down(Key::RightShift);
                    match key {
                        Key::Enter => {
                            let _ = bridge.write_bytes(b"\n");
                        },
                        Key::Backspace => {
                            let _ = bridge.write_bytes(b"\x08");
                        },
                        Key::Tab => {
                            let _ = bridge.write_bytes(b"\t");
                        },
                        Key::Up => {
                            let _ = bridge.write_bytes(b"\x1b[A");
                        },
                        Key::Down => {
                            let _ = bridge.write_bytes(b"\x1b[B");
                        },
                        Key::Right => {
                            let _ = bridge.write_bytes(b"\x1b[C");
                        },
                        Key::Left => {
                            let _ = bridge.write_bytes(b"\x1b[D");
                        },
                        _ => {
                            if let Some(ch) = key_to_ascii_shifted(key, shift) {
                                let _ = bridge.write_bytes(&[ch]);
                            }
                        },
                    }
                }
                continue;
            }

            // Escape: in editor mode, switch back to terminal. In terminal, quit.
            if key == Key::Escape {
                if mode == Mode::Editor {
                    mode = Mode::Terminal;
                    status_msg = String::from("[TERM: type commands, Enter=run]");
                    // Set cursor to after the last "geo> " prompt
                    cursor_row = term_prompt_row;
                    cursor_col = 5;
                    ensure_cursor_visible(&cursor_row, &mut scroll_offset, font_mode.vis_rows());
                    continue;
                } else {
                    should_quit = true;
                    break;
                }
            }

            // File input mode: Ctrl+F8 activates, handles typing a path
            if file_input_mode {
                match key {
                    Key::Escape => {
                        file_input_mode = false;
                        file_input_buf.clear();
                        status_msg =
                            String::from("[TEXT mode: type assembly, F8=assemble, F5=run]");
                    },
                    Key::Enter => {
                        // Attempt to load the file
                        let path = Path::new(&file_input_buf);
                        if let Ok(source) = std::fs::read_to_string(path) {
                            load_source_to_canvas(
                                &mut canvas_buffer,
                                &source,
                                &mut cursor_row,
                                &mut cursor_col,
                            );
                            scroll_offset = 0;
                            loaded_file = Some(path.to_path_buf());
                            status_msg = format!("[loaded: {}]", file_input_buf);
                        } else {
                            status_msg = format!("[error: cannot read {}]", file_input_buf);
                        }
                        file_input_mode = false;
                        file_input_buf.clear();
                    },
                    Key::Backspace => {
                        file_input_buf.pop();
                        status_msg = format!(
                            "[load file: {} | Tab=complete, Enter=load, Esc=cancel]",
                            file_input_buf
                        );
                    },
                    Key::Tab => {
                        // Cycle through completions from programs/*.asm
                        if !file_completions.is_empty() {
                            file_completion_idx =
                                (file_completion_idx + 1) % file_completions.len();
                            file_input_buf = file_completions[file_completion_idx].clone();
                            status_msg = format!(
                                "[load file: {} | Tab=complete, Enter=load, Esc=cancel]",
                                file_input_buf
                            );
                        }
                    },
                    _ => {
                        // Type characters into the path buffer
                        let shift = window.is_key_down(Key::LeftShift)
                            || window.is_key_down(Key::RightShift);
                        if let Some(ch) = key_to_ascii_shifted(key, shift) {
                            file_input_buf.push(ch as char);
                            // Reset completion index when user types manually
                            file_completion_idx = 0;
                            status_msg = format!(
                                "[load file: {} | Tab=complete, Enter=load, Esc=cancel]",
                                file_input_buf
                            );
                        }
                    },
                }
                continue;
            }

            // ── Mode-aware key handling ───────────────────────────
            if mode == Mode::Terminal {
                // If in scrollback mode, exit on any key except PageUp/PageDown
                if in_scrollback && key != Key::PageUp && key != Key::PageDown {
                    in_scrollback = false;
                    status_msg = String::from("[SCROLLBACK EXIT -- back to terminal]");
                    // Don't process this key further in terminal mode
                    // (it would type into the prompt, which is confusing)
                    continue;
                }
                // Terminal mode: type into prompt line, Enter = execute
                match key {
                    Key::Enter => {
                        // Read command text from prompt row (skip "geo> " prefix)
                        let raw = read_canvas_line(&canvas_buffer, term_prompt_row);
                        let cmd = raw.strip_prefix("geo> ").unwrap_or(&raw);
                        let cmd = cmd.trim();

                        // ── QEMU command interception ────────────────────
                        if cmd.starts_with("qemu") {
                            let parts: Vec<&str> = cmd.split_whitespace().collect();
                            let subcmd = parts.get(1).copied().unwrap_or("");
                            match subcmd {
                                "boot" => {
                                    if parts.len() < 3 {
                                        term_output_row = write_line_to_canvas(
                                            &mut canvas_buffer,
                                            term_output_row,
                                            "Usage: qemu boot <config>",
                                        );
                                        term_output_row = write_line_to_canvas(
                                            &mut canvas_buffer,
                                            term_output_row,
                                            "  e.g. qemu boot arch=riscv64 kernel=Image ram=256M",
                                        );
                                        term_output_row = write_line_to_canvas(
                                            &mut canvas_buffer,
                                            term_output_row,
                                            "geo> ",
                                        );
                                        ensure_scroll(term_output_row, &mut scroll_offset);
                                        continue;
                                    }
                                    // Kill any existing QEMU first
                                    if let Some(ref mut bridge) = qemu_bridge {
                                        let _ = bridge.kill();
                                    }
                                    qemu_bridge = None;
                                    qemu_active = false;

                                    let mut config_str = parts[2..].join(" ");
                                    // Auto-decode .rts.png files and resolve building references to temp files
                                    config_str = resolve_qemu_pixel_paths(&config_str, &vm);
                                    match QemuBridge::spawn(&config_str) {
                                        Ok(bridge) => {
                                            // Clear canvas for QEMU terminal output
                                            canvas_buffer.fill(0);
                                            font_mode = FontMode::Small;
                                            scroll_offset = 0;
                                            qemu_active = true;
                                            qemu_bridge = Some(bridge);
                                            status_msg = String::from(
                                                "[QEMU] Running -- Esc to exit, type to send",
                                            );
                                            continue;
                                        },
                                        Err(e) => {
                                            term_output_row = write_line_to_canvas(
                                                &mut canvas_buffer,
                                                term_output_row,
                                                &format!("[qemu] Error: {}", e),
                                            );
                                            term_output_row = write_line_to_canvas(
                                                &mut canvas_buffer,
                                                term_output_row,
                                                "geo> ",
                                            );
                                            ensure_scroll(term_output_row, &mut scroll_offset);
                                            continue;
                                        },
                                    }
                                },
                                "kill" => {
                                    if let Some(ref mut bridge) = qemu_bridge {
                                        let _ = bridge.kill();
                                        qemu_bridge = None;
                                        qemu_active = false;
                                        font_mode = FontMode::Normal;
                                        status_msg = String::from("[QEMU] Killed");
                                        // Restore normal canvas
                                        canvas_buffer.fill(0);
                                        term_output_row =
                                            write_line_to_canvas(&mut canvas_buffer, 0, "geo> ");
                                        term_prompt_row = 0;
                                        cursor_row = 0;
                                        cursor_col = 5;
                                        scroll_offset = 0;
                                    } else {
                                        status_msg = String::from("[QEMU] Not running");
                                    }
                                    continue;
                                },
                                "status" => {
                                    if let Some(ref mut bridge) = qemu_bridge {
                                        if bridge.is_alive() {
                                            status_msg = String::from("[QEMU] Running");
                                        } else {
                                            status_msg = String::from("[QEMU] Exited");
                                            qemu_bridge = None;
                                        }
                                    } else {
                                        status_msg = String::from("[QEMU] Not running");
                                    }
                                    continue;
                                },
                                _ => {
                                    term_output_row = write_line_to_canvas(
                                        &mut canvas_buffer,
                                        term_output_row,
                                        "Usage: qemu <boot|kill|status>",
                                    );
                                    term_output_row = write_line_to_canvas(
                                        &mut canvas_buffer,
                                        term_output_row,
                                        "geo> ",
                                    );
                                    ensure_scroll(term_output_row, &mut scroll_offset);
                                    continue;
                                },
                            }
                        }

                        // Output goes on the line after the prompt
                        term_output_row = term_prompt_row + 1;

                        // Record prompt line to scrollback before execution
                        scrollback.push_canvas_rows(
                            &canvas_buffer,
                            term_prompt_row,
                            term_prompt_row + 1,
                        );

                        let (hermes_prompt, go_edit, quit) = handle_terminal_command(
                            cmd,
                            &mut vm,
                            &mut canvas_buffer,
                            &mut term_output_row,
                            &mut scroll_offset,
                            &mut loaded_file,
                            &mut canvas_assembled,
                            &mut breakpoints,
                        );

                        // Record command output to scrollback (lines from after prompt to before new prompt)
                        scrollback.push_canvas_rows(
                            &canvas_buffer,
                            term_prompt_row + 1,
                            term_output_row,
                        );
                        _scrollback_pre_cmd = scrollback.len();

                        // Handle hermes/build prompt if returned
                        if let Some(prompt) = hermes_prompt {
                            if let Some(build_prompt) = prompt.strip_prefix("build:") {
                                run_build_canvas(
                                    build_prompt,
                                    &mut vm,
                                    &mut canvas_buffer,
                                    &mut term_output_row,
                                    &mut scroll_offset,
                                    &mut loaded_file,
                                    &mut canvas_assembled,
                                    &mut breakpoints,
                                );
                            } else {
                                let hermes_prompt_str =
                                    prompt.strip_prefix("hermes:").unwrap_or(&prompt);
                                run_hermes_canvas(
                                    hermes_prompt_str,
                                    &mut vm,
                                    &mut canvas_buffer,
                                    &mut term_output_row,
                                    &mut scroll_offset,
                                    &mut loaded_file,
                                    &mut canvas_assembled,
                                    &mut breakpoints,
                                );
                            }
                            term_output_row =
                                write_line_to_canvas(&mut canvas_buffer, term_output_row, "geo> ");
                            ensure_scroll(term_output_row, &mut scroll_offset);
                            term_prompt_row = term_output_row - 1;
                            cursor_row = term_prompt_row;
                            cursor_col = 5;
                            ensure_cursor_visible(
                                &cursor_row,
                                &mut scroll_offset,
                                font_mode.vis_rows(),
                            );
                            continue;
                        }

                        if quit {
                            should_quit = true;
                            break;
                        }

                        if go_edit {
                            mode = Mode::Editor;
                            status_msg = String::from(
                                "[EDIT mode: type assembly, F8=assemble, F5=run, Esc=terminal]",
                            );
                            // Position cursor at start of canvas
                            cursor_row = 0;
                            cursor_col = 0;
                            scroll_offset = 0;
                        } else {
                            // Track the new prompt position
                            term_prompt_row = term_output_row - 1; // write_line left us after the "geo> " line
                            cursor_row = term_prompt_row;
                            cursor_col = 5; // after "geo> "
                            ensure_cursor_visible(
                                &cursor_row,
                                &mut scroll_offset,
                                font_mode.vis_rows(),
                            );
                            // Update term_output_row for next command
                            // (it's already set past the "geo> " prompt)
                        }
                    },
                    Key::Backspace => {
                        if cursor_col > 5 {
                            cursor_col -= 1;
                            let idx = cursor_row * CANVAS_COLS + cursor_col;
                            canvas_buffer[idx] = 0;
                        }
                    },
                    Key::Up => {
                        if cursor_row > 0 {
                            cursor_row -= 1;
                            ensure_cursor_visible(
                                &cursor_row,
                                &mut scroll_offset,
                                font_mode.vis_rows(),
                            );
                        }
                    },
                    Key::Down => {
                        if cursor_row < CANVAS_MAX_ROWS - 1 {
                            cursor_row += 1;
                            ensure_cursor_visible(
                                &cursor_row,
                                &mut scroll_offset,
                                font_mode.vis_rows(),
                            );
                        }
                    },
                    Key::C => {
                        // Ctrl+Shift+C: Copy selection to clipboard
                        let ctrl =
                            window.is_key_down(Key::LeftCtrl) || window.is_key_down(Key::RightCtrl);
                        let shift = window.is_key_down(Key::LeftShift)
                            || window.is_key_down(Key::RightShift);
                        if ctrl && shift {
                            if let Some((start, end)) = text_sel_anchor {
                                let sel_text = extract_selection(&canvas_buffer, start, end);
                                if !sel_text.is_empty() {
                                    clipboard = sel_text;
                                    status_msg = format!("[copied {} chars]", clipboard.len());
                                }
                            }
                        }
                    },
                    Key::V => {
                        // Ctrl+Shift+V: Paste clipboard into prompt line
                        let ctrl =
                            window.is_key_down(Key::LeftCtrl) || window.is_key_down(Key::RightCtrl);
                        let shift = window.is_key_down(Key::LeftShift)
                            || window.is_key_down(Key::RightShift);
                        if ctrl && shift && !clipboard.is_empty() {
                            for ch in clipboard.chars() {
                                if cursor_col < CANVAS_COLS - 1 {
                                    let idx = cursor_row * CANVAS_COLS + cursor_col;
                                    canvas_buffer[idx] = ch as u32;
                                    cursor_col += 1;
                                }
                            }
                            // Clear selection after paste
                            text_sel_anchor = None;
                        }
                    },
                    _ => {
                        // Type characters into prompt line
                        let shift = window.is_key_down(Key::LeftShift)
                            || window.is_key_down(Key::RightShift);
                        if let Some(ch) = key_to_ascii_shifted(key, shift) {
                            if cursor_col < CANVAS_COLS - 1 {
                                let idx = cursor_row * CANVAS_COLS + cursor_col;
                                canvas_buffer[idx] = ch as u32;
                                cursor_col += 1;
                            }
                        }
                    },
                }
                continue;
            }

            // ── Editor mode: canvas editing (VM paused) ──────────
            match key {
                Key::Enter => {
                    let idx = cursor_row * CANVAS_COLS + cursor_col;
                    canvas_buffer[idx] = '\n' as u32;
                    cursor_col = 0;
                    cursor_row += 1;
                    if cursor_row >= CANVAS_MAX_ROWS {
                        cursor_row = CANVAS_MAX_ROWS - 1;
                    }
                    ensure_cursor_visible(&cursor_row, &mut scroll_offset, font_mode.vis_rows());
                },
                Key::Space => {
                    let idx = cursor_row * CANVAS_COLS + cursor_col;
                    canvas_buffer[idx] = 0x20;
                    advance_cursor(
                        &mut canvas_buffer,
                        &mut cursor_row,
                        &mut cursor_col,
                        &mut scroll_offset,
                        font_mode.vis_rows(),
                    );
                },
                Key::Backspace => {
                    if cursor_col > 0 {
                        cursor_col -= 1;
                    } else if cursor_row > 0 {
                        cursor_row -= 1;
                        cursor_col = CANVAS_COLS - 1;
                    }
                    let idx = cursor_row * CANVAS_COLS + cursor_col;
                    canvas_buffer[idx] = 0;
                    ensure_cursor_visible(&cursor_row, &mut scroll_offset, font_mode.vis_rows());
                },
                // Phase 159: Font mode switching + PTY resize (SIGWINCH)
                Key::F1 => {
                    font_mode = FontMode::Medium;
                    let vc = font_mode.vis_cols();
                    let vr = font_mode.vis_rows();
                    if cursor_col >= vc {
                        cursor_col = vc - 1;
                    }
                    ensure_cursor_visible(&cursor_row, &mut scroll_offset, font_mode.vis_rows());
                    // Resize PTY so bash reflows output
                    let pty_h = vm.ram.get(0x4E03).copied().unwrap_or(0xFFFFFFFF);
                    if pty_h != 0xFFFFFFFF {
                        vm.resize_pty_direct(pty_h as usize, vr as u16, vc as u16);
                    }
                    status_msg = format!("[Font: {} {}×{}]", font_mode.name(), vc, vr);
                },
                Key::F2 => {
                    font_mode = FontMode::Small;
                    let vc = font_mode.vis_cols();
                    let vr = font_mode.vis_rows();
                    if cursor_col >= vc {
                        cursor_col = vc - 1;
                    }
                    ensure_cursor_visible(&cursor_row, &mut scroll_offset, font_mode.vis_rows());
                    let pty_h = vm.ram.get(0x4E03).copied().unwrap_or(0xFFFFFFFF);
                    if pty_h != 0xFFFFFFFF {
                        vm.resize_pty_direct(pty_h as usize, vr as u16, vc as u16);
                    }
                    status_msg = format!("[Font: {} {}×{}]", font_mode.name(), vc, vr);
                },
                Key::F3 => {
                    font_mode = font_mode.zoom_in();
                    let vc = font_mode.vis_cols();
                    let vr = font_mode.vis_rows();
                    if cursor_col >= vc {
                        cursor_col = vc - 1;
                    }
                    ensure_cursor_visible(&cursor_row, &mut scroll_offset, font_mode.vis_rows());
                    let pty_h = vm.ram.get(0x4E03).copied().unwrap_or(0xFFFFFFFF);
                    if pty_h != 0xFFFFFFFF {
                        vm.resize_pty_direct(pty_h as usize, vr as u16, vc as u16);
                    }
                    status_msg = format!("[Font: {} {}×{}]", font_mode.name(), vc, vr);
                },
                Key::F4 => {
                    font_mode = font_mode.zoom_out();
                    let vc = font_mode.vis_cols();
                    let vr = font_mode.vis_rows();
                    if cursor_col >= vc {
                        cursor_col = vc - 1;
                    }
                    ensure_cursor_visible(&cursor_row, &mut scroll_offset, font_mode.vis_rows());
                    let pty_h = vm.ram.get(0x4E03).copied().unwrap_or(0xFFFFFFFF);
                    if pty_h != 0xFFFFFFFF {
                        vm.resize_pty_direct(pty_h as usize, vr as u16, vc as u16);
                    }
                    status_msg = format!("[Font: {} {}×{}]", font_mode.name(), vc, vr);
                },
                Key::F5 => {
                    if vm.halted {
                        vm.pc = if canvas_assembled {
                            CANVAS_BYTECODE_ADDR as u32
                        } else {
                            0
                        };
                        vm.halted = false;
                    }
                    hit_breakpoint = false;
                    vm.breakpoint_hit = false;
                    is_running = !is_running;
                },
                Key::F6 => {
                    // Single-step: execute one instruction when paused
                    if !is_running && !vm.halted && canvas_assembled {
                        hit_breakpoint = false;
                        vm.breakpoint_hit = false;
                        vm.step();
                        if breakpoints.contains(&vm.pc) {
                            hit_breakpoint = true;
                        }
                        status_msg = format!("[step] PC=0x{:04X}", vm.pc);
                    }
                },
                Key::F8 => {
                    let ctrl =
                        window.is_key_down(Key::LeftCtrl) || window.is_key_down(Key::RightCtrl);
                    if ctrl {
                        // Ctrl+F8: enter file input mode
                        file_input_mode = true;
                        file_input_buf.clear();
                        file_completions = list_asm_files("programs");
                        file_completion_idx = 0;
                        // Pre-populate with last loaded file path if available
                        if let Some(ref path) = loaded_file {
                            file_input_buf = path.to_string_lossy().to_string();
                        }
                        status_msg = format!(
                            "[load file: {} | Tab=complete, Enter=load, Esc=cancel]",
                            file_input_buf
                        );
                    } else {
                        canvas_assemble(
                            &canvas_buffer,
                            &mut vm,
                            &mut canvas_assembled,
                            &mut status_msg,
                        );
                    }
                },
                Key::F7 => {
                    // Save state to file
                    vm.tile_store.flush(); // persist infinite map chunks
                    match save_state(SAVE_FILE, &vm, &canvas_buffer, canvas_assembled) {
                        Ok(()) => {
                            let file_size =
                                std::fs::metadata(SAVE_FILE).map(|m| m.len()).unwrap_or(0);
                            status_msg = format!(
                                "[saved: {} ({:.0}KB)]",
                                SAVE_FILE,
                                file_size as f64 / 1024.0
                            );
                        },
                        Err(e) => {
                            status_msg = format!("[save error: {}]", e);
                        },
                    }
                },
                Key::F9 => {
                    // Screenshot: save screen as PNG
                    let png_path = "screenshot.png";
                    match save_screen_png(png_path, &vm.screen) {
                        Ok(()) => {
                            let file_size =
                                std::fs::metadata(png_path).map(|m| m.len()).unwrap_or(0);
                            status_msg = format!(
                                "[screenshot: {} ({:.0}KB)]",
                                png_path,
                                file_size as f64 / 1024.0
                            );
                        },
                        Err(e) => {
                            status_msg = format!("[screenshot error: {}]", e);
                        },
                    }
                },
                Key::F10 => {
                    recording = !recording;
                    if recording {
                        frame_id = 0;
                        let _ = std::fs::create_dir_all("/tmp/geo_frames");
                        status_msg = String::from("[RECORDING STARTED: /tmp/geo_frames/]");
                    } else {
                        status_msg = format!(
                            "[RECORDING STOPPED: {} frames saved. Use ffmpeg to compile GIF]",
                            frame_id
                        );
                    }
                },
                Key::F12 => {
                    // Phase 162: Toggle cursor style (Block -> Underline -> Bar)
                    let _prev_style = cursor_style;
                    cursor_style = cursor_style.next();
                    cursor_blink_on = true;
                    cursor_blink_timer = std::time::Instant::now();
                    status_msg = format!("[Cursor: {}]", cursor_style.name());
                },
                Key::PageUp => {
                    if mode == Mode::Terminal {
                        // Enter scrollback mode and scroll up through terminal history
                        if !scrollback.is_empty() {
                            if !in_scrollback {
                                in_scrollback = true;
                                // Start at bottom of scrollback (most recent output)
                                scrollback_offset = scrollback.max_scroll();
                            }
                            scrollback_offset = scrollback_offset.saturating_sub(CANVAS_ROWS);
                            status_msg = format!(
                                "[SCROLLBACK {}/{} -- PageUp/Down=navigate, any key=exit]",
                                scrollback_offset,
                                scrollback.max_scroll()
                            );
                        }
                    } else if scroll_offset > 0 {
                        scroll_offset = scroll_offset.saturating_sub(CANVAS_ROWS);
                        let new_cursor = scroll_offset + CANVAS_ROWS / 2;
                        if new_cursor < cursor_row || cursor_row < scroll_offset {
                            cursor_row = new_cursor.min(CANVAS_MAX_ROWS - 1);
                        }
                    }
                },
                Key::PageDown => {
                    if mode == Mode::Terminal {
                        // Scroll down in scrollback
                        if in_scrollback {
                            let max = scrollback.max_scroll();
                            if scrollback_offset < max {
                                scrollback_offset = (scrollback_offset + CANVAS_ROWS).min(max);
                            }
                            if scrollback_offset >= max {
                                // Reached the bottom, exit scrollback
                                in_scrollback = false;
                                status_msg = String::from("[SCROLLBACK END -- back to terminal]");
                            } else {
                                status_msg = format!(
                                    "[SCROLLBACK {}/{} -- PageUp/Down=navigate, any key=exit]",
                                    scrollback_offset, max
                                );
                            }
                        }
                    } else {
                        let max_scroll = CANVAS_MAX_ROWS.saturating_sub(CANVAS_ROWS);
                        if scroll_offset < max_scroll {
                            scroll_offset = (scroll_offset + CANVAS_ROWS).min(max_scroll);
                            let new_cursor = scroll_offset + CANVAS_ROWS / 2;
                            if new_cursor > cursor_row || cursor_row >= scroll_offset + CANVAS_ROWS
                            {
                                cursor_row = new_cursor.min(CANVAS_MAX_ROWS - 1);
                            }
                        }
                    }
                },
                Key::Left => {
                    cursor_col = cursor_col.saturating_sub(1);
                },
                Key::Right => {
                    if cursor_col < CANVAS_COLS - 1 {
                        cursor_col += 1;
                    }
                },
                Key::Up => {
                    cursor_row = cursor_row.saturating_sub(1);
                    ensure_cursor_visible(&cursor_row, &mut scroll_offset, font_mode.vis_rows());
                },
                Key::Down => {
                    if cursor_row < CANVAS_MAX_ROWS - 1 {
                        cursor_row += 1;
                    }
                    ensure_cursor_visible(&cursor_row, &mut scroll_offset, font_mode.vis_rows());
                },
                Key::V => {
                    let ctrl =
                        window.is_key_down(Key::LeftCtrl) || window.is_key_down(Key::RightCtrl);
                    if ctrl {
                        match arboard::Clipboard::new() {
                            Ok(mut clipboard) => match clipboard.get_text() {
                                Ok(text) => {
                                    let pasted = paste_text_to_canvas(
                                        &mut canvas_buffer,
                                        &text,
                                        &mut cursor_row,
                                        &mut cursor_col,
                                    );
                                    ensure_cursor_visible(
                                        &cursor_row,
                                        &mut scroll_offset,
                                        font_mode.vis_rows(),
                                    );
                                    status_msg = format!("[pasted {} chars]", pasted);
                                },
                                Err(e) => {
                                    status_msg = format!("[paste error: {}]", e);
                                },
                            },
                            Err(e) => {
                                status_msg = format!("[clipboard error: {}]", e);
                            },
                        }
                    } else {
                        let shift = window.is_key_down(Key::LeftShift)
                            || window.is_key_down(Key::RightShift);
                        if let Some(ch) = key_to_ascii_shifted(Key::V, shift) {
                            let idx = cursor_row * CANVAS_COLS + cursor_col;
                            canvas_buffer[idx] = ch as u32;
                            advance_cursor(
                                &mut canvas_buffer,
                                &mut cursor_row,
                                &mut cursor_col,
                                &mut scroll_offset,
                                font_mode.vis_rows(),
                            );
                        }
                    }
                },
                _ => {
                    let shift =
                        window.is_key_down(Key::LeftShift) || window.is_key_down(Key::RightShift);
                    if let Some(ch) = key_to_ascii_shifted(key, shift) {
                        let idx = cursor_row * CANVAS_COLS + cursor_col;
                        canvas_buffer[idx] = ch as u32;
                        advance_cursor(
                            &mut canvas_buffer,
                            &mut cursor_row,
                            &mut cursor_col,
                            &mut scroll_offset,
                            font_mode.vis_rows(),
                        );
                    }
                },
            }
        }

        // ── QEMU output polling ────────────────────────────────────
        if qemu_active {
            if let Some(ref mut bridge) = qemu_bridge {
                let (_n, raw_text) = bridge.read_output(&mut canvas_buffer);
                // Write QEMU output to VM ring buffer for Developer Console app
                if !raw_text.is_empty() {
                    if let Ok(mut buf) = HYPERVISOR_CONSOLE_BUF.lock() {
                        buf.push(raw_text.clone());
                    }
                    let mut write_off = vm.ram.get(0x4F00).copied().unwrap_or(0) as usize;
                    let read_off = vm.ram.get(0x4F01).copied().unwrap_or(0) as usize;
                    write_off = write_off.max(0).min(254);
                    for &byte in raw_text.as_bytes() {
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
                if !bridge.is_alive() {
                    qemu_active = false;
                    font_mode = FontMode::Normal;
                    qemu_exited = true;
                    qemu_bridge = None;
                    vm.hypervisor_active = false;
                    status_msg = String::from("[QEMU] Process exited");
                }
            }
        }

        // ── VM execution ─────────────────────────────────────────
        let has_active_apps = !active_apps.is_empty();
        if is_running && !vm.halted {
            // Phase 45: Sync canvas buffer TO VM before execution
            // VM canvas_buffer is 4096 (CANVAS_RAM_SIZE), host buffer is 128*128=16384
            let copy_len = vm.canvas_buffer.len().min(canvas_buffer.len());
            vm.canvas_buffer[..copy_len].copy_from_slice(&canvas_buffer[..copy_len]);

            // Run until FRAME, breakpoint, halt, or step cap.
            // Cap is 10K steps per frame to keep the event loop responsive --
            // minifb needs to pump X11 events each iteration or the window
            // goes stale and is_open() returns false, killing the process.
            vm.frame_ready = false;
            for _ in 0..10_000 {
                if !vm.step() {
                    // Main process halted -- but keep running if windowed apps exist
                    if !has_active_apps {
                        is_running = false;
                    }
                    break;
                }
                // Step all spawned child processes in lock-step with the primary
                vm.step_all_processes();
                if vm.frame_ready {
                    // FRAME opcode hit: stop here, let the host render this tick
                    break;
                }
                if vm.breakpoint_hit {
                    is_running = false;
                    hit_breakpoint = true;
                    status_msg = format!("[BREAKPOINT] PC=0x{:04X}", vm.pc);
                    break;
                }
                if breakpoints.contains(&vm.pc) {
                    is_running = false;
                    hit_breakpoint = true;
                    status_msg = format!("[BREAK] PC=0x{:04X}", vm.pc);
                    break;
                }
            }

            // Drain RISC-V console output (e.g., from pixel-native write())
            // This includes output from guest syscalls that write to stdout/stderr
            while let Some(ref handle) = riscv_handle {
                while let Ok(bytes) = handle.try_recv_console() {
                    use std::io::Write;
                    let _ = std::io::stdout().write_all(&bytes);
                    let _ = std::io::stdout().flush();
                }
                break;
            }

            // Phase 34.3: Autonomous Repair Routines
            // 1. Read VM-side state changes (repair agents write STATUS_DONE to RAM).
            //    This must happen BEFORE tick() so completions are acknowledged first.
            let completed_agents = vm.area_manager.process_vm_completions(&vm.ram);
            if !completed_agents.is_empty() {
                if let Some(a) = vm.area_manager.get_agent(completed_agents[0]) {
                    status_msg = format!(
                        "[Agent {}] Repair complete. Tasks remaining: {}",
                        completed_agents[0],
                        a.issues_found.len()
                    );
                }
            }

            // Phase 34.2: Coordinated Autonomous Area Management (Vision Loop)
            // Consume actions from the VM's pending queue.
            let agent_actions: Vec<_> = vm.pending_agent_actions.drain(..).collect();
            for (agent_id, action) in agent_actions {
                match action {
                    geometry_os::kernel::area_manager::AgentAction::Inspect => {
                        // Capture the agent's assigned world sector into a 256x256 framebuffer.
                        let mut sector_fb = vec![0u32; 256 * 256];
                        if vm.area_manager.blit_sector_to_screen(
                            agent_id,
                            &mut vm.tile_store,
                            &mut sector_fb,
                            256,
                            256,
                        ) {
                            // Encode to PNG base64 for vision LLM.
                            let image_b64 = geometry_os::vision::encode_png_base64(&sector_fb);

                            let agent_info = if let Some(a) = vm.area_manager.get_agent(agent_id) {
                                format!(
                                    "Agent {} sector ({},{}) {}x{}",
                                    a.id, a.home_x, a.home_y, a.sector_w, a.sector_h
                                )
                            } else {
                                format!("Agent {}", agent_id)
                            };

                            let (role_name, role_focus) = if let Some(a) =
                                vm.area_manager.get_agent(agent_id)
                            {
                                match a.role {
                                    1 => (
                                        "CoreCompositor",
                                        "rendering integrity and structural artifacts",
                                    ),
                                    2 => (
                                        "VisualShell",
                                        "UI responsiveness and pixel-perfect widgets",
                                    ),
                                    3 => (
                                        "NeuralCognitive",
                                        "geometric intelligence and pattern coherence",
                                    ),
                                    4 => (
                                        "GraphicsRendering",
                                        "shader efficiency and color consistency",
                                    ),
                                    5 => {
                                        ("InputInteraction", "event hot-zones and cursor tracking")
                                    },
                                    6 => ("SystemServices", "daemon health and IPC corridors"),
                                    7 => (
                                        "DevelopmentTools",
                                        "OpenSpec compliance and code-pixel regions",
                                    ),
                                    _ => (
                                        "Maintenance",
                                        "general structural issues like noise and broken wires",
                                    ),
                                }
                            } else {
                                ("Maintenance", "general structural issues")
                            };

                            let tx = inspection_tx.clone();
                            std::thread::spawn(move || {
                                // Trigger background vision inspection (Phase 35).
                                let system_prompt = format!(
                                    "You are the Geometry OS {} Vision System. \
                                    Analyze this 256x256 substrate sector for {}. \
                                    Return a JSON array of issues. Each issue MUST have: \
                                    x, y (0-255), type (1=PRUNE_NOISE, 2=REPAIR_WIRE, 3=REINFORCE), \
                                    confidence (0.0-1.0), and description. \
                                    Example: [{{ \"x\": 10, \"y\": 20, \"type\": 1, \"confidence\": 0.9, \"description\": \"stray pixel\" }}] \
                                    ONLY return the JSON array, no other text.",
                                    role_name, role_focus
                                );

                                if let Some(response) = hermes::call_ollama_vision(
                                    &system_prompt,
                                    &format!("Inspect sector for {}.", agent_info),
                                    &image_b64,
                                ) {
                                    // Simple JSON parser for DiagnosticIssue list.
                                    let mut issues = Vec::new();
                                    if let Some(start_idx) = response.find('[') {
                                        if let Some(end_idx) = response.rfind(']') {
                                            let json_body = &response[start_idx..=end_idx];
                                            for obj_str in json_body.split("},{") {
                                                let clean_obj = obj_str.trim_matches(|c| {
                                                    c == '[' || c == ']' || c == '{' || c == '}'
                                                });
                                                let mut x = -1;
                                                let mut y = -1;
                                                let mut itype = 0;
                                                let mut conf = 0.0f32;
                                                let mut desc = String::new();

                                                for field in clean_obj.split(',') {
                                                    let kv: Vec<&str> = field.split(':').collect();
                                                    if kv.len() == 2 {
                                                        let key = kv[0].trim().trim_matches('"');
                                                        let val = kv[1].trim().trim_matches('"');
                                                        match key {
                                                            "x" => {
                                                                x = val.parse::<i32>().unwrap_or(-1)
                                                            },
                                                            "y" => {
                                                                y = val.parse::<i32>().unwrap_or(-1)
                                                            },
                                                            "type" => {
                                                                itype =
                                                                    val.parse::<u32>().unwrap_or(0)
                                                            },
                                                            "confidence" => {
                                                                conf = val
                                                                    .parse::<f32>()
                                                                    .unwrap_or(0.0)
                                                            },
                                                            "description" => desc = val.to_string(),
                                                            _ => {},
                                                        }
                                                    }
                                                }

                                                if x != -1 && y != -1 && itype != 0 {
                                                    issues.push(geometry_os::kernel::area_manager::DiagnosticIssue {
                                                        x, y, issue_type: itype, confidence: conf, description: desc
                                                    });
                                                }
                                            }
                                        }
                                    }
                                    let _ = tx.send((agent_id, issues));
                                }
                            });
                            status_msg = format!(
                                "[area] Started background inspection for agent {}.",
                                agent_id
                            );
                        }
                    },
                }
            }

            // Sync agent states to RAM for VM visibility
            vm.area_manager.write_to_ram(&mut vm.ram);

            // Phase 45: Sync canvas buffer FROM VM after execution
            let copy_len = vm.canvas_buffer.len().min(canvas_buffer.len());
            canvas_buffer[..copy_len].copy_from_slice(&vm.canvas_buffer[..copy_len]);

            // Phase 223: check for in-VM backup request (RAM[0xF040])
            if vm.ram.get(0xF040).copied().unwrap_or(0) == 1 {
                vm.ram[0xF040] = 0;
                eprintln!("[Singularity] In-VM Backup Requested...");
                // Run geosync backup as a detached process
                let _ = std::process::Command::new("./scripts/geosync.py")
                    .arg("backup")
                    .spawn()
                    .map_err(|e| eprintln!("[error] failed to launch geosync: {}", e));
                status_msg = "[geosync: backup triggered]".into();
            }
        } else if vm.halted && has_active_apps {
            // Main process halted but windowed apps are still running.
            // Keep scheduling child processes so apps stay alive.
            // Same 10K cap as main execution to keep event loop responsive.
            vm.frame_ready = false;
            for _ in 0..10_000 {
                vm.step_all_processes();
                if vm.frame_ready {
                    break;
                }
            }
        }

        // ── Audio dispatch ───────────────────────────────────────
        if let Some((freq, dur)) = vm.beep.take() {
            play_beep(freq, dur);
        }
        if let Some((wave, freq, dur)) = vm.note.take() {
            audio::play_note(audio::Waveform::from_u32(wave), freq, dur);
        }

        // ── Windowed app process cleanup (Phase 107) ─────────────
        // Check for halted windowed app processes and clean them up.
        {
            let mut to_remove: Vec<usize> = Vec::new();
            for (idx, (_, pid, name)) in active_apps.iter().enumerate() {
                let pid_val = *pid;
                let is_halted = vm
                    .processes
                    .iter()
                    .any(|p| p.pid == pid_val && p.is_halted());
                if is_halted {
                    // Destroy windows owned by this process
                    vm.windows.retain(|w| w.pid != pid_val);
                    // Mark slot for removal
                    to_remove.push(idx);
                    status_msg = format!("[APP CLOSED: {} (PID {})]", name, pid_val);
                }
            }
            // Remove halted apps from tracking (reverse order to preserve indices)
            for &idx in to_remove.iter().rev() {
                let (slot, _, _) = active_apps[idx];
                // Clear app code region
                let app_base = APP_CODE_BASE + slot * APP_CODE_SIZE;
                let ram_len = vm.ram.len();
                if app_base < ram_len {
                    let end = (app_base + APP_CODE_SIZE).min(ram_len);
                    for v in &mut vm.ram[app_base..end] {
                        *v = 0;
                    }
                }
                // Clear app data region
                let data_base =
                    crate::vm::types::APP_DATA_BASE + slot * crate::vm::types::APP_DATA_SIZE;
                if data_base < ram_len {
                    let end = (data_base + crate::vm::types::APP_DATA_SIZE).min(ram_len);
                    for v in &mut vm.ram[data_base..end] {
                        *v = 0;
                    }
                }
                active_apps.remove(idx);
            }
        }

        // ── Shutdown check ────────────────────────────────────────
        // Only exit when init (PID 1) halts in boot mode.
        // User programs loaded via socket should halt gracefully back to editor.
        if vm.halted && boot_mode && !has_active_apps {
            status_msg = "[SHUTDOWN] System halted cleanly.".into();
            is_running = false;
            let _ = status_msg; // suppress unused warning (break follows)
            let _ = is_running;
            break;
        }

        // ── Process Unix socket commands (AI control) ──────────
        if let Some(ref listener) = cmd_listener {
            while let Ok((mut stream, _)) = listener.accept() {
                use std::io::{Read, Write};
                let mut buf = [0u8; 4096];
                let mut response = String::new();
                if let Ok(n) = stream.read(&mut buf) {
                    let cmd = String::from_utf8_lossy(&buf[..n]);
                    for line in cmd.lines() {
                        let parts: Vec<&str> = line.split_whitespace().collect();
                        if parts.is_empty() {
                            continue;
                        }
                        match parts[0] {
                            "save" => {
                                let path = parts.get(1).copied().unwrap_or(SAVE_FILE);
                                vm.tile_store.flush(); // persist infinite map chunks
                                match save_state(path, &vm, &canvas_buffer, canvas_assembled) {
                                    Ok(()) => {
                                        status_msg = format!("[saved: {}]", path);
                                        response.push_str(&format!("{}\n", status_msg));
                                    },
                                    Err(e) => {
                                        status_msg = format!("[save error: {}]", e);
                                        response.push_str(&format!("{}\n", status_msg));
                                    },
                                }
                            },
                            "restore" | "load_state" => {
                                let path = parts.get(1).copied().unwrap_or(SAVE_FILE);
                                match load_state(path) {
                                    Ok((saved_vm, saved_canvas, saved_assembled)) => {
                                        vm = saved_vm;
                                        canvas_buffer = saved_canvas;
                                        canvas_assembled = saved_assembled;
                                        // Re-initialize tile store with persistence
                                        let map_dir = std::env::var("HOME")
                                            .map(|h| {
                                                std::path::PathBuf::from(h).join(".geometry_os")
                                            })
                                            .unwrap_or_else(|_| std::path::PathBuf::from("/tmp"));
                                        let epl_path = map_dir.join("tile_store.epl");
                                        vm.tile_store =
                                            geometry_os::tile_store::TileStore::with_epl(
                                                epl_path.to_str().unwrap_or("/tmp/tile_store.epl"),
                                            );
                                        status_msg = format!("[restored: {}]", path);
                                        response.push_str(&format!("{}\n", status_msg));
                                    },
                                    Err(e) => {
                                        status_msg = format!("[restore error: {}]", e);
                                        response.push_str(&format!("{}\n", status_msg));
                                    },
                                }
                            },
                            "coord_set_binary" => {
                                if parts.len() >= 5 {
                                    let x: u32 = match parts[1].parse() {
                                        Ok(v) => v,
                                        Err(_) => {
                                            response.push_str("[error: invalid x]\n");
                                            continue;
                                        },
                                    };
                                    let y: u32 = match parts[2].parse() {
                                        Ok(v) => v,
                                        Err(_) => {
                                            response.push_str("[error: invalid y]\n");
                                            continue;
                                        },
                                    };
                                    let format = parts[3];
                                    let file_path = parts[4];

                                    if file_path.is_empty() {
                                        response.push_str("[error: file path required]\n");
                                        continue;
                                    }

                                    match encoding::BinaryMetadata::from_file(
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
                                                    .insert(
                                                        "binary_data".to_string(),
                                                        metadata_json,
                                                    );
                                            } else {
                                                let mut coord_meta =
                                                    std::collections::HashMap::new();
                                                coord_meta.insert(
                                                    "binary_data".to_string(),
                                                    metadata_json,
                                                );
                                                vm.coordinate_metadata
                                                    .insert(coord_key, coord_meta);
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
                                    response.push_str(
                                        "[usage: coord_set_binary <x> <y> <format> <file>]\n",
                                    );
                                }
                            },
                            "spawn_building" => {
                                // Usage: spawn_building <name> <tx> <ty> [color]
                                if parts.len() >= 4 {
                                    let name = parts[1].to_string();
                                    let tx = parts[2].parse::<i32>().unwrap_or(0);
                                    let ty = parts[3].parse::<i32>().unwrap_or(0);
                                    let color = if parts.len() >= 5 {
                                        u32::from_str_radix(parts[4].trim_start_matches("0x"), 16)
                                            .unwrap_or(0xCCCCCC)
                                    } else {
                                        0xCCCCCC // grey for backups
                                    };

                                    // Find empty slot in RAM building table (0x7500)
                                    let count =
                                        vm.ram.get(0x7580).copied().unwrap_or(0).min(32) as usize;
                                    if count < 32 {
                                        let base = 0x7500 + count * 4;
                                        vm.ram[base] = tx as u32;
                                        vm.ram[base + 1] = ty as u32;
                                        vm.ram[base + 2] = color;

                                        // Write name string to RAM (using the area world_desktop uses: 0x7600 + count*16)
                                        let name_addr = 0x7600 + count * 16;
                                        vm.ram[base + 3] = name_addr as u32;
                                        for (i, b) in name.as_bytes().iter().enumerate().take(15) {
                                            if name_addr + i < vm.ram.len() {
                                                vm.ram[name_addr + i] = *b as u32;
                                            }
                                        }
                                        if name_addr + name.len().min(15) < vm.ram.len() {
                                            vm.ram[name_addr + name.len().min(15)] = 0;
                                            // null terminator
                                        }

                                        vm.ram[0x7580] = (count + 1) as u32;
                                        status_msg = format!(
                                            "[spawned building: {} at {},{}]",
                                            name, tx, ty
                                        );
                                        response.push_str(&format!("{}\n", status_msg));
                                    } else {
                                        status_msg = "[spawn_building error: table full]".into();
                                        response.push_str(&format!("{}\n", status_msg));
                                    }
                                } else {
                                    response.push_str(
                                        "[usage: spawn_building <name> <tx> <ty> [color]]\n",
                                    );
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
                                        let val = vm.ram[addr];
                                        response.push_str(&format!("0x{:08X}\n", val));
                                    } else {
                                        response.push_str("[peek error: address out of bounds]\n");
                                    }
                                } else {
                                    response.push_str("[usage: peek <addr>]\n");
                                }
                            },
                            "screenshot" => {
                                let path = parts.get(1).copied().unwrap_or("screenshot.png");
                                match save_full_buffer_png(path, &buffer, WIDTH, HEIGHT) {
                                    Ok(()) => status_msg = format!("[screenshot: {}]", path),
                                    Err(e) => status_msg = format!("[screenshot error: {}]", e),
                                }
                            },
                            "canvas" => {
                                let mut out = String::new();
                                for row in 0..CANVAS_MAX_ROWS {
                                    let mut ln = String::new();
                                    for col in 0..CANVAS_COLS {
                                        let val = canvas_buffer[row * CANVAS_COLS + col];
                                        if val > 0 && val < 128 {
                                            ln.push(val as u8 as char);
                                        } else {
                                            ln.push(' ');
                                        }
                                    }
                                    let trimmed = ln.trim_end();
                                    if !trimmed.is_empty() {
                                        out.push_str(&format!("{}|{}\n", row, trimmed));
                                    }
                                }
                                response.push_str(&out);
                            },
                            "assemble" | "asm" => {
                                canvas_assemble(
                                    &canvas_buffer,
                                    &mut vm,
                                    &mut canvas_assembled,
                                    &mut status_msg,
                                );
                                response.push_str(&format!("{}\n", status_msg));
                            },
                            "load_asm" => {
                                // Direct-from-disk assembly — bypasses canvas 128-line limit.
                                // Usage: load_asm <path> [base_addr]
                                // Reads .asm from disk, assembles, loads into VM RAM.
                                if parts.len() >= 2 {
                                    let path = parts[1];
                                    let base_addr = if parts.len() >= 3 {
                                        usize::from_str_radix(parts[2].trim_start_matches("0x"), 16)
                                            .unwrap_or(render::CANVAS_BYTECODE_ADDR)
                                    } else {
                                        render::CANVAS_BYTECODE_ADDR
                                    };
                                    match std::fs::read_to_string(path) {
                                        Ok(source) => {
                                            let mut pp = preprocessor::Preprocessor::new();
                                            let preprocessed = pp.preprocess(&source);
                                            match assembler::assemble(&preprocessed, base_addr) {
                                                Ok(asm_result) => {
                                                    // Clear and load bytecode into RAM
                                                    let clear_end =
                                                        (base_addr + 4096).min(vm.ram.len());
                                                    for v in vm.ram[base_addr..clear_end].iter_mut()
                                                    {
                                                        *v = 0;
                                                    }
                                                    for (i, &pixel) in
                                                        asm_result.pixels.iter().enumerate()
                                                    {
                                                        let addr = base_addr + i;
                                                        if addr < vm.ram.len() {
                                                            vm.ram[addr] = pixel;
                                                        }
                                                    }
                                                    vm.pc = base_addr as u32;
                                                    vm.halted = false;
                                                    vm.current_page_dir = None;
                                                    vm.processes.clear();
                                                    vm.current_pid = 0;
                                                    if vm.ram.len() > 0x7B52 {
                                                        vm.ram[0x7B50] = 0;
                                                        vm.ram[0x7B52] = 0;
                                                    }
                                                    is_running = false;
                                                    // Also load into canvas for visibility
                                                    canvas_buffer.fill(0);
                                                    canvas::load_source_to_canvas(
                                                        &mut canvas_buffer,
                                                        &source,
                                                        &mut cursor_row,
                                                        &mut cursor_col,
                                                    );
                                                    let line_count = source.lines().count();
                                                    status_msg = format!(
                                                        "[load_asm: {} ({} lines, {} words at 0x{:04X})]",
                                                        path,
                                                        line_count,
                                                        asm_result.pixels.len(),
                                                        base_addr
                                                    );
                                                    response.push_str(&format!("{}\n", status_msg));
                                                },
                                                Err(e) => {
                                                    status_msg = format!(
                                                        "[ASM ERROR line {}: {}]",
                                                        e.line, e.message
                                                    );
                                                    response.push_str(&format!("{}\n", status_msg));
                                                },
                                            }
                                        },
                                        Err(e) => {
                                            status_msg = format!("[load_asm error: {}]", e);
                                            response.push_str(&format!("{}\n", status_msg));
                                        },
                                    }
                                } else {
                                    response.push_str("[usage: load_asm <path> [base_addr]]\n");
                                }
                            },
                            "run" => {
                                if vm.halted {
                                    vm.pc = if canvas_assembled {
                                        CANVAS_BYTECODE_ADDR as u32
                                    } else {
                                        0
                                    };
                                    vm.halted = false;
                                }
                                hit_breakpoint = false;
                                is_running = !is_running;
                            },
                            "type" => {
                                // Type text onto canvas. Use \\n (literal backslash-n)
                                // for newline since socket protocol strips actual newlines.
                                if line.len() > 5 {
                                    let text = line[5..].replace("\\n", "\n");
                                    for ch in text.chars() {
                                        if ch == '\n' {
                                            cursor_col = 0;
                                            cursor_row += 1;
                                            if cursor_row >= CANVAS_MAX_ROWS {
                                                cursor_row = CANVAS_MAX_ROWS - 1;
                                            }
                                        } else if cursor_col < CANVAS_COLS {
                                            canvas_buffer[cursor_row * CANVAS_COLS + cursor_col] =
                                                ch as u32;
                                            cursor_col += 1;
                                            // Auto-wrap at end of line
                                            if cursor_col >= CANVAS_COLS {
                                                cursor_col = 0;
                                                cursor_row += 1;
                                                if cursor_row >= CANVAS_MAX_ROWS {
                                                    cursor_row = CANVAS_MAX_ROWS - 1;
                                                }
                                            }
                                        }
                                    }
                                }
                            },
                            "clear" => {
                                canvas_buffer.fill(0);
                                cursor_row = 0;
                                cursor_col = 0;
                                scroll_offset = 0;
                                term_output_row = 0;
                            },
                            "save_asm" => {
                                // Dump canvas text content to programs/<name>.asm on disk.
                                // Usage: save_asm <name>   -> writes to programs/<name>.asm
                                if let Some(name) = parts.get(1) {
                                    // Sanitize name: only alphanumerics, underscores, hyphens
                                    let safe: String = name
                                        .chars()
                                        .filter(|c| c.is_alphanumeric() || *c == '_' || *c == '-')
                                        .collect();
                                    if safe.is_empty() {
                                        response
                                            .push_str("[error: empty name after sanitization]\n");
                                    } else {
                                        let filename = format!("programs/{}.asm", safe);
                                        let mut source = String::new();
                                        for row in 0..CANVAS_MAX_ROWS {
                                            let mut ln = String::new();
                                            for col in 0..CANVAS_COLS {
                                                let val = canvas_buffer[row * CANVAS_COLS + col];
                                                if val > 0 && val < 128 {
                                                    ln.push(val as u8 as char);
                                                } else {
                                                    ln.push(' ');
                                                }
                                            }
                                            let trimmed = ln.trim_end();
                                            if !trimmed.is_empty() {
                                                source.push_str(trimmed);
                                                source.push('\n');
                                            }
                                        }
                                        match std::fs::write(&filename, &source) {
                                            Ok(()) => {
                                                let lines = source.lines().count();
                                                response.push_str(&format!(
                                                    "[saved: {} ({} lines, {} bytes)]\n",
                                                    filename,
                                                    lines,
                                                    source.len()
                                                ));
                                            },
                                            Err(e) => {
                                                response.push_str(&format!(
                                                    "[save_asm error: {}]\n",
                                                    e
                                                ));
                                            },
                                        }
                                    }
                                } else {
                                    response.push_str("[usage: save_asm <name>]\n");
                                }
                            },
                            "load_source" => {
                                // Bulk-load multi-line source into canvas, replacing the
                                // clunky type \\n dance. Usage: load_source <full source text>
                                // Newlines can be literal \n (backslash-n) or actual newlines
                                // (socket protocol usually strips real newlines per line, so
                                // this accepts the rest of the line after "load_source ").
                                canvas_buffer.fill(0);
                                cursor_row = 0;
                                cursor_col = 0;
                                scroll_offset = 0;
                                term_output_row = 0;
                                if line.len() > 12 {
                                    let text = line[12..].replace("\\n", "\n");
                                    for ch in text.chars() {
                                        if ch == '\n' {
                                            cursor_col = 0;
                                            cursor_row += 1;
                                            if cursor_row >= CANVAS_MAX_ROWS {
                                                cursor_row = CANVAS_MAX_ROWS - 1;
                                            }
                                        } else if cursor_col < CANVAS_COLS {
                                            canvas_buffer[cursor_row * CANVAS_COLS + cursor_col] =
                                                ch as u32;
                                            cursor_col += 1;
                                            if cursor_col >= CANVAS_COLS {
                                                cursor_col = 0;
                                                cursor_row += 1;
                                                if cursor_row >= CANVAS_MAX_ROWS {
                                                    cursor_row = CANVAS_MAX_ROWS - 1;
                                                }
                                            }
                                        }
                                    }
                                    response.push_str(&format!(
                                        "[loaded: cursor at ({},{})]\n",
                                        cursor_row, cursor_col
                                    ));
                                } else {
                                    response.push_str(
                                        "[usage: load_source <asm source with \\n for newlines>]\n",
                                    );
                                }
                            },
                            "status" => {
                                response.push_str(&format!(
                                    "mode={:?} running={} assembled={} pc=0x{:04X} cursor=({},{}) fullscreen={}\n",
                                    mode, is_running, canvas_assembled, vm.pc, cursor_row, cursor_col, fullscreen_mode
                                ));
                            },
                            "screen" => {
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
                            "registers" | "regs" => {
                                for i in 0..32 {
                                    response.push_str(&format!("r{:02}={:08X}\n", i, vm.regs[i]));
                                }
                            },
                            "disasm" => {
                                let pc = vm.pc;
                                // Try to decode around PC
                                let bases = [0u32, CANVAS_BYTECODE_ADDR as u32];
                                let mut inst_starts: std::collections::BTreeSet<u32> =
                                    std::collections::BTreeSet::new();
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
                                    } else if a == pc { /* skip, add later */
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
                                // Phase 435: Build label map for label-aware disassembly
                                let label_map = vm.build_label_map();
                                for &addr in &display_addrs {
                                    let (mnemonic, _) = vm.disassemble_at(addr);
                                    let marker = if addr == pc { ">" } else { " " };

                                    // Check if this address has a label
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
                            "vmscreen" => {
                                // Color-aware ASCII art of the 256x256 VM screen (64x32)
                                // Different hues map to different character sets so AI can
                                // distinguish water(~), land(#), buildings(^), text("), etc.
                                let scale_x = 4;
                                let scale_y = 8;
                                for y in 0..32 {
                                    let mut row = String::new();
                                    for x in 0..64 {
                                        let sx = x * scale_x;
                                        let sy = y * scale_y;
                                        // Average color in this cell
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

                                        if lum < 8 {
                                            // Pure black -- empty space
                                            row.push(' ');
                                        } else {
                                            // Classify by dominant channel for hue-based chars
                                            let ch = if r > 200 && g > 200 && b > 200 {
                                                // White/bright: text, borders
                                                '"'
                                            } else if r > 180 && g < 100 && b < 100 {
                                                // Red: buildings, markers
                                                '^'
                                            } else if r < 80 && g > 120 && b < 80 {
                                                // Green: land, forest
                                                if lum > 140 {
                                                    '#'
                                                } else if lum > 80 {
                                                    '+'
                                                } else {
                                                    ':'
                                                }
                                            } else if r < 80 && g < 80 && b > 120 {
                                                // Blue: water
                                                if lum > 120 {
                                                    '~'
                                                } else if lum > 50 {
                                                    '='
                                                } else {
                                                    '-'
                                                }
                                            } else if r > 150 && g > 100 && b < 60 {
                                                // Brown/yellow: desert, beach
                                                '%'
                                            } else if r > 100 && g < 80 && b > 100 {
                                                // Purple: mountains
                                                'M'
                                            } else if r < 60 && g > 100 && b > 100 {
                                                // Cyan/teal: shallow water
                                                '~'
                                            } else if r > 180 && g > 180 && b < 100 {
                                                // Yellow: taskbar, highlights
                                                '*'
                                            } else if r < 30 && g < 30 && b < 30 {
                                                // Very dark: night sky, deep space
                                                '.'
                                            } else if lum > 180 {
                                                // Bright but mixed
                                                '@'
                                            } else if lum > 100 {
                                                // Mid-tone mixed
                                                '+'
                                            } else {
                                                // Dark mixed
                                                ':'
                                            };
                                            row.push(ch);
                                        }
                                    }
                                    response.push_str(&(row.trim_end().to_string() + "\n"));
                                }
                            },
                            "peek_pixel" => {
                                let x = parts.get(1).and_then(|s| s.parse::<usize>().ok());
                                let y = parts.get(2).and_then(|s| s.parse::<usize>().ok());
                                match (x, y) {
                                    (Some(x), Some(y)) if x < 256 && y < 256 => {
                                        let c = vm.screen[y * 256 + x];
                                        let r = (c >> 16) & 0xFF;
                                        let g = (c >> 8) & 0xFF;
                                        let b = c & 0xFF;
                                        response.push_str(&format!(
                                            "{:06X} r={} g={} b={}\n",
                                            c & 0xFFFFFF,
                                            r,
                                            g,
                                            b
                                        ));
                                    },
                                    (Some(_), Some(_)) => {
                                        response
                                            .push_str("[error: out of range, screen is 256x256]\n");
                                    },
                                    _ => {
                                        response.push_str("[usage: peek_pixel <x> <y>]\n");
                                    },
                                }
                            },
                            "region_checksum" => {
                                let x = parts.get(1).and_then(|s| s.parse::<usize>().ok());
                                let y = parts.get(2).and_then(|s| s.parse::<usize>().ok());
                                let w = parts.get(3).and_then(|s| s.parse::<usize>().ok());
                                let h = parts.get(4).and_then(|s| s.parse::<usize>().ok());
                                match (x, y, w, h) {
                                    (Some(x), Some(y), Some(w), Some(h))
                                        if w > 0
                                            && h > 0
                                            && x.saturating_add(w) <= 256
                                            && y.saturating_add(h) <= 256 =>
                                    {
                                        let hash = geometry_os::vision::region_checksum(
                                            &vm.screen, x, y, w, h,
                                        );
                                        response.push_str(&format!("{:08X}\n", hash));
                                    },
                                    (Some(_), Some(_), Some(_), Some(_)) => {
                                        response.push_str(
                                            "[error: region must fit in 256x256, w/h > 0]\n",
                                        );
                                    },
                                    _ => {
                                        response
                                            .push_str("[usage: region_checksum <x> <y> <w> <h>]\n");
                                    },
                                }
                            },
                            "render_log" | "rlog" => match parts.get(1).copied() {
                                Some("on") => {
                                    vm.render_logging = true;
                                    response.push_str("[render_log enabled]\n");
                                },
                                Some("off") => {
                                    vm.render_logging = false;
                                    response.push_str("[render_log disabled]\n");
                                },
                                Some("clear") => {
                                    vm.render_log.clear();
                                    response.push_str("[render_log cleared]\n");
                                },
                                Some("dump") | None => {
                                    if vm.render_log.is_empty() {
                                        response.push_str("[render_log empty]\n");
                                    } else {
                                        for entry in vm.render_log.iter() {
                                            response.push_str(&format!(
                                                "frame={} {:02X}:{} args=[",
                                                entry.frame, entry.opcode, entry.name
                                            ));
                                            for i in 0..entry.argc as usize {
                                                response.push_str(&format!(
                                                    "{}{}",
                                                    if i > 0 { ", " } else { "" },
                                                    entry.args[i]
                                                ));
                                            }
                                            response.push_str("]\n");
                                        }
                                    }
                                },
                                _ => {
                                    response.push_str("[usage: render_log on|off|dump|clear]\n");
                                },
                            },
                            "ram" => {
                                let base = parts
                                    .get(1)
                                    .and_then(|s| {
                                        usize::from_str_radix(s.trim_start_matches("0x"), 16).ok()
                                    })
                                    .unwrap_or(ram_view_base);
                                let rows: usize =
                                    parts.get(2).and_then(|s| s.parse().ok()).unwrap_or(8);
                                for r in 0..rows {
                                    let mut line = format!("{:04X}: ", base + r * 16);
                                    for c in 0..16 {
                                        let addr = base + r * 16 + c;
                                        if addr < vm.ram.len() {
                                            line.push_str(&format!("{:08X} ", vm.ram[addr]));
                                        }
                                    }
                                    response.push_str(&(line.trim_end().to_string() + "\n"));
                                }
                            },
                            "poke" => {
                                // poke <addr> <value> — write single word to VM RAM
                                // Both addr and value in hex (0x prefix optional for addr)
                                if parts.len() < 3 {
                                    response.push_str("usage: poke <addr> <value>\n");
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
                                        // Invalidate icache at this address
                                        if addr < vm.icache.len() {
                                            vm.icache[addr] = None;
                                        }
                                        response.push_str(&format!(
                                            "ok ram[0x{:04X}]={:08X}\n",
                                            addr, val
                                        ));
                                    } else {
                                        response.push_str(&format!(
                                            "err: addr 0x{:04X} out of range (max 0x{:04X})\n",
                                            addr,
                                            vm.ram.len() - 1
                                        ));
                                    }
                                }
                            },
                            "poke_bulk" => {
                                // poke_bulk <addr> <v1> <v2> ... — write multiple words starting at addr
                                // values in hex or decimal, space-separated
                                if parts.len() < 3 {
                                    response.push_str("usage: poke_bulk <addr> <v1> <v2> ...\n");
                                } else {
                                    let base = usize::from_str_radix(
                                        parts[1].trim_start_matches("0x").trim_start_matches("0X"),
                                        16,
                                    )
                                    .or_else(|_| parts[1].parse::<usize>())
                                    .unwrap_or(usize::MAX);

                                    if base >= vm.ram.len() {
                                        response.push_str(&format!(
                                            "err: addr 0x{:04X} out of range\n",
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
                                                tok.trim_start_matches("0x")
                                                    .trim_start_matches("0X"),
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
                                                    response.push_str(&format!("warn: skipping invalid value '{}' at offset {}\n", tok, i));
                                                },
                                            }
                                        }
                                        response.push_str(&format!(
                                            "ok wrote {} words at 0x{:04X}\n",
                                            written, base
                                        ));
                                    }
                                }
                            },
                            "vm_state" | "vmstate" => {
                                // JSON-ish dump of key VM state
                                response.push_str(&format!("pc=0x{:04X}\n", vm.pc));
                                response.push_str(&format!("halted={}\n", vm.halted));
                                response.push_str(&format!("running={}\n", is_running));
                                response.push_str(&format!("assembled={}\n", canvas_assembled));
                                for i in 0..32 {
                                    response.push_str(&format!("r{:02}={:08X}\n", i, vm.regs[i]));
                                }
                            },
                            "dashboard" | "dash" => {
                                // Full ASCII dashboard of the GUI state
                                let state_label = if is_running {
                                    "RUNNING"
                                } else if vm.halted {
                                    "HALTED"
                                } else {
                                    "PAUSED"
                                };

                                response.push_str("╔════════════════════════════════════════════════════════════════╗\n");
                                response.push_str(&format!("║ Geometry OS Dashboard  {}  PC=0x{:04X}                              ║\n", state_label, vm.pc));
                                response.push_str("╠════════════════════════════════════════════════════════════════╣\n");

                                // Registers (4 per row)
                                response.push_str("║ REGS: ");
                                for i in 0..32 {
                                    response.push_str(&format!("r{:02}={:08X} ", i, vm.regs[i]));
                                    if (i + 1) % 4 == 0 {
                                        if i < 31 {
                                            response.push_str("║\n║       ");
                                        } else {
                                            response.push_str("║\n");
                                        }
                                    }
                                }

                                response.push_str("╠════════════════════════════════════════════════════════════════╣\n");

                                // Disassembly
                                let pc = vm.pc;
                                let bases = [0u32, CANVAS_BYTECODE_ADDR as u32];
                                let mut inst_starts2: std::collections::BTreeSet<u32> =
                                    std::collections::BTreeSet::new();
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
                                            inst_starts2.insert(addr);
                                            let (_, len) = vm.disassemble_at(addr);
                                            if len == 0 {
                                                break;
                                            }
                                            addr += len as u32;
                                        }
                                    }
                                }
                                let mut da2: Vec<u32> = Vec::new();
                                let mut b2: Vec<u32> = Vec::new();
                                let mut a2: Vec<u32> = Vec::new();
                                for &a in &inst_starts2 {
                                    if a < pc {
                                        b2.push(a);
                                        if b2.len() > 2 {
                                            b2.remove(0);
                                        }
                                    } else if a == pc {
                                    } else {
                                        a2.push(a);
                                        if a2.len() >= 3 {
                                            break;
                                        }
                                    }
                                }
                                da2.extend_from_slice(&b2);
                                if inst_starts2.contains(&pc) {
                                    da2.push(pc);
                                }
                                da2.extend_from_slice(&a2);

                                response.push_str("║ DISASM:\n");
                                for &addr in &da2 {
                                    let (mnemonic, _) = vm.disassemble_at(addr);
                                    let marker = if addr == pc { ">>" } else { "  " };
                                    response.push_str(&format!(
                                        "║ {} {:04X} {}\n",
                                        marker, addr, mnemonic
                                    ));
                                }

                                response.push_str("╠════════════════════════════════════════════════════════════════╣\n");

                                // VM Screen (ASCII art, compact 32x16)
                                response.push_str("║ VM DISPLAY:\n");
                                let sx = 8;
                                let sy = 16;
                                for y in 0..16 {
                                    let mut row = String::new();
                                    for x in 0..32 {
                                        let mut lit = 0u32;
                                        let mut total = 0u32;
                                        for dy in 0..sy {
                                            for dx in 0..sx {
                                                let py = y * sy + dy;
                                                let px = x * sx + dx;
                                                if py < 256 && px < 256 {
                                                    if vm.screen[py * 256 + px] != 0 {
                                                        lit += 1;
                                                    }
                                                    total += 1;
                                                }
                                            }
                                        }
                                        let ratio = if total > 0 {
                                            lit as f32 / total as f32
                                        } else {
                                            0.0
                                        };
                                        row.push(if ratio > 0.5 {
                                            '#'
                                        } else if ratio > 0.1 {
                                            '.'
                                        } else {
                                            ' '
                                        });
                                    }
                                    response.push_str(&format!("║ {}\n", row.trim_end()));
                                }

                                response.push_str("╠════════════════════════════════════════════════════════════════╣\n");
                                response.push_str(&format!("║ {}\n", status_msg));
                                response.push_str("╚════════════════════════════════════════════════════════════════╝\n");
                            },
                            "load" => {
                                // Load an .asm file onto the canvas
                                if let Some(path) = parts.get(1) {
                                    match std::fs::read_to_string(path) {
                                        Ok(source) => {
                                            load_source_to_canvas(
                                                &mut canvas_buffer,
                                                &source,
                                                &mut cursor_row,
                                                &mut cursor_col,
                                            );
                                            scroll_offset = 0;
                                            loaded_file = Some(PathBuf::from(path));
                                            canvas_assembled = false;
                                            status_msg = format!("[loaded: {}]", path);
                                            response.push_str(&format!("[loaded: {}]\n", path));
                                        },
                                        Err(e) => {
                                            response.push_str(&format!("[error: {}]\n", e));
                                        },
                                    }
                                } else {
                                    response.push_str("[usage: load <path>]\n");
                                }
                            },
                            "step" => {
                                // Single-step the VM
                                if !is_running && (!vm.halted || vm.pc > 0) {
                                    vm.step();
                                    response.push_str(&format!("pc=0x{:04X}\n", vm.pc));
                                } else if is_running {
                                    response.push_str("[vm is running, pause first]\n");
                                } else {
                                    response.push_str("[not loaded]\n");
                                }
                            },
                            "halt" => {
                                is_running = false;
                                // Don't set vm.halted = true here -- that signals
                                // program completion and triggers should_quit in
                                // terminal_direct_mode. Socket halt is a pause, not exit.
                                status_msg = "[HALTED]".into();
                            },
                            "loadbin" => {
                                // Load a binary file directly into VM RAM at address 0.
                                // Supports both raw byte format (1 byte per word) and
                                // u32 LE format (4 bytes per word, written by asm_bin).
                                if let Some(path) = parts.get(1) {
                                    match std::fs::read(path) {
                                        Ok(bytes) => {
                                            // Auto-detect: if size is divisible by 4 and large enough,
                                            // treat as u32 LE words (asm_bin output).
                                            // Otherwise treat as raw bytes.
                                            let words: Vec<u32> = if bytes.len() > 4
                                                && bytes.len() % 4 == 0
                                            {
                                                bytes
                                                    .chunks_exact(4)
                                                    .map(|c| {
                                                        u32::from_le_bytes([c[0], c[1], c[2], c[3]])
                                                    })
                                                    .collect()
                                            } else {
                                                bytes.iter().map(|&b| b as u32).collect()
                                            };
                                            let len = words.len().min(vm.ram.len());
                                            vm.ram[..len].copy_from_slice(&words[..len]);
                                            vm.pc = 0;
                                            vm.halted = false;
                                            // Invalidate icache so stale cached instructions
                                            // from a previous program don't execute.
                                            vm.icache_invalidate_range(0, len);
                                            canvas_assembled = false;
                                            status_msg =
                                                format!("[loaded {} words at 0x0000]", len);
                                            response.push_str(&format!(
                                                "[loaded {} words at 0x0000]\n",
                                                len
                                            ));
                                        },
                                        Err(e) => {
                                            response.push_str(&format!("[error: {}]\n", e));
                                        },
                                    }
                                } else {
                                    response.push_str("[usage: loadbin <path>]\n");
                                }
                            },
                            "help" => {
                                response.push_str("Commands: status, canvas, assemble, run, type <text>, clear, save, save_asm <name>, load_source <asm>, screenshot [path], screenshot_b64, screenshot_annotated_b64, canvas_checksum, canvas_diff <hex>, screen, registers, disasm, vmscreen, peek_pixel <x> <y>, region_checksum <x> <y> <w> <h>, render_log [on|off|dump|clear], ram [base] [rows], vm_state, dashboard, load <path>, loadasm <path>, loadbin <path>, step, halt, scrollback [offset] [count], buildings [radius], desktop_json, launch <app> [--window], player_pos, hypervisor_boot <config>, hypervisor_kill, riscv_run <elf_path>, riscv_kill, inject_key <keycode>, inject_mouse <move|click> <x> <y> [button], inject_text <text>, window_list, window_move <id> <x> <y>, window_close <id>, window_focus <id>, window_resize <id> <w> <h>, process_kill <pid>, launcher [cmd|close|status], clipboard [get|set <text>], watch <path>, unwatch, font [small|normal|medium], cursorstyle [block|underline|bar], help\n");
                                response.push_str("In 'type' command, use \\n for newlines.\n");
                            },
                            "scrollback" => {
                                let offset: usize =
                                    parts.get(1).and_then(|s| s.parse().ok()).unwrap_or(0);
                                let count: usize =
                                    parts.get(2).and_then(|s| s.parse().ok()).unwrap_or(32);
                                response.push_str(&format!(
                                    "[scrollback: {} lines buffered, max_scroll={}]\n",
                                    scrollback.len(),
                                    scrollback.max_scroll()
                                ));
                                let end = (offset + count).min(scrollback.len());
                                for i in offset..end {
                                    if let Some(line) = scrollback.get_line(i) {
                                        let text: String = line
                                            .iter()
                                            .take_while(|&&v| v != 0)
                                            .map(|&v| (v & 0xFF) as u8 as char)
                                            .collect();
                                        if !text.is_empty() {
                                            response.push_str(&format!("{}|{}\n", i, text));
                                        }
                                    }
                                }
                            },
                            "loadasm" => {
                                // Assemble a .asm file directly into VM RAM at
                                // CANVAS_BYTECODE_ADDR, bypassing the canvas text buffer.
                                if let Some(path) = parts.get(1) {
                                    match std::fs::read_to_string(path) {
                                        Ok(source) => {
                                            let mut pp = crate::preprocessor::Preprocessor::new();
                                            let preprocessed = pp.preprocess(&source);
                                            match crate::assembler::assemble(
                                                &preprocessed,
                                                crate::render::CANVAS_BYTECODE_ADDR,
                                            ) {
                                                Ok(asm_result) => {
                                                    let ram_len = vm.ram.len();
                                                    let base = crate::render::CANVAS_BYTECODE_ADDR;
                                                    for v in vm.ram[base..ram_len.min(base + 8192)]
                                                        .iter_mut()
                                                    {
                                                        *v = 0;
                                                    }
                                                    for (i, &word) in
                                                        asm_result.pixels.iter().enumerate()
                                                    {
                                                        let addr = base + i;
                                                        if addr < ram_len {
                                                            vm.ram[addr] = word;
                                                        }
                                                    }
                                                    vm.pc = base as u32;
                                                    vm.halted = false;
                                                    // Clear any stale page tables and callback state
                                                    // from previous programs
                                                    vm.current_page_dir = None;
                                                    vm.processes.clear();
                                                    vm.current_pid = 0;
                                                    if vm.ram.len() > 0x7B52 {
                                                        vm.ram[0x7B50] = 0;
                                                        vm.ram[0x7B52] = 0;
                                                    }
                                                    // Invalidate icache so stale cached instructions
                                                    // from a previous program don't execute.
                                                    vm.icache_invalidate_range(
                                                        base,
                                                        base + asm_result.pixels.len(),
                                                    );
                                                    canvas_assembled = true;
                                                    status_msg = format!(
                                                        "[loadasm OK: {} words at 0x{:04X}]",
                                                        asm_result.pixels.len(),
                                                        base
                                                    );
                                                    response.push_str(&format!(
                                                        "[loaded {} words at 0x{:04X}]\n",
                                                        asm_result.pixels.len(),
                                                        base
                                                    ));
                                                },
                                                Err(e) => {
                                                    response.push_str(&format!(
                                                        "[assembly error: {}]\n",
                                                        e
                                                    ));
                                                },
                                            }
                                        },
                                        Err(e) => {
                                            response.push_str(&format!("[error: {}]\n", e));
                                        },
                                    }
                                } else {
                                    response.push_str("[usage: loadasm <path>]\n");
                                }
                            },
                            // ── Phase 84: Building & Desktop Socket Commands ──────
                            "buildings" => {
                                // List buildings from Vec (unlimited capacity)
                                // Format: id,world_x,world_y,type_color,name per line
                                let radius: i32 =
                                    parts.get(1).and_then(|s| s.parse().ok()).unwrap_or(256);
                                let player_x = vm.ram[0x7808] as i32;
                                let player_y = vm.ram[0x7809] as i32;
                                for b in vm.buildings.iter() {
                                    let bx = b.x;
                                    let by = b.y;
                                    if radius > 0 {
                                        let dx = (bx - player_x).abs();
                                        let dy = (by - player_y).abs();
                                        if dx > radius || dy > radius {
                                            continue;
                                        }
                                    }
                                    response.push_str(&format!(
                                        "{},{},{},{:06x},{}\n",
                                        b.id,
                                        bx,
                                        by,
                                        b.type_color & 0xFFFFFF,
                                        b.name
                                    ));
                                }
                            },
                            "desktop_json" => {
                                // Full desktop state as JSON-ish
                                let player_x = vm.ram[0x7808];
                                let player_y = vm.ram[0x7809];
                                let cam_x = vm.ram[0x7800];
                                let cam_y = vm.ram[0x7801];
                                let frame = vm.ram[0x7802];
                                let nearby = vm.ram[0x7588];
                                response.push_str(&format!(
                                    "{{\"player\":{{\"x\":{},\"y\":{}}},\"camera\":{{\"x\":{},\"y\":{}}},\"frame\":{},\"nearby_building\":{},\"buildings\":[",
                                    player_x, player_y, cam_x, cam_y, frame, nearby
                                ));
                                let mut first = true;
                                for b in vm.buildings.iter() {
                                    if !first {
                                        response.push(',');
                                    }
                                    first = false;
                                    response.push_str(&format!(
                                        "{{\"id\":{},\"x\":{},\"y\":{},\"color\":\"{:06x}\",\"name\":\"{}\"}}",
                                        b.id, b.x, b.y, b.type_color & 0xFFFFFF, b.name
                                    ));
                                }
                                response.push_str("]}\n");
                            },
                            "launch" => {
                                // Launch an app by name (sets VM state to run the program)
                                // Supports --window flag to load into WINSYS window
                                let mut args_iter = parts.iter().skip(1).peekable();
                                let mut window_mode = false;
                                let mut app_name = "";

                                // Parse flags
                                while let Some(&arg) = args_iter.peek() {
                                    if *arg == "--window" {
                                        window_mode = true;
                                        args_iter.next();
                                    } else {
                                        app_name = arg;
                                        args_iter.next();
                                    }
                                }

                                if app_name.is_empty() {
                                    response.push_str("[error: launch requires app name]\n");
                                } else if window_mode {
                                    // ── Windowed launch: create a new WINSYS windowed process ──
                                    let prog_path = format!("programs/{}.asm", app_name);
                                    match std::fs::read_to_string(&prog_path) {
                                        Ok(source) => {
                                            let mut pp = crate::preprocessor::Preprocessor::new();
                                            let preprocessed = pp.preprocess(&source);
                                            // Find a free app slot BEFORE assembling so we can
                                            // pass the correct base_addr for label resolution
                                            let used_slots: Vec<usize> =
                                                active_apps.iter().map(|a| a.0).collect();
                                            let slot = (0..MAX_WINDOWED_APPS)
                                                .find(|s| !used_slots.contains(s));

                                            if let Some(slot_idx) = slot {
                                                let app_base =
                                                    APP_CODE_BASE + slot_idx * APP_CODE_SIZE;
                                                match crate::assembler::assemble(
                                                    &preprocessed,
                                                    app_base,
                                                ) {
                                                    Ok(asm_result) => {
                                                        let ram_len = vm.ram.len();

                                                        // Clear app code region
                                                        if app_base < ram_len {
                                                            let end = (app_base + APP_CODE_SIZE)
                                                                .min(ram_len);
                                                            for v in &mut vm.ram[app_base..end] {
                                                                *v = 0;
                                                            }
                                                        }

                                                        // Load app bytecode
                                                        for (idx, &word) in
                                                            asm_result.pixels.iter().enumerate()
                                                        {
                                                            let addr = app_base + idx;
                                                            if addr < ram_len {
                                                                vm.ram[addr] = word;
                                                            }
                                                        }

                                                        // Create a SpawnedProcess for the app
                                                        let pid = (vm.processes.len() + 1) as u32;
                                                        let mut proc =
                                                            crate::vm::types::SpawnedProcess::new(
                                                                pid,
                                                                0,
                                                                app_base as u32,
                                                            );
                                                        proc.parent_pid = 0; // kernel-spawned
                                                        proc.priority = 1;
                                                        // Assign private data region for this app
                                                        let data_base = crate::vm::types::APP_DATA_BASE
                                                            + slot_idx * crate::vm::types::APP_DATA_SIZE;
                                                        proc.data_base = data_base as u32;

                                                        // Position window near player/camera center
                                                        let cam_x = vm
                                                            .ram
                                                            .get(0x7800)
                                                            .copied()
                                                            .unwrap_or(0)
                                                            as i32;
                                                        let cam_y = vm
                                                            .ram
                                                            .get(0x7801)
                                                            .copied()
                                                            .unwrap_or(0)
                                                            as i32;
                                                        // Offset so window appears near center of view
                                                        let win_world_x =
                                                            (cam_x + 16).max(0) as u32;
                                                        let win_world_y =
                                                            (cam_y + 12).max(0) as u32;

                                                        // Phase 133: host_term uses SMALLTEXT (3x5 font) for 80 cols x 40 rows
                                                        // 80*3px = 240px wide, 40*6px + 10px title = 250px tall -> 256x256 window
                                                        // Other apps keep 128x96
                                                        let win_w = if app_name == "host_term" {
                                                            256u32
                                                        } else {
                                                            128u32
                                                        };
                                                        let win_h = if app_name == "host_term" {
                                                            256u32
                                                        } else {
                                                            96u32
                                                        };

                                                        // Create a world-space WINSYS window
                                                        vm.ram[crate::vm::types::WINDOW_WORLD_COORDS_ADDR] = 1;
                                                        let win_id = vm.windows.len() as u32 + 1;
                                                        let mut win =
                                                            crate::vm::types::Window::new_world(
                                                                win_id,
                                                                win_world_x,
                                                                win_world_y,
                                                                win_w,
                                                                win_h,
                                                                0, // title addr
                                                                pid,
                                                            );

                                                        // Set window title from app name
                                                        let title_base = 0x7900 + slot_idx * 32;
                                                        // Zero-fill the 32-byte title region first to prevent stale bytes
                                                        for j in 0..32 {
                                                            if title_base + j < ram_len {
                                                                vm.ram[title_base + j] = 0;
                                                            }
                                                        }
                                                        for (j, b) in app_name.bytes().enumerate() {
                                                            if title_base + j < ram_len {
                                                                vm.ram[title_base + j] = b as u32;
                                                            }
                                                        }
                                                        win.title_addr = title_base as u32;
                                                        vm.windows.push(win);

                                                        // Phase 133: tell host_term its WINSYS window ID (0x4E08)
                                                        // This enables dynamic sizing when launched in a window
                                                        if 0x4E08 < ram_len {
                                                            vm.ram[0x4E08] = win_id;
                                                        }

                                                        // Push the process
                                                        vm.processes.push(proc);

                                                        // Auto-focus the new window
                                                        vm.focused_pid = pid;

                                                        // Track active app
                                                        active_apps.push((
                                                            slot_idx,
                                                            pid,
                                                            app_name.to_string(),
                                                        ));

                                                        // Map stays running
                                                        is_running = true;
                                                        hit_breakpoint = false;
                                                        response.push_str(&format!(
                                                            "[windowed: {} PID={} slot={} win={}]\n",
                                                            app_name, pid, slot_idx, win_id
                                                        ));
                                                    },
                                                    Err(e) => {
                                                        response.push_str(&format!(
                                                            "[assembly error for {}: {}]\n",
                                                            app_name, e
                                                        ));
                                                    },
                                                }
                                            } else {
                                                response
                                                    .push_str("[max apps: close a window first]\n");
                                            }
                                        },
                                        Err(e) => {
                                            response.push_str(&format!(
                                                "[no program file for {}: {}]\n",
                                                app_name, e
                                            ));
                                        },
                                    }
                                } else {
                                    // ── Legacy launch: replace map with app ──
                                    // Find the building with matching name
                                    let mut found = false;
                                    for b in vm.buildings.iter() {
                                        if b.name == app_name {
                                            // Load and assemble the program
                                            let prog_path = format!("programs/{}.asm", app_name);
                                            match std::fs::read_to_string(&prog_path) {
                                                Ok(source) => {
                                                    let mut pp =
                                                        crate::preprocessor::Preprocessor::new();
                                                    let preprocessed = pp.preprocess(&source);
                                                    let base_addr =
                                                        crate::render::CANVAS_BYTECODE_ADDR;
                                                    match crate::assembler::assemble(
                                                        &preprocessed,
                                                        base_addr,
                                                    ) {
                                                        Ok(asm_result) => {
                                                            let ram_len = vm.ram.len();
                                                            for v in vm.ram[base_addr
                                                                ..ram_len.min(base_addr + 8192)]
                                                                .iter_mut()
                                                            {
                                                                *v = 0;
                                                            }
                                                            for (idx, &word) in
                                                                asm_result.pixels.iter().enumerate()
                                                            {
                                                                let addr = base_addr + idx;
                                                                if addr < ram_len {
                                                                    vm.ram[addr] = word;
                                                                }
                                                            }
                                                            vm.pc = base_addr as u32;
                                                            vm.halted = false;
                                                            canvas_assembled = true;
                                                            is_running = true;
                                                            hit_breakpoint = false;
                                                            response.push_str(&format!(
                                                                "[launching: {} from building {} ({} words)]\n",
                                                                app_name, b.id, asm_result.pixels.len()
                                                            ));
                                                        },
                                                        Err(e) => {
                                                            response.push_str(&format!(
                                                                "[assembly error for {}: {}]\n",
                                                                app_name, e
                                                            ));
                                                        },
                                                    }
                                                },
                                                Err(e) => {
                                                    response.push_str(&format!(
                                                        "[no program file for {}: {}]\n",
                                                        app_name, e
                                                    ));
                                                },
                                            }
                                            found = true;
                                            break;
                                        }
                                    }
                                    if !found {
                                        response
                                            .push_str(&format!("[app not found: {}]\n", app_name));
                                    }
                                }
                            },
                            "player_pos" => {
                                let px = vm.ram[0x7808];
                                let py = vm.ram[0x7809];
                                let facing = vm.ram[0x780A];
                                let facing_str = match facing {
                                    0 => "down",
                                    1 => "up",
                                    2 => "left",
                                    3 => "right",
                                    _ => "unknown",
                                };
                                response.push_str(&format!("{},{},{}\n", px, py, facing_str));
                            },
                            // ── AI Navigation Commands ─────────────────────────────
                            "goto" => {
                                // goto <name_or_id> -- teleport player to building
                                let target = parts.get(1).copied().unwrap_or("");
                                if target.is_empty() {
                                    response.push_str("[usage: goto <building_name_or_id>]\n");
                                } else {
                                    // Try to find building by name or id
                                    let mut found_x: i32 = -1;
                                    let mut found_y: i32 = -1;
                                    let mut found_name = String::new();
                                    // Check if target is a numeric id
                                    let target_id: Option<u32> = target.parse().ok();
                                    for b in vm.buildings.iter() {
                                        let matches = b.name == target || target_id == Some(b.id);
                                        if matches {
                                            found_x = b.x;
                                            found_y = b.y;
                                            found_name = b.name.clone();
                                            break;
                                        }
                                    }
                                    if found_x >= 0 {
                                        // Teleport player 2 tiles below the building (in front of door)
                                        vm.ram[0x7808] = (found_x) as u32;
                                        vm.ram[0x7809] = (found_y + 2) as u32;
                                        // Update camera to center on player
                                        let tile_size = match vm.ram[0x7812] {
                                            0 => 1,
                                            1 => 2,
                                            _ => 4,
                                        };
                                        let tiles_per_axis = 256 / tile_size as i32;
                                        vm.ram[0x7800] =
                                            (found_x - tiles_per_axis / 2).max(0) as u32;
                                        vm.ram[0x7801] =
                                            (found_y + 2 - tiles_per_axis / 2).max(0) as u32;
                                        response.push_str(&format!(
                                            "[teleported to {} ({},{}), camera updated]\n",
                                            found_name,
                                            found_x,
                                            found_y + 2
                                        ));
                                    } else {
                                        response.push_str(&format!(
                                            "[building '{}' not found. Use 'buildings' to list.]\n",
                                            target
                                        ));
                                    }
                                }
                            },
                            "nearby" => {
                                // List buildings sorted by distance from player
                                let player_x = vm.ram[0x7808] as i32;
                                let player_y = vm.ram[0x7809] as i32;
                                let mut bldgs: Vec<(u32, i32, i32, i32, String)> = Vec::new();
                                for b in vm.buildings.iter() {
                                    let dist = (b.x - player_x).abs() + (b.y - player_y).abs();
                                    bldgs.push((b.id, b.x, b.y, dist, b.name.clone()));
                                }
                                bldgs.sort_by_key(|b| b.3);
                                response.push_str(&format!(
                                    "player=({},{}), {} buildings:\n",
                                    player_x,
                                    player_y,
                                    bldgs.len()
                                ));
                                for (id, bx, by, dist, name) in &bldgs {
                                    response.push_str(&format!(
                                        "  [{}] {} ({},{}) dist={}\n",
                                        id, name, bx, by, dist
                                    ));
                                }
                            },
                            "menu" => {
                                // Numbered menu of all apps for AI to pick from
                                let player_x = vm.ram[0x7808] as i32;
                                let player_y = vm.ram[0x7809] as i32;
                                response.push_str(&format!(
                                    "=== Geometry OS Desktop Menu ({} apps) ===\n",
                                    vm.buildings.len()
                                ));
                                response.push_str(&format!(
                                    "Player: ({},{}) | Commands: goto <N>, launch <name>\n",
                                    player_x, player_y
                                ));
                                for b in vm.buildings.iter() {
                                    let dist = (b.x - player_x).abs() + (b.y - player_y).abs();
                                    response.push_str(&format!(
                                        "  [{}] {} (at {},{}, dist {})\n",
                                        b.id, b.name, b.x, b.y, dist
                                    ));
                                }
                                response.push_str("=== End Menu ===\n");
                            },
                            "import_binary" => {
                                // Import binary file into building metadata
                                // Usage: import_binary <path> <building_id> [format] [encoding]
                                if parts.len() >= 3 {
                                    let file_path = parts[1];
                                    let building_id: u32 = match parts[2].parse() {
                                        Ok(id) => id,
                                        Err(_) => {
                                            response.push_str("[error: invalid building_id]\n");
                                            continue;
                                        },
                                    };
                                    let format = parts.get(3).copied().unwrap_or("raw");
                                    let encoding = parts.get(4).copied().unwrap_or("base64");

                                    match encoding::BinaryMetadata::from_file(
                                        std::path::Path::new(file_path),
                                        format,
                                        encoding,
                                    ) {
                                        Ok(metadata) => {
                                            let metadata_json = serde_json::to_string(&metadata)
                                                .unwrap_or_else(|e| format!("[json error: {}]", e));

                                            // Store in building metadata via coordinate metadata system
                                            // Use coordinate (building_id, 0) as default storage location
                                            let coord_key = ((building_id as u64) << 16) | 0;
                                            if vm.coordinate_metadata.contains_key(&coord_key) {
                                                vm.coordinate_metadata
                                                    .get_mut(&coord_key)
                                                    .unwrap()
                                                    .insert(
                                                        "binary_data".to_string(),
                                                        metadata_json,
                                                    );
                                            } else {
                                                let mut coord_meta =
                                                    std::collections::HashMap::new();
                                                coord_meta.insert(
                                                    "binary_data".to_string(),
                                                    metadata_json,
                                                );
                                                vm.coordinate_metadata
                                                    .insert(coord_key, coord_meta);
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
                                    response.push_str("[usage: import_binary <path> <building_id> [format] [encoding]]\n");
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
                                        coord_meta
                                            .insert("boot_config".to_string(), config_str.clone());
                                        vm.coordinate_metadata.insert(coord_key, coord_meta);
                                    }
                                    response
                                        .push_str(&format!("[boot_config set: {}]\n", config_str));
                                } else {
                                    response.push_str("[usage: set_boot_config <kernel=building:N> [initrd=building:N] [ram=256] [bootargs=...]]\n");
                                }
                            },
                            "show_boot_config" => {
                                let coord_key = 0u64; // coordinate (0,0)
                                if let Some(coord_meta) = vm.coordinate_metadata.get(&coord_key) {
                                    if let Some(config_str) = coord_meta.get("boot_config") {
                                        response
                                            .push_str(&format!("boot_config: {}\n", config_str));
                                    } else {
                                        response.push_str("[boot_config: not set (no boot_config key at coordinate (0,0))]\n");
                                    }
                                } else {
                                    response.push_str("[boot_config: not set (no metadata at coordinate (0,0))]\n");
                                }
                            },
                            "import_memory_palace" => {
                                let strategy = if let Some(mode) = parts.get(1) {
                                    match mode.as_ref() {
                                        "preserve" => export::MergeStrategy::PreserveExisting,
                                        "rename" => export::MergeStrategy::RenameOnConflict,
                                        "overwrite" => export::MergeStrategy::Overwrite,
                                        _ => {
                                            response.push_str("[usage: import_memory_palace <path> [preserve|rename|overwrite]]\n");
                                            continue;
                                        },
                                    }
                                } else {
                                    export::MergeStrategy::PreserveExisting
                                };

                                if let Some(path) = parts.get(if parts.len() > 2 { 2 } else { 1 }) {
                                    match export::import_from_file(&mut vm, path, strategy) {
                                        Ok(()) => {
                                            response.push_str(&format!("[imported: {}]\n", path));
                                        },
                                        Err(e) => {
                                            response.push_str(&format!("[error: {}]\n", e));
                                        },
                                    }
                                } else {
                                    response.push_str("[usage: import_memory_palace <path> [preserve|rename|overwrite]]\n");
                                }
                            },
                            "hypervisor_boot" => {
                                // Boot a guest OS via hypervisor
                                // Usage: hypervisor_boot <config> [window_id]
                                // e.g. hypervisor_boot arch=riscv64 kernel=Image ram=256M
                                if parts.len() < 2 {
                                    response.push_str(
                                        "[error: hypervisor_boot requires config string]\n",
                                    );
                                } else {
                                    let config_parts: Vec<&str> = parts[1..]
                                        .iter()
                                        .take_while(|p| !p.starts_with("window="))
                                        .cloned()
                                        .collect();
                                    let config_str = config_parts.join(" ");
                                    // Check for optional window_id
                                    let window_id: u32 = parts
                                        .iter()
                                        .find(|p| p.starts_with("window="))
                                        .and_then(|p| p.split('=').nth(1))
                                        .and_then(|v| v.parse().ok())
                                        .unwrap_or(0);

                                    // Write config string to RAM at 0x2000
                                    let config_bytes: Vec<u32> = config_str
                                        .chars()
                                        .map(|c| c as u32)
                                        .chain(std::iter::once(0))
                                        .collect();
                                    for (i, &b) in config_bytes.iter().enumerate() {
                                        if 0x2000 + i < vm.ram.len() {
                                            vm.ram[0x2000 + i] = b;
                                        }
                                    }

                                    // Set up registers and call HYPERVISOR
                                    vm.regs[10] = 0x2000; // config addr in r10
                                    vm.regs[11] = window_id; // window_id in r11
                                                             // Simulate HYPERVISOR opcode manually
                                    let addr = vm.regs[10] as usize;
                                    let config = {
                                        let mut s = String::new();
                                        let mut i = addr;
                                        while i < vm.ram.len() && vm.ram[i] != 0 {
                                            s.push((vm.ram[i] & 0xFF) as u8 as char);
                                            i += 1;
                                        }
                                        if s.is_empty() {
                                            None
                                        } else {
                                            Some(s)
                                        }
                                    };
                                    match config {
                                        Some(cfg) => {
                                            let has_arch = cfg.split_whitespace().any(|t| {
                                                t.to_lowercase().starts_with("arch=") && t.len() > 5
                                            });
                                            if !has_arch {
                                                response
                                                    .push_str("[error: missing arch= parameter]\n");
                                            } else {
                                                // Kill any existing QEMU first
                                                if let Some(ref mut bridge) = qemu_bridge {
                                                    let _ = bridge.kill();
                                                }
                                                qemu_bridge = None;
                                                qemu_active = false;

                                                let resolved_cfg =
                                                    resolve_qemu_pixel_paths(&cfg, &vm);
                                                match QemuBridge::spawn(&resolved_cfg) {
                                                    Ok(bridge) => {
                                                        canvas_buffer.fill(0);
                                                        scroll_offset = 0;
                                                        qemu_active = true;
                                                        qemu_bridge = Some(bridge);
                                                        vm.hypervisor_config = resolved_cfg;
                                                        vm.hypervisor_window_id = window_id;
                                                        vm.hypervisor_active = true;
                                                        response.push_str(&format!(
                                                            "[hypervisor: booted config='{}' window={} active={}]\n",
                                                            cfg, window_id, vm.hypervisor_active
                                                        ));
                                                    },
                                                    Err(e) => {
                                                        response
                                                            .push_str(&format!("[error: {}]\n", e));
                                                    },
                                                }
                                            }
                                        },
                                        None => {
                                            response.push_str("[error: empty config string]\n");
                                        },
                                    }
                                }
                            },
                            "hypervisor_kill" => {
                                // Kill running hypervisor
                                if vm.hypervisor_active || qemu_active {
                                    if let Some(ref mut bridge) = qemu_bridge {
                                        let _ = bridge.kill();
                                    }
                                    qemu_bridge = None;
                                    qemu_active = false;
                                    vm.hypervisor_active = false;
                                    vm.hypervisor_config.clear();
                                    vm.hypervisor_window_id = 0;
                                    response.push_str("[hypervisor: killed]\n");
                                } else {
                                    response.push_str("[hypervisor: not running]\n");
                                }
                            },
                            "hypervisor_input" => {
                                // Send key input to hypervisor
                                // Usage: hypervisor_input <text>
                                if parts.len() < 2 {
                                    response.push_str(
                                        "[error: hypervisor_input requires input string]\n",
                                    );
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
                                                response.push_str(&format!(
                                                    "[error sending input: {}]\n",
                                                    e
                                                ));
                                            },
                                        }
                                    } else {
                                        response.push_str("[error: hypervisor is not running]\n");
                                    }
                                }
                            },
                            "hypervisor_console" => {
                                // Read console output from hypervisor
                                // Usage: hypervisor_console [flush]
                                if qemu_bridge.is_some() {
                                    let mut output = String::new();
                                    if let Ok(mut buf) = HYPERVISOR_CONSOLE_BUF.lock() {
                                        for s in buf.iter() {
                                            output.push_str(s);
                                        }
                                        buf.clear();
                                    }
                                    if output.is_empty() {
                                        response.push_str("[hypervisor_console: empty]\n");
                                    } else {
                                        response.push_str(&output);
                                    }
                                } else {
                                    response.push_str("[error: hypervisor is not running]\n");
                                }
                            },
                            "riscv_run" => {
                                // Launch a RISC-V ELF on a background thread
                                // Usage: riscv_run [--user] <path>
                                let mut use_user_mode = false;
                                let mut path_idx = 1;
                                if let Some(arg) = parts.get(1) {
                                    if *arg == "--user" {
                                        use_user_mode = true;
                                        path_idx = 2;
                                    }
                                }

                                if let Some(elf_path) = parts.get(path_idx) {
                                    match std::fs::read(elf_path) {
                                        Ok(elf_data) => {
                                            // Kill any existing RISC-V VM first
                                            if riscv_handle.is_some() {
                                                riscv_handle = None;
                                                riscv_latest_frame = None;
                                            }
                                            let mut config = VmThreadConfig {
                                                mode: GuestMode::Elf(elf_data),
                                                ram_size: 8 * 1024 * 1024,
                                                ..Default::default()
                                            };
                                            if use_user_mode {
                                                config.initial_privilege =
                                                    Some(riscv::cpu::Privilege::User);
                                            }
                                            match spawn_vm_thread(config) {
                                                Ok(handle) => {
                                                    response.push_str(&format!(
                                                        "[riscv: launched {} (mode={})]\n",
                                                        elf_path,
                                                        if use_user_mode {
                                                            "User"
                                                        } else {
                                                            "Machine"
                                                        }
                                                    ));
                                                    // Drain initial console output
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
                                                    riscv_handle = Some(handle);
                                                },
                                                Err(e) => {
                                                    response.push_str(&format!(
                                                        "[riscv: spawn failed: {}]\n",
                                                        e
                                                    ));
                                                },
                                            }
                                        },
                                        Err(e) => {
                                            response.push_str(&format!(
                                                "[riscv: failed to read {}: {}]\n",
                                                elf_path, e
                                            ));
                                        },
                                    }
                                } else {
                                    response.push_str("[usage: riscv_run [--user] <elf_path>]\n");
                                }
                            },
                            "riscv_boot" => {
                                // Boot a Linux kernel from Memory Palace building metadata
                                // Usage: riscv_boot kernel=building:N [initrd=building:N] [ram=256] [bootargs=...]
                                if parts.len() < 2 {
                                    response.push_str("[usage: riscv_boot kernel=building:N [initrd=building:N] [ram=256] [bootargs=...]]\n");
                                } else {
                                    let mut kernel_data: Option<Vec<u8>> = None;
                                    let mut initrd_data: Option<Vec<u8>> = None;
                                    let mut ram_mb = 256u32;
                                    let mut bootargs = "console=ttyS0".to_string();

                                    for part in &parts[1..] {
                                        if let Some(building_str) =
                                            part.strip_prefix("kernel=building:")
                                        {
                                            if let Ok(bid) = building_str.parse::<u32>() {
                                                kernel_data =
                                                    crate::cli::extract_binary_bytes_from_building(
                                                        &vm, bid,
                                                    );
                                                if kernel_data.is_none() {
                                                    response.push_str(&format!(
                                                        "[error: kernel building {} not found]\n",
                                                        bid
                                                    ));
                                                }
                                            }
                                        } else if let Some(building_str) =
                                            part.strip_prefix("initrd=building:")
                                        {
                                            if let Ok(bid) = building_str.parse::<u32>() {
                                                initrd_data =
                                                    crate::cli::extract_binary_bytes_from_building(
                                                        &vm, bid,
                                                    );
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
                                        riscv_handle = None;
                                        riscv_latest_frame = None;
                                        let config = riscv::live::VmThreadConfig {
                                            mode: riscv::live::GuestMode::Linux {
                                                kernel,
                                                initrd: initrd_data,
                                                bootargs,
                                            },
                                            ram_size: (ram_mb as usize) * 1024 * 1024,
                                            ..Default::default()
                                        };
                                        match riscv::live::spawn_vm_thread(config) {
                                            Ok(h) => {
                                                riscv_handle = Some(h);
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
                                                response
                                                    .push_str(&format!("[riscv] Error: {}\n", e));
                                            },
                                        }
                                    } else {
                                        response.push_str("[error: kernel=building:N required]\n");
                                    }
                                }
                            },
                            "linux_boot" => {
                                // Boot a Linux kernel natively
                                // Usage: linux_boot kernel=<path> [initrd=<path>] [ram=<MB>] [bootargs="..."]
                                let mut kernel_path = String::new();
                                let mut initrd_path = None;
                                // 768MB default: see BIOS boot comment for rationale
                                let mut ram_mb = 768u32;
                                let mut bootargs =
                                    "earlycon=sbi keep_bootcon console=ttyS0 rdinit=/init nosmp loglevel=8".to_string();

                                // Find bootargs= first (consumes rest of line)
                                // to handle space-containing values like bootargs=earlycon=sbi console=ttyS0
                                if let Some(ba_start) =
                                    parts.iter().position(|p| p.starts_with("bootargs="))
                                {
                                    let ba_val = parts[ba_start]["bootargs=".len()..].to_string();
                                    let rest = parts[ba_start + 1..].join(" ");
                                    bootargs = if rest.is_empty() {
                                        ba_val
                                    } else {
                                        format!("{} {}", ba_val, rest)
                                    };
                                    // Strip surrounding quotes if present
                                    if bootargs.starts_with('"') && bootargs.ends_with('"') {
                                        bootargs = bootargs[1..bootargs.len() - 1].to_string();
                                    } else if bootargs.starts_with('"') {
                                        bootargs = bootargs[1..].to_string();
                                    }
                                }
                                for part in &parts[1..] {
                                    if part.starts_with("kernel=") {
                                        kernel_path = part["kernel=".len()..].to_string();
                                    } else if part.starts_with("initrd=") {
                                        initrd_path = Some(part["initrd=".len()..].to_string());
                                    } else if part.starts_with("ram=") {
                                        ram_mb = part["ram=".len()..].parse().unwrap_or(128);
                                    }
                                    // bootargs handled above
                                }

                                if kernel_path.is_empty() {
                                    response
                                        .push_str("[error: linux_boot requires kernel=<path>]\n");
                                } else {
                                    match std::fs::read(&kernel_path) {
                                        Ok(kernel_data) => {
                                            let initrd_data = if let Some(ref p) = initrd_path {
                                                std::fs::read(p).ok()
                                            } else {
                                                None
                                            };

                                            // Kill existing
                                            if riscv_handle.is_some() {
                                                eprintln!("[geos] Killing existing RISC-V VM for Linux boot");
                                                riscv_handle = None;
                                                riscv_latest_frame = None;
                                            }

                                            eprintln!("[geos] Spawning VM thread for Linux boot: kernel_len={}, ram={}MB", kernel_data.len(), ram_mb);
                                            let _ = std::io::stderr().flush();

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
                                                    response.push_str(&format!(
                                                        "[linux: booting kernel={} ram={}MB]\n",
                                                        kernel_path, ram_mb
                                                    ));
                                                },
                                                Err(e) => {
                                                    response.push_str(&format!("[error: {}]\n", e));
                                                },
                                            }
                                        },
                                        Err(e) => {
                                            response.push_str(&format!(
                                                "[error: could not read kernel {}: {}]\n",
                                                kernel_path, e
                                            ));
                                        },
                                    }
                                }
                            },
                            "riscv_kill" => {
                                // Kill the running RISC-V VM
                                if riscv_handle.is_some() {
                                    riscv_handle = None;
                                    riscv_latest_frame = None;
                                    response.push_str("[riscv: killed]\n");
                                } else {
                                    response.push_str("[riscv: not running]\n");
                                }
                            },
                            "riscv_input" => {
                                // Send text input to the RISC-V VM's UART
                                if parts.len() < 2 {
                                    response.push_str("[usage: riscv_input <text>]\n");
                                } else if let Some(ref handle) = riscv_handle {
                                    let text = parts[1..].join(" ");
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
                            "riscv_console" => {
                                // Read pending console output from the RISC-V VM
                                if let Some(ref handle) = riscv_handle {
                                    let mut total = 0;
                                    while let Ok(data) = handle.try_recv_console() {
                                        if let Ok(s) = String::from_utf8(data) {
                                            response.push_str(&s);
                                        }
                                        total += 1;
                                        if total > 100 {
                                            break;
                                        }
                                    }
                                    if response.is_empty() {
                                        response.push_str("[no pending console output]\n");
                                    }
                                } else {
                                    response.push_str("[no riscv VM running]\n");
                                }
                            },
                            "riscv_fb_dump" => {
                                // Dump the RISC-V framebuffer to a PNG file.
                                // Usage: riscv_fb_dump <path>
                                // Requests a snapshot from the VM thread and writes it as PNG.
                                if let Some(ref mut riscv) = riscv_handle {
                                    if let Some(path) = parts.get(1) {
                                        match riscv.snapshot() {
                                            Some(frame) => {
                                                // Convert 0xRRGGBBAA (guest format) to 0x00RRGGBB (encode_png format)
                                                let converted: Vec<u32> = frame
                                                    .pixels
                                                    .iter()
                                                    .map(|px| px >> 8) // shift right 8: drops alpha, R moves to bit 16
                                                    .collect();
                                                let png_bytes =
                                                    geometry_os::vision::encode_png(&converted);
                                                match std::fs::write(path, &png_bytes) {
                                                    Ok(_) => {
                                                        response.push_str(&format!(
                                                            "[riscv: framebuffer dumped to {} ({} bytes, {} instructions)]\n",
                                                            path, png_bytes.len(), frame.instructions
                                                        ));
                                                    },
                                                    Err(e) => {
                                                        response.push_str(&format!(
                                                            "[riscv: write error: {}]\n",
                                                            e
                                                        ));
                                                    },
                                                }
                                            },
                                            None => {
                                                response.push_str("[riscv: snapshot timeout (VM may not be running)]\n");
                                            },
                                        }
                                    } else {
                                        response.push_str("[usage: riscv_fb_dump <path.png>]\n");
                                    }
                                } else {
                                    response.push_str("[riscv: not running]\n");
                                }
                            },
                            // Phase 88: AI Vision Bridge socket commands
                            "screenshot_b64" => {
                                let b64 = geometry_os::vision::encode_png_base64(&vm.screen);
                                response.push_str(&b64);
                                response.push('\n');
                            },
                            "screenshot_annotated_b64" => {
                                // Screenshot with window bounding boxes and labels overlaid
                                let active: Vec<&crate::vm::Window> =
                                    vm.windows.iter().filter(|w| w.active).collect();
                                // Find focused window (highest z_order)
                                let max_z = active.iter().map(|w| w.z_order).max().unwrap_or(0);
                                let mut overlays: Vec<geometry_os::vision::WindowOverlay> =
                                    Vec::new();
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
                                    overlays.push(geometry_os::vision::WindowOverlay {
                                        id: w.id,
                                        x: w.x,
                                        y: w.y,
                                        w: w.w,
                                        h: w.h,
                                        title,
                                        focused: w.z_order == max_z,
                                    });
                                }
                                let b64 = geometry_os::vision::encode_png_annotated_base64(
                                    &vm.screen, &overlays,
                                );
                                response.push_str(&b64);
                                response.push('\n');
                            },
                            "canvas_checksum" => {
                                let hash = geometry_os::vision::canvas_checksum(&vm.screen);
                                response.push_str(&format!("{}\n", hash));
                            },
                            "canvas_diff" => {
                                // canvas_diff <checksum_hex>
                                let prev_str = parts.get(1).unwrap_or(&"");
                                let prev_hash =
                                    u32::from_str_radix(prev_str.trim_start_matches("0x"), 16)
                                        .unwrap_or(prev_str.parse::<u32>().unwrap_or(0));
                                let current_hash = geometry_os::vision::canvas_checksum(&vm.screen);
                                if current_hash == prev_hash {
                                    response.push_str("same\n");
                                } else {
                                    response.push_str(&format!("changed: {:08X}\n", current_hash));
                                }
                            },
                            "vision_describe" => {
                                // vision_describe [PROMPT]
                                // Screenshot + describe via local Ollama vision model.
                                // Closes the External Hermes -> Ollama gap in the AI chain.
                                let prompt = if parts.len() > 1 {
                                    parts[1..].join(" ")
                                } else {
                                    "Describe what you see on this screen. Be concise: layout, colors, text, any visual anomalies.".to_string()
                                };
                                let screen_b64 = geometry_os::vision::encode_png_base64(&vm.screen);
                                let system = "You are a vision model describing a 256x256 pixel terminal framebuffer from Geometry OS. Be concise and factual. Describe layout, visible text, colors, shapes, and any rendering issues.";
                                match geometry_os::hermes::call_ollama_vision(
                                    system,
                                    &prompt,
                                    &screen_b64,
                                ) {
                                    Some(desc) => {
                                        response.push_str(&desc);
                                        response.push('\n');
                                    },
                                    None => {
                                        response.push_str("error: vision model unavailable\n");
                                    },
                                }
                            },
                            // ── Phase 89: AI Input Injection Socket Commands ──
                            "inject_key" => {
                                // inject_key <keycode> [shift]
                                // Injects a key event: to RISC-V guest if running, else GeOS VM
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
                                    if let Some(ref riscv) = riscv_handle {
                                        riscv.send_input(keycode as u8);
                                        response.push_str("ok\n");
                                    } else {
                                        let ok = vm.push_key(keycode);
                                        response.push_str(if ok {
                                            "ok\n"
                                        } else {
                                            "buffer_full\n"
                                        });
                                    }
                                } else {
                                    response.push_str("[usage: inject_key <keycode>]\n");
                                }
                            },
                            "inject_mouse" => {
                                // inject_mouse <action> <x> <y> [button]
                                // action: move, click
                                let action = parts.get(1).copied().unwrap_or("");
                                if let (Some(x_str), Some(y_str)) = (parts.get(2), parts.get(3)) {
                                    let x = x_str.parse::<u32>().unwrap_or(0);
                                    let y = y_str.parse::<u32>().unwrap_or(0);
                                    match action {
                                        "move" => {
                                            vm.push_mouse(x, y);
                                            response.push_str("ok\n");
                                        },
                                        "click" => {
                                            let button = parts
                                                .get(4)
                                                .and_then(|s| s.parse::<u32>().ok())
                                                .unwrap_or(2); // default: left click
                                            vm.push_mouse(x, y);
                                            vm.push_mouse_button(button);
                                            response.push_str("ok\n");
                                        },
                                        _ => {
                                            response.push_str("[usage: inject_mouse <move|click> <x> <y> [button]]\n");
                                        },
                                    }
                                } else {
                                    response.push_str(
                                        "[usage: inject_mouse <move|click> <x> <y> [button]]\n",
                                    );
                                }
                            },
                            "inject_text" => {
                                // inject_text <text>
                                // When a RISC-V program is running, sends characters to the
                                // guest UART exclusively. Otherwise sends to GeOS VM key buffer.
                                // In desktop mode (focused_pid==0), auto-activates TYPE mode
                                // by injecting '/' if CMD_MODE (RAM[0x7830]) is 0, then appends
                                // Enter after the text so the command executes immediately.
                                if line.len() > 12 {
                                    let text = &line[12..]; // skip "inject_text "
                                    let mut count = 0u32;
                                    if vm.focused_pid == 0 && riscv_handle.is_none() {
                                        // Desktop mode: check CMD_MODE at RAM[0x7830]
                                        let cmd_mode = vm.ram.get(0x7830).copied().unwrap_or(0);
                                        if cmd_mode == 0 {
                                            // Enter TYPE mode first
                                            if vm.push_key('/' as u32) {
                                                count += 1;
                                            }
                                        }
                                    }
                                    for ch in text.chars() {
                                        if let Some(ref riscv) = riscv_handle {
                                            riscv.send_input(ch as u8);
                                        } else {
                                            if !vm.push_key(ch as u32) {
                                                break;
                                            }
                                        }
                                        count += 1;
                                    }
                                    // Auto-execute in desktop TYPE mode
                                    if vm.focused_pid == 0 && riscv_handle.is_none() {
                                        if vm.push_key(13) {
                                            count += 1;
                                        }
                                    }
                                    response.push_str(&format!("injected {} chars\n", count));
                                } else {
                                    response.push_str("[usage: inject_text <text>]\n");
                                }
                            },
                            // ── Phase 106: Window Management Socket Commands ──────
                            "window_list" => {
                                // List all active WINSYS windows as JSON array
                                let active: Vec<&crate::vm::Window> =
                                    vm.windows.iter().filter(|w| w.active).collect();
                                let mut windows = Vec::new();
                                for w in &active {
                                    // Read title from RAM
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
                                        "{{\"id\":{},\"title\":\"{}\",\"pid\":{},\"x\":{},\"y\":{},\"w\":{},\"h\":{},\"z_order\":{}}}",
                                        w.id, title, w.pid, w.x, w.y, w.w, w.h, w.z_order
                                    ));
                                }
                                response.push_str(&format!("[{}]\n", windows.join(",")));
                            },
                            "window_move" => {
                                // window_move <id> <x> <y>
                                if let (Some(id_str), Some(x_str), Some(y_str)) =
                                    (parts.get(1), parts.get(2), parts.get(3))
                                {
                                    let win_id = id_str.parse::<u32>().unwrap_or(0);
                                    let new_x = x_str.parse::<u32>().unwrap_or(0);
                                    let new_y = y_str.parse::<u32>().unwrap_or(0);
                                    if let Some(w) =
                                        vm.windows.iter_mut().find(|w| w.id == win_id && w.active)
                                    {
                                        w.x = new_x;
                                        w.y = new_y;
                                        response.push_str(&format!(
                                            "ok {}->{},{}\n",
                                            win_id, new_x, new_y
                                        ));
                                    } else {
                                        response
                                            .push_str(&format!("[window {} not found]\n", win_id));
                                    }
                                } else {
                                    response.push_str("[usage: window_move <id> <x> <y>]\n");
                                }
                            },
                            "window_close" => {
                                // window_close <id>
                                if let Some(id_str) = parts.get(1) {
                                    let win_id = id_str.parse::<u32>().unwrap_or(0);
                                    if let Some(w) =
                                        vm.windows.iter_mut().find(|w| w.id == win_id && w.active)
                                    {
                                        w.active = false;
                                        response.push_str(&format!("ok closed {}\n", win_id));
                                    } else {
                                        response
                                            .push_str(&format!("[window {} not found]\n", win_id));
                                    }
                                } else {
                                    response.push_str("[usage: window_close <id>]\n");
                                }
                            },
                            "window_focus" => {
                                // window_focus <id> -- bring to front and focus
                                if let Some(id_str) = parts.get(1) {
                                    let win_id = id_str.parse::<u32>().unwrap_or(0);
                                    let max_z =
                                        vm.windows.iter().map(|w| w.z_order).max().unwrap_or(0);
                                    if let Some(w) =
                                        vm.windows.iter_mut().find(|w| w.id == win_id && w.active)
                                    {
                                        w.z_order = max_z + 1;
                                        vm.focused_pid = w.pid;
                                        response.push_str(&format!(
                                            "ok focus {} z={} pid={}\n",
                                            win_id,
                                            max_z + 1,
                                            w.pid
                                        ));
                                    } else {
                                        response
                                            .push_str(&format!("[window {} not found]\n", win_id));
                                    }
                                } else {
                                    response.push_str("[usage: window_focus <id>]\n");
                                }
                            },
                            "window_resize" => {
                                // window_resize <id> <w> <h>
                                if let (Some(id_str), Some(w_str), Some(h_str)) =
                                    (parts.get(1), parts.get(2), parts.get(3))
                                {
                                    let win_id = id_str.parse::<u32>().unwrap_or(0);
                                    let new_w = w_str.parse::<u32>().unwrap_or(0);
                                    let new_h = h_str.parse::<u32>().unwrap_or(0);
                                    if new_w == 0 || new_h == 0 || new_w > 512 || new_h > 512 {
                                        response.push_str("[error: invalid size (1-512)]\n");
                                    } else if let Some(w) =
                                        vm.windows.iter_mut().find(|w| w.id == win_id && w.active)
                                    {
                                        w.w = new_w;
                                        w.h = new_h;
                                        w.offscreen_buffer
                                            .resize((new_w as usize) * (new_h as usize), 0);
                                        response.push_str(&format!(
                                            "ok resize {} {}x{}\n",
                                            win_id, new_w, new_h
                                        ));
                                    } else {
                                        response
                                            .push_str(&format!("[window {} not found]\n", win_id));
                                    }
                                } else {
                                    response.push_str("[usage: window_resize <id> <w> <h>]\n");
                                }
                            },
                            "process_kill" => {
                                // process_kill <pid> -- destroy all windows for a PID
                                if let Some(pid_str) = parts.get(1) {
                                    let pid = pid_str.parse::<u32>().unwrap_or(0);
                                    let mut count = 0u32;
                                    for w in vm.windows.iter_mut() {
                                        if w.pid == pid && w.active {
                                            w.active = false;
                                            count += 1;
                                        }
                                    }
                                    response.push_str(&format!(
                                        "ok killed {} windows for pid {}\n",
                                        count, pid
                                    ));
                                } else {
                                    response.push_str("[usage: process_kill <pid>]\n");
                                }
                            },
                            "desktop_vision" => {
                                // Return structured JSON: windows array, focused_window, ascii_desktop
                                let active: Vec<&crate::vm::Window> =
                                    vm.windows.iter().filter(|w| w.active).collect();

                                // Read titles from RAM
                                let mut win_data: Vec<(u32, u32, u32, u32, u32, u32, u32, String)> =
                                    Vec::new();
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
                                    win_data
                                        .push((w.id, w.x, w.y, w.w, w.h, w.z_order, w.pid, title));
                                }

                                // Find focused window (highest z_order)
                                let mut max_z: u32 = 0;
                                let mut focused_idx: usize = 0;
                                for (i, (_, _, _, _, _, z, _, _)) in win_data.iter().enumerate() {
                                    if *z > max_z {
                                        max_z = *z;
                                        focused_idx = i;
                                    }
                                }
                                if win_data.is_empty() {
                                    continue;
                                }
                                let fw = &win_data[focused_idx];

                                // Build ASCII overlay (32x32 grid mapping 256x256 screen)
                                // Each char represents an 8x8 pixel block
                                let mut grid = [['.'; 32]; 32];
                                for w in &active {
                                    let x0 = (w.x / 8) as usize;
                                    let y0 = (w.y / 8) as usize;
                                    let x1 = ((w.x + w.w).min(256) / 8) as usize;
                                    let y1 = ((w.y + w.h).min(256) / 8) as usize;
                                    for gy in y0.min(32)..y1.min(32) {
                                        for gx in x0.min(32)..x1.min(32) {
                                            if gy == y0 && gx == x0 {
                                                grid[gy][gx] = '\u{250C}';
                                            } else if gy == y0 && gx + 1 >= x1 {
                                                grid[gy][gx] = '\u{2510}';
                                            } else if gy + 1 >= y1 && gx == x0 {
                                                grid[gy][gx] = '\u{2514}';
                                            } else if gy + 1 >= y1 && gx + 1 >= x1 {
                                                grid[gy][gx] = '\u{2518}';
                                            } else if gy == y0 || gy + 1 >= y1 {
                                                grid[gy][gx] = '\u{2500}';
                                            } else if gx == x0 || gx + 1 >= x1 {
                                                grid[gy][gx] = '\u{2502}';
                                            } else {
                                                let digit = (w.id % 10) as u8;
                                                grid[gy][gx] = (b'0' + digit) as char;
                                            }
                                        }
                                    }
                                }
                                let mut ascii = String::new();
                                for row in &grid {
                                    let line: String = row.iter().collect();
                                    ascii.push_str(&line);
                                    ascii.push('\n');
                                }

                                // Escape title/ascii for JSON
                                let esc = |s: &str| -> String {
                                    s.replace('\\', "\\\\")
                                        .replace('"', "\\\"")
                                        .replace('\n', "\\n")
                                };

                                // Build JSON response
                                let mut wins_json = Vec::new();
                                for (id, x, y, w, h, z, pid, title) in &win_data {
                                    wins_json.push(format!(
                                        "{{\"id\":{},\"x\":{},\"y\":{},\"w\":{},\"h\":{},\"z_order\":{},\"pid\":{},\"title\":\"{}\"}}",
                                        id, x, y, w, h, z, pid, esc(title)
                                    ));
                                }
                                let focused_json = format!(
                                    "{{\"id\":{},\"x\":{},\"y\":{},\"w\":{},\"h\":{},\"z_order\":{},\"pid\":{},\"title\":\"{}\"}}",
                                    fw.0, fw.1, fw.2, fw.3, fw.4, fw.5, fw.6, esc(&fw.7)
                                );
                                response.push_str(&format!(
                                    "{{\"windows\":[{}],\"focused_window\":{},\"ascii_desktop\":\"{}\"}}\n",
                                    wins_json.join(","),
                                    focused_json,
                                    esc(&ascii)
                                ));
                            },
                            "clipboard" => {
                                // clipboard [get|set <text>] -- read/write internal clipboard
                                let subcmd = parts.get(1).copied().unwrap_or("get");
                                match subcmd {
                                    "get" => {
                                        response.push_str(&format!("{}\n", clipboard));
                                    },
                                    "set" => {
                                        if let Some(text) = line.strip_prefix("clipboard set ") {
                                            clipboard = text.to_string();
                                            response.push_str(&format!(
                                                "ok {} chars\n",
                                                clipboard.len()
                                            ));
                                        } else {
                                            response.push_str("[usage: clipboard set <text>]\n");
                                        }
                                    },
                                    _ => {
                                        response.push_str("[usage: clipboard [get|set <text>]]\n");
                                    },
                                }
                            },
                            "launcher" => {
                                let subcmd = parts.get(1).copied().unwrap_or("");
                                match subcmd {
                                    "close" => {
                                        if launcher_active {
                                            for i in 0..3 {
                                                let row_start = i * CANVAS_COLS;
                                                canvas_buffer[row_start..row_start + CANVAS_COLS]
                                                    .copy_from_slice(&launcher_saved_rows[i]);
                                            }
                                            launcher_active = false;
                                            launcher_input.clear();
                                            response.push_str("ok launcher closed\n");
                                        } else {
                                            response.push_str("ok launcher not active\n");
                                        }
                                    },
                                    "status" => {
                                        if launcher_active {
                                            response.push_str(&format!(
                                                "active input={}\n",
                                                launcher_input
                                            ));
                                        } else {
                                            response.push_str("inactive\n");
                                        }
                                    },
                                    "" => {
                                        if !launcher_active {
                                            launcher_active = true;
                                            launcher_input.clear();
                                            for i in 0..3 {
                                                let row_start = i * CANVAS_COLS;
                                                launcher_saved_rows[i].copy_from_slice(
                                                    &canvas_buffer
                                                        [row_start..row_start + CANVAS_COLS],
                                                );
                                            }
                                            response.push_str("ok launcher opened\n");
                                        } else {
                                            response.push_str("ok launcher already active\n");
                                        }
                                    },
                                    _ => {
                                        let cmd = line.strip_prefix("launcher ").unwrap_or(subcmd);
                                        if !launcher_active {
                                            launcher_active = true;
                                            for i in 0..3 {
                                                let row_start = i * CANVAS_COLS;
                                                launcher_saved_rows[i].copy_from_slice(
                                                    &canvas_buffer
                                                        [row_start..row_start + CANVAS_COLS],
                                                );
                                            }
                                        }
                                        launcher_input = cmd.to_string();
                                        response.push_str(&format!(
                                            "ok launcher opened with: {}\n",
                                            launcher_input
                                        ));
                                    },
                                }
                            },
                            // ── Phase 200: File Watcher ───────────────────────────
                            "watch" => {
                                // watch <path> -- watch an .asm file for changes
                                // On save: load -> assemble -> run automatically
                                if let Some(path) = parts.get(1) {
                                    let watch_path = std::path::PathBuf::from(path);
                                    if watch_path.exists() {
                                        let mtime = std::fs::metadata(&watch_path)
                                            .ok()
                                            .and_then(|m| m.modified().ok());
                                        watch_file = Some((watch_path.clone(), mtime));
                                        response.push_str(&format!(
                                            "[watching: {}]\n",
                                            watch_path.display()
                                        ));
                                        // Immediately load, assemble, and run
                                        if let Ok(source) = std::fs::read_to_string(&watch_path) {
                                            load_source_to_canvas(
                                                &mut canvas_buffer,
                                                &source,
                                                &mut cursor_row,
                                                &mut cursor_col,
                                            );
                                            canvas_assemble(
                                                &canvas_buffer,
                                                &mut vm,
                                                &mut canvas_assembled,
                                                &mut status_msg,
                                            );
                                            if canvas_assembled {
                                                vm.pc = CANVAS_BYTECODE_ADDR as u32;
                                                vm.halted = false;
                                                is_running = true;
                                                terminal_direct_mode = true;
                                                fullscreen_map = false;
                                            }
                                        }
                                    } else {
                                        response
                                            .push_str(&format!("[watch: {} not found]\n", path));
                                    }
                                } else {
                                    // Report current watch state
                                    if let Some((ref p, _)) = watch_file {
                                        response
                                            .push_str(&format!("[watching: {}]\n", p.display()));
                                    } else {
                                        response.push_str("[watch: no file being watched]\n");
                                    }
                                }
                            },
                            "unwatch" => {
                                watch_file = None;
                                response.push_str("[unwatched]\n");
                            },
                            "font" => {
                                // font [small|normal|medium] -- switch font mode (also resizes PTY)
                                let subcmd = parts.get(1).copied().unwrap_or("");
                                let new_mode = match subcmd {
                                    "small" | "s" => Some(FontMode::Small),
                                    "normal" | "n" => Some(FontMode::Normal),
                                    "medium" | "med" | "m" => Some(FontMode::Medium),
                                    "" => None, // just report current
                                    _ => None,
                                };
                                if let Some(nm) = new_mode {
                                    font_mode = nm;
                                    let vc = font_mode.vis_cols();
                                    let vr = font_mode.vis_rows();
                                    if cursor_col >= vc {
                                        cursor_col = vc - 1;
                                    }
                                    ensure_cursor_visible(
                                        &cursor_row,
                                        &mut scroll_offset,
                                        font_mode.vis_rows(),
                                    );
                                    // Resize PTY if active
                                    let pty_h = vm.ram.get(0x4E03).copied().unwrap_or(0xFFFFFFFF);
                                    if pty_h != 0xFFFFFFFF {
                                        vm.resize_pty_direct(pty_h as usize, vr as u16, vc as u16);
                                    }
                                }
                                response.push_str(&format!(
                                    "[font: {} {}×{}]\n",
                                    font_mode.name(),
                                    font_mode.vis_cols(),
                                    font_mode.vis_rows()
                                ));
                            },
                            "cursorstyle" | "cursor" => {
                                // Phase 162: cursorstyle [block|underline|bar] -- toggle cursor style
                                let subcmd = parts.get(1).copied().unwrap_or("");
                                match subcmd {
                                    "block" | "b" => cursor_style = render::CursorStyle::Block,
                                    "underline" | "u" => {
                                        cursor_style = render::CursorStyle::Underline
                                    },
                                    "bar" | "l" => cursor_style = render::CursorStyle::Bar,
                                    "" | "toggle" | "next" => cursor_style = cursor_style.next(),
                                    _ => {},
                                }
                                cursor_blink_on = true;
                                cursor_blink_timer = std::time::Instant::now();
                                response.push_str(&format!(
                                    "[cursor: {} (F12 to toggle)]\n",
                                    cursor_style.name()
                                ));
                            },
                            // ── Phase 201: Checkpointing Socket Commands ───────────
                            "checkpoint" => {
                                let desc = if line.len() > 11 {
                                    Some(line[11..].to_string())
                                } else {
                                    None
                                };
                                match vm.checkpoint_create(desc) {
                                    Ok((filename, _cp)) => {
                                        response.push_str(&format!("[checkpoint: {}]\n", filename));
                                    },
                                    Err(e) => {
                                        response.push_str(&format!("[checkpoint error: {}]\n", e));
                                    },
                                }
                            },
                            "restore_checkpoint" => {
                                if let Some(filename) = parts.get(1) {
                                    match vm.restore_checkpoint(filename) {
                                        Ok(_cp) => {
                                            response
                                                .push_str(&format!("[restored: {}]\n", filename));
                                            is_running = false;
                                        },
                                        Err(e) => {
                                            response.push_str(&format!("[restore error: {}]\n", e));
                                        },
                                    }
                                } else {
                                    response.push_str("[usage: restore_checkpoint <filename>]\n");
                                }
                            },
                            "list_checkpoints" => match vm.checkpoint_list() {
                                Ok(list) => {
                                    if list.is_empty() {
                                        response.push_str("[no checkpoints]\n");
                                    } else {
                                        for filename in list {
                                            response.push_str(&format!("{}\n", filename));
                                        }
                                    }
                                },
                                Err(e) => {
                                    response.push_str(&format!("[list error: {}]\n", e));
                                },
                            },
                            "delete_checkpoint" => {
                                if let Some(filename) = parts.get(1) {
                                    match vm.checkpoint_delete(filename) {
                                        Ok(()) => {
                                            response
                                                .push_str(&format!("[deleted: {}]\n", filename));
                                        },
                                        Err(e) => {
                                            response.push_str(&format!("[delete error: {}]\n", e));
                                        },
                                    }
                                } else {
                                    response.push_str("[usage: delete_checkpoint <filename>]\n");
                                }
                            },
                            "diff_checkpoints" => {
                                if let (Some(a), Some(b)) = (parts.get(1), parts.get(2)) {
                                    match vm.checkpoint_diff(a, b) {
                                        Ok(diff) => {
                                            response.push_str(&diff.to_string());
                                            response.push('\n');
                                        },
                                        Err(e) => {
                                            response.push_str(&format!("[diff error: {}]\n", e));
                                        },
                                    }
                                } else {
                                    response.push_str("[usage: diff_checkpoints <a> <b>]\n");
                                }
                            },
                            // -- Phase 202: Building Metadata --
                            "set_metadata" => {
                                if let (Some(building_id_str), Some(key), Some(value)) =
                                    (parts.get(1), parts.get(2), parts.get(3))
                                {
                                    if let Ok(building_id) = building_id_str.parse::<u32>() {
                                        let entry =
                                            vm.building_metadata.entry(building_id).or_default();
                                        entry.insert(key.to_string(), value.to_string());
                                        response.push_str(&format!(
                                            "[metadata set: building {} {} = {}]\n",
                                            building_id, key, value
                                        ));
                                    } else {
                                        response.push_str(&format!(
                                            "[error: invalid building_id: {}]\n",
                                            building_id_str
                                        ));
                                    }
                                } else {
                                    response.push_str(
                                        "[usage: set_metadata <building_id> <key> <value>]\n",
                                    );
                                }
                            },
                            "get_metadata" => {
                                if let Some(building_id_str) = parts.get(1) {
                                    if let Ok(building_id) = building_id_str.parse::<u32>() {
                                        if let Some(metadata) =
                                            vm.building_metadata.get(&building_id)
                                        {
                                            if let Some(key_filter) = parts.get(2) {
                                                if let Some(value) = metadata.get(*key_filter) {
                                                    response.push_str(&format!("{}\n", value));
                                                } else {
                                                    response.push_str(&format!(
                                                        "[key not found: {}]\n",
                                                        key_filter
                                                    ));
                                                }
                                            } else {
                                                for (k, v) in metadata {
                                                    response.push_str(&format!("{}: {}\n", k, v));
                                                }
                                            }
                                        } else {
                                            response.push_str("[no metadata]\n");
                                        }
                                    } else {
                                        response.push_str(&format!(
                                            "[error: invalid building_id: {}]\n",
                                            building_id_str
                                        ));
                                    }
                                } else {
                                    response
                                        .push_str("[usage: get_metadata <building_id> [key]]\n");
                                }
                            },
                            "search_metadata" => {
                                if let Some(query) = parts.get(1) {
                                    let mut matches = Vec::new();
                                    for (&building_id, metadata) in &vm.building_metadata {
                                        for (key, value) in metadata {
                                            let search_text = format!("{}:{}", key, value);
                                            if search_text
                                                .to_lowercase()
                                                .contains(&query.to_lowercase())
                                            {
                                                matches.push(building_id);
                                                break;
                                            }
                                        }
                                    }
                                    if matches.is_empty() {
                                        response.push_str("[no matches]\n");
                                    } else {
                                        for id in &matches {
                                            response.push_str(&format!("{}\n", id));
                                        }
                                    }
                                } else {
                                    response.push_str("[usage: search_metadata <query>]\n");
                                }
                            },
                            "set_coord_metadata" => {
                                if let (Some(x_str), Some(y_str), Some(key), Some(value)) =
                                    (parts.get(1), parts.get(2), parts.get(3), parts.get(4))
                                {
                                    if let (Ok(x), Ok(y)) =
                                        (x_str.parse::<u32>(), y_str.parse::<u32>())
                                    {
                                        let coord_key = ((x as u64) << 32) | (y as u64);
                                        let entry =
                                            vm.coordinate_metadata.entry(coord_key).or_default();
                                        entry.insert(key.to_string(), value.to_string());
                                        response.push_str(&format!(
                                            "[coord_metadata set: ({}, {}) {} = {}]\n",
                                            x, y, key, value
                                        ));
                                    } else {
                                        response.push_str("[error: invalid coordinates]\n");
                                    }
                                } else {
                                    response.push_str(
                                        "[usage: set_coord_metadata <x> <y> <key> <value>]\n",
                                    );
                                }
                            },
                            "get_coord_metadata" => {
                                if let (Some(x_str), Some(y_str)) = (parts.get(1), parts.get(2)) {
                                    if let (Ok(x), Ok(y)) =
                                        (x_str.parse::<u32>(), y_str.parse::<u32>())
                                    {
                                        let coord_key = ((x as u64) << 32) | (y as u64);
                                        if let Some(metadata) =
                                            vm.coordinate_metadata.get(&coord_key)
                                        {
                                            if let Some(key_filter) = parts.get(3) {
                                                if let Some(value) = metadata.get(*key_filter) {
                                                    response.push_str(&format!("{}\n", value));
                                                } else {
                                                    response.push_str(&format!(
                                                        "[key not found: {}]\n",
                                                        key_filter
                                                    ));
                                                }
                                            } else {
                                                for (k, v) in metadata {
                                                    response.push_str(&format!("{}: {}\n", k, v));
                                                }
                                            }
                                        } else {
                                            response.push_str("[no metadata]\n");
                                        }
                                    } else {
                                        response.push_str("[error: invalid coordinates]\n");
                                    }
                                } else {
                                    response
                                        .push_str("[usage: get_coord_metadata <x> <y> [key]]\n");
                                }
                            },
                            // -- Phase 204: Navigation --
                            "navigate_to" => {
                                // Navigate to a building by ID or to coordinates
                                // Usage: navigate_to building:<id>
                                // Usage: navigate_to x:<x> y:<y>
                                let player_x = vm.ram[0x7808] as i32;
                                let player_y = vm.ram[0x7809] as i32;
                                let start =
                                    geometry_os::pathfinding::Point::new(player_x, player_y);

                                let target = if let Some(b_id_str) = parts.get(1) {
                                    let b_id = b_id_str
                                        .strip_prefix("building:")
                                        .and_then(|s| s.parse::<u32>().ok());
                                    if let Some(bid) = b_id {
                                        vm.buildings
                                            .iter()
                                            .find(|b| b.id == bid)
                                            .map(|b| geometry_os::pathfinding::Point::new(b.x, b.y))
                                    } else if b_id_str.starts_with("x:") {
                                        let x_str = b_id_str.strip_prefix("x:").unwrap();
                                        let y_str = parts
                                            .get(2)
                                            .and_then(|s| s.strip_prefix("y:"))
                                            .unwrap_or("");
                                        match (x_str.parse::<i32>().ok(), y_str.parse::<i32>().ok())
                                        {
                                            (Some(x), Some(y)) => {
                                                Some(geometry_os::pathfinding::Point::new(x, y))
                                            },
                                            _ => None,
                                        }
                                    } else {
                                        None
                                    }
                                } else {
                                    None
                                };

                                match target {
                                    Some(goal) => {
                                        let result = geometry_os::pathfinding::astar(start, goal);
                                        if result.found {
                                            response.push_str(&format!(
                                                "[path found: {} waypoints, {} distance]\n",
                                                result.waypoints.len(),
                                                result.total_distance
                                            ));
                                            for (i, inst) in result.instructions.iter().enumerate()
                                            {
                                                response.push_str(&format!(
                                                    "{}. {}\n",
                                                    i + 1,
                                                    inst
                                                ));
                                            }
                                            // ── Audio hints ──
                                            if !result.instructions.is_empty() {
                                                audio::speak_navigation(&result.instructions);
                                                audio::play_navigation_waypoint_chime();
                                            }
                                            // ── Desktop notification ──
                                            audio::notify_navigation(
                                                "Navigation: Arrived",
                                                &format!("Reached destination at ({}, {}) — {} waypoints",
                                                    goal.x, goal.y, result.waypoints.len()),
                                            );
                                            audio::play_navigation_arrival_chime();
                                        } else {
                                            response.push_str("[no path found]\n");
                                            audio::notify_navigation(
                                                "Navigation: Failed",
                                                "No path found to destination",
                                            );
                                        }
                                    },
                                    None => {
                                        response.push_str("[usage: navigate_to building:<id> | navigate_to x:<x> y:<y>]\n");
                                    },
                                }
                            },
                            "explore" => {
                                // Start autonomous exploration from current position
                                // Usage: explore [max_steps=N] [max_radius=N] [max_buildings=N]
                                let player_x = vm.ram[0x7808] as i32;
                                let player_y = vm.ram[0x7809] as i32;
                                let spawn =
                                    geometry_os::pathfinding::Point::new(player_x, player_y);

                                let mut max_steps = 10000usize;
                                let mut max_radius = 100i32;
                                let mut max_buildings = 20usize;

                                for arg in parts.iter().skip(1) {
                                    if let Some(n) =
                                        arg.strip_prefix("max_steps=").and_then(|s| s.parse().ok())
                                    {
                                        max_steps = n;
                                    } else if let Some(n) =
                                        arg.strip_prefix("max_radius=").and_then(|s| s.parse().ok())
                                    {
                                        max_radius = n;
                                    } else if let Some(n) = arg
                                        .strip_prefix("max_buildings=")
                                        .and_then(|s| s.parse().ok())
                                    {
                                        max_buildings = n;
                                    }
                                }

                                let constraints =
                                    geometry_os::exploration::ExplorationConstraints {
                                        max_steps: Some(max_steps),
                                        max_radius: Some(max_radius),
                                        max_buildings: Some(max_buildings),
                                        spawn_point: spawn,
                                    };

                                let mut frontier =
                                    geometry_os::exploration::ExplorationFrontier::new(spawn);

                                // Building detector: check each coordinate against VM building list
                                let buildings_clone = vm.buildings.clone();
                                let detector = move |p: geometry_os::pathfinding::Point| -> Option<
                                    geometry_os::exploration::DiscoveredBuilding,
                                > {
                                    for b in &buildings_clone {
                                        if b.x == p.x && b.y == p.y {
                                            return Some(
                                                geometry_os::exploration::DiscoveredBuilding {
                                                    building_id: b.id,
                                                    x: b.x,
                                                    y: b.y,
                                                    name: b.name.clone(),
                                                    discovered_at_step: 0,
                                                },
                                            );
                                        }
                                    }
                                    None
                                };

                                let log = frontier.explore(constraints, detector);
                                response.push_str(&format!(
                                    "[exploration complete: {} buildings, {} tiles, {} steps]\n",
                                    log.discovered_buildings.len(),
                                    log.tiles_visited,
                                    log.steps_taken
                                ));
                                for b in &log.discovered_buildings {
                                    response.push_str(&format!(
                                        "  building {}: {} at ({}, {})\n",
                                        b.building_id, b.name, b.x, b.y
                                    ));
                                }
                                response.push_str(&format!(
                                    "  final position: ({}, {})\n",
                                    log.final_position.x, log.final_position.y
                                ));
                            },
                            "set_nav_path" => {
                                // Set a navigation path for visual overlay
                                // Usage: set_nav_path [building:<id>|x:<x> y:<y>|clear]
                                if let Some(arg) = parts.get(1) {
                                    if arg == &"clear".to_string() {
                                        vm.nav_path.clear();
                                        response.push_str("[nav path cleared]\n");
                                    } else if let Some(b_id) = arg
                                        .strip_prefix("building:")
                                        .and_then(|s| s.parse::<u32>().ok())
                                    {
                                        if let Some(target) =
                                            vm.buildings.iter().find(|b| b.id == b_id)
                                        {
                                            let px = vm.ram[0x7808] as i32;
                                            let py = vm.ram[0x7809] as i32;
                                            let start =
                                                geometry_os::pathfinding::Point::new(px, py);
                                            let goal = geometry_os::pathfinding::Point::new(
                                                target.x, target.y,
                                            );
                                            let result =
                                                geometry_os::pathfinding::astar(start, goal);
                                            if result.found {
                                                vm.nav_path = result
                                                    .waypoints
                                                    .iter()
                                                    .map(|p| (p.x, p.y))
                                                    .collect();
                                                response.push_str(&format!(
                                                    "[nav path set: {} waypoints]\n",
                                                    vm.nav_path.len()
                                                ));
                                            } else {
                                                response.push_str("[nav path: no path found]\n");
                                            }
                                        } else {
                                            response.push_str("[nav path: building not found]\n");
                                        }
                                    } else {
                                        response.push_str("[usage: set_nav_path building:<id> | set_nav_path clear]\n");
                                    }
                                } else {
                                    response.push_str("[usage: set_nav_path building:<id> | set_nav_path clear]\n");
                                }
                            },
                            // -- Phase 203: Export/Import --
                            "export_memory_palace" => {
                                let include_canvas =
                                    parts.get(1).map(|s| *s == "--canvas").unwrap_or(false);
                                match export::export_with_timestamp(&vm, include_canvas) {
                                    Ok(path) => {
                                        response
                                            .push_str(&format!("[exported: {}]\n", path.display()));
                                        if include_canvas {
                                            // Also save canvas as PNG
                                            let canvas_path = path.with_extension("png");
                                            if save::save_full_buffer_png(
                                                canvas_path.to_str().unwrap(),
                                                &vm.screen,
                                                256,
                                                256,
                                            )
                                            .is_ok()
                                            {
                                                response.push_str(&format!(
                                                    "[canvas saved: {}]\n",
                                                    canvas_path.display()
                                                ));
                                            }
                                        }
                                    },
                                    Err(e) => {
                                        response.push_str(&format!("[error: {}]\n", e));
                                    },
                                }
                            },
                            "import_memory_palace" => {
                                let strategy = if let Some(mode) = parts.get(1) {
                                    match mode.as_ref() {
                                        "preserve" => export::MergeStrategy::PreserveExisting,
                                        "rename" => export::MergeStrategy::RenameOnConflict,
                                        "overwrite" => export::MergeStrategy::Overwrite,
                                        _ => {
                                            response.push_str("[usage: import_memory_palace <path> [preserve|rename|overwrite]]\n");
                                            continue;
                                        },
                                    }
                                } else {
                                    export::MergeStrategy::PreserveExisting
                                };

                                if let Some(path) = parts.get(if parts.len() > 2 { 2 } else { 1 }) {
                                    match export::import_from_file(&mut vm, path, strategy) {
                                        Ok(()) => {
                                            response.push_str(&format!("[imported: {}]\n", path));
                                        },
                                        Err(e) => {
                                            response.push_str(&format!("[error: {}]\n", e));
                                        },
                                    }
                                } else {
                                    response.push_str("[usage: import_memory_palace <path> [preserve|rename|overwrite]]\n");
                                }
                            },
                            "import_canvas" => {
                                let mode = if let Some(mode_str) = parts.get(1) {
                                    match mode_str.as_ref() {
                                        "merge" => export::ImportMode::Merge,
                                        "replace" => export::ImportMode::Replace,
                                        _ => {
                                            response.push_str(
                                                "[usage: import_canvas <path> [merge|replace]]\n",
                                            );
                                            continue;
                                        },
                                    }
                                } else {
                                    export::ImportMode::Merge
                                };

                                if let Some(path) = parts.get(if parts.len() > 2 { 2 } else { 1 }) {
                                    match export::import_canvas_from_png(&mut vm, path, mode) {
                                        Ok(()) => {
                                            response.push_str(&format!(
                                                "[canvas imported: {} ({:?})]\n",
                                                path, mode
                                            ));
                                        },
                                        Err(e) => {
                                            response.push_str(&format!("[error: {}]\n", e));
                                        },
                                    }
                                } else {
                                    response.push_str(
                                        "[usage: import_canvas <path> [merge|replace]]\n",
                                    );
                                }
                            },
                            // -- Phase 203+: Binary Memory Palace Extension --
                            "import_binary" => {
                                if parts.len() >= 3 {
                                    let file_path = parts[1];
                                    let building_id: u32 = match parts[2].parse() {
                                        Ok(id) => id,
                                        Err(_) => {
                                            response.push_str("[error: invalid building_id]\n");
                                            continue;
                                        },
                                    };
                                    let format = parts.get(3).copied().unwrap_or("raw");
                                    let encoding = parts.get(4).copied().unwrap_or("base64");

                                    match encoding::BinaryMetadata::from_file(
                                        std::path::Path::new(file_path),
                                        format,
                                        encoding,
                                    ) {
                                        Ok(metadata) => {
                                            let metadata_json = serde_json::to_string(&metadata)
                                                .unwrap_or_else(|e| format!("[json error: {}]", e));

                                            // Store in building metadata via coordinate metadata system
                                            // Use coordinate (building_id, 0) as default storage location
                                            let coord_key = ((building_id as u64) << 16) | 0;
                                            if vm.coordinate_metadata.contains_key(&coord_key) {
                                                vm.coordinate_metadata
                                                    .get_mut(&coord_key)
                                                    .unwrap()
                                                    .insert(
                                                        "binary_data".to_string(),
                                                        metadata_json,
                                                    );
                                            } else {
                                                let mut coord_meta =
                                                    std::collections::HashMap::new();
                                                coord_meta.insert(
                                                    "binary_data".to_string(),
                                                    metadata_json,
                                                );
                                                vm.coordinate_metadata
                                                    .insert(coord_key, coord_meta);
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
                                    response.push_str("[usage: import_binary <path> <building_id> [format] [encoding]]\n");
                                }
                            },
                            "export_binary" => {
                                if parts.len() >= 3 {
                                    let building_id: u32 = match parts[1].parse() {
                                        Ok(id) => id,
                                        Err(_) => {
                                            response.push_str("[error: invalid building_id]\n");
                                            continue;
                                        },
                                    };
                                    let output_path = parts[2];
                                    let building_addr = 0x7500 + building_id as usize;
                                    if building_addr + 2 < vm.ram.len() {
                                        let building_coord_word = vm.ram[building_addr];
                                        let bx = (building_coord_word >> 16) & 0xFFFF;
                                        let by = building_coord_word & 0xFFFF;
                                        let coord_key = ((bx as u64) << 16) | by as u64;
                                        if let Some(coord_metadata) =
                                            vm.coordinate_metadata.get(&coord_key)
                                        {
                                            if let Some(binary_json) =
                                                coord_metadata.get("binary_data")
                                            {
                                                if let Ok(metadata) = serde_json::from_str::<
                                                    encoding::BinaryMetadata,
                                                >(
                                                    binary_json
                                                ) {
                                                    match metadata.to_binary() {
                                                        Ok(binary_data) => {
                                                            match std::fs::write(
                                                                output_path,
                                                                &binary_data,
                                                            ) {
                                                                Ok(_) => {
                                                                    response.push_str(&format!(
                                                                        "[exported: building {} -> {} ({} bytes)]\n",
                                                                        building_id, output_path, binary_data.len()
                                                                    ));
                                                                },
                                                                Err(e) => {
                                                                    response.push_str(&format!("[error: write failed: {}]\n", e));
                                                                },
                                                            }
                                                        },
                                                        Err(e) => {
                                                            response.push_str(&format!(
                                                                "[error: decode failed: {}]\n",
                                                                e
                                                            ));
                                                        },
                                                    }
                                                } else {
                                                    response.push_str(
                                                        "[error: invalid binary metadata JSON]\n",
                                                    );
                                                }
                                            } else {
                                                response.push_str("[no binary data at building]\n");
                                            }
                                        } else {
                                            response.push_str("[building not found]\n");
                                        }
                                    } else {
                                        response.push_str("[building_id out of range]\n");
                                    }
                                } else {
                                    response.push_str(
                                        "[usage: export_binary <building_id> <output_path>]\n",
                                    );
                                }
                            },
                            "binary_inject" => {
                                if parts.len() >= 3 {
                                    let building_id: u32 = match parts[1].parse() {
                                        Ok(id) => id,
                                        Err(_) => {
                                            response.push_str("[error: invalid building_id]\n");
                                            continue;
                                        },
                                    };
                                    let ram_addr_str = parts[2];
                                    let ram_addr: usize = if ram_addr_str.starts_with("0x")
                                        || ram_addr_str.starts_with("0X")
                                    {
                                        usize::from_str_radix(&ram_addr_str[2..], 16).unwrap_or(0)
                                    } else {
                                        ram_addr_str.parse().unwrap_or(0)
                                    };

                                    // Look for binary metadata in building coordinate
                                    let building_addr = 0x7500 + building_id as usize;
                                    if building_addr + 2 < vm.ram.len() {
                                        let building_coord_word = vm.ram[building_addr];
                                        let bx = (building_coord_word >> 16) & 0xFFFF;
                                        let by = building_coord_word & 0xFFFF;
                                        let coord_key = ((bx as u64) << 16) | by as u64;

                                        if let Some(coord_metadata) =
                                            vm.coordinate_metadata.get(&coord_key)
                                        {
                                            if let Some(binary_json) =
                                                coord_metadata.get("binary_data")
                                            {
                                                if let Ok(metadata) = serde_json::from_str::<
                                                    encoding::BinaryMetadata,
                                                >(
                                                    binary_json
                                                ) {
                                                    match metadata.to_binary() {
                                                        Ok(binary_data) => {
                                                            match metadata.inject_to_ram(
                                                                &mut vm.ram,
                                                                ram_addr,
                                                            ) {
                                                                Ok(_) => {
                                                                    response.push_str(&format!(
                                                                        "[injected: building {} -> RAM 0x{:X} ({} words)]\n",
                                                                        building_id, ram_addr, binary_data.len() / 4
                                                                    ));
                                                                },
                                                                Err(e) => {
                                                                    response.push_str(&format!("[error: inject failed: {}]\n", e));
                                                                },
                                                            }
                                                        },
                                                        Err(e) => {
                                                            response.push_str(&format!(
                                                                "[error: decode failed: {}]\n",
                                                                e
                                                            ));
                                                        },
                                                    }
                                                } else {
                                                    response
                                                        .push_str("[no binary data at building]\n");
                                                }
                                            } else {
                                                response.push_str(
                                                    "[building not found or no metadata]\n",
                                                );
                                            }
                                        } else {
                                            response.push_str("[building_id out of range]\n");
                                        }
                                    } else {
                                        response.push_str(
                                            "[usage: binary_inject <building_id> <ram_addr>]\n",
                                        );
                                    }
                                }
                            },
                            "coord_set_binary" => {
                                if parts.len() >= 4 {
                                    let x: u32 = match parts[1].parse() {
                                        Ok(v) => v,
                                        Err(_) => {
                                            response.push_str("[error: invalid x]\n");
                                            continue;
                                        },
                                    };
                                    let y: u32 = match parts[2].parse() {
                                        Ok(v) => v,
                                        Err(_) => {
                                            response.push_str("[error: invalid y]\n");
                                            continue;
                                        },
                                    };
                                    let format = parts[3];
                                    let file_path = parts.get(4).copied().unwrap_or("");

                                    if file_path.is_empty() {
                                        response.push_str("[error: file path required]\n");
                                        continue;
                                    }

                                    match encoding::BinaryMetadata::from_file(
                                        std::path::Path::new(file_path),
                                        format,
                                        "base64",
                                    ) {
                                        Ok(metadata) => {
                                            let metadata_json = serde_json::to_string(&metadata)
                                                .unwrap_or_else(|e| format!("[json error: {}]", e));

                                            // Store as coordinate metadata
                                            if let Some(coord_metadata) = vm
                                                .coordinate_metadata
                                                .get_mut(&(((x as u64) << 16) | y as u64))
                                            {
                                                coord_metadata.insert(
                                                    "binary_data".to_string(),
                                                    metadata_json,
                                                );
                                            } else {
                                                let mut map = std::collections::HashMap::new();
                                                map.insert(
                                                    "binary_data".to_string(),
                                                    metadata_json,
                                                );
                                                vm.coordinate_metadata
                                                    .insert(((x as u64) << 16) | y as u64, map);
                                            }

                                            response.push_str(&format!(
                                                "[coord_set_binary: ({},{}) stored {} bytes, checksum {}]\n",
                                                x, y, metadata.size_bytes, metadata.checksum
                                            ));
                                        },
                                        Err(e) => {
                                            response.push_str(&format!("[error: {}]\n", e));
                                        },
                                    }
                                } else {
                                    response.push_str(
                                        "[usage: coord_set_binary <x> <y> <format> <file>]\n",
                                    );
                                }
                            },
                            "coord_get_binary" => {
                                if parts.len() >= 4 {
                                    let x: u32 = match parts[1].parse() {
                                        Ok(v) => v,
                                        Err(_) => {
                                            response.push_str("[error: invalid x]\n");
                                            continue;
                                        },
                                    };
                                    let y: u32 = match parts[2].parse() {
                                        Ok(v) => v,
                                        Err(_) => {
                                            response.push_str("[error: invalid y]\n");
                                            continue;
                                        },
                                    };
                                    let key = parts[3];

                                    if let Some(coord_metadata) =
                                        vm.coordinate_metadata.get(&(((x as u64) << 16) | y as u64))
                                    {
                                        if let Some(value) = coord_metadata.get(key) {
                                            response.push_str(&format!("{}\n", value));
                                        } else {
                                            response.push_str("[key not found]\n");
                                        }
                                    } else {
                                        response.push_str("[no metadata at coordinate]\n");
                                    }
                                } else {
                                    response.push_str("[usage: coord_get_binary <x> <y> <key>]\n");
                                }
                            },
                            // -- Phase 203+: Binary Chunk Management --
                            "binary_chunk_add" => {
                                // Usage: binary_chunk_add <building_id> <offset> <file>
                                if parts.len() >= 4 {
                                    let building_id: u32 = match parts[1].parse() {
                                        Ok(id) => id,
                                        Err(_) => {
                                            response.push_str("[error: invalid building_id]\n");
                                            continue;
                                        },
                                    };
                                    let offset: u64 = match parts[2].parse() {
                                        Ok(off) => off,
                                        Err(_) => {
                                            response.push_str("[error: invalid offset]\n");
                                            continue;
                                        },
                                    };
                                    let file_path = parts[3];

                                    // Get building coordinate from building table
                                    let building_addr = 0x7500 + building_id as usize;
                                    if building_addr >= vm.ram.len() {
                                        response.push_str("[error: building_id out of range]\n");
                                        continue;
                                    }

                                    let building_coord_word = vm.ram[building_addr];
                                    let bx = (building_coord_word >> 16) & 0xFFFF;
                                    let by = building_coord_word & 0xFFFF;
                                    let coord_key = ((bx as u64) << 16) | by as u64;

                                    match std::fs::read(file_path) {
                                        Ok(data) => {
                                            let encoded = encoding::binary_to_base64(&data);
                                            let chunk_info = format!(
                                                r#"{{"offset":{}, "length":{}, "data":"{}"}}"#,
                                                offset,
                                                data.len(),
                                                encoded
                                            );

                                            // Store chunk in building's coordinate metadata
                                            let chunks_key = "binary_chunks";
                                            if let Some(building_meta) =
                                                vm.coordinate_metadata.get_mut(&coord_key)
                                            {
                                                let chunks_list = building_meta
                                                    .get(chunks_key)
                                                    .cloned()
                                                    .unwrap_or_default();
                                                let mut chunks: Vec<String> =
                                                    serde_json::from_str(&chunks_list)
                                                        .unwrap_or_default();
                                                chunks.push(chunk_info);
                                                building_meta.insert(
                                                    chunks_key.to_string(),
                                                    serde_json::to_string(&chunks)
                                                        .unwrap_or_default(),
                                                );
                                            } else {
                                                let mut map = std::collections::HashMap::new();
                                                let chunks = vec![chunk_info];
                                                map.insert(
                                                    chunks_key.to_string(),
                                                    serde_json::to_string(&chunks)
                                                        .unwrap_or_default(),
                                                );
                                                vm.coordinate_metadata.insert(coord_key, map);
                                            }

                                            response.push_str(&format!(
                                                "[chunk_added: building {} offset {} length {}]\n",
                                                building_id,
                                                offset,
                                                data.len()
                                            ));
                                        },
                                        Err(e) => {
                                            response.push_str(&format!("[error: {}]\n", e));
                                        },
                                    }
                                } else {
                                    response.push_str(
                                        "[usage: binary_chunk_add <building_id> <offset> <file>]\n",
                                    );
                                }
                            },
                            "binary_chunk_list" => {
                                if parts.len() >= 2 {
                                    let building_id: u32 = match parts[1].parse() {
                                        Ok(id) => id,
                                        Err(_) => {
                                            response.push_str("[error: invalid building_id]\n");
                                            continue;
                                        },
                                    };

                                    // Get building coordinate from building table
                                    let building_addr = 0x7500 + building_id as usize;
                                    if building_addr >= vm.ram.len() {
                                        response.push_str("[error: building_id out of range]\n");
                                        continue;
                                    }

                                    let building_coord_word = vm.ram[building_addr];
                                    let bx = (building_coord_word >> 16) & 0xFFFF;
                                    let by = building_coord_word & 0xFFFF;
                                    let coord_key = ((bx as u64) << 16) | by as u64;

                                    if let Some(building_meta) =
                                        vm.coordinate_metadata.get(&coord_key)
                                    {
                                        if let Some(chunks_json) =
                                            building_meta.get("binary_chunks")
                                        {
                                            if let Ok(chunks) =
                                                serde_json::from_str::<Vec<serde_json::Value>>(
                                                    chunks_json,
                                                )
                                            {
                                                for chunk in &chunks {
                                                    response
                                                        .push_str(&format!("chunk: {}\n", chunk));
                                                }
                                                response.push_str(&format!(
                                                    "[{} chunks found]\n",
                                                    chunks.len()
                                                ));
                                            }
                                        } else {
                                            response.push_str("[no chunks for this building]\n");
                                        }
                                    } else {
                                        response.push_str("[building has no metadata]\n");
                                    }
                                } else {
                                    response.push_str("[usage: binary_chunk_list <building_id>]\n");
                                }
                            },
                            "riscv_boot" => {
                                // Boot a Linux kernel from Memory Palace building metadata
                                // Usage: riscv_boot kernel=building:N [initrd=building:N] [ram=256] [bootargs=...]
                                if parts.len() < 2 {
                                    response.push_str("[usage: riscv_boot kernel=building:N [initrd=building:N] [ram=256] [bootargs=...]]\n");
                                } else {
                                    let mut kernel_data: Option<Vec<u8>> = None;
                                    let mut initrd_data: Option<Vec<u8>> = None;
                                    let mut ram_mb = 256u32;
                                    let mut bootargs = "console=ttyS0".to_string();

                                    for part in &parts[1..] {
                                        if let Some(building_str) =
                                            part.strip_prefix("kernel=building:")
                                        {
                                            if let Ok(bid) = building_str.parse::<u32>() {
                                                kernel_data =
                                                    crate::cli::extract_binary_bytes_from_building(
                                                        &vm, bid,
                                                    );
                                                if kernel_data.is_none() {
                                                    response.push_str(&format!(
                                                        "[error: kernel building {} not found]\n",
                                                        bid
                                                    ));
                                                }
                                            }
                                        } else if let Some(building_str) =
                                            part.strip_prefix("initrd=building:")
                                        {
                                            if let Ok(bid) = building_str.parse::<u32>() {
                                                initrd_data =
                                                    crate::cli::extract_binary_bytes_from_building(
                                                        &vm, bid,
                                                    );
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
                                        // Kill any existing RISC-V VM first
                                        riscv_handle = None;
                                        riscv_latest_frame = None;
                                        let config = riscv::live::VmThreadConfig {
                                            mode: riscv::live::GuestMode::Linux {
                                                kernel,
                                                initrd: initrd_data,
                                                bootargs,
                                            },
                                            ram_size: (ram_mb as usize) * 1024 * 1024,
                                            ..Default::default()
                                        };
                                        match riscv::live::spawn_vm_thread(config) {
                                            Ok(h) => {
                                                riscv_handle = Some(h);
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
                                                response
                                                    .push_str(&format!("[riscv] Error: {}\n", e));
                                            },
                                        }
                                    } else {
                                        response.push_str("[error: kernel=building:N required]\n");
                                    }
                                }
                            },
                            "riscv_kill" => {
                                if riscv_handle.is_some() {
                                    riscv_handle = None;
                                    riscv_latest_frame = None;
                                    response.push_str("[riscv] Killed\n");
                                } else {
                                    response.push_str("[riscv] Not running\n");
                                }
                            },
                            "write_pixels" => {
                                if parts.len() < 3 {
                                    response.push_str(
                                        "[usage: write_pixels <offset> <rrggbb hex values...>]\n",
                                    );
                                } else {
                                    let offset: usize = match parts[1].parse() {
                                        Ok(v) => v,
                                        Err(_) => {
                                            response.push_str("[error: invalid offset]\n");
                                            continue;
                                        },
                                    };
                                    if offset >= vm.screen.len() {
                                        response.push_str(&format!(
                                            "[error: offset {} >= screen size {}]\n",
                                            offset,
                                            vm.screen.len()
                                        ));
                                        continue;
                                    }
                                    let mut count = 0usize;
                                    for (i, tok) in parts.iter().skip(2).enumerate() {
                                        let idx = offset + i;
                                        if idx >= vm.screen.len() {
                                            break;
                                        }
                                        let rgb =
                                            u32::from_str_radix(tok.trim_start_matches("0x"), 16)
                                                .unwrap_or(0);
                                        vm.screen[idx] = (rgb << 8) | 0xFF;
                                        count += 1;
                                    }
                                    response.push_str(&format!(
                                        "ok wrote {} pixels at offset {}\n",
                                        count, offset
                                    ));
                                }
                            },
                            _ => {
                                response.push_str(&format!("[unknown: {}]\n", line));
                            },
                        }
                    }
                }
                if !response.is_empty() {
                    let _ = stream.write_all(response.as_bytes());
                }
            }
        }

        // ── Process HTTP API requests (Phase 203) ───────────────
        if let Some(ref listener) = http_listener {
            while let Ok((mut stream, _)) = listener.accept() {
                use std::io::{Read, Write};
                let mut buf = [0u8; 8192];
                if let Ok(n) = stream.read(&mut buf) {
                    let request = String::from_utf8_lossy(&buf[..n]);
                    let lines: Vec<&str> = request.lines().collect();
                    if let Some(first_line) = lines.get(0) {
                        let parts: Vec<&str> = first_line.split_whitespace().collect();
                        if parts.len() >= 2 {
                            let method = parts[0];
                            let path = parts[1];

                            if method == "GET" && path == "/api/memory_palace/export" {
                                match export::export_memory_palace(&vm, false) {
                                    Ok(exp) => {
                                        if let Ok(json) = serde_json::to_string_pretty(&exp) {
                                            let response = format!(
                                                "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\nAccess-Control-Allow-Origin: *\r\nContent-Length: {}\r\n\r\n{}",
                                                json.len(),
                                                json
                                            );
                                            let _ = stream.write_all(response.as_bytes());
                                        }
                                    },
                                    Err(e) => {
                                        let res = format!(
                                            "HTTP/1.1 500 Internal Server Error\r\n\r\n{}",
                                            e
                                        );
                                        let _ = stream.write_all(res.as_bytes());
                                    },
                                }
                            } else if method == "POST" && path == "/api/memory_palace/import" {
                                // Basic body extraction (assuming small enough for one read)
                                if let Some(body_start) = request.find("\r\n\r\n") {
                                    let body = &request[body_start + 4..];
                                    if let Ok(exp) =
                                        serde_json::from_str::<export::MemoryPalaceExport>(body)
                                    {
                                        // Default to RenameOnConflict for safety over HTTP
                                        export::import_buildings(
                                            &mut vm,
                                            &exp.buildings,
                                            export::MergeStrategy::RenameOnConflict,
                                        );
                                        export::import_player(&mut vm, &exp.player);
                                        export::import_coordinate_metadata(
                                            &mut vm,
                                            &exp.coordinate_metadata,
                                        );

                                        let res = "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\nAccess-Control-Allow-Origin: *\r\n\r\n{\"status\":\"ok\"}";
                                        let _ = stream.write_all(res.as_bytes());
                                    } else {
                                        let res = "HTTP/1.1 400 Bad Request\r\n\r\nInvalid JSON";
                                        let _ = stream.write_all(res.as_bytes());
                                    }
                                }
                            } else if method == "OPTIONS" {
                                // Handle CORS preflight
                                let res = "HTTP/1.1 204 No Content\r\nAccess-Control-Allow-Origin: *\r\nAccess-Control-Allow-Methods: GET, POST, OPTIONS\r\nAccess-Control-Allow-Headers: Content-Type\r\n\r\n";
                                let _ = stream.write_all(res.as_bytes());
                            } else {
                                let res = "HTTP/1.1 404 Not Found\r\n\r\nNot Found";
                                let _ = stream.write_all(res.as_bytes());
                            }
                        }
                    }
                }
            }
        }
        // ── Phase 200: File Watcher Polling ──────────────────────
        // Check watched file for changes (poll every frame ~60fps)
        if let Some((ref path, ref last_mtime)) = watch_file {
            if let Ok(metadata) = std::fs::metadata(path) {
                if let Ok(current_mtime) = metadata.modified() {
                    let changed = match last_mtime {
                        None => true,
                        Some(prev) => current_mtime.duration_since(*prev).is_ok(),
                    };
                    if changed {
                        // File changed -- reload, assemble, run
                        if let Ok(source) = std::fs::read_to_string(path) {
                            load_source_to_canvas(
                                &mut canvas_buffer,
                                &source,
                                &mut cursor_row,
                                &mut cursor_col,
                            );
                            canvas_assemble(
                                &canvas_buffer,
                                &mut vm,
                                &mut canvas_assembled,
                                &mut status_msg,
                            );
                            if canvas_assembled {
                                vm.pc = CANVAS_BYTECODE_ADDR as u32;
                                vm.halted = false;
                                is_running = true;
                                terminal_direct_mode = true;
                                fullscreen_map = false;
                                status_msg = format!("[watch: reloaded {}]", path.display());
                            } else {
                                status_msg =
                                    format!("[watch: assemble failed for {}]", path.display());
                            }
                        }
                        // Update mtime
                        watch_file = Some((path.clone(), Some(current_mtime)));
                    }
                }
            }
        }

        // ── Update Visual Debugger intensities ──────────────────
        // Process new accesses
        for access in &vm.access_log {
            if access.addr < ram_intensity.len() {
                let boost = if access.kind == vm::MemAccessKind::Write {
                    1.5
                } else {
                    1.0
                };
                ram_intensity[access.addr] = boost;
                ram_kind[access.addr] = access.kind;
            }
        }
        // Decay existing intensities (every frame)
        for val in ram_intensity.iter_mut() {
            if *val > 0.01 {
                *val *= 0.75;
            } else {
                *val = 0.0;
            }
        }

        // Track PC for trail
        if is_running {
            pc_history.push_back(vm.pc);
            if pc_history.len() > 64 {
                pc_history.pop_front();
            }
        } else {
            pc_history.clear();
        }

        // ── HOTRELOAD port: edit (1) and reload (2) from VM programs ──
        if vm.ram.len() > HOTRELOAD_VERB_PORT {
            let verb = vm.ram[HOTRELOAD_VERB_PORT];
            if verb == 1 {
                // edit: load programs/<filename>.asm into the canvas
                vm.ram[HOTRELOAD_VERB_PORT] = 0; // clear verb first
                let path_addr = vm.ram.get(HOTRELOAD_PATH_PORT).copied().unwrap_or(0) as usize;
                let filename = if path_addr > 0 && path_addr < vm.ram.len() {
                    // Read null-terminated ASCII from RAM
                    let mut chars = Vec::new();
                    let mut a = path_addr;
                    while a < vm.ram.len() {
                        let byte = (vm.ram[a] & 0xFF) as u8;
                        if byte == 0 {
                            break;
                        }
                        chars.push(byte as char);
                        a += 1;
                    }
                    let name: String = chars.into_iter().collect();
                    if name.is_empty() {
                        None
                    } else {
                        Some(name)
                    }
                } else {
                    None
                };
                if let Some(fname) = filename {
                    let prog_path = std::path::Path::new("programs").join(format!("{}.asm", fname));
                    if let Ok(source) = std::fs::read_to_string(&prog_path) {
                        load_source_to_canvas(
                            &mut canvas_buffer,
                            &source,
                            &mut cursor_row,
                            &mut cursor_col,
                        );
                        loaded_file = Some(prog_path);
                        canvas_assembled = false;
                        is_running = false;
                        vm.halted = true;
                        status_msg = format!("[Editing {} — F8 to assemble, F5 to run]", fname);
                    } else {
                        status_msg = format!("[Edit: {} not found]", fname);
                    }
                }
            } else if verb == 2 {
                // reload: reassemble terminal.asm from disk and restart
                vm.ram[HOTRELOAD_VERB_PORT] = 0; // clear verb first
                let term_path = "programs/terminal.asm";
                if let Ok(source) = std::fs::read_to_string(term_path) {
                    let mut pp = crate::preprocessor::Preprocessor::new();
                    let preprocessed = pp.preprocess(&source);
                    let base_addr = crate::render::CANVAS_BYTECODE_ADDR;
                    if let Ok(asm_result) = crate::assembler::assemble(&preprocessed, base_addr) {
                        let ram_len = vm.ram.len();
                        for v in vm.ram[base_addr..ram_len.min(base_addr + 8192)].iter_mut() {
                            *v = 0;
                        }
                        for (idx, &word) in asm_result.pixels.iter().enumerate() {
                            let addr = base_addr + idx;
                            if addr < ram_len {
                                vm.ram[addr] = word;
                            }
                        }
                        vm.pc = base_addr as u32;
                        vm.halted = false;
                        canvas_assembled = true;
                        is_running = true;
                        hit_breakpoint = false;
                        status_msg = String::from("[Terminal reloaded]");
                    } else {
                        status_msg = String::from("[Reload: assembly error]");
                    }
                } else {
                    status_msg = String::from("[Reload: terminal.asm not found]");
                }
            }
        }

        // ── Hypervisor launch requested by VM opcode 0x72 ───────
        if vm.hypervisor_active && riscv_handle.is_none() && !qemu_active {
            let config_str = vm.hypervisor_config.clone();
            let mode = vm.hypervisor_mode;
            let window_id = vm.hypervisor_window_id;

            if mode == vm::HypervisorMode::Native {
                // Native RISC-V path
                let mut kernel_data: Option<Vec<u8>> = None;
                let mut initrd_data: Option<Vec<u8>> = None;
                let mut bootargs = "earlycon=sbi rdinit=/init nosmp loglevel=8".to_string();
                let mut ram_mb = 768u32;

                // Parse config for region:N or paths
                for part in config_str.split_whitespace() {
                    if part.starts_with("kernel=") {
                        let val = &part["kernel=".len()..];
                        if val.starts_with("region:") {
                            if let (Some(ref seeds), Ok(idx)) =
                                (&current_boot_seeds, val["region:".len()..].parse::<usize>())
                            {
                                if let Ok(chain) = pixel::BootChain::parse(seeds) {
                                    kernel_data = chain.resolve_region(seeds, idx).ok();
                                }
                            }
                        } else if val.starts_with("building:") {
                            // Resolve kernel from Memory Palace building binary
                            if let Ok(building_id) = val["building:".len()..].parse::<u32>() {
                                let building_addr = 0x7500 + building_id as usize;
                                if building_addr + 2 < vm.ram.len() {
                                    let building_coord_word = vm.ram[building_addr];
                                    let bx = (building_coord_word >> 16) & 0xFFFF;
                                    let by = building_coord_word & 0xFFFF;
                                    let coord_key = ((bx as u64) << 16) | by as u64;

                                    if let Some(coord_metadata) =
                                        vm.coordinate_metadata.get(&coord_key)
                                    {
                                        if let Some(binary_json) = coord_metadata.get("binary_data")
                                        {
                                            if let Ok(metadata) =
                                                serde_json::from_str::<encoding::BinaryMetadata>(
                                                    binary_json,
                                                )
                                            {
                                                kernel_data = metadata.to_binary().ok();
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            kernel_data = std::fs::read(val).ok();
                        }
                    } else if part.starts_with("initrd=") {
                        let val = &part["initrd=".len()..];
                        if val.starts_with("region:") {
                            if let (Some(ref seeds), Ok(idx)) =
                                (&current_boot_seeds, val["region:".len()..].parse::<usize>())
                            {
                                if let Ok(chain) = pixel::BootChain::parse(seeds) {
                                    initrd_data = chain.resolve_region(seeds, idx).ok();
                                }
                            }
                        } else if val.starts_with("building:") {
                            // Resolve initrd from Memory Palace building binary
                            if let Ok(building_id) = val["building:".len()..].parse::<u32>() {
                                let building_addr = 0x7500 + building_id as usize;
                                if building_addr + 2 < vm.ram.len() {
                                    let building_coord_word = vm.ram[building_addr];
                                    let bx = (building_coord_word >> 16) & 0xFFFF;
                                    let by = building_coord_word & 0xFFFF;
                                    let coord_key = ((bx as u64) << 16) | by as u64;

                                    if let Some(coord_metadata) =
                                        vm.coordinate_metadata.get(&coord_key)
                                    {
                                        if let Some(binary_json) = coord_metadata.get("binary_data")
                                        {
                                            if let Ok(metadata) =
                                                serde_json::from_str::<encoding::BinaryMetadata>(
                                                    binary_json,
                                                )
                                            {
                                                initrd_data = metadata.to_binary().ok();
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            initrd_data = std::fs::read(val).ok();
                        }
                    } else if part.starts_with("ram=") {
                        ram_mb = part["ram=".len()..].parse().unwrap_or(768);
                    } else if part.starts_with("bootargs=") {
                        bootargs = part["bootargs=".len()..].to_string();
                    }
                }

                if let Some(kernel) = kernel_data {
                    let config = VmThreadConfig {
                        mode: GuestMode::Linux {
                            kernel,
                            initrd: initrd_data,
                            bootargs,
                        },
                        ram_size: (ram_mb as usize) * 1024 * 1024,
                        ..Default::default()
                    };

                    match spawn_vm_thread(config) {
                        Ok(h) => {
                            riscv_handle = Some(h);
                            status_msg =
                                format!("[Hypervisor] Native RISC-V started (win={})", window_id);
                        },
                        Err(e) => {
                            status_msg = format!("[Hypervisor] Spawn failed: {}", e);
                            vm.hypervisor_active = false;
                        },
                    }
                } else {
                    status_msg = String::from("[Hypervisor] Error: No kernel data found");
                    vm.hypervisor_active = false;
                }
            } else {
                // QEMU path
                let resolved_cfg = resolve_qemu_pixel_paths(&config_str, &vm);
                match QemuBridge::spawn(&resolved_cfg) {
                    Ok(bridge) => {
                        canvas_buffer.fill(0);
                        scroll_offset = 0;
                        qemu_active = true;
                        qemu_bridge = Some(bridge);
                        status_msg = format!("[Hypervisor] QEMU started (win={})", window_id);
                    },
                    Err(e) => {
                        status_msg = format!("[Hypervisor] QEMU failed: {}", e);
                        vm.hypervisor_active = false;
                    },
                }
            }
        }
        // ── Detect fullscreen map mode ──────────────────────────
        // When running with buildings defined (RAM[0x7580] > 0), we're in map mode
        if is_running {
            let bldg_count = vm.ram.get(0x7580).copied().unwrap_or(0);
            if bldg_count > 0 {
                if !fullscreen_map {
                    fullscreen_map = true;
                    zoom_level = 2; // default zoom
                }
            } else if launched_from_map.is_none() {
                fullscreen_map = false;
            }
        } else {
            // If a launched app halted, return to map
            // --terminal mode: quit when host_term halts (bash exited)
            if terminal_direct_mode && vm.halted {
                should_quit = true;
                status_msg = String::from("[Terminal exited -- shutting down]");
            } else if launched_from_map.is_some() && vm.halted {
                // Reload the terminal program
                if let Some(ref app_name) = launched_from_map {
                    let term_path = "programs/terminal.asm";
                    if let Ok(source) = std::fs::read_to_string(term_path) {
                        let mut pp = crate::preprocessor::Preprocessor::new();
                        let preprocessed = pp.preprocess(&source);
                        let base_addr = crate::render::CANVAS_BYTECODE_ADDR;
                        if let Ok(asm_result) = crate::assembler::assemble(&preprocessed, base_addr)
                        {
                            let ram_len = vm.ram.len();
                            for v in vm.ram[base_addr..ram_len.min(base_addr + 8192)].iter_mut() {
                                *v = 0;
                            }
                            for (idx, &word) in asm_result.pixels.iter().enumerate() {
                                let addr = base_addr + idx;
                                if addr < ram_len {
                                    vm.ram[addr] = word;
                                }
                            }
                            vm.pc = base_addr as u32;
                            vm.halted = false;
                            canvas_assembled = true;
                            is_running = true;
                            hit_breakpoint = false;
                            fullscreen_map = true;
                            status_msg = format!("[Terminal restored after {}]", app_name);
                        }
                    }
                }
                launched_from_map = None;
            } else if !fullscreen_map {
                fullscreen_map = false;
            }
        }

        // ── Mouse drag: window drag or map panning (Phase 107) ────
        if fullscreen_map && is_running {
            let mouse_down_now = window.get_mouse_down(MouseButton::Left);
            let (_, scale) = match zoom_level {
                0 => (256usize, 2usize),
                1 => (256, 3),
                2 => (128, 6),
                3 => (64, 12),
                4 => (32, 24),
                _ => (128, 6),
            };

            if mouse_down_now && !mouse_drag_active && !window_drag_active {
                // Check if click is on a window title bar first
                if let Some((mx, my)) = window.get_mouse_pos(MouseMode::Clamp) {
                    // Convert host coords to VM screen framebuffer coords
                    let (src_region, _) = match zoom_level {
                        0 => (256usize, 2usize),
                        1 => (256, 3),
                        2 => (128, 6),
                        3 => (64, 12),
                        4 => (32, 24),
                        _ => (128, 6),
                    };
                    let src_offset = (256 - src_region) / 2;
                    let map_display_size = 768usize;
                    let map_offset = (map_display_size - src_region * scale) / 2;
                    let vm_sx =
                        ((mx as i32 - map_offset as i32).max(0) / scale as i32) + src_offset as i32;
                    let vm_sy =
                        ((my as i32 - map_offset as i32).max(0) / scale as i32) + src_offset as i32;

                    // Read camera for framebuffer-space window positions
                    let cam_x_tiles = vm.ram.get(0x7800).copied().unwrap_or(0) as i32;
                    let cam_y_tiles = vm.ram.get(0x7801).copied().unwrap_or(0) as i32;

                    // Check if click hits a world-space window (title bar or body)
                    let mut hit_window = false;
                    // Collect owned data to avoid borrow conflict with later mutation
                    struct WinHitInfo {
                        id: u32,
                        world_x: i32,
                        world_y: i32,
                        w: u32,
                        h: u32,
                        z_order: u32,
                    }
                    let mut sorted_win_data: Vec<WinHitInfo> = vm
                        .windows
                        .iter()
                        .filter(|w| w.active && w.is_world_space())
                        .map(|w| WinHitInfo {
                            id: w.id,
                            world_x: w.world_x as i32,
                            world_y: w.world_y as i32,
                            w: w.w,
                            h: w.h,
                            z_order: w.z_order,
                        })
                        .collect();
                    sorted_win_data.sort_by_key(|info| std::cmp::Reverse(info.z_order));

                    // Find which window was hit using VM framebuffer coordinates
                    // (both vm_sx/vm_sy and window positions are in 0-255 framebuffer space)
                    let mut hit_close_id: Option<u32> = None;
                    let mut hit_drag: Option<(u32, i32, i32)> = None;
                    let mut hit_focus_id: Option<u32> = None;
                    for info in &sorted_win_data {
                        let win_fb_x = (info.world_x - cam_x_tiles) * 8;
                        let win_fb_y = (info.world_y - cam_y_tiles) * 8;
                        let win_w = info.w as i32;
                        let win_h = info.h as i32;
                        let title_bar_h = 12;

                        let in_window = vm_sx >= win_fb_x
                            && vm_sx < win_fb_x + win_w
                            && vm_sy >= win_fb_y
                            && vm_sy < win_fb_y + win_h;
                        let in_title_bar = vm_sx >= win_fb_x
                            && vm_sx < win_fb_x + win_w
                            && vm_sy >= win_fb_y
                            && vm_sy < win_fb_y + title_bar_h;

                        if in_window {
                            if in_title_bar {
                                let close_btn_size = 8;
                                let close_btn_margin = 2;
                                let close_x = win_fb_x + win_w - close_btn_margin - close_btn_size;
                                let close_y_end = win_fb_y + close_btn_margin + close_btn_size;

                                if vm_sx >= close_x && vm_sy < close_y_end {
                                    hit_close_id = Some(info.id);
                                } else {
                                    hit_drag = Some((info.id, info.world_x, info.world_y));
                                }
                            } else {
                                // Window body click: bring to front
                                hit_focus_id = Some(info.id);
                            }
                            break;
                        }
                    }

                    // Now apply mutations (separate from the immutable borrow above)
                    if let Some(close_id) = hit_close_id {
                        if let Some(w) = vm.windows.iter_mut().find(|w| w.id == close_id) {
                            w.active = false;
                        }
                        hit_window = true;
                    } else if let Some((drag_id, wx, wy)) = hit_drag {
                        window_drag_active = true;
                        window_drag_id = drag_id;
                        window_drag_start = (mx, my);
                        window_drag_world_start = (wx, wy);
                        let max_z = vm.windows.iter().map(|w| w.z_order).max().unwrap_or(0);
                        if let Some(w) = vm.windows.iter_mut().find(|w| w.id == drag_id) {
                            w.z_order = max_z + 1;
                            vm.focused_pid = w.pid;
                        }
                        hit_window = true;
                    } else if let Some(focus_id) = hit_focus_id {
                        let max_z = vm.windows.iter().map(|w| w.z_order).max().unwrap_or(0);
                        if let Some(w) = vm.windows.iter_mut().find(|w| w.id == focus_id) {
                            w.z_order = max_z + 1;
                            vm.focused_pid = w.pid;
                        }
                        hit_window = true;
                    }

                    // If no window hit, start map pan
                    if !hit_window {
                        vm.focused_pid = 0; // desktop focused
                        mouse_drag_active = true;
                        drag_start = (mx, my);
                        drag_cam_start = (
                            vm.ram.get(0x7800).copied().unwrap_or(0) as i32,
                            vm.ram.get(0x7801).copied().unwrap_or(0) as i32,
                        );
                    }
                }
            }

            // Handle window drag
            if window_drag_active && mouse_down_now {
                if let Some((mx, my)) = window.get_mouse_pos(MouseMode::Clamp) {
                    // Convert pixel delta to world tile delta
                    let px_per_tile = (8 * scale) as f32; // 8 VM px * host scale
                    let dx = (mx - window_drag_start.0) / px_per_tile;
                    let dy = (my - window_drag_start.1) / px_per_tile;
                    let new_wx = window_drag_world_start.0 + dx as i32;
                    let new_wy = window_drag_world_start.1 + dy as i32;

                    // Update window position
                    if let Some(w) = vm.windows.iter_mut().find(|w| w.id == window_drag_id) {
                        w.world_x = if new_wx >= 0 { new_wx as u32 } else { 0 };
                        w.world_y = if new_wy >= 0 { new_wy as u32 } else { 0 };
                    }
                }
            }

            // Handle map pan drag
            if mouse_drag_active && mouse_down_now {
                if let Some((mx, my)) = window.get_mouse_pos(MouseMode::Clamp) {
                    let tiles_per_host_pixel = 1.0 / (4.0 * scale as f32);
                    let dx = (mx - drag_start.0) * tiles_per_host_pixel;
                    let dy = (my - drag_start.1) * tiles_per_host_pixel;
                    let new_cx = drag_cam_start.0 - dx as i32;
                    let new_cy = drag_cam_start.1 - dy as i32;
                    if (new_cx as usize) < vm.ram.len() {
                        vm.ram[0x7800] = new_cx as u32;
                    }
                    if (new_cy as usize) < vm.ram.len() {
                        vm.ram[0x7801] = new_cy as u32;
                    }
                }
            }

            if !mouse_down_now {
                mouse_drag_active = false;
                window_drag_active = false;
            }
        }

        // ── Scroll wheel zoom ────────────────────────────────────
        if fullscreen_map && is_running {
            if let Some((_sx, sy)) = window.get_scroll_wheel() {
                // sy > 0 = scroll up = zoom in, sy < 0 = zoom out
                if sy > 0.0 && zoom_level < 5 {
                    zoom_level += 1;
                    // Phase 223: Semantic Expansion at zoom level 5
                    if zoom_level == 5 {
                        // Check if camera center is near a building in the RAM table
                        let cam_tx = vm.ram.get(0x7800).copied().unwrap_or(0) as i32;
                        let cam_ty = vm.ram.get(0x7801).copied().unwrap_or(0) as i32;
                        let bldg_count = vm.ram.get(0x7580).copied().unwrap_or(0).min(32) as u32;
                        let mut found_app: Option<String> = None;

                        for i in 0..bldg_count {
                            let base = 0x7500 + (i as usize) * 4;
                            if base + 3 >= vm.ram.len() {
                                break;
                            }
                            let bx = vm.ram[base] as i32;
                            let by = vm.ram[base + 1] as i32;
                            // Check if camera is within 2 tiles of building center
                            if (bx - cam_tx).abs() <= 2 && (by - cam_ty).abs() <= 2 {
                                let name_addr = vm.ram[base + 3] as usize;
                                let mut name = String::new();
                                for j in 0..32 {
                                    if name_addr + j >= vm.ram.len() {
                                        break;
                                    }
                                    let ch = vm.ram[name_addr + j];
                                    if ch == 0 || ch > 127 {
                                        break;
                                    }
                                    name.push(ch as u8 as char);
                                }
                                if !name.is_empty() {
                                    found_app = Some(name);
                                    break;
                                }
                            }
                        }

                        if let Some(app_name) = found_app {
                            if app_name.starts_with("backup_") {
                                // Phase 223: Spatial Restore — load full state from file
                                let path = format!("backups/{}.sav", app_name);
                                eprintln!(
                                    "[Singularity] RESTORING from spatial snapshot: {}",
                                    path
                                );
                                match load_state(&path) {
                                    Ok((saved_vm, saved_canvas, saved_assembled)) => {
                                        vm = saved_vm;
                                        canvas_buffer = saved_canvas;
                                        canvas_assembled = saved_assembled;
                                        // Re-initialize tile store with persistence
                                        let map_dir = std::env::var("HOME")
                                            .map(|h| {
                                                std::path::PathBuf::from(h).join(".geometry_os")
                                            })
                                            .unwrap_or_else(|_| std::path::PathBuf::from("/tmp"));
                                        let epl_path = map_dir.join("tile_store.epl");
                                        vm.tile_store =
                                            geometry_os::tile_store::TileStore::with_epl(
                                                epl_path.to_str().unwrap_or("/tmp/tile_store.epl"),
                                            );
                                        status_msg = format!("[restored: {}]", path);
                                        zoom_level = 2; // Success
                                    },
                                    Err(e) => {
                                        status_msg = format!("[restore error: {}]", e);
                                        zoom_level = 4; // Bounce back
                                    },
                                }
                            } else {
                                eprintln!("[Singularity] EXPANDING into building: {}", app_name);

                                // Determine which .asm program to load for this building
                                let program = format!("programs/{}.asm", app_name);

                                // Push current program onto return stack (RAM[0xF030])
                                // Stack grows at 0xF030 + depth * 32 (max 4 levels)
                                let depth = vm.ram.get(0xF030).copied().unwrap_or(0).min(4);
                                let stack_slot = 0xF031 + (depth as usize) * 32;
                                // Store current zoom level
                                if stack_slot < vm.ram.len() {
                                    vm.ram[stack_slot] = 2;
                                } // default zoom
                                  // Store depth+1
                                vm.ram[0xF030] = depth + 1;

                                // Write program path to handover area
                                for (i, b) in program.as_bytes().iter().enumerate() {
                                    if 0xF010 + i < vm.ram.len() {
                                        vm.ram[0xF010 + i] = *b as u32;
                                    }
                                }
                                if 0xF010 + program.len() < vm.ram.len() {
                                    vm.ram[0xF010 + program.len()] = 0;
                                }
                                vm.ram[0xF020] = 1; // trigger chain_load
                                zoom_level = 2; // reset zoom for new context
                            }
                        } else {
                            // No building at this location — bounce back
                            eprintln!(
                                "[Singularity] No building at ({}, {}), staying at zoom 4",
                                cam_tx, cam_ty
                            );
                            zoom_level = 4;
                        }
                    }
                } else if sy < 0.0 && zoom_level > 0 {
                    zoom_level -= 1;
                } else if sy < 0.0 && zoom_level == 0 {
                    // Phase 223: Semantic Collapse — return to parent context
                    let depth = vm.ram.get(0xF030).copied().unwrap_or(0);
                    if depth > 0 {
                        let new_depth = depth - 1;
                        vm.ram[0xF030] = new_depth;
                        eprintln!("[Singularity] COLLAPSING to parent (depth {})", new_depth);
                        // Reset zoom for parent context
                        zoom_level = 2;
                        // Reload the world_desktop program (the map/launcher)
                        let program = "programs/world_desktop.asm".to_string();
                        for (i, b) in program.as_bytes().iter().enumerate() {
                            if 0xF010 + i < vm.ram.len() {
                                vm.ram[0xF010 + i] = *b as u32;
                            }
                        }
                        if 0xF010 + program.len() < vm.ram.len() {
                            vm.ram[0xF010 + program.len()] = 0;
                        }
                        vm.ram[0xF020] = 1;
                    }
                }
                // Write zoom to RAM for asm program to read
                if (0x7812) < vm.ram.len() {
                    vm.ram[0x7812] = zoom_level;
                }
                // Write map_flags
                if (0x7813) < vm.ram.len() {
                    vm.ram[0x7813] = 1; // fullscreen active
                }
            }
        }

        // Write zoom level and map flags to RAM every frame when in map mode
        if fullscreen_map {
            if (0x7812) < vm.ram.len() {
                vm.ram[0x7812] = zoom_level;
            }
            if (0x7813) < vm.ram.len() {
                vm.ram[0x7813] = 1;
            }
        }

        // ── Cursor blink timer (500ms toggle) ────────────────────
        if cursor_blink_timer.elapsed().as_millis() >= 500 {
            cursor_blink_on = !cursor_blink_on;
            cursor_blink_timer = std::time::Instant::now();
        }

        // ── Camera → bottom compositor layer ─────────────────────
        // The camera is the robot's "eyes". We composite camera frames into
        // vm.screen BEFORE WINSYS/RISC-V composites, so windows float on top.
        // Pixel real estate = attention budget: every window pixel is a choice
        // to allocate attention away from seeing the world.
        #[cfg(feature = "native")]
        if let Some(ref mut handle) = camera_handle {
            // Drain all available frames, keep only the latest
            loop {
                match handle.try_recv_frame() {
                    Some(frame) => camera_latest_frame = Some(frame),
                    None => break,
                }
            }
        }
        #[cfg(feature = "native")]
        if let Some(ref frame) = camera_latest_frame {
            // Write camera pixels directly into vm.screen as the base layer.
            // WINSYS windows and RISC-V guests will paint on top.
            for i in 0..256 * 256 {
                vm.screen[i] = frame.pixels[i];
            }
        }

        // ── Active Substrate → middle compositor layer ───────────
        #[cfg(feature = "gpu")]
        if let Some(ref mut substrate) = vm.active_substrate {
            // Step the simulation
            substrate.update(frame_id as u32, 1.0);

            // Read back pixels and composite onto vm.screen
            let sub_pixels = pollster::block_on(substrate.get_substrate());
            for i in 0..256 * 256 {
                let p = sub_pixels[i];
                if p != 0 {
                    // Alpha-keyed composite
                    vm.screen[i] = p & 0x00FFFFFF;
                }
            }
        }

        // ── RISC-V → canonical framebuffer composite (Phase C, U2) ────
        // RISC-V guests write to framebuf.pixels (0xRRGGBBAA) via MMIO.
        // On fb_present, frames arrive here. We composite them into vm.screen
        // (the single canonical 256×256 surface, 0x00RRGGBB) with alpha keying.
        // This must happen BEFORE render() so render sees the latest pixels.
        if let Some(ref mut handle) = riscv_handle {
            // Drain all available frames, keep only the latest
            loop {
                match handle.try_recv_frame() {
                    Ok(frame) => riscv_latest_frame = Some(frame),
                    Err(_) => break,
                }
            }
            // Drain and print console output
            // Also write to VM ring buffer for Developer Console app
            // Ring buffer at 0x4F00: [write_offset][read_offset][data...254 bytes]
            let mut hv_console_avail = 0u32;
            while let Ok(data) = handle.try_recv_console() {
                let s = String::from_utf8_lossy(&data);
                print!("{}", s);
                let _ = std::io::stdout().flush();

                // Write to VM RAM ring buffer
                let mut write_off = vm.ram.get(0x4F00).copied().unwrap_or(0) as usize;
                let read_off = vm.ram.get(0x4F01).copied().unwrap_or(0) as usize;
                write_off = write_off.max(0).min(254);
                for &byte in &data {
                    let slot = 0x4F02 + write_off;
                    if slot < vm.ram.len() {
                        vm.ram[slot] = byte as u32;
                    }
                    write_off = (write_off + 1) % 254;
                    // Don't overwrite unread data: stop if we'd hit read_offset
                    // Reserve one slot so write_off never equals read_off unless empty
                    if (write_off + 1) % 254 == read_off {
                        break;
                    }
                }
                vm.ram[0x4F00] = write_off as u32;
                hv_console_avail = 1;
            }
            // Forward VM hypervisor input queue to guest (before halt check)
            if vm.hypervisor_input_pending && !vm.hypervisor_input_queue.is_empty() {
                let bytes: Vec<u8> = vm.hypervisor_input_queue.drain(..).collect();
                vm.hypervisor_input_pending = false;
                for &byte in &bytes {
                    handle.send_input(byte);
                }
            }
            // Check for halt
            let mut hv_halted = false;
            loop {
                match handle.try_recv_status() {
                    Ok(VmStatus::Halted { reason, .. }) => {
                        status_msg = format!("[riscv: halted: {}]", reason);
                        hv_halted = true;
                        break;
                    },
                    Ok(_) => {},
                    Err(_) => break,
                }
            }
            if hv_halted {
                riscv_handle = None;
                vm.hypervisor_active = false;
            }
        }
        // Composite latest RISC-V frame into vm.screen (canonical framebuffer)
        if let Some(ref frame) = riscv_latest_frame {
            let fb_w = frame.width.min(256);
            let fb_h = frame.height.min(256);
            match frame.clip_rect {
                Some((cx, cy, cw, ch)) => {
                    // Region-clipped composite: only blit pixels within the clip rect.
                    // This lets two programs share the framebuffer — each present only
                    // touches its own region, so the other program's pixels are preserved.
                    let x_end = (cx as usize + cw as usize).min(fb_w);
                    let y_end = (cy as usize + ch as usize).min(fb_h);
                    for y in (cy as usize)..y_end {
                        for x in (cx as usize)..x_end {
                            let rgba = frame.pixels[y * frame.width + x];
                            // Alpha key: transparent pixels (alpha=0) don't overwrite
                            if (rgba & 0xFF) != 0 {
                                let color = riscv::framebuf::pixel_to_minifb(rgba);
                                vm.screen[y * 256 + x] = color;
                            }
                        }
                    }
                },
                None => {
                    // No clip rect: full-buffer composite (single-program mode)
                    for y in 0..fb_h {
                        for x in 0..fb_w {
                            let rgba = frame.pixels[y * frame.width + x];
                            if (rgba & 0xFF) != 0 {
                                let color = riscv::framebuf::pixel_to_minifb(rgba);
                                vm.screen[y * 256 + x] = color;
                            }
                        }
                    }
                },
            }
        }

        // ── Render ───────────────────────────────────────────────
        if fullscreen_map && is_running {
            // Fullscreen map: VM screen scaled 3x to fill window
            render_fullscreen_map(&mut buffer, &mut vm, Some(&icon_cache));
        } else if in_scrollback {
            // Scrollback mode: render scrollback buffer as canvas
            // Build a temporary canvas buffer from scrollback lines
            let mut sb_canvas = vec![0u32; CANVAS_MAX_ROWS * CANVAS_COLS];
            let page = scrollback.get_page(scrollback_offset);
            for (vis_row, line) in page.iter().enumerate() {
                if vis_row >= CANVAS_MAX_ROWS {
                    break;
                }
                let offset = vis_row * CANVAS_COLS;
                sb_canvas[offset..offset + CANVAS_COLS].copy_from_slice(line.as_slice());
            }
            // Leave remaining rows as zeros (empty)
            render(
                &mut buffer,
                &vm,
                &sb_canvas,
                0, // no cursor in scrollback
                0,
                0,     // no scroll offset (we handle it via sb_canvas content)
                false, // not running
                false,
                &status_msg,
                &ram_intensity,
                &ram_kind,
                &pc_history,
                ram_view_base,
                Some(&icon_cache),
                None, // no text selection in scrollback
                font_mode,
                cursor_style,
                false, // no cursor blink in scrollback
            );

            // Draw scrollback header bar over the rendered content
            {
                let bar_h: usize = 14;
                let bar_color: u32 = 0x1A3A5C; // dark blue
                let total_lines = scrollback.len();
                let current_line = scrollback_offset + CANVAS_ROWS;
                let header = format!(
                    "[SCROLLBACK] Line {}/{} -- PageUp/Down=navigate, any key=exit",
                    current_line.min(total_lines),
                    total_lines
                );
                // Fill bar background
                for py in 0..bar_h {
                    for px in 0..render::WIDTH {
                        buffer[py * render::WIDTH + px] = bar_color;
                    }
                }
                // Draw header text in bright white
                render::render_text(&mut buffer, 8, 3, &header, 0xCCDDFF);
                // Draw thin separator line below
                for px in 0..render::WIDTH {
                    buffer[bar_h * render::WIDTH + px] = 0x3366AA;
                }
            }
        } else {
            // Compute current selection for rendering (active drag or anchored selection)
            let current_sel = if text_sel_active {
                Some((text_sel_start, text_sel_end))
            } else {
                text_sel_anchor
            };
            render(
                &mut buffer,
                &vm,
                &canvas_buffer,
                cursor_row,
                cursor_col,
                scroll_offset,
                is_running,
                hit_breakpoint,
                &status_msg,
                &ram_intensity,
                &ram_kind,
                &pc_history,
                ram_view_base,
                Some(&icon_cache),
                if !fullscreen_map && !is_running {
                    current_sel
                } else {
                    None
                },
                font_mode,
                cursor_style,
                cursor_blink_on,
            );
        }

        // ── Desktop polish: clock + system tray overlay ──────────────
        {
            // System tray: positioned at bottom-right of window
            // Order (right to left): clock | battery | network | volume
            let tray_y = HEIGHT - 20;

            // Clock (rightmost)
            let clock = get_local_clock_string();
            render::render_text(&mut buffer, WIDTH - 80, tray_y, &clock, 0xAAAACC);

            // Battery indicator
            let mut tray_x = WIDTH - 160;
            if let Some(pct) = get_battery_percent() {
                let bat_color = if pct > 50 {
                    0x00CC00
                } else if pct > 20 {
                    0xFFAA00
                } else {
                    0xFF4444
                };
                let bat_text = format!("B:{}%", pct);
                render::render_text(&mut buffer, tray_x, tray_y, &bat_text, bat_color);
                tray_x -= 80;
            }

            // Network indicator
            let net = get_network_status();
            let net_color = if net == "WiFi" || net == "Eth" {
                0x00CC00
            } else {
                0x666666
            };
            render::render_text(&mut buffer, tray_x, tray_y, net, net_color);
            tray_x -= 60;

            // Volume indicator (Phase 153)
            if let Some(vol) = get_volume_percent() {
                let vol_color = if vol == 0 {
                    0xFF4444 // muted = red
                } else if vol > 50 {
                    0x00CC00 // high = green
                } else {
                    0xFFAA00 // medium = amber
                };
                let vol_text = format!("V:{}%", vol);
                render::render_text(&mut buffer, tray_x, tray_y, &vol_text, vol_color);
            }
        }

        // ── Alt-Tab window switcher overlay ──────────────────────
        if alt_tab_active {
            // Draw semi-transparent overlay
            let overlay_x = (WIDTH / 2) - 200;
            let overlay_y = (HEIGHT / 2) - 100;
            let overlay_w = 400;
            let overlay_h = 200;

            // Background
            for y in overlay_y..overlay_y + overlay_h {
                for x in overlay_x..overlay_x + overlay_w {
                    let idx = y * WIDTH + x;
                    if idx < buffer.len() {
                        // Darken existing pixel + add dark overlay
                        buffer[idx] = (buffer[idx] & 0xFEFEFE) >> 1;
                    }
                }
            }

            // Title
            render::render_text(
                &mut buffer,
                overlay_x + 10,
                overlay_y + 5,
                "Window Switcher (Tab=next, Enter=select, Esc=cancel)",
                0xFFFFFF,
            );

            // Window list
            let wins: Vec<_> = vm.windows.iter().collect();
            for (i, win) in wins.iter().enumerate() {
                if i >= 10 {
                    break;
                } // max 10 items displayed
                let y = overlay_y + 25 + i * 16;
                let color = if i == alt_tab_index {
                    0xFFFF00
                } else {
                    0xAAAAAA
                };
                let marker = if i == alt_tab_index { "> " } else { "  " };
                // Read title from RAM
                let mut title = String::new();
                let addr = win.title_addr as usize;
                for j in 0..32 {
                    if addr + j < vm.ram.len() {
                        let ch = vm.ram[addr + j];
                        if ch == 0 {
                            break;
                        }
                        if let Some(c) = char::from_u32(ch) {
                            title.push(c);
                        }
                    }
                }
                if title.is_empty() {
                    title = format!("Win#{}", win.id);
                }
                let label = format!("{}{} [{}x{}] PID:{}", marker, title, win.w, win.h, win.pid);
                render::render_text(&mut buffer, overlay_x + 10, y, &label, color);
            }

            if wins.is_empty() {
                render::render_text(
                    &mut buffer,
                    overlay_x + 10,
                    overlay_y + 50,
                    "No windows open",
                    0x888888,
                );
            }
        }
        // Only when running (desktop is active) and VM screen is visible
        // Rising-edge only: detect click press, not hold
        if is_running {
            let mouse_down = window.get_mouse_down(MouseButton::Left);
            if mouse_down && !prev_mouse_down {
                if let Some((mx, my)) = window.get_mouse_pos(MouseMode::Clamp) {
                    let now = std::time::Instant::now();
                    let elapsed = now.duration_since(last_click_time).as_millis() as u64;
                    let dx = mx - last_click_screen.0;
                    let dy = my - last_click_screen.1;
                    let dist = (dx * dx + dy * dy).sqrt();

                    if elapsed < double_click_threshold_ms && dist < double_click_dist {
                        click_count += 1;
                    } else {
                        click_count = 1;
                    }

                    last_click_time = now;
                    last_click_screen = (mx, my);

                    // On double-click: check if click is on a building in VM screen area
                    if click_count >= 2 {
                        click_count = 0; // reset

                        // Convert window coords to VM screen coords
                        let (vm_sx, vm_sy) = if fullscreen_map {
                            // Fullscreen map: zoom-dependent crop+scale
                            // zoom 0: 256px src at 2x, 1: 256px at 3x, 2: 128px center at 6x,
                            // 3: 64px center at 12x, 4: 32px center at 24x
                            let (src_region, scale) = match zoom_level {
                                0 => (256usize, 2usize),
                                1 => (256, 3),
                                2 => (128, 6),
                                3 => (64, 12),
                                4 => (32, 24),
                                _ => (128, 6),
                            };
                            let src_offset = (256 - src_region) / 2;
                            let map_display_size = 768usize;
                            let map_offset = (map_display_size - src_region * scale) / 2;
                            // Convert: (mx - map_offset) / scale + src_offset
                            let sx = ((mx as i32 - map_offset as i32).max(0) / scale as i32)
                                + src_offset as i32;
                            let sy = ((my as i32 - map_offset as i32).max(0) / scale as i32)
                                + src_offset as i32;
                            (sx.min(255), sy.min(255))
                        } else {
                            // Normal: VM screen at (VM_SCREEN_X, VM_SCREEN_Y)
                            (
                                mx as i32 - VM_SCREEN_X as i32,
                                my as i32 - VM_SCREEN_Y as i32,
                            )
                        };

                        if vm_sx >= 0 && vm_sx < 256 && vm_sy >= 0 && vm_sy < 256 {
                            // Convert VM screen coords to world tile coords
                            let cam_x = vm.ram.get(0x7800).copied().unwrap_or(0) as i32;
                            let cam_y = vm.ram.get(0x7801).copied().unwrap_or(0) as i32;
                            // screen_pos = (world - cam) * 4, so world = screen/4 + cam
                            let click_world_x = vm_sx / 4 + cam_x;
                            let click_world_y = vm_sy / 4 + cam_y;

                            // Search building table for a hit
                            let bldg_count =
                                vm.ram.get(0x7580).copied().unwrap_or(0).min(32) as usize;
                            for i in 0..bldg_count {
                                let base = 0x7500 + i * 4;
                                let bx = vm.ram.get(base).copied().unwrap_or(0) as i32;
                                let by = vm.ram.get(base + 1).copied().unwrap_or(0) as i32;
                                let name_addr = vm.ram.get(base + 3).copied().unwrap_or(0) as usize;

                                // Building is 6 world-tiles wide (24px / 4 = 6), 8 tall (32px / 4 = 8)
                                if click_world_x >= bx
                                    && click_world_x < bx + 6
                                    && click_world_y >= by
                                    && click_world_y < by + 8
                                {
                                    // Read building name
                                    let mut app_name = String::new();
                                    for j in 0..16 {
                                        if name_addr + j >= vm.ram.len() {
                                            break;
                                        }
                                        let ch = vm.ram[name_addr + j];
                                        if ch == 0 || ch > 127 {
                                            break;
                                        }
                                        app_name.push(ch as u8 as char);
                                    }

                                    if !app_name.is_empty() {
                                        // Phase 107: Launch app in a windowed process
                                        // instead of replacing the map program.
                                        let prog_path = format!("programs/{}.asm", app_name);
                                        match std::fs::read_to_string(&prog_path) {
                                            Ok(source) => {
                                                let mut pp =
                                                    crate::preprocessor::Preprocessor::new();
                                                let preprocessed = pp.preprocess(&source);
                                                // Find a free app slot BEFORE assembling so we can
                                                // pass the correct base_addr for label resolution
                                                let used_slots: Vec<usize> =
                                                    active_apps.iter().map(|a| a.0).collect();
                                                let slot = (0..MAX_WINDOWED_APPS)
                                                    .find(|s| !used_slots.contains(s));

                                                if let Some(slot_idx) = slot {
                                                    let app_base =
                                                        APP_CODE_BASE + slot_idx * APP_CODE_SIZE;
                                                    match crate::assembler::assemble(
                                                        &preprocessed,
                                                        app_base,
                                                    ) {
                                                        Ok(asm_result) => {
                                                            let ram_len = vm.ram.len();

                                                            // Clear app code region
                                                            if app_base < ram_len {
                                                                let end = (app_base
                                                                    + APP_CODE_SIZE)
                                                                    .min(ram_len);
                                                                for v in &mut vm.ram[app_base..end]
                                                                {
                                                                    *v = 0;
                                                                }
                                                            }

                                                            // Load app bytecode
                                                            for (idx, &word) in
                                                                asm_result.pixels.iter().enumerate()
                                                            {
                                                                let addr = app_base + idx;
                                                                if addr < ram_len {
                                                                    vm.ram[addr] = word;
                                                                }
                                                            }

                                                            // Create a SpawnedProcess for the app
                                                            let pid =
                                                                (vm.processes.len() + 1) as u32;
                                                            let mut proc = crate::vm::types::SpawnedProcess::new(pid, 0, app_base as u32);
                                                            proc.parent_pid = 0; // kernel-spawned
                                                            proc.priority = 1;
                                                            // Assign private data region for this app
                                                            let data_base = crate::vm::types::APP_DATA_BASE
                                                                + slot_idx * crate::vm::types::APP_DATA_SIZE;
                                                            proc.data_base = data_base as u32;

                                                            // Create a world-space WINSYS window for the app
                                                            let win_w = 128u32;
                                                            let win_h = 96u32;
                                                            let win_world_x = bx; // building world X
                                                            let win_world_y = by;

                                                            // Enable world-space mode for window creation
                                                            vm.ram[crate::vm::types::WINDOW_WORLD_COORDS_ADDR] = 1;
                                                            let win_id =
                                                                vm.windows.len() as u32 + 1;
                                                            let mut win =
                                                                crate::vm::types::Window::new_world(
                                                                    win_id,
                                                                    win_world_x as u32,
                                                                    win_world_y as u32,
                                                                    win_w,
                                                                    win_h,
                                                                    0, // title addr
                                                                    pid,
                                                                );
                                                            // Set window title from app name
                                                            let title_base = 0x7900 + slot_idx * 32;
                                                            // Zero-fill the 32-byte title region first to prevent stale bytes
                                                            for j in 0..32 {
                                                                if title_base + j < ram_len {
                                                                    vm.ram[title_base + j] = 0;
                                                                }
                                                            }
                                                            for (j, b) in
                                                                app_name.bytes().enumerate()
                                                            {
                                                                if title_base + j < ram_len {
                                                                    vm.ram[title_base + j] =
                                                                        b as u32;
                                                                }
                                                            }
                                                            win.title_addr = title_base as u32;
                                                            vm.windows.push(win);

                                                            // Push the process
                                                            vm.processes.push(proc);

                                                            // Track active app
                                                            active_apps.push((
                                                                slot_idx,
                                                                pid,
                                                                app_name.clone(),
                                                            ));

                                                            // Map stays running
                                                            is_running = true;
                                                            hit_breakpoint = false;
                                                            status_msg = format!(
                                                                "[WINDOWED: {} PID={} slot={}]",
                                                                app_name, pid, slot_idx
                                                            );
                                                        },
                                                        Err(e) => {
                                                            status_msg =
                                                                format!("[asm error: {}]", e);
                                                        },
                                                    }
                                                } else {
                                                    status_msg =
                                                        "[MAX APPS: close a window first]".into();
                                                }
                                            },
                                            Err(e) => {
                                                status_msg = format!("[no prog: {}]", e);
                                            },
                                        }
                                    }
                                    break; // only launch first hit
                                }
                            }
                        }
                    }
                }
            }
            prev_mouse_down = mouse_down;
        }

        // ── Screen-space window drag (Phase 124) ───────────────
        // Only when NOT in fullscreen map mode and VM is running
        if !fullscreen_map && is_running {
            use minifb::MouseButton;
            let mouse_down_now = window.get_mouse_down(MouseButton::Left);

            if mouse_down_now && !window_drag_active {
                if let Some((mx, my)) = window.get_mouse_pos(minifb::MouseMode::Clamp) {
                    // Convert host coords to VM screen coords
                    // VM screen at (VM_SCREEN_X, VM_SCREEN_Y) with 2x scale
                    let vm_sx = ((mx as i32) - 640) / 2;
                    let vm_sy = ((my as i32) - 64) / 2;

                    if vm_sx >= 0 && vm_sx < 256 && vm_sy >= 0 && vm_sy < 256 {
                        // Check screen-space windows (highest z_order first)
                        // Collect owned data to avoid borrow conflict with later mutation
                        struct ScreenWinInfo {
                            id: u32,
                            x: u32,
                            y: u32,
                            w: u32,
                            h: u32,
                            z_order: u32,
                        }
                        let mut sorted_win_data: Vec<ScreenWinInfo> = vm
                            .windows
                            .iter()
                            .filter(|w| w.active && !w.is_world_space())
                            .map(|w| ScreenWinInfo {
                                id: w.id,
                                x: w.x,
                                y: w.y,
                                w: w.w,
                                h: w.h,
                                z_order: w.z_order,
                            })
                            .collect();
                        sorted_win_data.sort_by_key(|info| std::cmp::Reverse(info.z_order));

                        let mut hit_close_id: Option<u32> = None;
                        let mut hit_drag: Option<(u32, u32, u32)> = None;
                        let mut hit_focus_id: Option<u32> = None;

                        for info in &sorted_win_data {
                            let bar_h = crate::vm::types::WINDOW_TITLE_BAR_H;
                            let in_window = vm_sx >= info.x as i32
                                && vm_sx < (info.x + info.w) as i32
                                && vm_sy >= info.y as i32
                                && vm_sy < (info.y + info.h) as i32;
                            let in_title_bar = vm_sx >= info.x as i32
                                && vm_sx < (info.x + info.w) as i32
                                && vm_sy >= info.y as i32
                                && vm_sy < (info.y + bar_h) as i32;

                            if in_window {
                                if in_title_bar {
                                    // Check close button (top-right corner, 8x8)
                                    let close_x = (info.x + info.w).saturating_sub(2 + 8);
                                    let close_y_end = info.y + 2 + 8;
                                    if vm_sx >= close_x as i32 && vm_sy < close_y_end as i32 {
                                        hit_close_id = Some(info.id);
                                        break;
                                    }
                                    // Title bar drag
                                    hit_drag = Some((info.id, info.x, info.y));
                                } else {
                                    // Window body click: just bring to front
                                    hit_focus_id = Some(info.id);
                                }
                                break;
                            }
                        }

                        // Apply mutations (separate from immutable borrow)
                        if let Some(close_id) = hit_close_id {
                            let max_z = vm.windows.iter().map(|w| w.z_order).max().unwrap_or(0);
                            if let Some(w) = vm.windows.iter_mut().find(|w| w.id == close_id) {
                                w.z_order = max_z + 1;
                                w.active = false;
                            }
                        } else if let Some((drag_id, drag_x, drag_y)) = hit_drag {
                            // Check for double-click on title bar (Phase 153: maximize/restore)
                            let now = std::time::Instant::now();
                            let elapsed = now.duration_since(win_dbl_click_time).as_millis() as u64;
                            let dx = mx - win_dbl_click_pos.0;
                            let dy = my - win_dbl_click_pos.1;
                            let dist = (dx * dx + dy * dy).sqrt();
                            let is_dbl = drag_id == win_dbl_click_id && elapsed < 500 && dist < 8.0;

                            if is_dbl {
                                // Double-click title bar: toggle maximize/restore
                                let max_w = 256;
                                let max_h = 240; // leave room for taskbar
                                let title =
                                    if let Some(w) = vm.windows.iter().find(|w| w.id == drag_id) {
                                        w.read_title(&vm.ram)
                                    } else {
                                        String::new()
                                    };
                                // Compute max_z before mutable borrow
                                let max_z = vm.windows.iter().map(|w| w.z_order).max().unwrap_or(0);
                                if let Some(w) = vm.windows.iter_mut().find(|w| w.id == drag_id) {
                                    w.z_order = max_z + 1;
                                    w.toggle_maximize(max_w, max_h);
                                    if w.maximized {
                                        status_msg = format!("[maximized: {}]", title);
                                    } else {
                                        status_msg = format!("[restored: {}]", title);
                                    }
                                }
                                // Reset double-click tracking
                                win_dbl_click_id = 0;
                            } else {
                                // Single click on title bar: start drag + bring to front
                                let max_z = vm.windows.iter().map(|w| w.z_order).max().unwrap_or(0);
                                if let Some(w) = vm.windows.iter_mut().find(|w| w.id == drag_id) {
                                    w.z_order = max_z + 1;
                                }
                                window_drag_active = true;
                                window_drag_id = drag_id;
                                window_drag_start = (mx, my);
                                window_drag_world_start = (drag_x as i32, drag_y as i32);
                                // Track for potential double-click
                                win_dbl_click_id = drag_id;
                                win_dbl_click_time = now;
                                win_dbl_click_pos = (mx, my);
                            }
                        } else if let Some(focus_id) = hit_focus_id {
                            let max_z = vm.windows.iter().map(|w| w.z_order).max().unwrap_or(0);
                            if let Some(w) = vm.windows.iter_mut().find(|w| w.id == focus_id) {
                                w.z_order = max_z + 1;
                            }
                        }
                    }
                }
            }

            // Handle active screen-space window drag
            if window_drag_active && mouse_down_now {
                if let Some((mx, _my)) = window.get_mouse_pos(minifb::MouseMode::Clamp) {
                    let dx = ((mx - window_drag_start.0) / 2.0) as i32;
                    let dy = (((_my) - window_drag_start.1) / 2.0) as i32;
                    let new_x = window_drag_world_start.0 + dx;
                    let new_y = window_drag_world_start.1 + dy;
                    if let Some(w) = vm.windows.iter_mut().find(|w| w.id == window_drag_id) {
                        w.x = if new_x >= 0 { new_x as u32 } else { 0 };
                        w.y = if new_y >= 0 { new_y as u32 } else { 0 };
                    }
                }
            }

            if !mouse_down_now {
                window_drag_active = false;
            }
        }

        // ── Terminal text selection (Phase 157) ──────────────────
        // Mouse drag to select text when NOT in fullscreen map and NOT running
        // (i.e., in terminal/editor mode with VM paused)
        if !fullscreen_map && !is_running && mode == Mode::Terminal {
            let mouse_down_now = window.get_mouse_down(MouseButton::Left);
            let canvas_pixel_x = CANVAS_COLS * CANVAS_SCALE; // 32 * 16 = 512
            let canvas_pixel_y = CANVAS_ROWS * CANVAS_SCALE; // 32 * 16 = 512

            // Mouse press: start selection
            if mouse_down_now && !text_sel_active {
                if let Some((mx, my)) = window.get_mouse_pos(MouseMode::Clamp) {
                    // Convert host pixel to canvas row/col (accounting for scroll offset)
                    let col = (mx as usize) / CANVAS_SCALE;
                    let row = (my as usize) / CANVAS_SCALE + scroll_offset;
                    if col < CANVAS_COLS
                        && row < CANVAS_MAX_ROWS
                        && (mx as usize) < canvas_pixel_x
                        && (my as usize) < canvas_pixel_y
                    {
                        text_sel_active = true;
                        text_sel_start = (row, col);
                        text_sel_end = (row, col);
                        text_sel_anchor = None; // clear previous selection
                    }
                }
            }

            // Mouse drag: update selection end
            if text_sel_active && mouse_down_now {
                if let Some((mx, my)) = window.get_mouse_pos(MouseMode::Clamp) {
                    let col = ((mx as usize) / CANVAS_SCALE).min(CANVAS_COLS - 1);
                    let row = (my as usize) / CANVAS_SCALE + scroll_offset;
                    let row = row.min(CANVAS_MAX_ROWS - 1);
                    if (mx as usize) < canvas_pixel_x && (my as usize) < canvas_pixel_y {
                        text_sel_end = (row, col);
                    }
                }
            }

            // Mouse release: finalize selection
            if !mouse_down_now && text_sel_active {
                text_sel_active = false;
                // Only keep selection if start != end (non-trivial selection)
                if text_sel_start != text_sel_end {
                    text_sel_anchor = Some((text_sel_start, text_sel_end));
                } else {
                    text_sel_anchor = None;
                }
            }

            // Phase 162: Ctrl+click toggles cursor style (Block -> Underline -> Bar)
            if mouse_down_now
                && !text_sel_active
                && (window.is_key_down(Key::LeftCtrl) || window.is_key_down(Key::RightCtrl))
            {
                let prev_style = cursor_style;
                cursor_style = cursor_style.next();
                // Reset blink timer so cursor is immediately visible after toggle
                cursor_blink_on = true;
                cursor_blink_timer = std::time::Instant::now();
                status_msg = format!("[Cursor: {} -> {}]", prev_style.name(), cursor_style.name());
            }

            // Middle-click paste
            if window.get_mouse_down(MouseButton::Middle) {
                if !clipboard.is_empty() {
                    for ch in clipboard.chars() {
                        if cursor_col < CANVAS_COLS - 1 {
                            let idx = cursor_row * CANVAS_COLS + cursor_col;
                            canvas_buffer[idx] = ch as u32;
                            cursor_col += 1;
                        }
                    }
                    text_sel_anchor = None;
                }
            }
        }

        if fullscreen_mode {
            // Scale the 1024x768 buffer into the fullscreen buffer
            scale_buffer_to_fullscreen(&buffer, WIDTH, HEIGHT, &mut fs_buffer, fs_win_w, fs_win_h);
            if let Err(e) = window.update_with_buffer(&fs_buffer, fs_win_w, fs_win_h) {
                eprintln!("Render error: {}. Exiting.", e);
                break;
            }
        } else {
            if let Err(e) = window.update_with_buffer(&buffer, WIDTH, HEIGHT) {
                eprintln!("Render error: {}. Exiting.", e);
                break;
            }
            // Mirror 256x256 palace region to /dev/palace kernel buffer
            if palace_device.is_available() {
                let palace_bytes = unsafe {
                    std::slice::from_raw_parts(
                        buffer.as_ptr() as *const u8,
                        (256 * 256 * 4).min(buffer.len() * 4),
                    )
                };
                palace_device.write_buffer(palace_bytes, 0);
            }
        }

        if recording {
            let path = format!("/tmp/geo_frames/frame_{:05}.png", frame_id);
            if let Err(e) = save_full_buffer_png(&path, &buffer, WIDTH, HEIGHT) {
                status_msg = format!("[rec error: {}]", e);
                recording = false;
            } else {
                frame_id += 1;
            }
        }
    }
}
