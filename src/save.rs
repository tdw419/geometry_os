// save.rs -- Save/load state, PNG screenshot for Geometry OS

use crate::inode_fs;
use crate::vfs;
use crate::vm;
use crate::vm::RAM_SIZE;
use std::path::Path;

/// Read a little-endian u32 from a byte slice at the given offset.
/// Returns InvalidData if the slice doesn't have 4 bytes available.
fn read_u32_le(data: &[u8], offset: usize) -> std::io::Result<u32> {
    if offset + 4 > data.len() {
        return Err(std::io::Error::new(
            std::io::ErrorKind::UnexpectedEof,
            format!(
                "unexpected end of data at offset {} (need 4 bytes, have {})",
                offset,
                data.len()
            ),
        ));
    }
    Ok(u32::from_le_bytes([
        data[offset],
        data[offset + 1],
        data[offset + 2],
        data[offset + 3],
    ]))
}

pub fn save_screen_png(path: &str, screen: &[u32]) -> std::io::Result<()> {
    let file = std::fs::File::create(path)?;
    let w = &mut std::io::BufWriter::new(file);
    let mut encoder = png::Encoder::new(w, 256, 256);
    encoder.set_color(png::ColorType::Rgb);
    encoder.set_depth(png::BitDepth::Eight);
    let mut writer = encoder.write_header()?;
    let mut raw_data = Vec::with_capacity(256 * 256 * 3);
    for pixel in screen {
        raw_data.push((pixel >> 16) as u8); // R
        raw_data.push((pixel >> 8) as u8); // G
        raw_data.push(*pixel as u8); // B
    }
    writer.write_image_data(&raw_data)?;
    Ok(())
}

pub fn save_full_buffer_png(path: &str, buffer: &[u32], w: usize, h: usize) -> std::io::Result<()> {
    let file = std::fs::File::create(path)?;
    let writer = &mut std::io::BufWriter::new(file);
    let mut encoder = png::Encoder::new(writer, w as u32, h as u32);
    encoder.set_color(png::ColorType::Rgb);
    encoder.set_depth(png::BitDepth::Eight);
    let mut writer = encoder.write_header()?;
    let mut raw_data = Vec::with_capacity(w * h * 3);
    for &pixel in buffer {
        raw_data.push((pixel >> 16) as u8); // R
        raw_data.push((pixel >> 8) as u8); // G
        raw_data.push(pixel as u8); // B
    }
    writer.write_image_data(&raw_data)?;
    Ok(())
}

/// Save full application state (VM + canvas) to a binary file.
/// Format: VM save (see vm.rs) + canvas_len u32 + canvas_buffer + canvas_assembled u8
pub fn save_state(
    path: &str,
    vm: &vm::Vm,
    canvas_buffer: &[u32],
    canvas_assembled: bool,
) -> std::io::Result<()> {
    use std::io::Write;
    // Save VM state first
    vm.save_to_file(Path::new(path))?;
    // Append canvas data
    let mut f = std::fs::OpenOptions::new().append(true).open(path)?;
    let canvas_len = canvas_buffer.len() as u32;
    f.write_all(&canvas_len.to_le_bytes())?;
    for &v in canvas_buffer {
        f.write_all(&v.to_le_bytes())?;
    }
    f.write_all(&[if canvas_assembled { 1 } else { 0 }])?;
    Ok(())
}

/// Load full application state from a binary file.
/// Returns (vm, canvas_buffer, canvas_assembled) on success.
pub fn load_state(path: &str) -> std::io::Result<(vm::Vm, Vec<u32>, bool)> {
    use std::io::Read;
    let mut data = Vec::new();
    let mut f = std::fs::File::open(path)?;
    f.read_to_end(&mut data)?;

    // Read VM portion -- includes rand_state (4) + frame_count (4) after screen
    let vm_min = 4 + 4 + 1 + 4 + vm::NUM_REGS * 4 + vm::RAM_SIZE * 4 + vm::SCREEN_SIZE * 4
        + 4 /* rand_state */ + 4; /* frame_count */
    if data.len() < vm_min + 4 {
        return Err(std::io::Error::new(
            std::io::ErrorKind::InvalidData,
            format!(
                "save file too small: {} bytes (need at least {} for VM + canvas header)",
                data.len(),
                vm_min + 4
            ),
        ));
    }

    // Parse VM from the raw bytes (same logic as Vm::load_from_file)
    if data.len() < 4 || &data[0..4] != vm::SAVE_MAGIC {
        return Err(std::io::Error::new(
            std::io::ErrorKind::InvalidData,
            "invalid magic bytes",
        ));
    }
    let version = read_u32_le(&data, 4)?;
    if !(1..=vm::SAVE_VERSION).contains(&version) {
        return Err(std::io::Error::new(
            std::io::ErrorKind::InvalidData,
            format!(
                "unsupported save version: {} (need 1-{})",
                version,
                vm::SAVE_VERSION
            ),
        ));
    }

    let mut off = 8usize;
    if off >= data.len() {
        return Err(std::io::Error::new(
            std::io::ErrorKind::InvalidData,
            "save file truncated at halted field",
        ));
    }
    let halted = data[off] != 0;
    off += 1;
    let pc = read_u32_le(&data, off)?;
    off += 4;

    let mut regs = [0u32; vm::NUM_REGS];
    for r in regs.iter_mut() {
        *r = read_u32_le(&data, off)?;
        off += 4;
    }
    let mut ram = vec![0u32; vm::RAM_SIZE];
    for v in ram.iter_mut() {
        *v = read_u32_le(&data, off)?;
        off += 4;
    }
    let mut screen = vec![0u32; vm::SCREEN_SIZE];
    for v in screen.iter_mut() {
        *v = read_u32_le(&data, off)?;
        off += 4;
    }

    let rand_state = read_u32_le(&data, off)?;
    off += 4;
    let frame_count = read_u32_le(&data, off)?;
    off += 4;

    // v3 fields: building_metadata + coordinate_metadata (empty if v1/v2)
    let (building_metadata, coordinate_metadata) = if version >= 3 {
        use std::collections::HashMap;
        // building_metadata: HashMap<u32, HashMap<String, String>>
        let building_metadata = {
            let count = read_u32_le(&data, off)? as usize;
            off += 4;
            let mut m = HashMap::new();
            for _ in 0..count {
                let building_id = read_u32_le(&data, off)?;
                off += 4;
                let inner_count = read_u32_le(&data, off)? as usize;
                off += 4;
                let mut inner = HashMap::new();
                for _ in 0..inner_count {
                    let k_len = read_u32_le(&data, off)? as usize;
                    off += 4;
                    if off + k_len + 4 > data.len() {
                        return Err(std::io::Error::new(
                            std::io::ErrorKind::InvalidData,
                            "truncated in building_metadata key",
                        ));
                    }
                    let k = String::from_utf8_lossy(&data[off..off + k_len]).to_string();
                    off += k_len;
                    let v_len = read_u32_le(&data, off)? as usize;
                    off += 4;
                    if off + v_len > data.len() {
                        return Err(std::io::Error::new(
                            std::io::ErrorKind::InvalidData,
                            "truncated in building_metadata value",
                        ));
                    }
                    let v = String::from_utf8_lossy(&data[off..off + v_len]).to_string();
                    off += v_len;
                    inner.insert(k, v);
                }
                m.insert(building_id, inner);
            }
            m
        };
        let coordinate_metadata = {
            let count = read_u32_le(&data, off)? as usize;
            off += 4;
            let mut m = HashMap::new();
            for _ in 0..count {
                let coord_key = {
                    if off + 8 > data.len() {
                        return Err(std::io::Error::new(
                            std::io::ErrorKind::InvalidData,
                            "truncated in coord key",
                        ));
                    }
                    let bytes: [u8; 8] = [
                        data[off],
                        data[off + 1],
                        data[off + 2],
                        data[off + 3],
                        data[off + 4],
                        data[off + 5],
                        data[off + 6],
                        data[off + 7],
                    ];
                    off += 8;
                    u64::from_le_bytes(bytes)
                };
                let inner_count = read_u32_le(&data, off)? as usize;
                off += 4;
                let mut inner = HashMap::new();
                for _ in 0..inner_count {
                    let k_len = read_u32_le(&data, off)? as usize;
                    off += 4;
                    if off + k_len + 4 > data.len() {
                        return Err(std::io::Error::new(
                            std::io::ErrorKind::InvalidData,
                            "truncated in coord metadata key",
                        ));
                    }
                    let k = String::from_utf8_lossy(&data[off..off + k_len]).to_string();
                    off += k_len;
                    let v_len = read_u32_le(&data, off)? as usize;
                    off += 4;
                    if off + v_len > data.len() {
                        return Err(std::io::Error::new(
                            std::io::ErrorKind::InvalidData,
                            "truncated in coord metadata value",
                        ));
                    }
                    let v = String::from_utf8_lossy(&data[off..off + v_len]).to_string();
                    off += v_len;
                    inner.insert(k, v);
                }
                m.insert(coord_key, inner);
            }
            m
        };
        (building_metadata, coordinate_metadata)
    } else {
        (
            std::collections::HashMap::new(),
            std::collections::HashMap::new(),
        )
    };

    // v4 fields: buildings Vec (empty if v1/v2/v3)
    let buildings = if version >= 4 {
        let count = read_u32_le(&data, off)? as usize;
        off += 4;
        let mut bldgs = Vec::with_capacity(count);
        for _ in 0..count {
            if off + 20 > data.len() {
                return Err(std::io::Error::new(
                    std::io::ErrorKind::InvalidData,
                    "truncated in building data",
                ));
            }
            let id = read_u32_le(&data, off)?;
            off += 4;
            let x = read_u32_le(&data, off)? as i32;
            off += 4;
            let y = read_u32_le(&data, off)? as i32;
            off += 4;
            let type_color = read_u32_le(&data, off)?;
            off += 4;
            let name_len = read_u32_le(&data, off)? as usize;
            off += 4;
            if off + name_len > data.len() {
                return Err(std::io::Error::new(
                    std::io::ErrorKind::InvalidData,
                    "truncated in building name",
                ));
            }
            let name = String::from_utf8_lossy(&data[off..off + name_len]).to_string();
            off += name_len;
            bldgs.push(vm::Building {
                id,
                x,
                y,
                type_color,
                name,
            });
        }
        bldgs
    } else {
        Vec::new()
    };

    let vm = vm::Vm {
        ram,
        regs,
        pc,
        screen,
        back_buffer: Vec::new(),
        back_buffer_active: false,
        sprite_layer: vec![0; vm::SCREEN_SIZE],
        sprite_layer_active: false,
        assembler_labels: std::collections::HashMap::new(),
        buildings,
        nav_path: Vec::new(),
        halted,
        shutdown_requested: false,
        breakpoint_hit: false,
        frame_ready: false,
        rand_state,
        frame_count,
        beep: None,
        note: None,
        audio_play: None,
        audio_stop: false,
        audio_status_query: false,
        debug_mode: false,
        access_log: Vec::new(),
        processes: Vec::new(),
        mode: vm::CpuMode::Kernel,
        kernel_stack: Vec::new(),
        allocated_pages: 0b11,
        page_ref_count: {
            let mut rc = [0u32; vm::NUM_RAM_PAGES];
            rc[0] = 1;
            rc[1] = 1;
            rc
        },
        page_cow: 0,
        current_page_dir: None,
        current_vmas: Vec::new(),
        segfault_pid: 0,
        segfault: false,
        vfs: vfs::Vfs::new(),
        inode_fs: inode_fs::InodeFs::new(),
        current_pid: 0,
        current_capabilities: None,
        sched_tick: 0,
        default_time_slice: vm::DEFAULT_TIME_SLICE,
        yielded: false,
        wants_block: false,
        pending_wakes: Vec::new(),
        sleep_frames: 0,
        new_priority: 0,
        pipes: Vec::new(),
        mutexes: Vec::new(),
        semaphores: Vec::new(),
        pipe_created: false,
        msg_sender: 0,
        msg_data: [0; vm::MSG_WORDS],
        msg_recv_requested: false,
        env_vars: std::collections::HashMap::new(),
        building_metadata,
        coordinate_metadata,
        booted: false,
        kernel_font_mode: 0,
        step_exit_code: None,
        step_zombie: false,
        hypervisor_active: false,
        hypervisor_config: String::new(),
        hypervisor_mode: vm::HypervisorMode::default(),
        hypervisor_window_id: 0,
        hypervisor_input_queue: Vec::new(),
        hypervisor_input_pending: false,
        hypervisor_mailbox: [0u32; 64],
        opcode_histogram: [0; 256],
        total_steps: 0,
        profile_regions: [0; 16],
        profile_active: [false; 16],
        profile_start: [0; 16],
        canvas_buffer: vec![0; vm::CANVAS_RAM_SIZE],
        key_buffer: vec![0; 256],
        key_buffer_head: 0,
        key_buffer_tail: 0,
        key_port: 0,
        key_bitmask: 0,
        formulas: Vec::new(),
        formula_dep_index: std::collections::HashMap::new(),
        trace_recording: false,
        trace_buffer: vm::TraceBuffer::new(vm::DEFAULT_TRACE_CAPACITY),
        frame_checkpoints: vm::FrameCheckBuffer::new(vm::DEFAULT_FRAME_CHECK_CAPACITY),
        snapshots: Vec::new(),
        pixel_write_log: vm::PixelWriteLog::new(vm::DEFAULT_PIXEL_WRITE_CAPACITY),
        tcp_connections: (0..vm::MAX_TCP_CONNECTIONS).map(|_| None).collect(),
        pty_slots: (0..vm::MAX_PTY_SLOTS).map(|_| None).collect(),
        net_inbox: Vec::new(),
        hit_regions: Vec::with_capacity(vm::MAX_HIT_REGIONS),
        mouse_x: 0,
        mouse_y: 0,
        mouse_button: 0,
        mouse_event_buffer: vec![0; 64],
        mouse_event_x: vec![0; 64],
        mouse_event_y: vec![0; 64],
        mouse_event_head: 0,
        mouse_event_tail: 0,
        windows: Vec::with_capacity(vm::MAX_WINDOWS),
        next_window_id: 1,
        llm_mock_response: None,
        llm_config: None,
        hermes_mock_response: None,
        hermes_session_id: None,
        background_vms: Vec::new(),
        next_bg_vm_id: 1,
        segfault_addr: 0,
        pc_trace: [0; 16],
        pc_trace_idx: 0,
        crash_dialog_active: false,
        crash_dialog_pid: 0,
        live_hypervisor: None,
        mailbox_write_buf: vec![vm::MailboxEntry::default(); vm::MAILBOX_SIZE],
        mailbox_read_buf: vec![vm::MailboxEntry::default(); vm::MAILBOX_SIZE],
        host_file_handles: (0..vm::types::MAX_HOST_FILES).map(|_| None).collect(),
        focused_pid: 0,
        clip_rect: None,
        clipboard: Vec::new(),
        clipboard_text: Vec::new(),
        clipboard_history: Vec::new(),
        clipboard_history_head: 0,
        clipboard_history_count: 0,
        hash_tables: std::array::from_fn(|_| std::collections::HashMap::new()),
        hash_tables_active: 0,
        sprite_sheets: Default::default(),
        icache: vec![None; RAM_SIZE],
        icache_freq: vec![0; RAM_SIZE],
        icache_generation: 0,
        icache_hits: 0,
        icache_misses: 0,
        icache_hot_threshold: vm::types::ICACHE_HOT_THRESHOLD,
        render_logging: false,
        render_log: vm::RenderLog::new(vm::DEFAULT_RENDER_LOG_CAPACITY),
        // Phase 222: wall-clock timer (new epoch on load)
        epoch: std::time::Instant::now(),
        alarms: (0..vm::types::MAX_ALARMS)
            .map(|_| vm::types::WallAlarm {
                target_ms: 0,
                addr: 0,
                value: 0,
                active: false,
            })
            .collect(),
        // Infinite tile map (chunks loaded from separate files on disk)
        tile_store: crate::tile_store::TileStore::new(),
        // ── Phase 34: Area Agent Evolution ──────────────────────────
        area_manager: crate::kernel::area_manager::AreaManager::new(),
        pending_agent_actions: Vec::new(),
        #[cfg(feature = "gpu")]
        active_substrate: None,
        substrate_x: 0,
        substrate_y: 0,
        substrate_cmd: 0,
        substrate_arg1: 0,
        substrate_arg2: 0,
        substrate_status: 0,
        substrate_result: 0,
        // Phase P: Spatial File System
        spatial_files: std::collections::HashMap::new(),
        // Glyph Grid Layer (Phase Glyph)
        glyph_grid: crate::glyph_grid::GlyphGrid::new(),
        substrate_execution: false,
        sprite_layers: Default::default(),
    };

    // Parse canvas trailer
    let canvas_len = read_u32_le(&data, off)? as usize;
    off += 4;
    if off + canvas_len * 4 + 1 > data.len() {
        return Err(std::io::Error::new(
            std::io::ErrorKind::InvalidData,
            format!(
                "save file truncated in canvas data: need {} more bytes, have {}",
                off + canvas_len * 4 + 1 - data.len(),
                data.len() - off
            ),
        ));
    }
    let mut canvas_buffer = vec![0u32; canvas_len];
    for v in canvas_buffer.iter_mut() {
        *v = read_u32_le(&data, off)?;
        off += 4;
    }
    let canvas_assembled = data[off] != 0;

    Ok((vm, canvas_buffer, canvas_assembled))
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::vm::Vm;

    #[test]
    fn test_save_screen_png_roundtrip() {
        let temp_dir = std::env::temp_dir();
        let path = temp_dir.join("test_save_screen.png");
        let path_str = path.to_str().expect("temp dir path should be valid UTF-8");

        // Create a known screen pattern
        let mut screen = vec![0u32; 256 * 256];
        screen[0] = 0xFF0000; // red pixel at (0,0)
        screen[1] = 0x00FF00; // green pixel at (1,0)
        screen[256] = 0x0000FF; // blue pixel at (0,1)
        screen[257] = 0xFFFFFF; // white pixel at (1,1)

        save_screen_png(path_str, &screen).expect("save_screen_png should succeed");

        // Read back and verify
        let file = std::fs::File::open(&path).expect("saved PNG should exist");
        let decoder = png::Decoder::new(std::io::BufReader::new(file));
        let mut reader = decoder.read_info().expect("PNG header should be valid");
        assert_eq!(reader.info().width, 256);
        assert_eq!(reader.info().height, 256);

        let mut buf = vec![0u8; 256 * 256 * 3];
        reader
            .next_frame(&mut buf)
            .expect("PNG frame read should succeed");

        // Check pixel (0,0) = red
        assert_eq!(buf[0], 0xFF, "R channel of pixel (0,0)");
        assert_eq!(buf[1], 0x00, "G channel of pixel (0,0)");
        assert_eq!(buf[2], 0x00, "B channel of pixel (0,0)");

        // Check pixel (1,0) = green
        assert_eq!(buf[3], 0x00, "R channel of pixel (1,0)");
        assert_eq!(buf[4], 0xFF, "G channel of pixel (1,0)");
        assert_eq!(buf[5], 0x00, "B channel of pixel (1,0)");

        // Check pixel (0,1) = blue
        let off = 256 * 3;
        assert_eq!(buf[off], 0x00);
        assert_eq!(buf[off + 1], 0x00);
        assert_eq!(buf[off + 2], 0xFF);

        // Check pixel (1,1) = white
        assert_eq!(buf[off + 3], 0xFF);
        assert_eq!(buf[off + 4], 0xFF);
        assert_eq!(buf[off + 5], 0xFF);

        let _ = std::fs::remove_file(&path);
    }

    #[test]
    fn test_save_screen_png_all_black() {
        let temp_dir = std::env::temp_dir();
        let path = temp_dir.join("test_save_black.png");
        let path_str = path.to_str().expect("temp dir path should be valid UTF-8");

        let screen = vec![0u32; 256 * 256];
        save_screen_png(path_str, &screen).expect("save_screen_png should succeed");

        let file = std::fs::File::open(&path).expect("saved PNG should exist");
        let decoder = png::Decoder::new(std::io::BufReader::new(file));
        let mut reader = decoder.read_info().expect("PNG header should be valid");
        let mut buf = vec![0u8; 256 * 256 * 3];
        reader
            .next_frame(&mut buf)
            .expect("PNG frame read should succeed");

        assert!(
            buf.iter().all(|&b| b == 0),
            "all-black screen should produce all-zero bytes"
        );

        let _ = std::fs::remove_file(&path);
    }

    #[test]
    fn test_save_screen_png_all_white() {
        let temp_dir = std::env::temp_dir();
        let path = temp_dir.join("test_save_white.png");
        let path_str = path.to_str().expect("temp dir path should be valid UTF-8");

        let screen = vec![0xFFFFFFu32; 256 * 256];
        save_screen_png(path_str, &screen).expect("save_screen_png should succeed");

        let file = std::fs::File::open(&path).expect("saved PNG should exist");
        let decoder = png::Decoder::new(std::io::BufReader::new(file));
        let mut reader = decoder.read_info().expect("PNG header should be valid");
        let mut buf = vec![0u8; 256 * 256 * 3];
        reader
            .next_frame(&mut buf)
            .expect("PNG frame read should succeed");

        assert!(
            buf.iter().all(|&b| b == 0xFF),
            "all-white screen should produce all-0xFF bytes"
        );

        let _ = std::fs::remove_file(&path);
    }

    #[test]
    fn test_save_full_buffer_png_custom_size() {
        let temp_dir = std::env::temp_dir();
        let path = temp_dir.join("test_save_custom.png");
        let path_str = path.to_str().expect("temp dir path should be valid UTF-8");

        let w = 64;
        let h = 32;
        let buffer = vec![0x12345678u32; w * h];

        save_full_buffer_png(path_str, &buffer, w, h).expect("save_full_buffer_png should succeed");

        let file = std::fs::File::open(&path).expect("saved PNG should exist");
        let decoder = png::Decoder::new(std::io::BufReader::new(file));
        let mut reader = decoder.read_info().expect("PNG header should be valid");
        assert_eq!(reader.info().width, w as u32);
        assert_eq!(reader.info().height, h as u32);

        let mut buf = vec![0u8; w * h * 3];
        reader
            .next_frame(&mut buf)
            .expect("PNG frame read should succeed");

        // save_full_buffer_png extracts RGB from u32 as: R=(pixel>>16), G=(pixel>>8), B=pixel
        // So 0x12345678 -> R=0x34, G=0x56, B=0x78
        assert_eq!(buf[0], 0x34);
        assert_eq!(buf[1], 0x56);
        assert_eq!(buf[2], 0x78);

        let _ = std::fs::remove_file(&path);
    }

    #[test]
    fn test_save_load_state_roundtrip() {
        let temp_dir = std::env::temp_dir();
        let path = temp_dir.join("test_save_state.bin");
        let path_str = path.to_str().expect("temp dir path should be valid UTF-8");

        // Create a VM with known state
        let mut vm = Vm::new();
        vm.pc = 42;
        vm.regs[0] = 100;
        vm.regs[5] = 200;
        vm.ram[100] = 0xDEADBEEF;
        vm.halted = false;
        vm.screen[0] = 0xFF0000;

        let canvas = vec![0x00FF00u32; 1024];
        let canvas_assembled = true;

        save_state(path_str, &vm, &canvas, canvas_assembled).expect("save_state should succeed");

        // Load back
        let (loaded_vm, loaded_canvas, loaded_assembled) =
            load_state(path_str).expect("load_state should succeed on valid save");

        assert_eq!(loaded_vm.pc, 42);
        assert_eq!(loaded_vm.regs[0], 100);
        assert_eq!(loaded_vm.regs[5], 200);
        assert_eq!(loaded_vm.ram[100], 0xDEADBEEF);
        assert!(!loaded_vm.halted);
        assert_eq!(loaded_vm.screen[0], 0xFF0000);
        assert_eq!(loaded_canvas.len(), 1024);
        assert_eq!(loaded_canvas[0], 0x00FF00);
        assert!(loaded_assembled);

        let _ = std::fs::remove_file(&path);
    }

    #[test]
    fn test_load_state_invalid_magic() {
        let temp_dir = std::env::temp_dir();
        let path = temp_dir.join("test_invalid_magic.bin");
        // Create a file large enough to pass the size check but with wrong magic
        let vm_min =
            4 + 4 + 1 + 4 + vm::NUM_REGS * 4 + vm::RAM_SIZE * 4 + vm::SCREEN_SIZE * 4 + 4 + 4; // +rand_state +frame_count
        let data_size = vm_min + 4 + 1; // vm_min + canvas_len (4) + canvas_assembled (1)
        let mut data = vec![0u8; data_size];
        data[0] = b'B';
        data[1] = b'A';
        data[2] = b'D';
        data[3] = b'!'; // wrong magic
        std::fs::write(&path, &data).expect("write test file should succeed");

        let result = load_state(path.to_str().expect("path should be valid UTF-8"));
        assert!(result.is_err());
        assert!(result
            .expect_err("should be error")
            .to_string()
            .contains("invalid magic"));

        let _ = std::fs::remove_file(&path);
    }

    #[test]
    fn test_load_state_too_small() {
        let temp_dir = std::env::temp_dir();
        let path = temp_dir.join("test_too_small.bin");
        // Write valid magic but way too small
        std::fs::write(
            &path,
            [
                vm::SAVE_MAGIC[0],
                vm::SAVE_MAGIC[1],
                vm::SAVE_MAGIC[2],
                vm::SAVE_MAGIC[3],
                0,
                0,
                0,
                0,
                0,
            ],
        )
        .expect("write test file should succeed");

        let result = load_state(path.to_str().expect("path should be valid UTF-8"));
        assert!(result.is_err());

        let _ = std::fs::remove_file(&path);
    }

    #[test]
    fn test_load_state_truncated_at_canvas() {
        let temp_dir = std::env::temp_dir();
        let path = temp_dir.join("test_truncated_canvas.bin");
        // Create a valid VM portion but with canvas_len claiming more data than exists
        // v2: magic(4)+version(4)+halted(1)+pc(4)+regs(128)+ram+screen+rand(4)+frame(4)
        let vm_min =
            4 + 4 + 1 + 4 + vm::NUM_REGS * 4 + vm::RAM_SIZE * 4 + vm::SCREEN_SIZE * 4 + 4 + 4;
        // v3 adds empty building_metadata count (4) + empty coordinate_metadata count (4)
        let v3_trailer = 8;
        let data_size = vm_min + v3_trailer + 4; // vm_min + v3 trailer + canvas_len field, but no canvas data
        let mut data = vec![0u8; data_size];
        // Write valid magic and version
        data[0..4].copy_from_slice(vm::SAVE_MAGIC);
        data[4..8].copy_from_slice(&3u32.to_le_bytes());
        // Set canvas_len to 100 (but no canvas data follows)
        let canvas_len_offset = vm_min + v3_trailer;
        data[canvas_len_offset..canvas_len_offset + 4].copy_from_slice(&100u32.to_le_bytes());
        std::fs::write(&path, &data).expect("write test file should succeed");

        let result = load_state(path.to_str().expect("path should be valid UTF-8"));
        assert!(result.is_err());
        let err = result.expect_err("should be error");
        assert!(
            err.to_string().contains("truncated in canvas data"),
            "error should mention canvas truncation, got: {}",
            err
        );

        let _ = std::fs::remove_file(&path);
    }

    #[test]
    fn test_read_u32_le_out_of_bounds() {
        let data = vec![0u8; 2]; // too short for a u32
        let result = read_u32_le(&data, 0);
        assert!(result.is_err());
        let err = result.expect_err("should be error");
        assert!(err.to_string().contains("unexpected end of data"));
    }

    #[test]
    fn test_read_u32_le_valid() {
        let data = vec![0x78, 0x56, 0x34, 0x12]; // little-endian 0x12345678
        let result = read_u32_le(&data, 0).expect("read should succeed");
        assert_eq!(result, 0x12345678);
    }

    #[test]
    fn test_save_load_multiple_times() {
        // Test that repeated save/load cycles preserve state
        let temp_dir = std::env::temp_dir();
        let path = temp_dir.join("test_multi_cycle.bin");
        let path_str = path.to_str().expect("temp dir path should be valid UTF-8");

        for cycle in 0..3 {
            let cidx = cycle as usize;
            // Create VM with cycle-specific data
            let mut vm = Vm::new();
            vm.pc = (cidx * 10) as u32;
            vm.regs[0] = (cidx * 100) as u32;
            vm.ram[cidx * 10] = ((cidx * 0x11111111) as u64 & 0xFFFFFFFF) as u32;
            vm.screen[cidx] = (cidx * 0x2222) as u32;

            let canvas = vec![cycle as u32; 1024];
            let canvas_assembled = cycle % 2 == 0;

            save_state(path_str, &vm, &canvas, canvas_assembled)
                .expect("save_state should succeed");

            // Load back
            let (loaded_vm, loaded_canvas, loaded_assembled) =
                load_state(path_str).expect("load_state should succeed");

            assert_eq!(loaded_vm.pc, (cidx * 10) as u32);
            assert_eq!(loaded_vm.regs[0], (cidx * 100) as u32);
            assert_eq!(
                loaded_vm.ram[cidx * 10],
                ((cidx * 0x11111111) as u64 & 0xFFFFFFFF) as u32
            );
            assert_eq!(loaded_vm.screen[cidx], (cidx * 0x2222) as u32);
            assert!(loaded_canvas.iter().all(|&v| v == cycle as u32));
            assert_eq!(loaded_assembled, canvas_assembled);
        }

        let _ = std::fs::remove_file(&path);
    }

    #[test]
    fn test_save_load_canvas_empty() {
        let temp_dir = std::env::temp_dir();
        let path = temp_dir.join("test_empty_canvas.bin");
        let path_str = path.to_str().expect("temp dir path should be valid UTF-8");

        let vm = Vm::new();
        let canvas = vec![]; // Empty canvas
        let canvas_assembled = false;

        save_state(path_str, &vm, &canvas, canvas_assembled)
            .expect("save_state should succeed with empty canvas");

        let (loaded_vm, loaded_canvas, loaded_assembled) =
            load_state(path_str).expect("load_state should succeed");

        assert_eq!(loaded_canvas.len(), 0);
        assert!(!loaded_assembled);

        let _ = std::fs::remove_file(&path);
    }

    #[test]
    fn test_save_load_with_process_state() {
        let temp_dir = std::env::temp_dir();
        let path = temp_dir.join("test_process_state.bin");
        let path_str = path.to_str().expect("temp dir path should be valid UTF-8");

        let mut vm = Vm::new();

        // Set up a process (if the VM supports it)
        vm.pc = 0x1000;
        vm.regs[1] = 0xDEADBEEF;
        vm.ram[0x2000] = 0xCAFEBABE;
        vm.halted = false;

        let canvas = vec![0x12345678u32; 512];
        let canvas_assembled = true;

        save_state(path_str, &vm, &canvas, canvas_assembled).expect("save_state should succeed");

        let (loaded_vm, loaded_canvas, loaded_assembled) =
            load_state(path_str).expect("load_state should succeed");

        assert_eq!(loaded_vm.pc, 0x1000);
        assert_eq!(loaded_vm.regs[1], 0xDEADBEEF);
        assert_eq!(loaded_vm.ram[0x2000], 0xCAFEBABE);
        assert!(!loaded_vm.halted);
        assert_eq!(loaded_canvas[0], 0x12345678);
        assert!(loaded_assembled);

        let _ = std::fs::remove_file(&path);
    }

    #[test]
    fn test_save_large_canvas() {
        let temp_dir = std::env::temp_dir();
        let path = temp_dir.join("test_large_canvas.bin");
        let path_str = path.to_str().expect("temp dir path should be valid UTF-8");

        let vm = Vm::new();

        // Create a large canvas (full canvas buffer size is 4096)
        let canvas_size = 4096;
        let canvas: Vec<u32> = (0..canvas_size).map(|i| (i * 0x01010101) as u32).collect();
        let canvas_assembled = true;

        save_state(path_str, &vm, &canvas, canvas_assembled)
            .expect("save_state should succeed with large canvas");

        let (loaded_vm, loaded_canvas, loaded_assembled) =
            load_state(path_str).expect("load_state should succeed");

        assert_eq!(loaded_canvas.len(), canvas_size);
        for i in 0..canvas_size {
            assert_eq!(loaded_canvas[i], (i * 0x01010101) as u32);
        }
        assert!(loaded_assembled);

        let _ = std::fs::remove_file(&path);
    }

    #[test]
    fn test_save_integrity_random_data() {
        let temp_dir = std::env::temp_dir();
        let path = temp_dir.join("test_random_data.bin");
        let path_str = path.to_str().expect("temp dir path should be valid UTF-8");

        let mut vm = Vm::new();

        // Fill RAM with random-looking patterns
        for i in 0..1000usize {
            vm.ram[i] = (i as u32)
                .wrapping_mul(0x9E3779B9u32)
                .wrapping_add(0x85EBCA77u32);
        }
        vm.regs[5] = 0x12345678;
        vm.regs[10] = 0x9ABCDEF0;
        vm.pc = 0x8000;

        let canvas: Vec<u32> = (0..1024)
            .map(|i| ((i as u32).wrapping_mul(0x6A09E667u32) ^ 0xBB67AE85u32))
            .collect();
        let canvas_assembled = false;

        save_state(path_str, &vm, &canvas, canvas_assembled).expect("save_state should succeed");

        let (loaded_vm, loaded_canvas, loaded_assembled) =
            load_state(path_str).expect("load_state should succeed");

        // Verify RAM preserved correctly
        for i in 0..1000usize {
            assert_eq!(
                loaded_vm.ram[i],
                (i as u32)
                    .wrapping_mul(0x9E3779B9u32)
                    .wrapping_add(0x85EBCA77u32),
                "RAM[{}] mismatch",
                i
            );
        }
        assert_eq!(loaded_vm.regs[10], 0x9ABCDEF0);
        assert_eq!(loaded_vm.pc, 0x8000);
        assert_eq!(loaded_canvas.len(), 1024);
        for i in 0..1024usize {
            let expected = (i as u32).wrapping_mul(0x6A09E667u32) ^ 0xBB67AE85u32;
            assert_eq!(loaded_canvas[i], expected, "canvas[{}] mismatch", i);
        }
        assert!(!loaded_assembled);

        let _ = std::fs::remove_file(&path);
    }
}
