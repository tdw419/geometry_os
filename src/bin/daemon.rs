// Headless GPU Dispatch Daemon -- HTTP Server
//
// Initializes GPU without a surface (headless), compiles the
// glyph_vm_scheduler.wgsl compute shader, and serves an HTTP API
// for loading and executing programs at runtime.
//
// Endpoints:
//   POST /api/v1/programs          - Load and execute a program (JSON body or .gasm text)
//   GET  /api/v1/status            - Daemon status and VM states
//   GET  /api/v1/programs          - List loaded programs
//   POST /api/v1/dispatch          - Dispatch one frame of compute
//   GET  /api/v1/substrate/{addr}  - Read substrate pixels
//
// Usage: cargo run --bin daemon [--port PORT]

use pixels_move_pixels::assembler;
use pixels_move_pixels::filmstrip;
use pixels_move_pixels::gasm;
use pixels_move_pixels::software_vm::SoftwareVm;
use pixels_move_pixels::substrate::RegionAllocator;
use pixels_move_pixels::vm::{vm_state, GlyphVm};
use pixels_move_pixels::{font_atlas, MAX_VMS};

use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::io::{BufRead, Read, Write};
use std::net::TcpListener;
#[allow(unused_imports)]
use std::os::unix::net::{UnixListener, UnixStream};
use std::sync::{Arc, Mutex};

// ── Data types ──

#[derive(Debug, Serialize, Deserialize)]
struct LoadProgramRequest {
    /// .gasm source text (assembled server-side)
    #[serde(rename = "gasm")]
    gasm_source: Option<String>,
    /// Raw pixel data as hex string (e.g. "01000000 64000000")
    #[serde(rename = "pixels")]
    pixels_hex: Option<String>,
    /// Raw pixel data as array of u32 integers
    #[serde(rename = "pixelsRaw")]
    pixels_raw: Option<Vec<u32>>,
    /// VM slot to spawn (0-7). Default: first free slot
    vm_id: Option<u32>,
    /// Name/label for the program
    name: Option<String>,
    /// If true, treat input as a film strip (multi-frame program)
    filmstrip: Option<bool>,
}

#[derive(Debug, Serialize, Deserialize)]
struct LoadProgramResponse {
    success: bool,
    program_id: String,
    address: u32,
    pixel_count: usize,
    vm_id: u32,
    message: String,
}

#[derive(Debug, Serialize, Deserialize)]
struct StatusResponse {
    running: bool,
    vm_states: Vec<VmStatus>,
    programs_loaded: usize,
    uptime_secs: u64,
}

#[derive(Debug, Serialize, Deserialize)]
struct VmStatus {
    vm_id: u32,
    state: String,
    pc: u32,
    cycles: u32,
    halted: bool,
    entry_point: u32,
    frame_ptr: u32,
    frame_count: u32,
    /// First 16 registers (r0-r15) for lightweight status display.
    regs: [u32; 16],
    /// Base address of this VM's allocated region.
    base_addr: u32,
    /// Bound (end) address of this VM's allocated region.
    bound_addr: u32,
    /// Recent frame transitions for this VM (max 64, ring buffer).
    jump_log: Vec<FrameTransition>,
    /// Symbolic frame labels for this VM's loaded filmstrip (empty if no labels).
    frame_labels: HashMap<String, usize>,
}

#[derive(Debug, Serialize, Deserialize)]
struct DispatchResponse {
    success: bool,
    frame: u32,
    vm_results: Vec<VmResult>,
}

#[derive(Debug, Serialize, Deserialize)]
struct VmResult {
    vm_id: u32,
    halted: bool,
    cycles: u32,
    pc: u32,
}

#[derive(Debug)]
#[allow(dead_code)]
struct LoadedProgram {
    id: String,
    name: String,
    address: u32,
    pixel_count: usize,
    vm_id: u32,
    pixels: Vec<u32>,
    is_filmstrip: bool,
    frame_count: u32,
    /// Symbolic frame labels (e.g. {"Boot": 0, "Loop": 1}) for UI display.
    frame_labels: HashMap<String, usize>,
}

// ── Frame transition tracking ──

/// Maximum transitions stored per VM (ring buffer size).
const JUMP_LOG_SIZE: usize = 64;

/// A single frame transition event, recorded when frame_ptr changes.
#[derive(Debug, Clone, Serialize, Deserialize)]
struct FrameTransition {
    /// VM that transitioned.
    vm_id: u32,
    /// Frame index before the transition.
    from_frame: u32,
    /// Frame index after the transition.
    to_frame: u32,
    /// PC at the moment of transition (where the FRAME opcode or HALT was).
    pc_at_transition: u32,
    /// What caused the transition: "auto_advance" (HALT-driven) or "frame_opcode" (explicit FRAME).
    cause: String,
    /// Daemon frame (dispatch tick) when this occurred.
    dispatch_frame: u32,
}

/// Per-VM ring buffer of recent frame transitions.
struct JumpLog {
    entries: Vec<FrameTransition>,
    cursor: usize,
}

impl JumpLog {
    fn new() -> Self {
        Self {
            entries: Vec::with_capacity(JUMP_LOG_SIZE),
            cursor: 0,
        }
    }

    fn push(&mut self, entry: FrameTransition) {
        if self.entries.len() < JUMP_LOG_SIZE {
            self.entries.push(entry);
        } else {
            self.entries[self.cursor] = entry;
        }
        self.cursor = (self.cursor + 1) % JUMP_LOG_SIZE;
    }

    /// Return entries in chronological order (oldest first).
    fn recent(&self) -> Vec<&FrameTransition> {
        if self.entries.len() < JUMP_LOG_SIZE {
            self.entries.iter().collect()
        } else {
            // Ring buffer is full: cursor points to oldest entry.
            let mut ordered = Vec::with_capacity(JUMP_LOG_SIZE);
            for i in 0..JUMP_LOG_SIZE {
                let idx = (self.cursor + i) % JUMP_LOG_SIZE;
                ordered.push(&self.entries[idx]);
            }
            ordered
        }
    }

    /// Clear the log (e.g., when a VM is recycled).
    fn clear(&mut self) {
        self.entries.clear();
        self.cursor = 0;
    }
}

// ── Daemon state ──

struct DaemonState {
    vm: GlyphVm,
    allocator: RegionAllocator,
    programs: Vec<LoadedProgram>,
    frame_count: u32,
    started_at: std::time::Instant,
    /// Per-VM jump logs (indexed by VM id).
    jump_logs: [JumpLog; MAX_VMS as usize],
    /// Snapshot of each VM's frame_ptr from the previous dispatch.
    prev_frame_ptrs: [u32; MAX_VMS as usize],
}

impl DaemonState {
    fn new() -> Self {
        eprintln!("[daemon] Initializing GPU...");
        let vm = GlyphVm::new();
        eprintln!("[daemon] GPU initialized. Loading font atlas...");

        // Load font atlas
        font_atlas::load_into_substrate(vm.substrate());

        // Build bold atlas using software VM
        let atlas_program = assembler::bold_atlas_builder();
        let mut svm = SoftwareVm::new();
        svm.load_font_atlas();
        svm.load_program(0x1000, &atlas_program.pixels);
        svm.spawn_vm(0, 0x1000);
        for _ in 0..2000 {
            if svm.vm_state(0).halted != 0 {
                break;
            }
            svm.execute_frame();
        }

        // Copy bold atlas to GPU substrate
        let derived_base: u32 = 0x00F10000;
        for addr in derived_base..(derived_base + 128 * 8) {
            vm.substrate().poke(addr, svm.peek(addr));
        }
        eprintln!("[daemon] Font atlas loaded.");

        Self {
            vm,
            allocator: RegionAllocator::new(),
            programs: Vec::new(),
            frame_count: 0,
            started_at: std::time::Instant::now(),
            jump_logs: core::array::from_fn(|_| JumpLog::new()),
            prev_frame_ptrs: [0u32; MAX_VMS as usize],
        }
    }

    /// Spawn a VM at an already-loaded address (no loading, just activation).
    /// Returns the VM id assigned.
    fn spawn_at(&mut self, addr: u32) -> Result<(u32, String), String> {
        // Verify address doesn't overlap any active VM
        for i in 0..MAX_VMS {
            let s = self.vm.vm_state(i as usize);
            if s.state == vm_state::RUNNING || s.state == vm_state::WAITING {
                let vm_start = s.base_addr;
                let vm_end = s.bound_addr;
                if vm_start != vm_end && addr >= vm_start && addr < vm_end {
                    return Err(format!(
                        "Address {:#X} is inside active VM {} [{:#X}, {:#X})",
                        addr, i, vm_start, vm_end
                    ));
                }
            }
        }

        // Check that substrate is non-zero at the address (program was loaded)
        let first_pixel = self.vm.substrate().peek(addr);
        if first_pixel == 0 {
            return Err(format!(
                "Address {:#X} is empty (no program loaded there)",
                addr
            ));
        }

        // Find a free VM slot
        let vm_id = self.find_free_vm().ok_or("No free VM slot available")?;

        self.vm.spawn_vm(vm_id, addr);

        let program_id = format!("spawn_{:04x}", self.programs.len());
        let name = format!("spawned_{}", self.programs.len());

        self.programs.push(LoadedProgram {
            id: program_id.clone(),
            name,
            address: addr,
            pixel_count: 0, // unknown -- substrate was pre-loaded
            vm_id,
            pixels: Vec::new(),
            is_filmstrip: false,
            frame_count: 0,
            frame_labels: HashMap::new(),
        });

        Ok((vm_id, program_id))
    }

    fn find_free_vm(&self) -> Option<u32> {
        for i in 0..MAX_VMS {
            let state = self.vm.vm_state(i as usize).state;
            if state == vm_state::INACTIVE {
                return Some(i);
            }
        }
        None
    }

    fn load_program(&mut self, req: &LoadProgramRequest) -> Result<LoadProgramResponse, String> {
        let is_filmstrip = req.filmstrip.unwrap_or(false);

        // Auto-detect filmstrip from gasm source containing "---" separator
        let auto_filmstrip = is_filmstrip
            || (req.gasm_source.is_some()
                && req
                    .gasm_source
                    .as_ref()
                    .map(|s| s.contains("\n---\n"))
                    .unwrap_or(false));

        if auto_filmstrip {
            return self.load_filmstrip(req);
        }

        // Parse pixels from one of the input formats
        let pixels = if let Some(ref source) = req.gasm_source {
            gasm::assemble(source)
                .map(|p| p.pixels)
                .map_err(|e| format!("Assembly error: {e}"))?
        } else if let Some(ref raw) = req.pixels_raw {
            raw.clone()
        } else if let Some(ref hex) = req.pixels_hex {
            parse_hex_pixels(hex)?
        } else {
            return Err("Must provide one of: gasm, pixelsRaw, or pixels".into());
        };

        if pixels.is_empty() {
            return Err("Program is empty (0 pixels)".into());
        }

        // Allocate a region
        let addr = self
            .allocator
            .allocate_region(pixels.len() as u32)
            .ok_or("No contiguous free region available")?;

        // Load into substrate
        self.vm.substrate().load_program(addr, &pixels);
        eprintln!(
            "[daemon] Loaded {} pixels at address 0x{:08X}",
            pixels.len(),
            addr
        );

        // Pick VM slot
        let vm_id = req
            .vm_id
            .unwrap_or_else(|| self.find_free_vm().unwrap_or(0));
        if vm_id >= MAX_VMS {
            return Err(format!("VM id must be 0-{}", MAX_VMS - 1));
        }

        // Spawn VM at the program address
        self.vm.spawn_vm(vm_id, addr);

        // Generate program ID
        let program_id = format!("prog_{:04x}", self.programs.len());

        let name = req
            .name
            .clone()
            .unwrap_or_else(|| format!("program_{}", self.programs.len()));

        let resp = LoadProgramResponse {
            success: true,
            program_id: program_id.clone(),
            address: addr,
            pixel_count: pixels.len(),
            vm_id,
            message: format!(
                "Loaded {} pixels at 0x{:08X}, spawned VM {}",
                pixels.len(),
                addr,
                vm_id
            ),
        };

        self.programs.push(LoadedProgram {
            id: program_id,
            name,
            address: addr,
            pixel_count: pixels.len(),
            vm_id,
            pixels,
            is_filmstrip: false,
            frame_count: 0,
            frame_labels: HashMap::new(),
        });

        Ok(resp)
    }

    /// Load a film strip (multi-frame program) into the VM.
    ///
    /// Supports two input paths:
    ///   1. `gasm_source` with `---` separators between frames
    ///   2. `pixelsRaw` or `pixels_hex` with concatenated 65536-pixel frames
    fn load_filmstrip(&mut self, req: &LoadProgramRequest) -> Result<LoadProgramResponse, String> {
        let (strip, frame_labels) = if let Some(ref source) = req.gasm_source {
            // Multi-frame gasm: assemble each segment independently, capture labels
            let (programs, frame_labels) = gasm::assemble_filmstrip_with_labels(source)
                .map_err(|e| format!("Filmstrip assembly error: {e}"))?;
            let segments: Vec<Vec<u32>> = programs.iter().map(|p| p.pixels.clone()).collect();
            let strip = filmstrip::filmstrip_from_segments(&segments);
            (strip, Some(frame_labels))
        } else if let Some(ref raw) = req.pixels_raw {
            (filmstrip::filmstrip_from_flat_pixels(raw)?, None)
        } else if let Some(ref hex) = req.pixels_hex {
            let pixels = parse_hex_pixels(hex)?;
            (filmstrip::filmstrip_from_flat_pixels(&pixels)?, None)
        } else {
            return Err("Filmstrip requires one of: gasm (with ---), pixelsRaw, or pixels".into());
        };

        let num_frames = strip.frame_count();
        let total_pixels = num_frames * filmstrip::FRAME_TILE_PIXELS;

        eprintln!(
            "[daemon] Film strip: {} frames, {} total pixels",
            num_frames, total_pixels
        );

        // Allocate contiguous region for the entire strip
        let base_addr = self
            .allocator
            .allocate_region(total_pixels)
            .ok_or("No contiguous free region for film strip")?;

        // Load all frames into substrate
        strip.load_into_substrate(self.vm.substrate(), base_addr);
        eprintln!(
            "[daemon] Loaded film strip at address 0x{:08X} ({} frames)",
            base_addr, num_frames
        );

        // Pick VM slot
        let vm_id = req
            .vm_id
            .unwrap_or_else(|| self.find_free_vm().unwrap_or(0));
        if vm_id >= MAX_VMS {
            return Err(format!("VM id must be 0-{}", MAX_VMS - 1));
        }

        // Spawn VM and set up filmstrip state
        self.vm.spawn_vm(vm_id, base_addr);
        let vm = self.vm.vm_state_mut(vm_id as usize);
        vm.attention_mask = 0; // frame_ptr = 0
        vm.frame_count = num_frames;

        // Generate program ID
        let program_id = format!("film_{:04x}", self.programs.len());

        let name = req
            .name
            .clone()
            .unwrap_or_else(|| format!("filmstrip_{}", self.programs.len()));

        let resp = LoadProgramResponse {
            success: true,
            program_id: program_id.clone(),
            address: base_addr,
            pixel_count: total_pixels as usize,
            vm_id,
            message: format!(
                "Loaded {}-frame film strip at 0x{:08X}, spawned VM {}",
                num_frames, base_addr, vm_id
            ),
        };

        self.programs.push(LoadedProgram {
            id: program_id,
            name,
            address: base_addr,
            pixel_count: total_pixels as usize,
            vm_id,
            pixels: Vec::new(), // too large to store; omit
            is_filmstrip: true,
            frame_count: num_frames,
            frame_labels: frame_labels.unwrap_or_default(),
        });

        Ok(resp)
    }

    fn dispatch_frame(&mut self) -> DispatchResponse {
        self.vm.execute_frame();
        self.frame_count += 1;

        // Read GPU frame traces (records every intra-dispatch transition)
        let gpu_traces = self.vm.read_frame_traces();

        // Feed GPU traces into per-VM jump logs
        for trace in gpu_traces {
            let cause_str = if trace.cause == 0 {
                "auto_advance"
            } else {
                "frame_opcode"
            };
            self.jump_logs[trace.vm_id as usize].push(FrameTransition {
                vm_id: trace.vm_id,
                from_frame: trace.from_frame,
                to_frame: trace.to_frame,
                pc_at_transition: trace.pc_at_transition,
                cause: cause_str.to_string(),
                dispatch_frame: self.frame_count,
            });
        }

        // Update frame_ptr snapshots for any VMs without GPU traces
        // (fallback for non-trace-generating scenarios)
        for i in 0..MAX_VMS {
            let s = self.vm.vm_state(i as usize);
            self.prev_frame_ptrs[i as usize] = s.attention_mask;
        }

        let vm_results: Vec<VmResult> = (0..MAX_VMS)
            .map(|i| {
                let s = self.vm.vm_state(i as usize);
                VmResult {
                    vm_id: i,
                    halted: s.halted != 0 || s.state == vm_state::HALTED,
                    cycles: s.cycles,
                    pc: s.pc,
                }
            })
            .collect();

        DispatchResponse {
            success: true,
            frame: self.frame_count,
            vm_results,
        }
    }

    /// Hot-load a program into an unused substrate region without disturbing running VMs.
    /// Allocates a fresh region, assembles the .gasm source, writes to GPU substrate,
    /// and spawns a new VM. Returns the load response or an error.
    fn load_hot(&mut self, req: &LoadProgramRequest) -> Result<LoadProgramResponse, String> {
        // Parse pixels from one of the input formats
        let pixels = if let Some(ref source) = req.gasm_source {
            gasm::assemble(source)
                .map(|p| p.pixels)
                .map_err(|e| format!("Assembly error: {e}"))?
        } else if let Some(ref raw) = req.pixels_raw {
            raw.clone()
        } else if let Some(ref hex) = req.pixels_hex {
            parse_hex_pixels(hex)?
        } else {
            return Err("Must provide one of: gasm, pixelsRaw, or pixels".into());
        };

        if pixels.is_empty() {
            return Err("Program is empty (0 pixels)".into());
        }

        // Verify target region doesn't overlap any active VM
        let addr = self
            .allocator
            .allocate_region(pixels.len() as u32)
            .ok_or("No contiguous free region available")?;

        // Check against active VM bounds (GPU VMs)
        for i in 0..MAX_VMS {
            let s = self.vm.vm_state(i as usize);
            if s.state == vm_state::RUNNING || s.state == vm_state::WAITING {
                let vm_start = s.base_addr;
                let vm_end = s.bound_addr;
                if vm_start != vm_end && addr < vm_end && (addr + pixels.len() as u32) > vm_start {
                    // Free the allocation and fail
                    self.allocator.free_region(addr, pixels.len() as u32);
                    return Err(format!(
                        "Region [{:#X}, {:#X}) overlaps active VM {} [{:#X}, {:#X})",
                        addr,
                        addr + pixels.len() as u32,
                        i,
                        vm_start,
                        vm_end
                    ));
                }
            }
        }

        // Governance check
        let gov_result = pixels_move_pixels::governance::check(&pixels);
        if !gov_result.approved {
            self.allocator.free_region(addr, pixels.len() as u32);
            return Err(format!("Governance rejected: {}", gov_result.reason));
        }

        // Load into GPU substrate
        self.vm.substrate().load_program(addr, &pixels);
        eprintln!(
            "[daemon] Hot-loaded {} pixels at address 0x{:08X}",
            pixels.len(),
            addr
        );

        // Find a free VM slot
        let vm_id = match self.find_free_vm() {
            Some(id) => id,
            None => {
                self.allocator.free_region(addr, pixels.len() as u32);
                return Err("No free VM slot available".into());
            }
        };

        // Spawn VM at the program address
        self.vm.spawn_vm(vm_id, addr);

        let program_id = format!("hot_{:04x}", self.programs.len());

        let name = req
            .name
            .clone()
            .unwrap_or_else(|| format!("hot_program_{}", self.programs.len()));

        let resp = LoadProgramResponse {
            success: true,
            program_id: program_id.clone(),
            address: addr,
            pixel_count: pixels.len(),
            vm_id,
            message: format!(
                "Hot-loaded {} pixels at 0x{:08X}, spawned VM {}",
                pixels.len(),
                addr,
                vm_id
            ),
        };

        self.programs.push(LoadedProgram {
            id: program_id,
            name,
            address: addr,
            pixel_count: pixels.len(),
            vm_id,
            pixels,
            is_filmstrip: false,
            frame_count: 0,
            frame_labels: HashMap::new(),
        });

        Ok(resp)
    }

    fn status(&self) -> StatusResponse {
        let vm_states: Vec<VmStatus> = (0..MAX_VMS)
            .map(|i| {
                let s = self.vm.vm_state(i as usize);
                let mut regs = [0u32; 16];
                regs.copy_from_slice(&s.regs[..16]);
                VmStatus {
                    vm_id: i,
                    state: match s.state {
                        0 => "inactive".into(),
                        1 => "running".into(),
                        2 => "halted".into(),
                        3 => "waiting".into(),
                        0xFF => "fault".into(),
                        _ => format!("unknown({})", s.state),
                    },
                    pc: s.pc,
                    cycles: s.cycles,
                    halted: s.halted != 0,
                    entry_point: s.entry_point,
                    frame_ptr: s.attention_mask,
                    frame_count: s.frame_count,
                    regs,
                    base_addr: s.base_addr,
                    bound_addr: s.bound_addr,
                    jump_log: self.jump_logs[i as usize]
                        .recent()
                        .into_iter()
                        .cloned()
                        .collect(),
                    frame_labels: self
                        .programs
                        .iter()
                        .find(|p| p.vm_id == i)
                        .map(|p| p.frame_labels.clone())
                        .unwrap_or_default(),
                }
            })
            .collect();

        StatusResponse {
            running: true,
            vm_states,
            programs_loaded: self.programs.len(),
            uptime_secs: self.started_at.elapsed().as_secs(),
        }
    }
}

fn parse_hex_pixels(hex: &str) -> Result<Vec<u32>, String> {
    let clean: String = hex.split_whitespace().collect();
    if clean.len() % 8 != 0 {
        return Err(format!(
            "Hex string length {} is not a multiple of 8",
            clean.len()
        ));
    }
    let mut pixels = Vec::new();
    for chunk in clean.as_bytes().chunks(8) {
        let s = std::str::from_utf8(chunk).map_err(|e| e.to_string())?;
        let val = u32::from_str_radix(s, 16).map_err(|e| e.to_string())?;
        pixels.push(val);
    }
    Ok(pixels)
}

/// Parse a hex or decimal address string.
fn parse_addr(s: &str) -> Option<u32> {
    let s = s.trim();
    if s.starts_with("0x") || s.starts_with("0X") {
        u32::from_str_radix(s.trim_start_matches("0x").trim_start_matches("0X"), 16).ok()
    } else {
        s.parse::<u32>().ok()
    }
}

// ── Minimal HTTP server ──

fn read_request(stream: &mut std::net::TcpStream) -> Result<HttpRequest, String> {
    let mut buf = Vec::new();
    let mut tmp = [0u8; 4096];
    let mut content_length = 0usize;
    let mut headers_done = false;

    // Read until we have all headers + body
    loop {
        match stream.read(&mut tmp) {
            Ok(0) => return Err("Connection closed".into()),
            Ok(n) => {
                buf.extend_from_slice(&tmp[..n]);

                if !headers_done {
                    if let Some(pos) = find_header_end(&buf) {
                        headers_done = true;
                        let header_str = std::str::from_utf8(&buf[..pos]).map_err(|e| e.to_string())?;
                        content_length = parse_content_length(header_str).unwrap_or(0);
                        let body_start = pos + 4; // skip \r\n\r\n
                        let body_received = buf.len() - body_start;
                        if body_received >= content_length {
                            break;
                        }
                    }
                } else {
                    let body_start = buf
                        .windows(4)
                        .position(|w| w == b"\r\n\r\n")
                        .map(|p| p + 4)
                        .unwrap_or(0);
                    let body_received = buf.len() - body_start;
                    if body_received >= content_length {
                        break;
                    }
                }

                if buf.len() > 10 * 1024 * 1024 {
                    return Err("Request too large (>10MB)".into());
                }
            }
            Err(e) => return Err(e.to_string()),
        }
    }

    parse_http_request(&buf)
}

fn find_header_end(buf: &[u8]) -> Option<usize> {
    buf.windows(4).position(|w| w == b"\r\n\r\n")
}

fn parse_content_length(header: &str) -> Option<usize> {
    for line in header.lines() {
        if line.to_lowercase().starts_with("content-length:") {
            let val: usize = line.split(':').nth(1)?.trim().parse().ok()?;
            return Some(val);
        }
    }
    None
}

struct HttpRequest {
    method: String,
    path: String,
    body: Vec<u8>,
    content_type: String,
}

fn parse_http_request(raw: &[u8]) -> Result<HttpRequest, String> {
    let header_end = find_header_end(raw).ok_or("No header terminator found")?;
    let header_str = std::str::from_utf8(&raw[..header_end]).map_err(|e| e.to_string())?;
    let body = raw[header_end + 4..].to_vec();

    let first_line = header_str.lines().next().ok_or("Empty request")?;
    let mut parts = first_line.split_whitespace();
    let method = parts.next().ok_or("No method")?.to_string();
    let path = parts.next().ok_or("No path")?.to_string();

    let content_type = header_str
        .lines()
        .find(|l| l.to_lowercase().starts_with("content-type:"))
        .map(|l| l.split(':').nth(1).unwrap_or("").trim().to_string())
        .unwrap_or_default();

    Ok(HttpRequest {
        method,
        path,
        body,
        content_type,
    })
}

fn send_response(stream: &mut std::net::TcpStream, status: u16, body: &str) {
    let status_text = match status {
        200 => "OK",
        400 => "Bad Request",
        404 => "Not Found",
        500 => "Internal Server Error",
        _ => "OK",
    };
    let response = format!(
        "HTTP/1.1 {} {}\r\n\
         Content-Type: application/json\r\n\
         Content-Length: {}\r\n\
         Connection: close\r\n\
         Access-Control-Allow-Origin: *\r\n\
         \r\n\
         {}",
        status,
        status_text,
        body.len(),
        body
    );
    let _ = stream.write_all(response.as_bytes());
    let _ = stream.flush();
}

fn send_options(stream: &mut std::net::TcpStream) {
    let response = "HTTP/1.1 204 No Content\r\n\
                    Access-Control-Allow-Origin: *\r\n\
                    Access-Control-Allow-Methods: GET, POST, OPTIONS\r\n\
                    Access-Control-Allow-Headers: Content-Type\r\n\
                    Content-Length: 0\r\n\
                    Connection: close\r\n\r\n";
    let _ = stream.write_all(response.as_bytes());
    let _ = stream.flush();
}

fn json_ok<T: Serialize>(data: &T) -> String {
    serde_json::to_string(data).unwrap_or_else(|e| format!("{{\"error\":\"{}\"}}", e))
}

fn json_error(msg: &str) -> String {
    format!("{{\"success\":false,\"error\":\"{}\"}}", msg.replace('"', "\\\""))
}

fn handle_request(state: &Arc<Mutex<DaemonState>>, req: HttpRequest) -> (u16, String) {
    match (req.method.as_str(), req.path.as_str()) {
        // POST /api/v1/programs - Load and spawn a program
        ("POST", "/api/v1/programs") => {
            let body_str = String::from_utf8_lossy(&req.body);

            // Try parsing as JSON first
            let load_req: LoadProgramRequest = if req.content_type.contains("text/plain") || req.content_type.is_empty() {
                // Treat as raw .gasm source
                LoadProgramRequest {
                    gasm_source: Some(body_str.to_string()),
                    pixels_hex: None,
                    pixels_raw: None,
                    vm_id: None,
                    name: None,
                    filmstrip: None,
                }
            } else {
                match serde_json::from_str(&body_str) {
                    Ok(r) => r,
                    Err(e) => return (400, json_error(&format!("Invalid JSON: {e}"))),
                }
            };

            let mut s = state.lock().unwrap();
            match s.load_program(&load_req) {
                Ok(resp) => (200, json_ok(&resp)),
                Err(e) => (400, json_error(&e)),
            }
        }

        // POST /api/v1/hot-load - Hot-load program without disturbing running VMs
        ("POST", "/api/v1/hot-load") => {
            let body_str = String::from_utf8_lossy(&req.body);

            let load_req: LoadProgramRequest = if req.content_type.contains("text/plain")
                || req.content_type.is_empty()
            {
                LoadProgramRequest {
                    gasm_source: Some(body_str.to_string()),
                    pixels_hex: None,
                    pixels_raw: None,
                    vm_id: None,
                    name: None,
                    filmstrip: None,
                }
            } else {
                match serde_json::from_str(&body_str) {
                    Ok(r) => r,
                    Err(e) => return (400, json_error(&format!("Invalid JSON: {e}"))),
                }
            };

            let mut s = state.lock().unwrap();
            match s.load_hot(&load_req) {
                Ok(resp) => (200, json_ok(&resp)),
                Err(e) => (400, json_error(&e)),
            }
        }

        // POST /api/v1/dispatch - Execute one frame
        ("POST", "/api/v1/dispatch") => {
            let mut s = state.lock().unwrap();
            let resp = s.dispatch_frame();
            (200, json_ok(&resp))
        }

        // GET /api/v1/status
        ("GET", "/api/v1/status") => {
            let s = state.lock().unwrap();
            let status = s.status();
            (200, json_ok(&status))
        }

        // GET /api/v1/programs - list loaded programs
        ("GET", "/api/v1/programs") => {
            let s = state.lock().unwrap();
            let progs: Vec<serde_json::Value> = s
                .programs
                .iter()
                .map(|p| {
                    serde_json::json!({
                        "id": p.id,
                        "name": p.name,
                        "address": p.address,
                        "address_hex": format!("0x{:08X}", p.address),
                        "pixel_count": p.pixel_count,
                        "vm_id": p.vm_id,
                        "is_filmstrip": p.is_filmstrip,
                        "frame_count": p.frame_count,
                    })
                })
                .collect();
            (200, json_ok(&progs))
        }

        // GET /api/v1/substrate/{addr}/{count}
        ("GET", path) if path.starts_with("/api/v1/substrate/") => {
            let parts: Vec<&str> = path.trim_start_matches("/api/v1/substrate/").split('/').collect();
            if parts.len() < 2 {
                return (400, json_error("Usage: /api/v1/substrate/{addr}/{count}"));
            }
            let addr: u32 = if parts[0].starts_with("0x") || parts[0].starts_with("0X") {
                match u32::from_str_radix(parts[0].trim_start_matches("0x").trim_start_matches("0X"), 16) {
                    Ok(a) => a,
                    Err(_) => return (400, json_error("Invalid hex address")),
                }
            } else {
                match parts[0].parse::<u32>() {
                    Ok(a) => a,
                    Err(_) => return (400, json_error("Invalid address")),
                }
            };
            let count: u32 = match parts[1].parse() {
                Ok(c) => c,
                Err(_) => return (400, json_error("Invalid count")),
            };
            let s = state.lock().unwrap();
            let mut pixels = Vec::new();
            for i in 0..count {
                pixels.push(s.vm.substrate().peek(addr + i));
            }
            let values: Vec<String> = pixels.iter().map(|p| format!("0x{:08X}", p)).collect();
            (200, json_ok(&serde_json::json!({
                "address": addr,
                "count": count,
                "pixels": values,
            })))
        }

        _ => (404, json_error("Not found")),
    }
}

/// Process a single command line (shared by stdin and Unix socket).
/// Returns a response string (for Unix socket clients) or empty (for stdin, which logs directly).
fn handle_command_text(state: &Arc<Mutex<DaemonState>>, line: &str) -> String {
    let line = line.trim();
    if line.is_empty() {
        return String::new();
    }
    let parts: Vec<&str> = line.splitn(3, char::is_whitespace).collect();
    let cmd = parts[0].to_uppercase();

    match cmd.as_str() {
        "LOAD" => {
            // LOAD <file.gasm>              -- auto-allocate address
            // LOAD <addr> <file.gasm>       -- load at specific address
            if parts.len() < 2 {
                return "ERROR: Usage: LOAD <file.gasm> or LOAD <addr> <file.gasm>\n".into();
            }

            // Try to parse: if parts[1] looks like an address and parts[2] exists,
            // treat as LOAD <addr> <file>; otherwise LOAD <file>
            let (target_addr, file_path) = if parts.len() >= 3 {
                if let Some(addr) = parse_addr(parts[1].trim()) {
                    (Some(addr), parts[2].trim())
                } else {
                    (None, parts[1].trim())
                }
            } else {
                (None, parts[1].trim())
            };

            if file_path.is_empty() {
                return "ERROR: Usage: LOAD <file.gasm> or LOAD <addr> <file.gasm>\n".into();
            }

            let source = match std::fs::read_to_string(file_path) {
                Ok(s) => s,
                Err(e) => return format!("ERROR: Failed to read {}: {}\n", file_path, e),
            };

            let req = LoadProgramRequest {
                gasm_source: Some(source),
                pixels_hex: None,
                pixels_raw: None,
                vm_id: None,
                name: Some(file_path.to_string()),
                filmstrip: None,
            };

            let mut s = state.lock().unwrap();
            match s.load_hot(&req) {
                Ok(resp) => {
                    if let Some(_addr) = target_addr {
                        // TODO: Pass target address to allocator for address-pinned loading
                    }
                    let msg = format!(
                        "OK: Loaded {} pixels at 0x{:08X}, vm_id={}\n",
                        resp.pixel_count, resp.address, resp.vm_id
                    );
                    eprintln!("[daemon:cmd] {}", msg.trim());
                    msg
                }
                Err(e) => {
                    let msg = format!("FAILED: {}\n", e);
                    eprintln!("[daemon:cmd] {}", msg.trim());
                    msg
                }
            }
        }

        "SPAWN" => {
            let addr_str = parts.get(1).map(|s| s.trim()).unwrap_or("");
            if addr_str.is_empty() {
                return "ERROR: Usage: SPAWN <addr_hex>\n".into();
            }
            let addr = match parse_addr(addr_str) {
                Some(a) => a,
                None => return format!("ERROR: Invalid address: {}\n", addr_str),
            };
            let mut s = state.lock().unwrap();
            match s.spawn_at(addr) {
                Ok((vm_id, prog_id)) => {
                    let msg = format!(
                        "OK: Spawned VM {} at 0x{:08X} ({})\n",
                        vm_id, addr, prog_id
                    );
                    eprintln!("[daemon:cmd] {}", msg.trim());
                    msg
                }
                Err(e) => {
                    let msg = format!("FAILED: {}\n", e);
                    eprintln!("[daemon:cmd] {}", msg.trim());
                    msg
                }
            }
        }

        "STATUS" => {
            let s = state.lock().unwrap();
            let status = s.status();
            let json = serde_json::to_string(&status).unwrap_or_else(|e| format!("{{\"error\":\"{}\"}}", e));
            eprintln!(
                "[daemon:cmd] Uptime: {}s, Programs: {}",
                status.uptime_secs, status.programs_loaded
            );
            for vm in &status.vm_states {
                if vm.state != "inactive" {
                    eprintln!(
                        "  VM {}: {} pc={} cycles={} halted={}",
                        vm.vm_id, vm.state, vm.pc, vm.cycles, vm.halted
                    );
                }
            }
            format!("{}\n", json)
        }

        "DISPATCH" => {
            let mut s = state.lock().unwrap();
            let resp = s.dispatch_frame();
            eprintln!(
                "[daemon:cmd] Dispatched frame {} ({} VMs)",
                resp.frame,
                resp.vm_results
                    .iter()
                    .filter(|v| !v.halted || v.cycles > 0)
                    .count()
            );
            let json =
                serde_json::to_string(&resp).unwrap_or_else(|e| format!("{{\"error\":\"{}\"}}", e));
            format!("{}\n", json)
        }

        "QUIT" | "EXIT" => {
            eprintln!("[daemon:cmd] Shutting down...");
            std::process::exit(0);
        }

        _ => format!(
            "ERROR: Unknown command: {} (LOAD, SPAWN, STATUS, DISPATCH, QUIT)\n",
            cmd
        ),
    }
}

fn main() {
    env_logger::init();

    let port = {
        let args: Vec<String> = std::env::args().collect();
        if let Some(idx) = args.iter().position(|a| a == "--port") {
            args.get(idx + 1).cloned()
        } else if args.len() > 1 {
            // Positional: first non-flag arg
            args.iter()
                .skip(1)
                .find(|a| !a.starts_with('-'))
                .cloned()
        } else {
            None
        }
    }
    .unwrap_or_else(|| "3101".into());

    let socket_path = {
        let args: Vec<String> = std::env::args().collect();
        if let Some(idx) = args.iter().position(|a| a == "--socket") {
            args.get(idx + 1).cloned()
        } else {
            None
        }
    };

    println!("Geometry OS Daemon");
    println!("==================");
    println!();

    // Initialize state (triggers GPU init)
    let state = Arc::new(Mutex::new(DaemonState::new()));

    let addr = format!("127.0.0.1:{}", port);
    let listener = TcpListener::bind(&addr).unwrap_or_else(|e| {
        eprintln!("Failed to bind {}: {}", addr, e);
        std::process::exit(1);
    });

    println!("Daemon listening on http://{}", addr);
    println!();
    println!("API:");
    println!("  POST /api/v1/programs   Load program (JSON: {{gasm, pixelsRaw, pixels_hex, vm_id, name}})");
    println!("  POST /api/v1/hot-load   Hot-load program without disturbing running VMs");
    println!("  POST /api/v1/dispatch   Execute one frame of GPU compute");
    println!("  GET  /api/v1/status     VM states and daemon info");
    println!("  GET  /api/v1/programs   List loaded programs");
    println!("  GET  /api/v1/substrate/{{addr}}/{{count}}  Read substrate pixels");
    println!();
    println!("Stdin / Unix socket commands:");
    println!("  LOAD <file.gasm>        Assemble and hot-load a .gasm program");
    println!("  LOAD <addr> <file.gasm> Assemble and hot-load at a specific address");
    println!("  SPAWN <addr_hex>        Spawn a VM at an already-loaded address");
    println!("  STATUS                  Print VM status summary");
    println!("  DISPATCH                Execute one frame");
    println!("  QUIT                    Shut down the daemon");
    println!();

    // Spawn stdin command processor thread
    let cmd_state = Arc::clone(&state);
    std::thread::spawn(move || {
        let stdin = std::io::stdin();
        let mut lines = stdin.lock().lines();
        eprintln!("[daemon:cmd] Stdin command processor ready");
        while let Some(Ok(line)) = lines.next() {
            handle_command_text(&cmd_state, &line);
        }
    });

    // Spawn Unix socket command processor (if --socket was provided)
    if let Some(ref sock_path) = socket_path {
        let sock_display = sock_path.clone();
        let sock_state = Arc::clone(&state);
        let sock_path = sock_path.clone();
        // Clean up stale socket
        let _ = std::fs::remove_file(&sock_path);
        std::thread::spawn(move || {
            let listener = match UnixListener::bind(&sock_path) {
                Ok(l) => l,
                Err(e) => {
                    eprintln!("[daemon:sock] Failed to bind {}: {}", sock_path, e);
                    return;
                }
            };
            eprintln!("[daemon:sock] Unix socket listening on {}", sock_path);
            for stream in listener.incoming() {
                match stream {
                    Ok(mut stream) => {
                        let mut buf = String::new();
                        if let Ok(_) = stream.read_to_string(&mut buf) {
                            let line = buf.trim();
                            if line.is_empty() {
                                continue;
                            }
                            let resp = handle_command_text(&sock_state, line);
                            let _ = stream.write_all(resp.as_bytes());
                            let _ = stream.flush();
                        }
                    }
                    Err(e) => {
                        eprintln!("[daemon:sock] Connection error: {}", e);
                    }
                }
            }
        });
        println!("Unix socket: {}", sock_display);
        println!("  LOAD <file.gasm>        Assemble and hot-load a .gasm program");
        println!("  SPAWN <addr_hex>        Spawn a VM at an already-loaded address");
        println!("  STATUS                  VM status as JSON");
        println!("  DISPATCH                Execute one frame");
        println!("  QUIT                    Shut down");
        println!();
    }

    for stream in listener.incoming() {
        match stream {
            Ok(mut stream) => {
                // Handle CORS preflight
                let req = match read_request(&mut stream) {
                    Ok(r) => r,
                    Err(e) => {
                        eprintln!("[daemon] Bad request: {e}");
                        send_response(&mut stream, 400, &json_error(&e));
                        continue;
                    }
                };

                if req.method == "OPTIONS" {
                    send_options(&mut stream);
                    continue;
                }

                let (status, body) = handle_request(&state, req);
                send_response(&mut stream, status, &body);
            }
            Err(e) => {
                eprintln!("[daemon] Connection error: {e}");
            }
        }
    }
}
