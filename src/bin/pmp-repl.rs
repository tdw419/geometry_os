// PMP REPL Daemon - Watch Directory Interface
//
// The bridge from "I wrote a VM" to "the VM runs programs I give it."
// Watches ~/.pmp/inbox/ for .gasm files, assembles and executes them
// on the software VM, writes results to ~/.pmp/outbox/, moves inputs
// to ~/.pmp/done/.
//
// The substrate persists across programs. New programs load at
// incrementing addresses. VM slots are allocated on demand.
//
// Usage:
//   cargo run --bin pmp-repl          # foreground daemon
//   cargo run --bin pmp-repl -- --gpu # GPU mode (slower per-frame, parallel)
//
// Drop a file:
//   echo 'LDI r0, 42\nHALT' > ~/.pmp/inbox/hello.gasm
//   cat ~/.pmp/outbox/hello.json

use std::fs;
use std::path::PathBuf;
use std::time::{Duration, Instant};

use pixels_move_pixels::font_atlas;
use pixels_move_pixels::gasm;
use pixels_move_pixels::software_vm::SoftwareVm;

// ── Layout Constants ──

/// First user program loads here (after font atlas at 0x00F00000 and IPC at 0x00E00000).
/// Programs get 0x00100000 (1M pixels = 4MB) each.
const PROGRAM_BASE: u32 = 0x0100_0000;
const PROGRAM_REGION_SIZE: u32 = 0x0010_0000; // 1M pixels per program slot

// ── Daemon State ──

struct ReplState {
    /// The persistent software VM (substrate stays alive between programs).
    vm: SoftwareVm,
    /// Next available VM slot (0-7).
    next_vm_slot: u32,
    /// Next program load address.
    next_load_addr: u32,
    /// Number of programs executed this session.
    programs_run: u64,
}

impl ReplState {
    fn new() -> Self {
        let mut vm = SoftwareVm::new();
        vm.load_font_atlas();
        Self {
            vm,
            next_vm_slot: 0,
            next_load_addr: PROGRAM_BASE,
            programs_run: 0,
        }
    }

    /// Allocate the next free VM slot. Returns None if all 8 are occupied.
    fn alloc_vm_slot(&mut self) -> Option<u32> {
        // Try to find a halted or inactive VM
        for slot in 0..8u32 {
            let state = self.vm.vm_state(slot as usize);
            if state.state != 1 {
                // not RUNNING
                self.next_vm_slot = slot;
                return Some(slot);
            }
        }
        None
    }

    /// Allocate the next load address. Returns None if address space is exhausted.
    fn alloc_address(&mut self, program_size: usize) -> Option<u32> {
        if self.next_load_addr + program_size as u32 >= 0x00E0_0000 {
            // Would collide with IPC region -- wrap around
            self.next_load_addr = PROGRAM_BASE;
        }
        let addr = self.next_load_addr;
        self.next_load_addr += PROGRAM_REGION_SIZE;
        if self.next_load_addr >= 0x00E0_0000 {
            self.next_load_addr = PROGRAM_BASE;
        }
        Some(addr)
    }

    /// Execute a .gasm program. Returns the execution result.
    fn execute(&mut self, source: &str, name: &str) -> ExecutionResult {
        let start = Instant::now();
        let asm_start = Instant::now();

        // Assemble
        let program = match gasm::assemble(source) {
            Ok(p) => p,
            Err(e) => {
                return ExecutionResult {
                    name: name.to_string(),
                    status: "assemble_error".to_string(),
                    error: Some(e),
                    assembly_us: asm_start.elapsed().as_micros() as u64,
                    ..Default::default()
                }
            }
        };
        let assembly_us = asm_start.elapsed().as_micros() as u64;
        let program_len = program.pixels.len();

        // Allocate resources
        let vm_slot = match self.alloc_vm_slot() {
            Some(s) => s,
            None => {
                return ExecutionResult {
                    name: name.to_string(),
                    status: "no_vm_slot".to_string(),
                    error: Some("all 8 VM slots occupied".to_string()),
                    assembly_us,
                    program_size: program_len,
                    ..Default::default()
                };
            }
        };

        let load_addr = match self.alloc_address(program_len) {
            Some(a) => a,
            None => {
                return ExecutionResult {
                    name: name.to_string(),
                    status: "no_address_space".to_string(),
                    error: Some("address space exhausted".to_string()),
                    assembly_us,
                    program_size: program_len,
                    vm_slot,
                    ..Default::default()
                };
            }
        };

        // Load and spawn
        self.vm.load_program(load_addr, &program.pixels);
        self.vm.spawn_vm(vm_slot, load_addr);

        // Set sandbox bounds for this program
        let bound_addr = load_addr + PROGRAM_REGION_SIZE;
        {
            let vm_state = self.vm.vm_state_mut(vm_slot as usize);
            vm_state.base_addr = load_addr;
            vm_state.bound_addr = bound_addr;
        }

        // Execute frames until halted or budget exhausted
        let exec_start = Instant::now();
        let max_frames = 10_000;
        let mut frames_run = 0u32;
        let mut halted = false;

        for _ in 0..max_frames {
            self.vm.execute_frame();
            frames_run += 1;
            if self.vm.vm_state(vm_slot as usize).halted != 0 {
                halted = true;
                break;
            }
            if self.vm.vm_state(vm_slot as usize).state == 0xFF {
                // VM_FAULT
                break;
            }
        }

        let exec_us = exec_start.elapsed().as_micros() as u64;

        // Capture final state
        let final_state = self.vm.vm_state(vm_slot as usize).clone();

        // Read back non-zero registers
        let mut regs = Vec::new();
        for (i, &val) in final_state.regs.iter().enumerate() {
            if val != 0 {
                regs.push((i, val));
            }
        }

        // Read back non-zero memory in the program region
        let mut memory = Vec::new();
        let scan_range = std::cmp::min(program_len as u32 * 2, PROGRAM_REGION_SIZE);
        for offset in 0..scan_range {
            let val = self.vm.peek(load_addr + offset);
            if val != 0 {
                memory.push((load_addr + offset, val));
            }
        }

        self.programs_run += 1;

        let total_us = start.elapsed().as_micros() as u64;

        ExecutionResult {
            name: name.to_string(),
            status: if halted {
                "halted".to_string()
            } else if final_state.state == 0xFF {
                "fault".to_string()
            } else {
                "running".to_string()
            },
            error: None,
            assembly_us,
            exec_us,
            total_us,
            program_size: program_len,
            vm_slot,
            load_addr,
            frames: frames_run,
            cycles: final_state.cycles,
            pc: final_state.pc,
            regs,
            memory,
            programs_run: self.programs_run,
        }
    }
}

// ── Output Format ──

#[derive(Debug, Default, serde::Serialize)]
struct ExecutionResult {
    name: String,
    status: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    error: Option<String>,
    assembly_us: u64,
    #[serde(default)]
    exec_us: u64,
    #[serde(default)]
    total_us: u64,
    #[serde(default)]
    program_size: usize,
    #[serde(default)]
    vm_slot: u32,
    #[serde(default)]
    load_addr: u32,
    #[serde(default)]
    frames: u32,
    #[serde(default)]
    cycles: u32,
    #[serde(default)]
    pc: u32,
    #[serde(default)]
    regs: Vec<(usize, u32)>,
    #[serde(default)]
    memory: Vec<(u32, u32)>,
    #[serde(default)]
    programs_run: u64,
}

// ── Directory Setup ──

fn pmp_dir() -> PathBuf {
    let home = std::env::var("HOME").unwrap_or_else(|_| ".".to_string());
    PathBuf::from(home).join(".pmp")
}

fn ensure_dirs() -> (PathBuf, PathBuf, PathBuf) {
    let base = pmp_dir();
    let inbox = base.join("inbox");
    let outbox = base.join("outbox");
    let done = base.join("done");
    fs::create_dir_all(&inbox).expect("create inbox");
    fs::create_dir_all(&outbox).expect("create outbox");
    fs::create_dir_all(&done).expect("create done");
    (inbox, outbox, done)
}

// ── Main Loop ──

fn main() {
    let args: Vec<String> = std::env::args().collect();
    let gpu_mode = args.iter().any(|a| a == "--gpu");

    if gpu_mode {
        eprintln!("GPU mode not yet implemented in pmp-repl (software VM is faster for iteration)");
        std::process::exit(1);
    }

    let (inbox, outbox, done) = ensure_dirs();

    println!("pmp-repl: pixels move pixels repl daemon");
    println!("=========================================");
    println!("  inbox:  {}", inbox.display());
    println!("  outbox: {}", outbox.display());
    println!("  done:   {}", done.display());
    println!();
    println!("  substrate: persistent software VM (8 slots, 64MB RAM)");
    println!("  font atlas: loaded at 0x{:08X}", font_atlas::FONT_BASE);
    println!("  program base: 0x{:08X}", PROGRAM_BASE);
    println!();
    println!("  drop .gasm or .png files in inbox/ -- results appear in outbox/");
    println!("  ctrl+c to stop");
    println!();

    let mut state = ReplState::new();
    let poll_interval = Duration::from_millis(200);

    loop {
        // Scan inbox for .gasm files
        let entries = match fs::read_dir(&inbox) {
            Ok(e) => e,
            Err(err) => {
                eprintln!("error reading inbox: {}", err);
                std::thread::sleep(poll_interval);
                continue;
            }
        };

        let mut files: Vec<PathBuf> = entries
            .filter_map(|e| e.ok())
            .map(|e| e.path())
            .filter(|p| {
                p.extension()
                    .map(|ext| ext == "gasm" || ext == "png")
                    .unwrap_or(false)
            })
            .collect();

        // Sort by modification time (oldest first = FIFO)
        files.sort_by_key(|p| {
            fs::metadata(p)
                .and_then(|m| m.modified())
                .unwrap_or(std::time::SystemTime::UNIX_EPOCH)
        });

        for path in files {
            let name = path
                .file_stem()
                .and_then(|s| s.to_str())
                .unwrap_or("unknown")
                .to_string();

            let is_png = path
                .extension()
                .map(|ext| ext == "png")
                .unwrap_or(false);

            if is_png {
                // PNG mode: load image into SCREEN region, run as pixel program
                let img = match image::open(&path) {
                    Ok(img) => img.to_rgba8(),
                    Err(err) => {
                        eprintln!("error loading PNG {}: {}", path.display(), err);
                        continue;
                    }
                };

                println!(
                    "[{}] loading PNG {} ({}x{} pixels)...",
                    state.programs_run + 1,
                    name,
                    img.width(),
                    img.height()
                );

                // Load PNG pixels into screen region
                state.vm.load_png_to_screen(&img);

                // Also load the PNG as a program at the next address
                // Each pixel becomes a glyph instruction (R=opcode, G=stratum, B=p1, A=p2)
                let (w, h) = img.dimensions();
                let pixel_count = (w * h) as usize;
                let load_addr = match state.alloc_address(pixel_count) {
                    Some(a) => a,
                    None => {
                        eprintln!("  no address space for PNG program");
                        continue;
                    }
                };

                // Convert RGBA pixels to u32 glyph instructions
                let mut program_pixels: Vec<u32> = Vec::with_capacity(pixel_count);
                for y in 0..h {
                    for x in 0..w {
                        let px = img.get_pixel(x, y);
                        let [r, g, b, a] = px.0;
                        let glyph =
                            (r as u32) | ((g as u32) << 8) | ((b as u32) << 16) | ((a as u32) << 24);
                        program_pixels.push(glyph);
                    }
                }

                let vm_slot = match state.alloc_vm_slot() {
                    Some(s) => s,
                    None => {
                        eprintln!("  no VM slot available");
                        continue;
                    }
                };

                state.vm.load_program(load_addr, &program_pixels);
                state.vm.spawn_vm(vm_slot, load_addr);

                // Set sandbox bounds
                let bound_addr = load_addr + PROGRAM_REGION_SIZE;
                {
                    let vm_state = state.vm.vm_state_mut(vm_slot as usize);
                    vm_state.base_addr = load_addr;
                    vm_state.bound_addr = bound_addr;
                }

                // Execute
                let exec_start = Instant::now();
                let max_frames = 10_000;
                let mut frames_run = 0u32;
                let mut halted = false;

                for _ in 0..max_frames {
                    state.vm.execute_frame();
                    frames_run += 1;
                    if state.vm.vm_state(vm_slot as usize).halted != 0 {
                        halted = true;
                        break;
                    }
                    if state.vm.vm_state(vm_slot as usize).state == 0xFF {
                        break;
                    }
                }
                let exec_us = exec_start.elapsed().as_micros() as u64;

                // Dump screen as PNG
                let screen_img = state.vm.dump_screen_png();
                let png_path = outbox.join(format!("{}.png", name));
                match screen_img.save(&png_path) {
                    Ok(()) => {
                        println!(
                            "  ok: {}x{} PNG -> VM{}, {} frames, {}us -> {}",
                            w,
                            h,
                            vm_slot,
                            frames_run,
                            exec_us,
                            png_path.display()
                        );
                    }
                    Err(err) => {
                        eprintln!("  error saving output PNG: {}", err);
                    }
                }

                // Write JSON result too
                let final_state = state.vm.vm_state(vm_slot as usize).clone();
                let result = ExecutionResult {
                    name: name.clone(),
                    status: if halted {
                        "halted".to_string()
                    } else if final_state.state == 0xFF {
                        "fault".to_string()
                    } else {
                        "running".to_string()
                    },
                    error: None,
                    assembly_us: 0,
                    exec_us,
                    total_us: exec_us,
                    program_size: pixel_count,
                    vm_slot,
                    load_addr,
                    frames: frames_run,
                    cycles: final_state.cycles,
                    pc: final_state.pc,
                    regs: final_state
                        .regs
                        .iter()
                        .enumerate()
                        .filter(|(_, &v)| v != 0)
                        .map(|(i, &v)| (i, v))
                        .collect(),
                    memory: Vec::new(),
                    programs_run: state.programs_run + 1,
                };
                let json_path = outbox.join(format!("{}.json", name));
                if let Ok(json) = serde_json::to_string_pretty(&result) {
                    let _ = fs::write(&json_path, json);
                }

                state.programs_run += 1;

                // Move input to done/
                let done_path = done.join(path.file_name().unwrap());
                let _ = fs::rename(&path, &done_path);
                continue;
            }

            // .gasm mode (existing logic)
            let source = match fs::read_to_string(&path) {
                Ok(s) => s,
                Err(err) => {
                    eprintln!("error reading {}: {}", path.display(), err);
                    continue;
                }
            };

            println!(
                "[{}] assembling {} ({} bytes)...",
                state.programs_run + 1,
                name,
                source.len()
            );

            let result = state.execute(&source, &name);

            // Print summary
            match result.status.as_str() {
                "halted" => {
                    println!(
                        "  ok: {} pixels, VM{}, {} cycles, {} frames, {}us",
                        result.program_size,
                        result.vm_slot,
                        result.cycles,
                        result.frames,
                        result.exec_us
                    );
                    if !result.regs.is_empty() {
                        print!("  regs:");
                        for (reg, val) in &result.regs {
                            print!(" r{}=0x{:08X}", reg, val);
                        }
                        println!();
                    }
                }
                "assemble_error" => {
                    println!("  FAIL: assembly error: {}", result.error.as_deref().unwrap_or("?"));
                }
                "fault" => {
                    println!("  FAULT: VM{} faulted at pc={}", result.vm_slot, result.pc);
                }
                "running" => {
                    println!(
                        "  TIMEOUT: VM{} still running after {} frames, pc={}",
                        result.vm_slot, result.frames, result.pc
                    );
                }
                other => {
                    println!("  {}: {}", other, result.error.as_deref().unwrap_or("?"));
                }
            }

            // Write JSON result
            let json_path = outbox.join(format!("{}.json", name));
            match serde_json::to_string_pretty(&result) {
                Ok(json) => {
                    if let Err(err) = fs::write(&json_path, json) {
                        eprintln!("  error writing {}: {}", json_path.display(), err);
                    }
                }
                Err(err) => {
                    eprintln!("  error serializing result: {}", err);
                }
            }

            // Dump screen region as PNG if any pixels were written to screen
            let screen_img = state.vm.dump_screen_png();
            // Check if any non-zero pixels exist in screen region
            let has_pixels = screen_img.pixels().any(|p| p.0 != [0, 0, 0, 0]);
            if has_pixels {
                let screen_path = outbox.join(format!("{}.png", name));
                if let Err(err) = screen_img.save(&screen_path) {
                    eprintln!("  error saving screen PNG: {}", err);
                } else {
                    println!("  screen: {}", screen_path.display());
                }
            }

            // Move input to done/
            let done_path = done.join(path.file_name().unwrap());
            if let Err(err) = fs::rename(&path, &done_path) {
                eprintln!("  error moving to done: {}", err);
            }
        }

        std::thread::sleep(poll_interval);
    }
}
