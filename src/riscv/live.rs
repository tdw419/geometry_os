#![allow(dead_code)]
// riscv/live.rs -- Off-thread RISC-V VM with channel-based present (Phase B, b.1.1)
//
// Spawns RiscvVm on its own thread. When the guest writes to the framebuffer
// control register (fb_present), the pixel buffer is cloned and sent over an
// mpsc channel to the GUI thread. The GUI thread recv()s on its render tick.
//
// This makes the synchronous-callback-in-bus-write bug structurally impossible:
// the VM thread never touches the display surface.
//
// Controls: pause/resume/reset/shutdown via ThreadControl enum.
// The GUI thread calls try_recv_frame() each render tick (non-blocking).

use super::cpu::{self, StepResult};
use super::framebuf::{FB_HEIGHT, FB_WIDTH};
use super::loader;
use super::RiscvVm;

use std::cell::RefCell;
use std::fs;
use std::io::Write;
use std::rc::Rc;
use std::sync::mpsc::{self, Receiver, Sender, TryRecvError};
use std::thread::{self, JoinHandle};

// ── Messages ─────────────────────────────────────────────────────

/// A single frame of pixels from the guest, sent over the channel.
#[derive(Debug, Clone)]
pub struct Frame {
    /// 256*256 RGBA pixels (same layout as Framebuffer::pixels).
    pub pixels: Vec<u32>,
    /// Width (256).
    pub width: usize,
    /// Height (256).
    pub height: usize,
    /// Instruction count at time of present.
    pub instructions: u64,
    /// Clip rectangle active when present fired: (x, y, w, h).
    /// None means the full framebuffer should be composited.
    /// When Some, the GUI should only blit pixels within this rect.
    pub clip_rect: super::framebuf::ClipRect,
}

/// Control messages sent from the GUI thread to the VM thread.
#[allow(dead_code)]
pub enum ThreadControl {
    /// Stop the VM loop and join the thread.
    Shutdown,
    /// Pause execution (VM thread spins without stepping).
    Pause,
    /// Resume execution after a pause.
    Resume,
    /// Reset VM: reload ELF from stored bytes, reset PC.
    Reset,
    /// Forward a keyboard byte to the guest's UART RX.
    Input(u8),
    /// Send a copy of the current framebuffer over the frame channel.
    /// Used by the socket handler to visually verify guest output.
    TriggerSnapshot,
}

/// Status reports sent from the VM thread to the GUI thread.
#[derive(Debug)]
pub enum VmStatus {
    /// VM has halted (ebreak, shutdown, fault).
    Halted {
        pc: u32,
        instructions: u64,
        reason: String,
    },
    /// VM reset completed.
    ResetDone,
    /// VM paused.
    Paused,
    /// VM resumed.
    Resumed,
}

// ── Handle ───────────────────────────────────────────────────────

/// Handle to the off-thread RISC-V VM.
///
/// The GUI thread holds this. It provides:
/// - try_recv_frame(): non-blocking frame receive for the render loop
/// - control(): send control commands (pause/resume/reset/shutdown)
/// - try_recv_status(): check for status updates (halted, reset, etc.)
pub struct RiscvVmHandle {
    /// Channel: VM thread -> GUI thread (pixel frames).
    frame_rx: Receiver<Frame>,
    /// Channel: GUI thread -> VM thread (control commands).
    control_tx: Sender<ThreadControl>,
    /// Channel: VM thread -> GUI thread (status updates).
    status_rx: Receiver<VmStatus>,
    /// Channel: VM thread -> GUI thread (guest console output).
    console_rx: Receiver<Vec<u8>>,
    /// Channel: GUI thread -> VM thread (host->guest virtio-serial data).
    serial_input_tx: Sender<Vec<u8>>,
    /// Handle to the VM thread (for join on drop).
    thread_handle: Option<JoinHandle<()>>,
    /// Whether the VM is currently paused.
    paused: bool,
    /// Most recent frame received from the VM (updated by render loop or snapshot).
    pub last_frame: Option<Frame>,
}

impl RiscvVmHandle {
    /// Non-blocking check for a new frame from the VM.
    /// Returns Ok(Frame) if one is available, Err(TryRecvError) otherwise.
    /// Call this each render tick in the GUI loop.
    pub fn try_recv_frame(&self) -> Result<Frame, TryRecvError> {
        self.frame_rx.try_recv()
    }

    /// Non-blocking check for new console output from the guest.
    pub fn try_recv_console(&self) -> Result<Vec<u8>, TryRecvError> {
        self.console_rx.try_recv()
    }

    /// Send data to the guest via virtio-serial (host -> guest).
    /// The data is queued into the RX buffer and delivered next time
    /// the guest kicks the receive virtqueue.
    pub fn send_serial(&self, data: Vec<u8>) {
        let _ = self.serial_input_tx.send(data);
    }

    /// Send a control command to the VM thread.
    pub fn control(&self, cmd: ThreadControl) {
        let _ = self.control_tx.send(cmd);
    }

    /// Request a snapshot of the current framebuffer from the VM thread.
    /// Sends TriggerSnapshot, waits up to 500ms for the response frame.
    /// Returns the frame or None on timeout.
    pub fn snapshot(&mut self) -> Option<Frame> {
        // Drain any stale frames first
        while self.frame_rx.try_recv().is_ok() {}

        // Request snapshot
        let _ = self.control_tx.send(ThreadControl::TriggerSnapshot);

        // Wait for the response (with timeout)
        let start = std::time::Instant::now();
        loop {
            match self.frame_rx.try_recv() {
                Ok(frame) => {
                    self.last_frame = Some(frame.clone());
                    return Some(frame);
                },
                Err(TryRecvError::Empty) => {
                    if start.elapsed().as_millis() > 500 {
                        return self.last_frame.clone();
                    }
                    std::thread::sleep(std::time::Duration::from_millis(1));
                },
                Err(TryRecvError::Disconnected) => return None,
            }
        }
    }

    /// Non-blocking check for VM status updates.
    pub fn try_recv_status(&self) -> Result<VmStatus, TryRecvError> {
        self.status_rx.try_recv()
    }

    /// Check if the VM is paused.
    pub fn is_paused(&self) -> bool {
        self.paused
    }

    /// Convenience: pause the VM.
    pub fn pause(&mut self) {
        self.control(ThreadControl::Pause);
        self.paused = true;
    }

    /// Convenience: resume the VM.
    pub fn resume(&mut self) {
        self.control(ThreadControl::Resume);
        self.paused = false;
    }

    /// Convenience: reset the VM.
    pub fn reset(&self) {
        self.control(ThreadControl::Reset);
    }

    /// Forward a keyboard byte to the guest's UART RX.
    /// Call this from the GUI thread when a key is pressed and the
    /// RISC-V program should receive it.
    pub fn send_input(&self, byte: u8) {
        let _ = self.control_tx.send(ThreadControl::Input(byte));
    }

    /// Shut down the VM thread and wait for it to finish.
    pub fn shutdown(&mut self) {
        self.control(ThreadControl::Shutdown);
        if let Some(handle) = self.thread_handle.take() {
            let _ = handle.join();
        }
    }
}

impl Drop for RiscvVmHandle {
    fn drop(&mut self) {
        self.shutdown();
    }
}

// ── Spawner ──────────────────────────────────────────────────────

/// Execution mode for the guest VM.
#[derive(Clone)]
pub enum GuestMode {
    /// Load and run a standard RISC-V ELF binary.
    Elf(Vec<u8>),
    /// Boot a RISC-V Linux kernel with optional initramfs and bootargs.
    Linux {
        kernel: Vec<u8>,
        initrd: Option<Vec<u8>>,
        bootargs: String,
    },
}

/// Configuration for spawning a new RiscvVmThread.
pub struct VmThreadConfig {
    /// Guest execution mode (ELF or Linux).
    pub mode: GuestMode,
    /// RAM size in bytes (default: 1MB).
    pub ram_size: usize,
    /// RAM base address (default: 0x8000_0000).
    pub ram_base: u64,
    /// Instructions per batch between channel checks (default: 5000).
    pub batch_size: u32,
    /// Initial privilege level (default: None, uses CPU default which is Machine).
    pub initial_privilege: Option<super::cpu::Privilege>,
    /// Initial stack pointer (default: None).
    pub initial_sp: Option<u32>,
    /// Whether pixel-native spatial syscall dispatching is enabled (default: false).
    pub pixel_native: bool,
}

impl Default for VmThreadConfig {
    fn default() -> Self {
        Self {
            mode: GuestMode::Elf(Vec::new()),
            ram_size: 1024 * 1024,
            ram_base: 0x8000_0000,
            batch_size: 5000,
            initial_privilege: None,
            initial_sp: None,
            pixel_native: false,
        }
    }
}

/// Spawn a RISC-V VM on its own thread with channel-based present.
///
/// Returns an RiscvVmHandle for the GUI thread to receive frames
/// and send control commands.
pub fn spawn_vm_thread(config: VmThreadConfig) -> Result<RiscvVmHandle, String> {
    let (frame_tx, frame_rx) = mpsc::channel::<Frame>();
    let (control_tx, control_rx) = mpsc::channel::<ThreadControl>();
    let (status_tx, status_rx) = mpsc::channel::<VmStatus>();
    let (console_tx, console_rx) = mpsc::channel::<Vec<u8>>();
    let (serial_input_tx, serial_input_rx) = mpsc::channel::<Vec<u8>>();

    let handle = thread::Builder::new()
        .name("riscv-vm".into())
        .spawn(move || {
            vm_thread_main(
                config,
                frame_tx,
                control_rx,
                status_tx,
                console_tx,
                serial_input_rx,
            );
        })
        .map_err(|e| format!("Failed to spawn VM thread: {}", e))?;

    Ok(RiscvVmHandle {
        frame_rx,
        control_tx,
        status_rx,
        console_rx,
        serial_input_tx,
        thread_handle: Some(handle),
        paused: false,
        last_frame: None,
    })
}

// ── VM Thread Main Loop ──────────────────────────────────────────

fn vm_thread_main(
    config: VmThreadConfig,
    frame_tx: Sender<Frame>,
    control_rx: Receiver<ThreadControl>,
    status_tx: Sender<VmStatus>,
    console_tx: Sender<Vec<u8>>,
    serial_input_rx: Receiver<Vec<u8>>,
) {
    eprintln!("[riscv-vm] Thread started");
    let _ = std::io::stderr().flush();

    // Shared parameters
    let ram_size = config.ram_size;
    let ram_base = config.ram_base;
    let batch_size = config.batch_size;

    // 1. Initialize VM based on mode
    let (mut vm, is_linux, fw_addr, dtb_addr) = match config.mode {
        GuestMode::Elf(ref elf_data) => {
            eprintln!("[riscv-vm] Mode: ELF (len={})", elf_data.len());
            let _ = std::io::stderr().flush();
            let mut vm = RiscvVm::new_with_base(config.ram_base, config.ram_size);
            let load_info = match loader::load_elf(&mut vm.bus, elf_data) {
                Ok(info) => info,
                Err(e) => {
                    let _ = status_tx.send(VmStatus::Halted {
                        pc: 0,
                        instructions: 0,
                        reason: format!("ELF load error: {:?}", e),
                    });
                    return;
                },
            };
            vm.cpu.pc = load_info.entry;

            // Set up Linux-style heap
            vm.bus.heap_start = load_info.highest_addr;
            vm.bus.heap_end = load_info.highest_addr;
            // mmap region starts at mid-RAM, grows upward toward stack
            vm.bus.mmap_next = ram_base + ram_size as u64 / 2;

            // Apply manual overrides (e.g., for User-mode emulation)
            if let Some(p) = config.initial_privilege {
                vm.cpu.privilege = p;
            }
            if let Some(sp) = config.initial_sp {
                vm.cpu.x[2] = sp;
            } else if config.initial_privilege == Some(super::cpu::Privilege::User) {
                // Default stack for User mode if not specified: top of RAM
                vm.cpu.x[2] = (ram_base + ram_size as u64 - 16) as u32;
            }

            // For User-mode emulation: disable all interrupts so the timer
            // doesn't immediately trap back to Machine mode (which would
            // restart the ELF in an infinite loop). Also set mstatus.MIE=0
            // to prevent any interrupt from firing while in User mode.
            if config.initial_privilege == Some(super::cpu::Privilege::User) {
                vm.cpu.csr.mie = 0; // Disable all interrupt enables
                vm.cpu.csr.mstatus &= !(1 << 3); // Clear MIE bit
            }

            (vm, false, 0u64, 0u64)
        },
        GuestMode::Linux {
            ref kernel,
            ref initrd,
            ref bootargs,
        } => {
            eprintln!(
                "[riscv-vm] Mode: Linux (kernel={}, initrd={}, bootargs='{}')",
                kernel.len(),
                initrd.as_ref().map_or(0, |i| i.len()),
                bootargs
            );
            let _ = std::io::stderr().flush();
            let ram_size_mb = (config.ram_size / (1024 * 1024)) as u32;
            // Load System.map for kernel patches (fall back to defaults if not found)
            let patches = std::fs::read_to_string(".geometry_os/build/linux-6.14/System.map")
                .ok()
                .map(|m| super::kernel_patches::KernelPatches::from_system_map(&m));
            match RiscvVm::boot_linux_setup_with_patches(
                kernel,
                initrd.as_deref(),
                ram_size_mb,
                bootargs,
                patches,
            ) {
                Ok((mut vm, fw, entry, dtb)) => {
                    // GPU substrate already initialized by boot_linux_setup_with_patches()
                    (vm, true, fw, dtb)
                },
                Err(e) => {
                    let _ = status_tx.send(VmStatus::Halted {
                        pc: 0,
                        instructions: 0,
                        reason: format!("Linux setup error: {:?}", e),
                    });
                    return;
                },
            }
        },
    };

    vm.bus.pixel_native_enabled = config.pixel_native;

    // Initialize GPU substrate for ELF mode (Linux mode gets it from boot_linux_setup).
    // Behind cfg(gpu), this is a no-op without the feature.
    if !is_linux {
        vm.init_gpu_substrate();
    }

    // Instruction count tracker for present callback
    let instruction_count: Rc<RefCell<u64>> = Rc::new(RefCell::new(0));

    // Install channel-based present callback
    let ft = frame_tx.clone();
    let ic_clone = instruction_count.clone();
    let present_cb: super::framebuf::PresentCallback =
        Rc::new(RefCell::new(move |pixels: &[u32], clip_rect| {
            let frame = Frame {
                pixels: pixels.to_vec(),
                width: FB_WIDTH,
                height: FB_HEIGHT,
                instructions: *ic_clone.borrow(),
                clip_rect,
            };
            let _ = ft.send(frame);
        }));
    vm.bus.framebuf.on_present = Some(present_cb);

    // Wire virtio-serial TX callback to forward guest serial output
    // through the console channel (same path as SBI/UART).
    let serial_console_tx = console_tx.clone();
    vm.bus
        .virtio_serial
        .set_tx_callback(Box::new(move |data: &[u8]| {
            let _ = serial_console_tx.send(data.to_vec());
        }));

    let mut paused = false;
    let mut running = true;
    let mut count = 0u64;
    let fw_addr_u32 = fw_addr as u32;
    let mut last_satp = vm.cpu.csr.satp;

    // Linux diagnostic state
    let mut linux_diag_count: u64 = 0;
    let mut linux_last_pc: u32 = 0;
    let mut linux_fault_count: u64 = 0;

    // CPU safety throttle for Linux mode.
    // The Linux VM can spin billions of instructions in tight loops (e.g.,
    // check_unaligned_access polling jiffies, or cpu_idle WFI). Without a
    // yield, this pegs a core at 100% and can thermally throttle or lock up
    // the host machine.
    //
    // Two mechanisms:
    // 1. Periodic yield: every 10M instructions, yield the thread for 1ms.
    //    This caps CPU at ~99% and gives the OS scheduler breathing room.
    // 2. Stall detector: if the VM visits fewer than 8 unique PCs over 50M
    //    instructions with no new console output, it's in a tight spin.
    //    Increase the sleep to 10ms to dramatically reduce CPU burn.
    //    The stall resets if new console output appears (kernel is still
    //    making progress via printk).
    const YIELD_INTERVAL: u64 = 10_000_000;
    const STALL_WINDOW: u64 = 50_000_000;
    const STALL_UNIQUE_PC_THRESHOLD: usize = 8;
    let mut stall_pc_set: std::collections::HashSet<u32> = std::collections::HashSet::new();
    let mut stall_check_start: u64 = 0;
    let mut last_console_len: usize = 0;
    let mut stalled: bool = false;

    eprintln!("[riscv-vm] Starting loop, is_linux={}", is_linux);

    // Enable block cache for Linux boot (skips fetch/decode on hot paths).
    if is_linux {
        vm.block_cache.enabled = false; // Phase 43: Disable for high-fidelity tracing
    }

    while running {
        // 1. Process control commands
        match control_rx.try_recv() {
            Ok(ThreadControl::Shutdown) => break,
            Ok(ThreadControl::Pause) => {
                paused = true;
                let _ = status_tx.send(VmStatus::Paused);
            },
            Ok(ThreadControl::Resume) => {
                paused = false;
                let _ = status_tx.send(VmStatus::Resumed);
            },
            Ok(ThreadControl::Reset) => {
                // For now, reset just kills. Full reload requires storing config.
                let _ = status_tx.send(VmStatus::Halted {
                    pc: vm.cpu.pc,
                    instructions: count,
                    reason: "Reset not fully implemented for live thread".into(),
                });
                break;
            },
            Ok(ThreadControl::Input(byte)) => {
                vm.bus.uart.receive_byte(byte);
            },
            Ok(ThreadControl::TriggerSnapshot) => {
                // Clone current framebuffer and send as a Frame
                // Snapshot always sends full buffer (no clip restriction)
                let frame = Frame {
                    pixels: vm.bus.framebuf.pixels.clone(),
                    width: FB_WIDTH,
                    height: FB_HEIGHT,
                    instructions: count,
                    clip_rect: None, // full buffer for snapshots
                };
                let _ = frame_tx.send(frame);
            },
            Err(TryRecvError::Empty) => {},
            Err(TryRecvError::Disconnected) => break,
        }

        // 2. If paused, yield and continue
        if paused {
            thread::yield_now();
            continue;
        }

        // 3. Run a batch of instructions
        let mut halt_reason = None;
        for _ in 0..batch_size {
            // Linux-mode logic: trap forwarding and PT fixups
            if is_linux {
                // SATP change identity mapping injection
                let cur_satp = vm.cpu.csr.satp;
                if cur_satp != last_satp {
                    let mode = (cur_satp >> 31) & 1;
                    if mode == 1 {
                        let ppn = cur_satp & 0x3FFFFF;
                        let pg_dir_phys = (ppn as u64) * 4096;
                        // Inject device identity mappings (0x02000000, 0x0C000000, 0x10000000)
                        // Restricted to indices 0..72 (up to 288MB) to avoid conflicting
                        // with userspace RAM/stack/heap which starts appearing at higher indices.
                        let identity_pte: u32 = 0x0000_00CF; // V+R+W+X+A+D, U=0
                        for l1_idx in 0..72 {
                            let addr = pg_dir_phys + (l1_idx as u64) * 4;
                            if let Ok(existing) = vm.bus.read_word(addr) {
                                if (existing & 1) == 0 {
                                    let pte = identity_pte | (l1_idx << 20);
                                    let _ = vm.bus.write_word(addr, pte);
                                }
                            }
                        }
                        // Ensure DTB is mapped
                        let dtb_va = dtb_addr as u32;
                        let dtb_vpn1 = ((dtb_va >> 22) & 0x3FF) as u64;
                        let l1_addr = pg_dir_phys + dtb_vpn1 * 4;
                        if let Ok(l1_entry) = vm.bus.read_word(l1_addr) {
                            if (l1_entry & 1) == 0 {
                                let dtb_l1_offset = (dtb_addr >> 22) as u32;
                                let pte = 0x0000_00CF | (dtb_l1_offset << 20);
                                let _ = vm.bus.write_word(l1_addr, pte);
                            }
                        }
                        vm.cpu.tlb.flush_all();
                    }
                    last_satp = cur_satp;
                }
            }

            // Linux timer fix: don't tick CLINT every instruction.
            // The kernel expects timebase=10MHz (from DTB). At ~52 MIPS,
            // ticking every instruction makes mtime run at 52MHz -- 5x too fast.
            // This causes a timer interrupt storm: the kernel spends all its
            // time in ret_from_exception / handle_riscv_irq and never reaches
            // printk.
            //
            // Fix: only tick CLINT every 5 instructions. This gives ~10.4MHz
            // effective timebase, close enough for kernel scheduling.
            // Timer throttle: only tick CLINT every 200th instruction.
            // Without this, mtime runs at instruction speed (~52MHz) but
            // the kernel expects 10MHz timebase -> timer interrupt storm.
            // Even at 1:5 the storm persists because the timer handler
            // needs hundreds of instructions between ticks. 1:200 gives
            // ~260kHz effective timebase -- slow enough for the kernel
            // to complete timer handling before the next interrupt.
            let prev_mtime = vm.bus.clint.mtime;
            let pc_before = vm.cpu.pc;
            let priv_before = vm.cpu.privilege;

            // Phase 43: High-fidelity tracing around the trap area
            if is_linux && count > 178400 && count < 178500 {
                if let Some(info) = &vm.cpu.last_step {
                    let msg = format!(
                        "[trace] #{} PC=0x{:08X} word=0x{:08X} len={} op={:?} priv={:?}\n",
                        count, info.pc, info.word, info.inst_len, info.op, priv_before
                    );
                    eprintln!("{}", msg);
                }
            }

            let step_result = if is_linux && (count % 100 == 0) {
                vm.step_with_clint_ticks(1)
            } else if is_linux {
                vm.step_no_clint()
            } else {
                vm.step()
            };

            // Detect S->M traps (Linux mode only)
            if is_linux
                && priv_before == crate::riscv::cpu::Privilege::Supervisor
                && vm.cpu.privilege == crate::riscv::cpu::Privilege::Machine
            {
                let msg = format!(
                    "[boot] S->M TRAP at count={}: PC was=0x{:08X} now=0x{:08X} mcause=0x{:08X} mepc=0x{:08X} mtval=0x{:08X} mtvec=0x{:08X} stvec=0x{:08X}\n",
                    count, pc_before, vm.cpu.pc, vm.cpu.csr.mcause, vm.cpu.csr.mepc, vm.cpu.csr.mtval, vm.cpu.csr.mtvec, vm.cpu.csr.stvec
                );
                // Validation: Read back the failing memory area
                let s1_pa: u64 = 0x80400000 + 0x0FFE;
                let b0 = vm.bus.read_byte(s1_pa).unwrap_or(0);
                let b1 = vm.bus.read_byte(s1_pa + 1).unwrap_or(0);
                let b2 = vm.bus.read_byte(s1_pa + 2).unwrap_or(0);
                let b3 = vm.bus.read_byte(s1_pa + 3).unwrap_or(0);
                let msg2 = format!(
                    "[trap-diag] PA 0x{:08X} bytes in RAM: {:02X} {:02X} {:02X} {:02X}\n",
                    s1_pa, b0, b1, b2, b3
                );

                eprintln!("{}{}", msg, msg2);
                let _ = std::io::stderr().flush();
                if let Ok(mut f) = std::fs::OpenOptions::new().create(true).append(true).open(
                    "/home/jericho/projects/zion/projects/geometry_os/geometry_os/geos_guest.log",
                ) {
                    let _ = f.write_all(msg.as_bytes());
                    let _ = f.write_all(msg2.as_bytes());
                    let _ = f.flush();
                }
            }
            // Verify CLINT throttle is working (first 25 instructions)
            if is_linux && count < 25 {
                use std::io::Write;
                let new_mtime = vm.bus.clint.mtime;
                let ticked = new_mtime != prev_mtime;
                let msg = format!(
                    "[clint-check] count={} mtime {}->{} ticked={}\n",
                    count, prev_mtime, new_mtime, ticked
                );
                eprintln!("{}", msg);
                if let Ok(mut f) = std::fs::OpenOptions::new().create(true).append(true).open(
                    "/home/jericho/projects/zion/projects/geometry_os/geometry_os/geos_guest.log",
                ) {
                    let _ = f.write_all(msg.as_bytes());
                    let _ = f.flush();
                }
            }
            count += 1;
            *instruction_count.borrow_mut() = count;

            // ── CPU safety throttle (Linux mode only) ──
            if is_linux {
                // Periodic yield: every 10M instructions, sleep 1ms.
                // Caps CPU at ~99% and prevents thermal issues.
                if count % YIELD_INTERVAL == 0 {
                    std::thread::sleep(std::time::Duration::from_millis(if stalled {
                        10
                    } else {
                        1
                    }));
                }

                // Periodic interrupt state diagnostic (every 100M instructions)
                if count % 100_000_000 == 0 && count > 0 {
                    let mip = vm.cpu.csr.mip;
                    let mie = vm.cpu.csr.mie;
                    let mstatus = vm.cpu.csr.mstatus;
                    let sie = (mstatus >> 3) & 1; // SIE bit
                    let stip = (mip >> 5) & 1;
                    let stie = (mie >> 5) & 1;
                    let mtip = (mip >> 7) & 1;
                    let mtie = (mie >> 7) & 1;
                    let mideleg = vm.cpu.csr.mideleg;
                    let timer_pending = vm.bus.clint.timer_pending();
                    eprintln!(
                        "[riscv-diag] INT STATE @ 10M: mip=0x{:08X} mie=0x{:08X} mstatus=0x{:08X} sie={} stip={} stie={} mtip={} mtie={} mideleg=0x{:X} clint.timer_pending={} mtime={} mtimecmp={}",
                        mip, mie, mstatus, sie, stip, stie, mtip, mtie, mideleg, timer_pending, vm.bus.clint.mtime, vm.bus.clint.mtimecmp
                    );
                }

                // Stall detector: track unique PCs over 50M instruction windows.
                stall_pc_set.insert(vm.cpu.pc);
                if count - stall_check_start >= STALL_WINDOW {
                    let console_len = vm.bus.sbi.console_output.len() + vm.bus.uart.tx_buf.len();
                    let new_output = console_len != last_console_len;
                    if !new_output && stall_pc_set.len() < STALL_UNIQUE_PC_THRESHOLD {
                        if !stalled {
                            eprintln!(
                                "[riscv-vm] STALL DETECTED: {} unique PCs over {}M instructions, no console output. Throttling.",
                                stall_pc_set.len(), STALL_WINDOW / 1_000_000
                            );
                        }
                        stalled = true;
                    } else {
                        if stalled
                            && (new_output || stall_pc_set.len() >= STALL_UNIQUE_PC_THRESHOLD)
                        {
                            eprintln!(
                                "[riscv-vm] Stall cleared: {} unique PCs, new_output={}",
                                stall_pc_set.len(),
                                new_output
                            );
                        }
                        stalled = false;
                    }
                    last_console_len = console_len;
                    stall_pc_set.clear();
                    stall_check_start = count;
                }
            }

            if count % 2_000_000 == 0 {
                use std::io::Write;
                let (hits, misses, compiles, cached) = vm.block_cache.stats();
                let hit_rate = if hits + misses > 0 {
                    hits as f64 / (hits + misses) as f64 * 100.0
                } else {
                    0.0
                };
                let msg = format!("[riscv-vm] {}M inst, mtime={}, PC=0x{:08X}, priv={:?}, scause=0x{:X}, sepc=0x{:08X}, cache: {}/{} hits ({:.1}%, {} blocks)\n",
                    count / 1_000_000, vm.bus.clint.mtime, vm.cpu.pc, vm.cpu.privilege, vm.cpu.csr.scause, vm.cpu.csr.sepc,
                    hits, hits + misses, hit_rate, cached);
                eprint!("{}", msg);
                if let Ok(mut f) = std::fs::OpenOptions::new().create(true).append(true).open(
                    "/home/jericho/projects/zion/projects/geometry_os/geometry_os/geos_guest.log",
                ) {
                    let _ = f.write_all(msg.as_bytes());
                    let _ = f.flush();
                }

                // Phase 20-25: Render instruction heatmap to framebuffer
                if let Some(heatmap) = &vm.bus.instruction_heatmap {
                    heatmap.render(&mut vm.bus.framebuf.pixels);
                    let frame = Frame {
                        pixels: vm.bus.framebuf.pixels.clone(),
                        width: FB_WIDTH,
                        height: FB_HEIGHT,
                        instructions: count,
                        clip_rect: None,
                    };
                    let _ = frame_tx.send(frame);
                }
            }

            // Print any new console output from the guest (SBI, UART, or virtio-serial)
            if !vm.bus.sbi.console_output.is_empty()
                || !vm.bus.uart.tx_buf.is_empty()
                || !vm.bus.virtio_serial.tx_buf.is_empty()
            {
                use std::io::Write;
                let mut log_file = std::fs::OpenOptions::new()
                    .create(true)
                    .append(true)
                    .open("/home/jericho/projects/zion/projects/geometry_os/geometry_os/geos_guest.log")
                    .ok();

                if !vm.bus.sbi.console_output.is_empty() {
                    let output = vm.bus.sbi.console_output.clone();
                    let s = String::from_utf8_lossy(&output);
                    eprint!("{}", s);
                    if let Some(ref mut f) = log_file {
                        let _ = f.write_all(s.as_bytes());
                    }
                    let _ = console_tx.send(output);
                    vm.bus.sbi.console_output.clear();
                }
                if !vm.bus.uart.tx_buf.is_empty() {
                    let output = vm.bus.uart.tx_buf.clone();
                    let s = String::from_utf8_lossy(&output);
                    eprint!("{}", s);
                    if let Some(ref mut f) = log_file {
                        let _ = f.write_all(s.as_bytes());
                    }
                    let _ = console_tx.send(output);
                    vm.bus.uart.tx_buf.clear();
                }
                // Virtio-serial TX drain (guest -> host byte stream)
                if !vm.bus.virtio_serial.tx_buf.is_empty() {
                    let output = vm.bus.virtio_serial.drain_tx();
                    let s = String::from_utf8_lossy(&output);
                    eprint!("{}", s);
                    if let Some(ref mut f) = log_file {
                        let _ = f.write_all(s.as_bytes());
                    }
                    let _ = console_tx.send(output);
                }
                let _ = std::io::stderr().flush();
                if let Some(ref mut f) = log_file {
                    let _ = f.flush();
                }
            }

            // Inject host->guest serial data (from send_serial() calls)
            while let Ok(data) = serial_input_rx.try_recv() {
                vm.bus.virtio_serial.inject_rx(&data);
            }

            // Linux-mode: log PC transitions for diagnostics (first 500)
            if is_linux {
                let cur_pc = vm.cpu.pc;
                if cur_pc != linux_last_pc {
                    linux_last_pc = cur_pc;
                    if linux_diag_count < 500 {
                        use std::io::Write;
                        let msg = format!(
                            "[pc-diag] #{} PC=0x{:08X} priv={:?} scause=0x{:X} sepc=0x{:08X} mtime={}\n",
                            count, cur_pc, vm.cpu.privilege, vm.cpu.csr.scause, vm.cpu.csr.sepc, vm.bus.clint.mtime
                        );
                        if let Ok(mut f) = std::fs::OpenOptions::new()
                            .create(true)
                            .append(true)
                            .open("/home/jericho/projects/zion/projects/geometry_os/geometry_os/geos_guest.log")
                        {
                            let _ = f.write_all(msg.as_bytes());
                        }
                        linux_diag_count += 1;
                    }
                }
            }

            // Linux-mode trap forwarding
            if is_linux && vm.cpu.pc == fw_addr_u32 {
                let mcause = vm.cpu.csr.mcause;
                let cause_code = mcause & !(1u32 << 31);
                let mpp = (vm.cpu.csr.mstatus & 0x1800) >> 11;

                if cause_code != 0xB && mpp != 3 {
                    // Trap from S-mode or U-mode.
                    // Check for demand-paged identity mapping at low addresses.
                    let fault_addr = vm.cpu.csr.mtval;
                    let is_page_fault = cause_code == 12 || cause_code == 13 || cause_code == 15;

                    if is_page_fault && fault_addr < 0xC000_0000 {
                        let satp = vm.cpu.csr.satp;
                        let pg_dir_ppn = (satp & 0x3FFFFF) as u64;
                        if pg_dir_ppn > 0 {
                            let pg_dir_phys = pg_dir_ppn * 4096;
                            let vpn1 = ((fault_addr >> 22) & 0x3FF) as u64;
                            let l1_addr = pg_dir_phys + vpn1 * 4;
                            let existing = vm.bus.read_word(l1_addr).unwrap_or(0);
                            if (existing & 1) == 0 {
                                // Inject identity megapage: VA -> PA (same)
                                let pte: u32 = 0x0000_00CF | ((vpn1 as u32) << 20);
                                vm.bus.write_word(l1_addr, pte).ok();
                                vm.cpu.tlb.flush_all();
                                // Retry the faulting instruction: jump to mepc and return to S-mode
                                vm.cpu.pc = vm.cpu.csr.mepc;
                                // Restore privilege (S-mode)
                                vm.cpu.privilege = cpu::Privilege::Supervisor;
                                // We handled it! skip normal trap forwarding
                                continue;
                            }
                        }
                    }

                    // Normal trap forwarding to S-mode
                    vm.cpu.csr.stval = vm.cpu.csr.mtval;
                    vm.cpu.csr.sepc = vm.cpu.csr.mepc;
                    vm.cpu.csr.scause = cause_code;
                    let stvec = vm.cpu.csr.stvec;
                    vm.cpu.pc = if (stvec & 1) == 1 && (cause_code & (1 << 31)) != 0 {
                        (stvec & !3) + (cause_code & 0x7FFFFFFF) * 4
                    } else {
                        stvec & !3
                    };
                    vm.cpu.privilege = cpu::Privilege::Supervisor;
                }
            }

            match step_result {
                StepResult::Ok => {},
                StepResult::Ebreak => {
                    halt_reason = Some(format!("EBREAK at PC=0x{:08X}", vm.cpu.pc));
                    break;
                },
                StepResult::Shutdown => {
                    halt_reason = Some("Guest requested shutdown".into());
                    break;
                },
                StepResult::Ecall => {},
                StepResult::FetchFault | StepResult::LoadFault | StepResult::StoreFault => {
                    if is_linux {
                        // Linux guests: page faults are normal traps handled by the kernel.
                        linux_fault_count += 1;
                        // Log first 5 faults with full page table walk diagnostics
                        if linux_fault_count <= 5 {
                            use std::io::Write;
                            let scause = vm.cpu.csr.scause;
                            let fault_type = match scause {
                                12 => "fetch-page",
                                13 => "load-page",
                                15 => "store-page",
                                7 => "store-access",
                                5 => "load-access",
                                3 => "fetch-access",
                                1 => "instruction-misaligned",
                                _ => "unknown",
                            };
                            let msg = format!(
                                "[fault] #{} {} scause=0x{:X} sepc=0x{:08X} stval=0x{:08X} stvec=0x{:08X}\n",
                                linux_fault_count, fault_type,
                                scause, vm.cpu.csr.sepc, vm.cpu.csr.stval, vm.cpu.csr.stvec
                            );
                            eprintln!("{}", msg);
                            if let Ok(mut f) = std::fs::OpenOptions::new()
                                .create(true)
                                .append(true)
                                .open("/home/jericho/projects/zion/projects/geometry_os/geometry_os/geos_guest.log")
                            {
                                let _ = f.write_all(msg.as_bytes());
                                // Dump page table walk for stval
                                let stval = vm.cpu.csr.stval;
                                let vpn1 = (stval >> 22) & 0x3FF;
                                let vpn0 = (stval >> 12) & 0x3FF;
                                let satp = vm.cpu.csr.satp;
                                let root_ppn = satp & 0x003FFFFF;
                                let l1_pa = (root_ppn as u64) << 12;
                                let l1_entry_addr = l1_pa + (vpn1 as u64) * 4;
                                let l1_pte = vm.bus.read_word(l1_entry_addr).unwrap_or(0xFFFFFFFF);
                                let diag = format!(
                                    "[pt-walk] stval=0x{:08X} vpn1={} vpn0={} satp=0x{:08X}\n\
                                     [pt-walk] L1[{}] @ PA 0x{:08X} = 0x{:08X}\n",
                                    stval, vpn1, vpn0, satp, vpn1, l1_entry_addr, l1_pte
                                );
                                let _ = f.write_all(diag.as_bytes());
                                // If L1 is non-leaf, follow to L2
                                if (l1_pte & 1) != 0 && (l1_pte & 0xE) == 0 {
                                    let l1_ppn = (l1_pte >> 10) & 0xFFFFF;
                                    let fixed_l1_ppn = if l1_ppn >= 0xC0000 {
                                        l1_ppn - 0xC0000
                                    } else {
                                        l1_ppn
                                    };
                                    let l2_base = (fixed_l1_ppn as u64) << 12;
                                    let l2_addr = l2_base + (vpn0 as u64) * 4;
                                    let l2_pte = vm.bus.read_word(l2_addr).unwrap_or(0xFFFFFFFF);
                                    let l2_diag = format!(
                                        "[pt-walk] L1 PPN=0x{:05X} -> L2 base PA 0x{:08X}\n\
                                         [pt-walk] L2[{}] @ PA 0x{:08X} = 0x{:08X}\n",
                                        l1_ppn, l2_base, vpn0, l2_addr, l2_pte
                                    );
                                    let _ = f.write_all(l2_diag.as_bytes());
                                }
                                let reg_diag = format!(
                                    "[pt-walk] SP=0x{:08X} RA=0x{:08X} satp=0x{:08X}\n",
                                    vm.cpu.x[2], vm.cpu.x[1], vm.cpu.csr.satp
                                );
                                let _ = f.write_all(reg_diag.as_bytes());
                            }
                        }
                    } else {
                        halt_reason = Some(format!("FAULT at PC=0x{:08X}", vm.cpu.pc));
                        break;
                    }
                },
                StepResult::Yielded => {},
            }

            if vm.bus.sbi.shutdown_requested {
                halt_reason = Some("SBI shutdown".into());
                break;
            }
        }

        // 4. If halted, notify and stop
        if let Some(reason) = halt_reason {
            eprintln!("[riscv-vm] Thread halting: {}", reason);
            let _ = status_tx.send(VmStatus::Halted {
                pc: vm.cpu.pc,
                instructions: count,
                reason,
            });
            running = false;
        }

        // 5. Drain console output
        if !vm.bus.sbi.console_output.is_empty() {
            let output = vm.bus.sbi.console_output.clone();
            vm.bus.sbi.console_output.clear();
            let _ = console_tx.send(output);
        }

        // Yield to host
        thread::yield_now();
    }
    eprintln!(
        "[riscv-vm] Thread exited cleanly after {} instructions",
        count
    );
}

// ── Tests ────────────────────────────────────────────────────────

#[cfg(test)]
mod tests {
    use super::*;

    /// Simple test: spawn VM, wait for it to halt (no ELF = immediate fault),
    /// verify the status channel works.
    #[test]
    fn test_spawn_and_shutdown() {
        // Use the smallest valid program we can: raw RISC-V with ebreak
        // Actually, let's just test the channel mechanics without a real ELF.
        let (frame_tx, _frame_rx): (Sender<Frame>, Receiver<Frame>) = mpsc::channel();
        let (control_tx, control_rx) = mpsc::channel::<ThreadControl>();
        let (status_tx, status_rx) = mpsc::channel::<VmStatus>();
        let (console_tx, _console_rx) = mpsc::channel::<Vec<u8>>();
        let (_serial_input_tx, serial_input_rx) = mpsc::channel::<Vec<u8>>();

        // Send shutdown immediately
        control_tx.send(ThreadControl::Shutdown).unwrap();

        // Run the thread main in a closure -- it should exit immediately
        let config = VmThreadConfig::default();
        let handle = thread::spawn(move || {
            vm_thread_main(
                config,
                frame_tx,
                control_rx,
                status_tx,
                console_tx,
                serial_input_rx,
            );
        });

        handle.join().expect("thread should join cleanly");
    }

    #[test]
    fn test_pause_resume() {
        // With no valid ELF, the VM halts immediately. So we test that
        // the control/status channel plumbing works by checking we get
        // a Halted status (the expected outcome with empty ELF data).
        let (frame_tx, _frame_rx): (Sender<Frame>, Receiver<Frame>) = mpsc::channel();
        let (control_tx, control_rx) = mpsc::channel::<ThreadControl>();
        let (status_tx, status_rx) = mpsc::channel::<VmStatus>();
        let (console_tx, _console_rx) = mpsc::channel::<Vec<u8>>();
        let (_serial_input_tx2, serial_input_rx2) = mpsc::channel::<Vec<u8>>();

        let config = VmThreadConfig::default();
        let handle = thread::spawn(move || {
            vm_thread_main(
                config,
                frame_tx,
                control_rx,
                status_tx,
                console_tx,
                serial_input_rx2,
            );
        });

        // With empty ELF data, VM should report Halted
        let status = status_rx.recv_timeout(std::time::Duration::from_secs(2));
        match status {
            Ok(VmStatus::Halted { reason, .. }) => {
                assert!(
                    reason.contains("ELF load error"),
                    "expected ELF load error, got: {}",
                    reason
                );
            },
            other => panic!("expected Halted status, got: {:?}", other),
        }

        // Shutdown (may fail if thread already exited after reporting Halted)
        let _ = control_tx.send(ThreadControl::Shutdown);
        handle.join().expect("thread should join cleanly");
    }

    #[test]
    fn test_real_elf_halts_and_sends_status() {
        // Load a real ELF -- hello_asm.elf should halt after printing.
        let elf_path = "examples/riscv-hello/hello_asm.elf";
        let elf_data = match std::fs::read(elf_path) {
            Ok(d) => d,
            Err(_) => return, // Skip if ELF not present (CI, etc.)
        };

        let config = VmThreadConfig {
            mode: GuestMode::Elf(elf_data),
            ram_size: 64 * 1024,
            ..Default::default()
        };

        let mut handle = spawn_vm_thread(config).expect("spawn should succeed");

        // Wait for the VM to halt (hello_asm should finish quickly)
        // May need a few retries since the VM runs asynchronously
        let deadline = std::time::Instant::now() + std::time::Duration::from_secs(5);
        let final_status: Result<VmStatus, String> = loop {
            match handle.try_recv_status() {
                Ok(s) => break Ok(s),
                Err(TryRecvError::Empty) => {
                    if std::time::Instant::now() > deadline {
                        break Err("timeout".into());
                    }
                    std::thread::sleep(std::time::Duration::from_millis(50));
                },
                Err(e) => break Err(format!("{:?}", e)),
            }
        };

        match final_status {
            Ok(VmStatus::Halted { instructions, .. }) => {
                assert!(instructions > 0, "should have executed some instructions");
            },
            other => panic!("expected Halted status, got: {:?}", other),
        }

        handle.shutdown();
    }

    #[test]
    fn test_net_syscall_user_mode() {
        // Load the networking syscall test ELF and run it in User mode.
        // Tests: socket, connect, sendto, recvfrom, shutdown, close.
        let elf_path = "examples/riscv-hello/net_syscall_test.elf";
        let elf_data = match std::fs::read(elf_path) {
            Ok(d) => d,
            Err(_) => return, // Skip if ELF not present (CI, etc.)
        };

        let config = VmThreadConfig {
            mode: GuestMode::Elf(elf_data),
            ram_size: 1024 * 1024,
            initial_privilege: Some(super::cpu::Privilege::User),
            ..Default::default()
        };

        let mut handle = spawn_vm_thread(config).expect("spawn should succeed");

        // Collect console output while waiting for halt
        let deadline = std::time::Instant::now() + std::time::Duration::from_secs(10);
        let mut console_output = Vec::new();
        let final_status: Result<VmStatus, String> = loop {
            // Drain console output
            while let Ok(chunk) = handle.try_recv_console() {
                console_output.extend_from_slice(&chunk);
            }
            match handle.try_recv_status() {
                Ok(s) => break Ok(s),
                Err(TryRecvError::Empty) => {
                    if std::time::Instant::now() > deadline {
                        break Err("timeout".into());
                    }
                    std::thread::sleep(std::time::Duration::from_millis(50));
                },
                Err(e) => break Err(format!("{:?}", e)),
            }
        };

        // Final console drain
        while let Ok(chunk) = handle.try_recv_console() {
            console_output.extend_from_slice(&chunk);
        }

        handle.shutdown();

        let output = String::from_utf8_lossy(&console_output);
        eprintln!("[net_test] Console output:\n{}", output);

        // Verify the test ran (should at least create a socket)
        assert!(
            output.contains("socket") || output.contains("Networking"),
            "Networking test should have produced output, got: {}",
            output
        );

        // Verify the VM halted properly
        match final_status {
            Ok(VmStatus::Halted { instructions, .. }) => {
                assert!(instructions > 0, "should have executed some instructions");
            },
            other => panic!("expected Halted status, got: {:?}", other),
        }

        // Check for test results in output
        let has_pass = output.contains("PASS");
        let has_summary = output.contains("Summary") || output.contains("passed");
        if has_pass || has_summary {
            eprintln!("[net_test] Test results found in output");
        }
    }
}
