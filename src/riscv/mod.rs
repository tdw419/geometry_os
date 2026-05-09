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

pub mod boot;
pub mod bridge;
pub mod bus;
pub mod clint;
pub mod cpu;
pub mod csr;
pub mod decode;
pub mod dtb;
pub mod framebuf;
pub mod gpu;
pub mod gpu_bridge;
pub mod gpu_loader;
pub mod gpu_reference;
pub mod live;
pub mod loader;
pub mod memory;
pub mod mmu;
pub mod plic;
pub mod sbi;
pub mod socket;
pub mod syscall;
pub mod trace;
pub mod uart;
pub mod vfs_surface;
pub mod virtio_blk;
pub mod virtio_net;

#[cfg(test)]
mod tests;

use cpu::StepResult;

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
        }
    }

    /// Create a new VM with a custom RAM base address.
    /// Used for Linux boot where RAM starts at 0x0000_0000.
    /// Captures CLINT mtime as boot_mtime for GEO_UPTIME syscall.
    pub fn new_with_base(ram_base: u64, ram_size: usize) -> Self {
        let mut bus = bus::Bus::new(ram_base, ram_size);
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
                num_words,
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

        // 5. Handle cooperative yield -- save current, switch to next
        if result == StepResult::Yielded {
            self.save_context();
            let target = if let Some(id) = self.bus.sbi.yield_to_context.take() {
                // Yield to specific context
                id
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
        // Skip timer MIP sync to avoid level-triggered timer storms:
        // once mtime >= mtimecmp, the timer would fire on every instruction
        // even though we're not advancing mtime. Only sync MSIP/MEIP.

        // 1b. Check alarms
        let current_mtime = self.bus.clint.mtime;
        let fired_alarms = self.bus.sbi.check_alarms(current_mtime);
        for (_alarm_id, callback_addr) in fired_alarms {
            if callback_addr != 0 {
                self.cpu.x[1] = self.cpu.pc;
                self.cpu.pc = callback_addr;
            }
        }

        // 2. Sync MIP (skip timer to avoid level-triggered storm)
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

        // 4. Execute one CPU instruction
        let result = self.cpu.step(&mut self.bus);

        // 4b. Handle GPU compute
        if let Some((code_addr, num_words, max_steps, num_tiles, result_addr)) =
            self.bus.sbi.gpu_compute_requested.take()
        {
            let req = gpu_bridge::GpuComputeRequest {
                code_addr,
                num_words,
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
                id
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

        // 4. Execute one CPU instruction
        let result = self.cpu.step(&mut self.bus);

        // 4b. Handle GPU compute
        if let Some((code_addr, num_words, max_steps, num_tiles, result_addr)) =
            self.bus.sbi.gpu_compute_requested.take()
        {
            let req = gpu_bridge::GpuComputeRequest {
                code_addr,
                num_words,
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
                id
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
}
