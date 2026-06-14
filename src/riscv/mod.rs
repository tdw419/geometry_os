// riscv/mod.rs -- RISC-V hypervisor module (Phases 34-37)
//
// Pure Rust RISC-V interpreter for Geometry OS.
// Boots guest OS kernels on the canvas text surface.
// See docs/RISCV_HYPERVISOR.md for full architecture.
//
// GPU multicore execution (Phase: Foundation):
//   gpu.rs           - GpuExecutor (wgpu compute pipeline), tile state init
//   gpu_reference.rs - CPU reference interpreter for GPU verification
//   gpu_loader.rs    - Cartridge builders (fibonacci, counter)
//   riscv_executor.wgsl - WGSL compute shader
// Enable with: cargo build --features gpu

pub mod block_cache;
pub mod boot;
pub mod bridge;
pub mod bus;
pub mod checkpoint;
pub mod clint;
pub mod cpu;
pub mod csr;
pub mod debug_linux;
pub mod decode;
pub mod dtb;
pub mod framebuf;
pub mod gpu;
pub mod gpu_bridge;
pub mod gpu_loader;
pub mod gpu_reference;
pub mod gsfs;
pub mod kernel_patches;
pub mod linux;
pub mod live;
pub mod loader;
pub mod memory;
pub mod mmu;
pub mod mmu_heatmap;
pub mod plic;
pub mod pixel_native;
pub mod sbi;
pub mod socket;
pub mod spi_sd;
pub mod substrate;
pub mod syscall;
pub mod trace;
pub mod uart;
pub mod vfs_surface;
pub mod virtio_blk;
pub mod virtio_gpu;
pub mod virtio_net;
pub mod virtio_serial;
pub mod viz;

#[cfg(test)]
mod tests;

use cpu::StepResult;

/// Extract the first LOAD segment (typically .text) from a 32-bit ELF.
/// Returns (virtual_address_of_segment, raw_bytes).
/// Used by JIT driver injection to load compiled driver code into guest RAM.
fn extract_text_segment(elf: &[u8]) -> Option<(u32, Vec<u8>)> {
    // ELF32 header: magic at 0, e_entry at 24, e_phoff at 28, e_phentsize at 42, e_phnum at 44
    if elf.len() < 52 || &elf[0..4] != b"\x7fELF" {
        return None;
    }
    let _entry = u32::from_le_bytes(elf[24..28].try_into().ok()?);
    let ph_off = u32::from_le_bytes(elf[28..32].try_into().ok()?) as usize;
    let ph_entsize = u16::from_le_bytes(elf[42..44].try_into().ok()?) as usize;
    let ph_num = u16::from_le_bytes(elf[44..46].try_into().ok()?) as usize;

    for i in 0..ph_num {
        let off = ph_off + i * ph_entsize;
        if off + ph_entsize > elf.len() {
            break;
        }
        let p_type = u32::from_le_bytes(elf[off..off + 4].try_into().ok()?);
        let p_offset = u32::from_le_bytes(elf[off + 4..off + 8].try_into().ok()?);
        let p_vaddr = u32::from_le_bytes(elf[off + 8..off + 12].try_into().ok()?);
        let _p_paddr = u32::from_le_bytes(elf[off + 12..off + 16].try_into().ok()?);
        let p_filesz = u32::from_le_bytes(elf[off + 16..off + 20].try_into().ok()?);
        let p_memsz = u32::from_le_bytes(elf[off + 20..off + 24].try_into().ok()?);

        // PT_LOAD = 1
        if p_type == 1 && p_filesz > 0 {
            let start = p_offset as usize;
            let end = start + p_filesz as usize;
            if end <= elf.len() {
                let mut bytes = elf[start..end].to_vec();
                // Zero-pad to memsz if needed (BSS)
                if p_memsz > p_filesz {
                    bytes.resize(p_memsz as usize, 0);
                }
                return Some((p_vaddr, bytes));
            }
        }
    }
    None
}

/// Saved guest context for cooperative multi-processing (Phase 209).
/// Contains all per-process state needed to switch between contexts.
#[derive(Debug, Clone)]
pub struct GuestContext {
    /// General-purpose registers x0-x31.
    pub x: [u32; 32],
    /// Program counter.
    pub pc: u32,
    /// Current privilege level.
    pub privilege: cpu::Privilege,
    /// Control and Status Registers.
    pub csr: csr::CsrBank,
    /// Translation Lookaside Buffer.
    pub tlb: mmu::Tlb,
    /// Delayed TLB flush flag.
    pub satp_flush_pending: bool,
    /// LR/SC reservation address.
    pub reservation: Option<u64>,
    /// Context ID assigned at spawn time.
    pub id: usize,
    /// Whether this context is still alive.
    pub alive: bool,
}

impl GuestContext {
    /// Create a new context with default state.
    pub fn new(id: usize) -> Self {
        Self {
            x: [0u32; 32],
            pc: 0x8000_0000,
            privilege: cpu::Privilege::Machine,
            csr: csr::CsrBank::new(),
            tlb: mmu::Tlb::new(),
            satp_flush_pending: false,
            reservation: None,
            id,
            alive: true,
        }
    }
}

/// Top-level RISC-V virtual machine.
/// Owns the CPU, the bus (memory + devices), and guest contexts for multi-process.
pub struct RiscvVm {
    pub cpu: cpu::RiscvCpu,
    pub bus: bus::Bus,
    /// Saved guest contexts for cooperative multi-processing.
    /// Index 0 is the primary context (created at boot).
    pub contexts: Vec<GuestContext>,
    /// Index of the currently active context.
    pub current_context: usize,
    /// Next context ID to assign.
    pub next_context_id: usize,
    /// GPU compute bridge for offloading RISC-V execution to the host GPU.
    /// Lazily initialized on first GPU compute SBI call.
    pub gpu_bridge: gpu_bridge::GpuBridge,
    /// Basic block cache for skipping fetch/decode on hot paths.
    pub block_cache: block_cache::BlockCache,
}

impl std::fmt::Debug for RiscvVm {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.debug_struct("RiscvVm")
            .field("cpu.pc", &self.cpu.pc)
            .field("bus.ram_base", &self.bus.mem.ram_base)
            .field("contexts", &self.contexts.len())
            .field("current_context", &self.current_context)
            .finish()
    }
}

/// Result of a guest boot attempt.
#[derive(Debug)]
pub struct BootResult {
    /// Number of instructions executed.
    pub instructions: u64,
    /// Entry point where CPU started.
    pub entry: u32,
    /// Address where DTB was loaded.
    pub dtb_addr: u64,
}

#[allow(dead_code)]
impl RiscvVm {
    /// Create a new VM with the given RAM size in bytes.
    /// RAM starts at 0x8000_0000 (default for synthetic tests).
    /// Captures CLINT mtime as boot_mtime for GEO_UPTIME syscall.
    pub fn new(ram_size: usize) -> Self {
        let mut bus = bus::Bus::new(0x8000_0000, ram_size);
        let cpu = cpu::RiscvCpu::new();
        let primary = GuestContext::new(0);
        // Phase 257: Record boot time for uptime syscall
        bus.sbi.boot_mtime = bus.clint.mtime;
        Self {
            cpu,
            bus,
            contexts: vec![primary],
            current_context: 0,
            next_context_id: 1,
            gpu_bridge: gpu_bridge::GpuBridge::new(),
            block_cache: block_cache::BlockCache::new(),
        }
    }

    /// Create a new VM with a custom RAM base address.
    /// Used for Linux boot where RAM starts at 0x0000_0000.
    /// Captures CLINT mtime as boot_mtime for GEO_UPTIME syscall.
    pub fn new_with_base(ram_base: u64, ram_size: usize) -> Self {
        let mut bus = bus::Bus::new(ram_base, ram_size);
        let mut cpu = cpu::RiscvCpu::new();
        // Set MTVEC to point to the start of RAM (safe landing zone)
        cpu.csr.mtvec = ram_base as u32;
        let primary = GuestContext::new(0);
        // Phase 257: Record boot time for uptime syscall
        bus.sbi.boot_mtime = bus.clint.mtime;
        Self {
            cpu,
            bus,
            contexts: vec![primary],
            current_context: 0,
            next_context_id: 1,
            gpu_bridge: gpu_bridge::GpuBridge::new(),
            block_cache: block_cache::BlockCache::new(),
        }
    }

    /// Initialize the GPU compute substrate for the RISC-V guest.
    ///
    /// When compiled with `--features gpu`, this creates a wgpu-backed
    /// `ActiveSubstrate` and installs it on the Bus's `SubstrateDevice`.
    /// The substrate is then accessible via MMIO at 0x4000_0000.
    ///
    /// Without the `gpu` feature, this is a no-op.
    ///
    /// Called automatically by `boot_linux_setup_with_patches()` and the
    /// live VM thread, so most callers don't need to invoke this directly.
    pub fn init_gpu_substrate(&mut self) {
        #[cfg(feature = "gpu")]
        {
            let instance = wgpu::Instance::new(&wgpu::InstanceDescriptor {
                backends: wgpu::Backends::all(),
                ..Default::default()
            });
            let adapter =
                match pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions {
                    power_preference: wgpu::PowerPreference::HighPerformance,
                    compatible_surface: None,
                    force_fallback_adapter: false,
                })) {
                    Ok(a) => a,
                    Err(e) => {
                        eprintln!("[gpu-init] No GPU adapter found: {e}, substrate unavailable");
                        return;
                    },
                };
            let info = adapter.get_info();
            eprintln!(
                "[gpu-init] Adapter: {} (backend: {:?})",
                info.name, info.backend
            );
            let (device, queue) =
                match pollster::block_on(adapter.request_device(&wgpu::DeviceDescriptor {
                    label: Some("GeOS RISC-V Substrate"),
                    required_features: wgpu::Features::empty(),
                    required_limits: wgpu::Limits::default(),
                    ..Default::default()
                })) {
                    Ok(pair) => pair,
                    Err(e) => {
                        eprintln!("[gpu-init] Device creation failed: {}", e);
                        return;
                    },
                };
            let substrate =
                crate::kernel::active_substrate::ActiveSubstrate::new(&device, &queue, 256, 256);
            self.bus.substrate = substrate::SubstrateDevice::with_substrate(substrate);
            eprintln!("[gpu-init] Substrate wired into MMIO at 0x4000_0000");
        }
        #[cfg(not(feature = "gpu"))]
        {
            // No GPU available -- substrate commands will return STATUS_DONE
            // as no-ops, and GpuBridge.execute() returns GPU_ERR_UNAVAILABLE.
        }
    }

    /// Execute one step: tick CLINT, sync MIP, run instruction.
    /// Handles cooperative context switching when a guest yields.
    /// Phase 257: Also checks alarms each tick.
    pub fn step(&mut self) -> StepResult {
        // 1. Advance CLINT timer
        self.bus.tick_clint();

        // 1b. Phase 257: Check alarms against current CLINT mtime
        let current_mtime = self.bus.clint.mtime;
        let fired_alarms = self.bus.sbi.check_alarms(current_mtime);
        for (_alarm_id, callback_addr) in fired_alarms {
            if callback_addr != 0 {
                // Fire alarm: jump to callback address.
                // Save return address in ra (x1) so callback can return.
                self.cpu.x[1] = self.cpu.pc;
                self.cpu.pc = callback_addr;
            }
            // callback_addr == 0 means "just wake" -- no jump needed,
            // the context is already running.
        }

        // 2. Sync CLINT hardware state into MIP
        self.bus.sync_mip(&mut self.cpu.csr.mip);

        // 3. Handle pending spawn request
        if let Some((entry, _)) = self.bus.sbi.spawn_requested.take() {
            let ctx_id = self.next_context_id;
            self.next_context_id += 1;
            let mut ctx = GuestContext::new(ctx_id);
            ctx.pc = entry;
            self.contexts.push(ctx);
            // Return the context ID to the caller (in a0)
            self.cpu.x[10] = ctx_id as u32;
        }

        // 4. Execute one CPU instruction via the bus
        let result = self.cpu.step(&mut self.bus);

        // 4b. Handle pending GPU compute request (set by ECALL in step 4)
        if let Some((code_addr, num_words, max_steps, num_tiles, result_addr)) =
            self.bus.sbi.gpu_compute_requested.take()
        {
            let req = gpu_bridge::GpuComputeRequest {
                code_addr,
                num_words: num_words as u32,
                max_steps,
                num_tiles,
                result_addr,
            };
            let bus_ptr = &mut self.bus as *mut bus::Bus;
            // SAFETY: We need split borrows -- gpu_bridge.execute calls read_fn/write_fn
            // which access bus.mem, while gpu_bridge is a separate field.
            let result_code = unsafe {
                let gpu_bridge = &mut *(&mut self.gpu_bridge as *mut gpu_bridge::GpuBridge);
                gpu_bridge.execute(
                    &req,
                    |addr| (*bus_ptr).mem.read_word(addr).unwrap_or(0),
                    |addr, val| {
                        let _ = (*bus_ptr).mem.write_word(addr, val);
                    },
                )
            };
            // Write result code to a0 for the guest (overwrites SBI_SUCCESS)
            self.cpu.x[10] = result_code;
        }

        // 4c. Convert specless probe reports to JIT synthesis requests (before 4d processes them)
        if let Some((mmio_base, magic, sig_lo, sig_hi)) = self.bus.sbi.jit_probe_pending.take() {
            // Infer device type from probe data
            let device_type = if magic == sbi::VIRTIO_MAGIC {
                // VirtIO device: sig_lo = DeviceID (2=BLK, else NET)
                if sig_lo == 2 {
                    sbi::JIT_DEV_VIRTIO_BLK
                } else {
                    sbi::JIT_DEV_VIRTIO_NET
                }
            } else if (sig_lo & sbi::UART_LSR_THRE) != 0 {
                // UART: LSR register had THRE bits set at offset 5
                sbi::JIT_DEV_UART
            } else if (mmio_base >> 24) == 0x60 {
                // Framebuffer: high address range
                sbi::JIT_DEV_FRAMEBUFFER
            } else {
                eprintln!(
                    "[jit] PROBE: unrecognized device at 0x{:08X} magic=0x{:08X} sig=0x{:08X}",
                    mmio_base, magic, sig_lo
                );
                self.cpu.x[10] = sbi::SBI_ERR_FAILURE as u32;
                return result;
            };

            eprintln!(
                "[jit] PROBE: base=0x{:08X} magic=0x{:08X} sig_lo=0x{:08X} sig_hi=0x{:08X} -> inferred device_type={}",
                mmio_base, magic, sig_lo, sig_hi, device_type
            );

            // Convert to standard JIT request and queue it
            self.bus.sbi.jit_driver_pending = Some((device_type, mmio_base));
        }

        // 4d. Handle pending JIT driver synthesis request (legacy: device_type from guest)
        if let Some((device_type, mmio_base)) = self.bus.sbi.jit_driver_pending.take() {
            let _ = mmio_base; // used for logging only
            let slot = device_type as usize;
            let arena = sbi::jit_arena_for_device(device_type) as u64;
            let elf_name = if slot < sbi::JIT_DRIVER_ELFS.len() {
                sbi::JIT_DRIVER_ELFS[slot]
            } else {
                "unknown.elf"
            };

            let driver_dir = std::env::var("GEOS_JIT_DRIVER_DIR").unwrap_or_else(|_| {
                let base = std::env::current_dir().unwrap_or_default();
                let mut p = base;
                p.push("examples");
                p.push("jit_drivers");
                p.to_string_lossy().to_string()
            });
            let full_path = format!("{}/{}", driver_dir, elf_name);

            // --- Hot Synthesis ---
            // Invoke the synthesis engine to generate/compile the driver on-demand.
            let synth_script = "examples/riscv-rust/synthesize_driver.py";
            eprintln!(
                "[jit] Synthesizing driver for device_type={}...",
                device_type
            );
            let synth_output = std::process::Command::new("python3")
                .arg(synth_script)
                .arg(device_type.to_string())
                .arg(&full_path)
                .output();

            match synth_output {
                Ok(output) if output.status.success() => {
                    eprintln!("[jit] Synthesis successful: {}", elf_name);
                },
                Ok(output) => {
                    eprintln!(
                        "[jit] Synthesis failed for {}: {}",
                        elf_name,
                        String::from_utf8_lossy(&output.stderr)
                    );
                    self.cpu.x[10] = sbi::SBI_ERR_FAILURE as u32;
                    // Skip injection attempt -- no ELF was produced
                    return result;
                },
                Err(e) => {
                    eprintln!(
                        "[jit] Failed to execute synthesis script {}: {}",
                        synth_script, e
                    );
                    self.cpu.x[10] = sbi::SBI_ERR_FAILURE as u32;
                    return result;
                },
            }

            if let Ok(elf_data) = std::fs::read(&full_path) {
                if let Some((_entry, code_bytes)) = extract_text_segment(&elf_data) {
                    for (i, &byte) in code_bytes.iter().enumerate() {
                        let _ = self.bus.mem.write_byte(arena + i as u64, byte);
                    }
                    self.cpu.x[10] = sbi::SBI_SUCCESS as u32;
                    self.cpu.x[11] = arena as u32; // entry point = base of slot
                    eprintln!(
                        "[jit] device_type={} mmio=0x{:08X}: injected {} bytes at 0x{:08X} ({})",
                        device_type,
                        mmio_base,
                        code_bytes.len(),
                        arena,
                        elf_name
                    );
                } else {
                    eprintln!("[jit] Failed to extract .text from {}", full_path);
                    self.cpu.x[10] = sbi::SBI_ERR_FAILURE as u32;
                }
            } else {
                eprintln!("[jit] No driver ELF at {} -- skipping injection", full_path);
                self.cpu.x[10] = sbi::SBI_ERR_FAILURE as u32;
            }
        }

        // 5. Handle cooperative yield -- save current, switch to next
        if result == StepResult::Yielded {
            self.save_context();
            let target = if let Some(id) = self.bus.sbi.yield_to_context.take() {
                // Yield to specific context
                id as usize
            } else {
                // Round-robin: find next alive context
                self.next_alive_context()
            };
            if target != self.current_context {
                self.current_context = target;
                self.restore_context();
            }
        }

        result
    }

    /// Execute one step with configurable CLINT tick speed.
    /// Used by the live thread for Linux guests where 1:1 tick ratio is too slow.
    /// Execute one instruction without advancing CLINT mtime.
    /// Used for Linux timer throttling: tick CLINT every Nth instruction
    /// so the kernel's timebase matches reality instead of running 5x fast.
    pub fn step_no_clint(&mut self) -> StepResult {
        // Skip CLINT tick -- mtime stays frozen this instruction.
        // But still sync timer MIP: if mtime >= mtimecmp, STIP/MTIP must
        // remain asserted (level-triggered). Only the SBI set_timer handler
        // clears them by advancing mtimecmp past mtime.
        // We skip ticking mtime but NOT the pending-check.

        // 1b. Check alarms
        let current_mtime = self.bus.clint.mtime;
        let fired_alarms = self.bus.sbi.check_alarms(current_mtime);
        for (_alarm_id, callback_addr) in fired_alarms {
            if callback_addr != 0 {
                self.cpu.x[1] = self.cpu.pc;
                self.cpu.pc = callback_addr;
            }
        }

        // 2. Sync MIP (MSIP, MEIP only -- skip timer to avoid storms when clock frozen)
        self.bus.sync_mip_skip_timer(&mut self.cpu.csr.mip);

        // 3. Handle pending spawn request
        if let Some((entry, _)) = self.bus.sbi.spawn_requested.take() {
            let ctx_id = self.next_context_id;
            self.next_context_id += 1;
            let mut ctx = GuestContext::new(ctx_id);
            ctx.pc = entry;
            self.contexts.push(ctx);
            self.cpu.x[10] = ctx_id as u32;
        }

        // 4. Execute one CPU instruction (try block cache first)
        let result = match self.block_cache.execute(&mut self.cpu, &mut self.bus) {
            block_cache::CacheExecResult::Executed(r) => r,
            block_cache::CacheExecResult::Miss => self.cpu.step(&mut self.bus),
        };

        // 4b. Handle GPU compute
        if let Some((code_addr, num_words, max_steps, num_tiles, result_addr)) =
            self.bus.sbi.gpu_compute_requested.take()
        {
            let req = gpu_bridge::GpuComputeRequest {
                code_addr,
                num_words: num_words as u32,
                max_steps,
                num_tiles,
                result_addr,
            };
            let bus_ptr = &mut self.bus as *mut bus::Bus;
            let result_code = unsafe {
                let gpu_bridge = &mut *(&mut self.gpu_bridge as *mut gpu_bridge::GpuBridge);
                gpu_bridge.execute(
                    &req,
                    |addr| (*bus_ptr).mem.read_word(addr).unwrap_or(0),
                    |addr, val| {
                        let _ = (*bus_ptr).mem.write_word(addr, val);
                    },
                )
            };
            self.cpu.x[10] = result_code;
        }

        // 5. Handle cooperative yield
        if result == StepResult::Yielded {
            self.save_context();
            let target = if let Some(id) = self.bus.sbi.yield_to_context.take() {
                id as usize
            } else {
                self.next_alive_context()
            };
            if target != self.current_context {
                self.current_context = target;
                self.restore_context();
            }
        }

        result
    }

    pub fn step_with_clint_ticks(&mut self, ticks: u64) -> StepResult {
        // 1. Advance CLINT timer by N ticks
        self.bus.tick_clint_n(ticks);

        // 1b. Check alarms
        let current_mtime = self.bus.clint.mtime;
        let fired_alarms = self.bus.sbi.check_alarms(current_mtime);
        for (_alarm_id, callback_addr) in fired_alarms {
            if callback_addr != 0 {
                self.cpu.x[1] = self.cpu.pc;
                self.cpu.pc = callback_addr;
            }
        }

        // 2. Sync CLINT hardware state into MIP
        self.bus.sync_mip(&mut self.cpu.csr.mip);

        // 3. Handle pending spawn request
        if let Some((entry, _)) = self.bus.sbi.spawn_requested.take() {
            let ctx_id = self.next_context_id;
            self.next_context_id += 1;
            let mut ctx = GuestContext::new(ctx_id);
            ctx.pc = entry;
            self.contexts.push(ctx);
            self.cpu.x[10] = ctx_id as u32;
        }

        // 4. Execute one CPU instruction (try block cache first)
        let result = match self.block_cache.execute(&mut self.cpu, &mut self.bus) {
            block_cache::CacheExecResult::Executed(r) => r,
            block_cache::CacheExecResult::Miss => self.cpu.step(&mut self.bus),
        };

        // 4b. Handle GPU compute
        if let Some((code_addr, num_words, max_steps, num_tiles, result_addr)) =
            self.bus.sbi.gpu_compute_requested.take()
        {
            let req = gpu_bridge::GpuComputeRequest {
                code_addr,
                num_words: num_words as u32,
                max_steps,
                num_tiles,
                result_addr,
            };
            let bus_ptr = &mut self.bus as *mut bus::Bus;
            let result_code = unsafe {
                let gpu_bridge = &mut *(&mut self.gpu_bridge as *mut gpu_bridge::GpuBridge);
                gpu_bridge.execute(
                    &req,
                    |addr| (*bus_ptr).mem.read_word(addr).unwrap_or(0),
                    |addr, val| {
                        let _ = (*bus_ptr).mem.write_word(addr, val);
                    },
                )
            };
            self.cpu.x[10] = result_code;
        }

        // 5. Handle cooperative yield
        if result == StepResult::Yielded {
            self.save_context();
            let target = if let Some(id) = self.bus.sbi.yield_to_context.take() {
                id as usize
            } else {
                self.next_alive_context()
            };
            if target != self.current_context {
                self.current_context = target;
                self.restore_context();
            }
        }

        result
    }

    /// Save current CPU state into the active context.
    pub fn save_context(&mut self) {
        if let Some(ctx) = self.contexts.get_mut(self.current_context) {
            ctx.x.copy_from_slice(&self.cpu.x);
            ctx.pc = self.cpu.pc;
            ctx.privilege = self.cpu.privilege;
            ctx.csr = self.cpu.csr.clone();
            ctx.tlb = self.cpu.tlb.clone();
            ctx.satp_flush_pending = self.cpu.satp_flush_pending;
            ctx.reservation = self.cpu.reservation;
        }
    }

    /// Restore CPU state from the active context.
    pub fn restore_context(&mut self) {
        if let Some(ctx) = self.contexts.get(self.current_context) {
            self.cpu.x.copy_from_slice(&ctx.x);
            self.cpu.pc = ctx.pc;
            self.cpu.privilege = ctx.privilege;
            self.cpu.csr = ctx.csr.clone();
            self.cpu.tlb = ctx.tlb.clone();
            self.cpu.satp_flush_pending = ctx.satp_flush_pending;
            self.cpu.reservation = ctx.reservation;
        }
    }

    /// Find the next alive context in round-robin order.
    fn next_alive_context(&self) -> usize {
        let n = self.contexts.len();
        if n <= 1 {
            return self.current_context;
        }
        for i in 1..n {
            let idx = (self.current_context + i) % n;
            if self.contexts[idx].alive {
                return idx;
            }
        }
        // All dead except current -- stay put
        self.current_context
    }

    /// Get the number of alive contexts.
    pub fn alive_context_count(&self) -> usize {
        self.contexts.iter().filter(|c| c.alive).count()
    }

    /// Kill a context by ID. Returns true if the context was found and killed.
    pub fn kill_context(&mut self, id: usize) -> bool {
        if let Some(ctx) = self.contexts.get_mut(id) {
            if ctx.alive {
                ctx.alive = false;
                return true;
            }
        }
        false
    }

    // Phase 201: Checkpointing and Spatial Version Control
    // Add checkpoint and restore methods for Memory Palace snapshot/restore.

    /// Create a checkpoint snapshot of the current VM state.
    /// Returns (filename, checkpoint) where filename can be used for restore.
    pub fn create_checkpoint(
        &mut self,
        description: Option<String>,
    ) -> Result<(String, checkpoint::Checkpoint), checkpoint::CheckpointError> {
        use checkpoint::*;

        let checkpoint_dir = ensure_checkpoint_dir()?;
        let timestamp = generate_checkpoint_id();

        // Snapshot CPU state
        let pc = self.cpu.pc;
        let registers = self.cpu.x;
        let mtvec = self.cpu.csr.mtvec;
        let mscratch = self.cpu.csr.mscratch;

        // Snapshot RAM
        let ram_bytes = self.bus.mem.ram_snapshot();

        // Snapshot contexts
        let contexts: Vec<ContextSnapshot> = self
            .contexts
            .iter()
            .map(|ctx| ContextSnapshot {
                context_id: ctx.id,
                registers: ctx.x,
                pc: ctx.pc,
            })
            .collect();

        let current_context = self.current_context;
        let next_context_id = self.next_context_id;

        // Note: block_cache is transient optimization, not saved

        let checkpoint = Checkpoint {
            timestamp,
            parent_id: None,
            description,
            pc,
            registers,
            mtvec,
            mscratch,
            ram_bytes,
            contexts,
            current_context,
            next_context_id,
            block_cache_entries: Vec::new(),
        };

        let filename = save_checkpoint(&checkpoint, &checkpoint_dir)?;
        Ok((filename, checkpoint))
    }

    /// Restore VM state from a checkpoint file.
    pub fn restore_checkpoint(
        &mut self,
        filename: &str,
    ) -> Result<checkpoint::Checkpoint, checkpoint::CheckpointError> {
        use checkpoint::*;

        let checkpoint_dir = ensure_checkpoint_dir()?;
        let checkpoint = load_checkpoint(filename, &checkpoint_dir)?;

        // Validate RAM size matches
        if checkpoint.ram_bytes.len() != self.bus.mem.ram_size() {
            return Err(CheckpointError::Invalid(format!(
                "Checkpoint RAM size ({}) does not match VM RAM size ({})",
                checkpoint.ram_bytes.len(),
                self.bus.mem.ram_size()
            )));
        }

        // Restore CPU state
        self.cpu.pc = checkpoint.pc;
        self.cpu.x = checkpoint.registers;
        self.cpu.csr.mtvec = checkpoint.mtvec;
        self.cpu.csr.mscratch = checkpoint.mscratch;

        // Restore RAM
        if !self.bus.mem.ram_restore(&checkpoint.ram_bytes) {
            return Err(CheckpointError::Invalid(
                "Failed to restore RAM: size mismatch".to_string(),
            ));
        }

        // Restore contexts (create new GuestContext objects)
        self.contexts = checkpoint
            .contexts
            .iter()
            .map(|snap| GuestContext {
                x: snap.registers,
                pc: snap.pc,
                privilege: cpu::Privilege::Machine,
                csr: csr::CsrBank::new(),
                tlb: mmu::Tlb::new(),
                satp_flush_pending: false,
                reservation: None,
                id: snap.context_id,
                alive: true,
            })
            .collect();

        self.current_context = checkpoint.current_context;
        self.next_context_id = checkpoint.next_context_id;

        // Invalidate block cache on restore (it's transient)
        self.block_cache.invalidate();

        Ok(checkpoint)
    }

    /// List all available checkpoints.
    pub fn list_checkpoints(&self) -> Result<Vec<String>, checkpoint::CheckpointError> {
        use checkpoint::*;
        let checkpoint_dir = ensure_checkpoint_dir()?;
        list_checkpoints(&checkpoint_dir)
    }

    /// Delete a checkpoint file.
    pub fn delete_checkpoint(&self, filename: &str) -> Result<(), checkpoint::CheckpointError> {
        use checkpoint::*;
        let checkpoint_dir = ensure_checkpoint_dir()?;
        delete_checkpoint(filename, &checkpoint_dir)
    }

    /// Diff two checkpoints and return a structured comparison.
    pub fn diff_checkpoints(
        &self,
        filename_a: &str,
        filename_b: &str,
    ) -> Result<serde_json::Value, checkpoint::CheckpointError> {
        use checkpoint::*;
        let checkpoint_dir = ensure_checkpoint_dir()?;
        let a = load_checkpoint(filename_a, &checkpoint_dir)?;
        let b = load_checkpoint(filename_b, &checkpoint_dir)?;
        Ok(diff_checkpoints(&a, &b))
    }
}
