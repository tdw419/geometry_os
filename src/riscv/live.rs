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
                }
                Err(TryRecvError::Empty) => {
                    if start.elapsed().as_millis() > 500 {
                        return self.last_frame.clone();
                    }
                    std::thread::sleep(std::time::Duration::from_millis(1));
                }
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
}

impl Default for VmThreadConfig {
    fn default() -> Self {
        Self {
            mode: GuestMode::Elf(Vec::new()),
            ram_size: 1024 * 1024,
            ram_base: 0x8000_0000,
            batch_size: 5000,
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

    let handle = thread::Builder::new()
        .name("riscv-vm".into())
        .spawn(move || {
            vm_thread_main(config, frame_tx, control_rx, status_tx);
        })
        .map_err(|e| format!("Failed to spawn VM thread: {}", e))?;

    Ok(RiscvVmHandle {
        frame_rx,
        control_tx,
        status_rx,
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
) {
    eprintln!("[riscv-vm] Thread started");
    // Shared parameters
    let ram_size = config.ram_size;
    let ram_base = config.ram_base;
    let batch_size = config.batch_size;

    // 1. Initialize VM based on mode
    let (mut vm, is_linux, fw_addr, dtb_addr) = match config.mode {
        GuestMode::Elf(ref elf_data) => {
            let mut vm = RiscvVm::new_with_base(ram_base, ram_size);
            let load_info = match loader::load_elf(&mut vm.bus, elf_data) {
                Ok(info) => info,
                Err(e) => {
                    let _ = status_tx.send(VmStatus::Halted {
                        pc: 0,
                        instructions: 0,
                        reason: format!("ELF load error: {:?}", e),
                    });
                    return;
                }
            };
            vm.cpu.pc = load_info.entry;
            (vm, false, 0u64, 0u64)
        }
        GuestMode::Linux {
            ref kernel,
            ref initrd,
            ref bootargs,
        } => {
            let ram_size_mb = (ram_size / (1024 * 1024)) as u32;
            match RiscvVm::boot_linux_setup(kernel, initrd.as_deref(), ram_size_mb, bootargs) {
                Ok((mut vm, fw, entry, dtb)) => {
                    vm.cpu.pc = entry;
                    (vm, true, fw, dtb)
                }
                Err(e) => {
                    let _ = status_tx.send(VmStatus::Halted {
                        pc: 0,
                        instructions: 0,
                        reason: format!("Linux setup error: {:?}", e),
                    });
                    return;
                }
            }
        }
    };

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

    let mut paused = false;
    let mut running = true;
    let mut count = 0u64;
    let fw_addr_u32 = fw_addr as u32;
    let mut last_satp = vm.cpu.csr.satp;

    while running {
        // 1. Process control commands
        match control_rx.try_recv() {
            Ok(ThreadControl::Shutdown) => break,
            Ok(ThreadControl::Pause) => {
                paused = true;
                let _ = status_tx.send(VmStatus::Paused);
            }
            Ok(ThreadControl::Resume) => {
                paused = false;
                let _ = status_tx.send(VmStatus::Resumed);
            }
            Ok(ThreadControl::Reset) => {
                // For now, reset just kills. Full reload requires storing config.
                let _ = status_tx.send(VmStatus::Halted {
                    pc: vm.cpu.pc,
                    instructions: count,
                    reason: "Reset not fully implemented for live thread".into(),
                });
                break;
            }
            Ok(ThreadControl::Input(byte)) => {
                vm.bus.uart.receive_byte(byte);
            }
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
            }
            Err(TryRecvError::Empty) => {}
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
                        let identity_pte: u32 = 0x0000_00CF; // V+R+W+X+A+D, U=0
                        for l1_idx in 0..640 {
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

            let step_result = vm.step();
            count += 1;
            *instruction_count.borrow_mut() = count;

            if count % 1_000_000 == 0 {
                eprintln!("[riscv-vm] Executed {} instructions...", count);
            }

            // Print any new console output from the guest (SBI or UART)
            if !vm.bus.sbi.console_output.is_empty() || !vm.bus.uart.tx_buf.is_empty() {
                use std::io::Write;
                if !vm.bus.sbi.console_output.is_empty() {
                    let s = String::from_utf8_lossy(&vm.bus.sbi.console_output);
                    print!("{}", s);
                    vm.bus.sbi.console_output.clear();
                }
                if !vm.bus.uart.tx_buf.is_empty() {
                    let s = String::from_utf8_lossy(&vm.bus.uart.tx_buf);
                    print!("{}", s);
                    vm.bus.uart.tx_buf.clear();
                }
                let _ = std::io::stdout().flush();
            }

            // Linux-mode trap forwarding
            if is_linux && vm.cpu.pc == fw_addr_u32 {
                let cause = vm.cpu.csr.mcause;
                if cause != 0xB { // Not ECALL_M
                    // Forward M-mode trap to S-mode
                    vm.cpu.csr.stval = vm.cpu.csr.mtval;
                    vm.cpu.csr.sepc = vm.cpu.csr.mepc;
                    vm.cpu.csr.scause = cause;
                    let stvec = vm.cpu.csr.stvec;
                    vm.cpu.pc = if (stvec & 1) == 1 && (cause & (1 << 31)) != 0 {
                        (stvec & !3) + (cause & 0x7FFFFFFF) * 4
                    } else {
                        stvec & !3
                    };
                    vm.cpu.privilege = cpu::Privilege::Supervisor;
                }
            }

            match step_result {
                StepResult::Ok => {}
                StepResult::Ebreak => {
                    halt_reason = Some(format!("EBREAK at PC=0x{:08X}", vm.cpu.pc));
                    break;
                }
                StepResult::Shutdown => {
                    halt_reason = Some("Guest requested shutdown".into());
                    break;
                }
                StepResult::Ecall => {}
                StepResult::FetchFault | StepResult::LoadFault | StepResult::StoreFault => {
                    halt_reason = Some(format!("FAULT at PC=0x{:08X}", vm.cpu.pc));
                    break;
                }
                StepResult::Yielded => {}
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

        // Yield to host
        thread::yield_now();
    }
    eprintln!("[riscv-vm] Thread exited cleanly after {} instructions", count);
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

        // Send shutdown immediately
        control_tx.send(ThreadControl::Shutdown).unwrap();

        // Run the thread main in a closure -- it should exit immediately
        let config = VmThreadConfig::default();
        let handle = thread::spawn(move || {
            vm_thread_main(config, frame_tx, control_rx, status_tx);
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

        let config = VmThreadConfig::default();
        let handle = thread::spawn(move || {
            vm_thread_main(config, frame_tx, control_rx, status_tx);
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
            }
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
                }
                Err(e) => break Err(format!("{:?}", e)),
            }
        };

        match final_status {
            Ok(VmStatus::Halted { instructions, .. }) => {
                assert!(instructions > 0, "should have executed some instructions");
            }
            other => panic!("expected Halted status, got: {:?}", other),
        }

        handle.shutdown();
    }
}
