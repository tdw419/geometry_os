// riscv/bus.rs -- Memory-mapped IO bus (Phase 35)
//
// Routes memory accesses to RAM or device MMIO regions.
// Currently handles: CLINT (timer + software interrupts).
// Phase 36 will add: UART, PLIC, virtio-blk.
use super::clint::Clint;
use super::framebuf::Framebuffer;
use super::memory::{GuestMemory, MemoryError};
use super::mmu::VMALLOC_SCRATCH_POOL_SIZE;
use super::plic::Plic;
use super::sbi::Sbi;
use super::socket::GuestSockets;
use super::spi_sd::SpiSd;
use super::substrate::SubstrateDevice;
use super::uart::Uart;
use super::vfs_surface::VfsSurface;
use super::virtio_blk::VirtioBlk;
use super::virtio_gpu::VirtioGpu;
use super::virtio_net::VirtioNet;
use super::virtio_serial::VirtioSerial;
use std::collections::HashSet;
use std::io::Write;

/// A file descriptor entry for Linux user-mode emulation.
/// Stores file data in memory for simplicity (no persistent host FDs).
#[derive(Debug, Clone)]
pub struct LinuxFile {
    /// Virtual path within the GeOS filesystem (for diagnostics).
    pub path: String,
    /// Current file offset (for lseek / sequential read).
    pub offset: u64,
    /// File data loaded from host filesystem.
    pub data: Vec<u8>,
    /// Whether this FD is writable.
    pub writable: bool,
}

/// CLINT MMIO address range.
const CLINT_START: u64 = 0x0200_0000;
const CLINT_END: u64 = 0x0201_0000;

/// GSFS MMIO register range (0x10005000-0x1000501F).
const GSFS_MMIO_BASE: u64 = 0x1000_5000;
const GSFS_MMIO_END: u64 = 0x1000_5020;

/// The system bus: owns RAM and devices, routes accesses.
pub struct Bus {
    /// Guest RAM.
    pub mem: GuestMemory,
    /// Core Local Interruptor (timer + software interrupts).
    pub clint: Clint,
    /// UART 16550 serial port.
    pub uart: Uart,
    /// Platform-Level Interrupt Controller.
    pub plic: Plic,
    /// Virtio block device.
    pub virtio_blk: VirtioBlk,
    /// Virtio network device.
    pub virtio_net: VirtioNet,
    /// Virtio GPU device (framebuffer display).
    pub virtio_gpu: VirtioGpu,
    /// Virtio serial console device (host-guest byte stream).
    pub virtio_serial: VirtioSerial,
    /// SPI SD card controller (block storage at 0x10004000).
    pub spi_sd: SpiSd,
    /// GeOS Simple Filesystem mounted on the SPI SD card.
    pub gsfs: super::gsfs::Gsfs,
    /// GeOS Simple Filesystem mounted on the VirtIO block device (the Memory Palace disk).
    /// This bridges the emulator's filesystem with the guest-visible VirtIO disk.
    /// Buildings are serialized as .building files on this filesystem.
    pub virtio_blk_gsfs: super::gsfs::Gsfs,
    /// VFS Pixel Surface MMIO device.
    pub vfs_surface: VfsSurface,
    /// MMIO Framebuffer (256x256 RGBA at 0x6000_0000).
    pub framebuf: Framebuffer,
    /// Substrate Coprocessor MMIO device (0x4000_0000).
    /// Bridges the GPU Active Cellular Substrate into the RISC-V physical address space.
    pub substrate: SubstrateDevice,
    /// SBI (Supervisor Binary Interface) handler.
    /// Intercepts SBI ECALLs from the kernel before they reach the trap vector.
    pub sbi: Sbi,
    /// Spatial Heatmap of instruction fetches (Phase 20-25).
    pub instruction_heatmap: Option<super::mmu_heatmap::InstructionHeatmap>,
    /// Guest TCP socket manager for bare-metal socket syscalls.
    pub guest_sockets: GuestSockets,
    /// Syscall trace log: records User-mode ECALLs (Linux syscalls).
    /// Populated by the CPU when it detects a U-mode ECALL.
    pub syscall_log: Vec<super::syscall::SyscallEvent>,
    /// MMU trace log: records page table walks and faults.
    pub mmu_log: Vec<super::mmu::MmuEvent>,
    /// Scheduler trace log: records context switches.
    pub sched_log: Vec<super::cpu::SchedEvent>,
    /// Index into syscall_log of the last U-mode ECALL awaiting its return value.
    /// Set when a U-mode ECALL is captured; cleared when SRET returns to U-mode.
    pub pending_syscall_idx: Option<usize>,
    /// Debug write watchpoint: physical address to watch, None = disabled.
    /// When a write hits this address, records the value and last_pc.
    pub write_watch_addr: Option<u64>,
    /// Debug: value written to the watchpoint address.
    pub write_watch_val: u32,
    /// Debug: PC when the watchpoint was hit.
    pub write_watch_pc: u32,
    /// Debug: whether the watchpoint was hit.
    pub write_watch_hit: bool,
    /// Debug: log of writes where the value equals the guest physical address
    /// (self-referential pattern: *(PA) == PA, in kernel VA form).
    /// Tracks up to 20 such writes to catch cred usage counter corruption.
    pub self_ref_write_log: Vec<(u64, u32, u32)>, // (PA, val, PC)
    /// Debug: log of writes to memblock memory regions (PA 0x0080348C-0x00803A8C).
    pub memblock_write_log: Vec<(u64, u32)>,
    /// Debug: PC at the time of memblock write (set by boot loop before each step).
    pub current_pc: u32,
    /// When true, the MMU identity-maps virtual addresses below 4MB
    /// (VA == PA) when the page table walk fails. This emulates OpenSBI
    /// firmware behavior for Linux boot, where per-CPU data, device
    /// probes, and early boot structures live in low memory.
    /// Default: false. Set to true by boot_linux_setup().
    pub low_addr_identity_map: bool,
    /// When true, emit eprintln debug traces for vmalloc/vmemmap MMU translations.
    /// Separate from low_addr_identity_map (which controls functional behavior).
    pub mmu_debug_trace: bool,
    /// When true, automatically fix virtual PPNs in kernel page tables on SATP write.
    /// Linux's setup_vm() creates PTEs with virtual PPNs (because __pa() is a no-op
    /// without real SBI firmware). This flag triggers a full page table scan on each
    /// SATP write, translating PPNs >= 0xC0000 (virtual) to physical PPNs.
    /// Default: false. Set to true by boot_linux_setup().
    pub auto_pte_fixup: bool,
    /// The current heap end for Linux-style brk() emulation.
    pub heap_start: u64,
    pub heap_end: u64,
    /// mmap region tracking for Linux user-mode: (addr, len) pairs, sorted by addr.
    pub mmap_regions: Vec<(u64, u64)>,
    /// Next free address for mmap allocations (grows upward).
    pub mmap_next: u64,
    /// Known page table physical page addresses (4KB-aligned).
    /// When auto_pte_fixup is true, writes to these pages are intercepted:
    /// PPNs >= 0xC0000 (virtual kernel addresses) are translated to physical PPNs
    /// by subtracting PAGE_OFFSET/4096. New L2 table pages are discovered when
    /// non-leaf PTEs are written and automatically registered.
    /// Populated by fixup_kernel_page_table() and dynamically during writes.
    pub known_pt_pages: HashSet<u64>,
    /// Set of L1 page directory physical addresses (for distinguishing L1 from L2 writes)
    pub l1_pg_dirs: HashSet<u64>,
    /// Write-protected physical addresses. Writes to these addresses are silently
    /// dropped. Used to protect DTB early pointers (_dtb_early_va, _dtb_early_pa)
    /// from being clobbered by setup_vm()'s pt_ops write.
    /// Each entry is (physical_address, protected_value). Reads return the
    /// protected value regardless of what's in RAM.
    pub protected_addrs: Vec<(u64, u32)>,
    /// Permanent value watchpoints: log writes matching PA ranges and optional values.
    /// Replaces the old single-shot write_watch_addr/val/pc/hit fields.
    pub value_watches: Vec<ValueWatch>,
    /// Linux user-mode file descriptor table.
    /// FDs 0-2 are reserved (stdin=0, stdout=1, stderr=2).
    /// FDs 3+ map to host files opened via openat syscall.
    pub linux_fd_table: Vec<Option<LinuxFile>>,
    /// Whether pixel-native spatial syscall dispatching is enabled.
    pub pixel_native_enabled: bool,
}

/// A single value watchpoint — logs writes to a physical address range.
///
/// Each watchpoint can match:
/// - Any write to the range (match_value = None)
/// - Only writes of a specific value (match_value = Some(v))
///
/// Hits are stored in a ring buffer and optionally printed via eprintln.
#[derive(Debug, Clone)]
pub struct ValueWatch {
    /// Physical address range start (inclusive)
    pub start: u64,
    /// Physical address range end (exclusive)
    pub end: u64,
    /// When Some, only trigger on writes of this exact u32 value
    pub match_value: Option<u32>,
    /// Total hit count since creation
    pub hits: u64,
    /// Ring buffer of individual hit entries
    pub log: Vec<ValueWatchEntry>,
    /// Max entries in the ring buffer (default: 100)
    pub max_log: usize,
    /// When true, prints each hit immediately via eprintln
    pub verbose: bool,
}

/// A single watchpoint hit: what, where, when.
#[derive(Debug, Clone)]
pub struct ValueWatchEntry {
    /// Physical address written
    pub addr: u64,
    /// Value written as u32 (for byte/half writes, the full register value)
    pub val: u32,
    /// CPU PC at time of write (from bus.current_pc)
    pub pc: u32,
    /// Instruction count at time of write (from boot.rs count)
    pub count: u64,
}

impl ValueWatch {
    /// Create a new value watchpoint.
    pub fn new(start: u64, end: u64) -> Self {
        Self {
            start,
            end,
            match_value: None,
            hits: 0,
            log: Vec::new(),
            max_log: 100,
            verbose: true,
        }
    }

    /// Create a watchpoint that only triggers on writes of a specific value.
    pub fn new_value(start: u64, end: u64, match_value: u32) -> Self {
        Self {
            start,
            end,
            match_value: Some(match_value),
            hits: 0,
            log: Vec::new(),
            max_log: 100,
            verbose: true,
        }
    }

    /// Check if this watchpoint triggers on a write to `addr` with `val`.
    /// Returns true if it matched (and records the hit).
    pub fn check(&mut self, addr: u64, val: u32, pc: u32, count: u64) -> bool {
        if addr < self.start || addr >= self.end {
            return false;
        }
        if let Some(mv) = self.match_value {
            if val != mv {
                return false;
            }
        }
        // Match!
        self.hits += 1;
        let entry = ValueWatchEntry {
            addr,
            val,
            pc,
            count,
        };
        if self.log.len() >= self.max_log {
            self.log.remove(0); // ring buffer pop front
        }
        self.log.push(entry);
        if self.verbose {
            eprintln!(
                "[vw] PA=0x{:08X} val=0x{:08X} PC=0x{:08X} count={} (watch #{})",
                addr, val, pc, count, self.hits
            );
        }
        true
    }

    /// Reset the hit count and clear the log.
    pub fn reset(&mut self) {
        self.hits = 0;
        self.log.clear();
    }
}

impl Bus {
    /// Record an instruction fetch in the spatial heatmap.
    #[inline]
    pub fn record_fetch(&mut self, addr: u32) {
        if let Some(heatmap) = &mut self.instruction_heatmap {
            heatmap.record(addr);
        }
    }

    /// Create a new bus with the given RAM base address and size.
    pub fn new(ram_base: u64, ram_size: usize) -> Self {
        let mut vfs_surface = VfsSurface::new();
        vfs_surface.load_files();
        vfs_surface.restore_canvas(); // recover saved canvas from previous session

        Self {
            mem: GuestMemory::new(ram_base, ram_size),
            clint: Clint::new(),
            uart: Uart::new(),
            plic: Plic::new(),
            virtio_blk: VirtioBlk::new(),
            virtio_net: VirtioNet::new(),
            virtio_gpu: VirtioGpu::new(),
            virtio_serial: VirtioSerial::new(),
            spi_sd: SpiSd::new(),
            gsfs: super::gsfs::Gsfs::new(),
            virtio_blk_gsfs: super::gsfs::Gsfs::new(),
            vfs_surface,
            framebuf: Framebuffer::new(),
            substrate: SubstrateDevice::new(),
            sbi: Sbi::new(),
            instruction_heatmap: None,
            guest_sockets: GuestSockets::new(),
            syscall_log: Vec::new(),
            mmu_log: Vec::new(),
            sched_log: Vec::new(),
            pending_syscall_idx: None,
            value_watches: Vec::new(),
            write_watch_addr: None,
            write_watch_val: 0,
            write_watch_pc: 0,
            write_watch_hit: false,
            self_ref_write_log: Vec::new(),
            memblock_write_log: Vec::new(),
            current_pc: 0,
            low_addr_identity_map: false,
            mmu_debug_trace: false,
            auto_pte_fixup: false,
            heap_start: 0,
            heap_end: 0,
            mmap_regions: Vec::new(),
            mmap_next: 0,
            known_pt_pages: HashSet::new(),
            l1_pg_dirs: HashSet::new(),
            protected_addrs: Vec::new(),
            linux_fd_table: vec![
                None, // FD 0: stdin (not backed by file)
                None, // FD 1: stdout (handled by sys_write)
                None, // FD 2: stderr (handled by sys_write)
            ],
            pixel_native_enabled: false,
        }
    }

    /// Read a 32-bit word. Routes to device MMIO or RAM.
    /// Takes &mut self because device reads can have side effects
    /// (e.g., UART RBR read consumes the byte and clears Data Ready).
    pub fn read_word(&mut self, addr: u64) -> Result<u32, MemoryError> {
        // Write-protected address check: return protected value for reads.
        for &(pa, protected_val) in &self.protected_addrs {
            if addr == pa {
                return Ok(protected_val);
            }
        }

        // RAM FAST-PATH: 99.9% of accesses during Linux boot hit RAM.
        // All MMIO devices are below 0x80000000; RAM starts at ram_base.
        // Skip the MMIO cascade for in-range RAM addresses.
        let ram_end = self.mem.ram_base + self.mem.size() as u64;
        if addr >= self.mem.ram_base && addr < ram_end {
            return self.mem.read_word(addr);
        }

        // 1. MMIO Devices
        if Self::in_clint(addr) {
            self.clint.read(addr).ok_or(MemoryError { addr, size: 4 })
        } else if super::uart::Uart::contains(addr) {
            self.uart
                .read_word(addr)
                .ok_or(MemoryError { addr, size: 4 })
        } else if super::plic::Plic::contains(addr) {
            self.plic.read(addr).ok_or(MemoryError { addr, size: 4 })
        } else if super::virtio_blk::VirtioBlk::contains(addr) {
            self.virtio_blk
                .read(addr)
                .ok_or(MemoryError { addr, size: 4 })
        } else if super::virtio_net::VirtioNet::contains(addr) {
            self.virtio_net
                .read(addr)
                .ok_or(MemoryError { addr, size: 4 })
        } else if super::virtio_gpu::VirtioGpu::contains(addr) {
            let offset = (addr - super::virtio_gpu::VIRTIO_GPU_BASE) as usize;
            self.virtio_gpu
                .read(offset)
                .ok_or(MemoryError { addr, size: 4 })
        } else if super::virtio_serial::VirtioSerial::contains(addr) {
            self.virtio_serial
                .read(addr)
                .ok_or(MemoryError { addr, size: 4 })
        } else if super::spi_sd::SpiSd::contains(addr) {
            self.spi_sd.read(addr).ok_or(MemoryError { addr, size: 4 })
        } else if addr >= GSFS_MMIO_BASE && addr < GSFS_MMIO_END {
            // GSFS MMIO registers
            let offset = (addr - GSFS_MMIO_BASE) as usize;
            match offset {
                0x00 => {
                    // GSFS_STATUS: 0=idle, 1=formatted, 2=mounted, 0xFF=error
                    let status = if self.gsfs.is_mounted() {
                        2u32
                    } else if self.gsfs.is_formatted() {
                        1u32
                    } else {
                        0u32
                    };
                    Ok(status)
                },
                0x04 => {
                    // GSFS_BLOCK_SIZE (always 512)
                    Ok(512u32)
                },
                0x08 => {
                    // GSFS_BLOCK_COUNT (from spi_sd capacity)
                    Ok(self.spi_sd.sector_count() as u32)
                },
                0x0C => {
                    // GSFS_TOTAL_INODES
                    Ok(self.gsfs.total_inodes())
                },
                0x10 => {
                    // GSFS_FREE_INODES
                    Ok(self.gsfs.free_inodes())
                },
                0x14 => {
                    // GSFS_USED_BLOCKS
                    Ok(self.gsfs.used_blocks())
                },
                _ => Ok(0u32),
            }
        } else if super::vfs_surface::VfsSurface::contains(addr) {
            self.vfs_surface
                .read(addr)
                .ok_or(MemoryError { addr, size: 4 })
        } else if super::framebuf::Framebuffer::contains(addr) {
            self.framebuf
                .read(addr)
                .ok_or(MemoryError { addr, size: 4 })
        } else if SubstrateDevice::contains(addr) {
            // Substrate Coprocessor MMIO at 0x4000_0000
            self.substrate
                .read(addr)
                .ok_or(MemoryError { addr, size: 4 })
        } else if addr >= self.mem.ram_base && addr < self.mem.ram_base + self.mem.size() as u64 {
            // 2. RAM Access
            self.mem.read_word(addr)
        } else if addr < self.mem.ram_base {
            if self.low_addr_identity_map {
                Ok(0)
            } else {
                Err(MemoryError { addr, size: 4 })
            }
        } else {
            // Unmapped address above everything
            Err(MemoryError { addr, size: 4 })
        }
    }

    pub fn write_word(&mut self, addr: u64, val: u32) -> Result<(), MemoryError> {
        // Write-protected address check: silently drop writes to protected addresses.
        for &(pa, _protected_val) in &self.protected_addrs {
            if addr == pa {
                return Ok(());
            }
        }
        // Permanent value watchpoint check
        self.check_value_watches(addr, val);
        // Detect self-referential writes: *(PA) == VA_of_PA pattern.
        // The crash shows the cred usage counter at PA 0x8080C024 contains 0xC080C024 (the VA).
        // This catches the exact write that corrupts the cred.
        if self.self_ref_write_log.len() < 20
            && addr >= self.mem.ram_base
            && addr < self.mem.ram_base + self.mem.size() as u64
        {
            // Check if val looks like a kernel VA that maps to this PA
            // On RV32: VA = PA + 0x40000000 for kernel virtual mapping
            let expected_va = addr + 0x40000000;
            if val as u64 == expected_va {
                self.self_ref_write_log.push((addr, val, self.current_pc));
                eprintln!(
                    "[bus-selfref] PA 0x{:08X} written with VA 0x{:08X} (PC=0x{:08X}) — self-referential write!",
                    addr, val, self.current_pc
                );
            }
        }
        // Memblock regions write detector (PA 0x0080348C - 0x00803A8C)
        // Log any write to the memblock memory regions array for debugging.
        // Also captures current_pc set by the boot loop before each step.
        if (0x0080348C..0x00803A8C).contains(&addr) && self.memblock_write_log.len() < 100 {
            // Store PC in upper 32 bits: (PC << 32) | addr, val
            // Since we only have Vec<(u64, u32)>, encode PC in the top of addr
            let encoded_addr = ((self.current_pc as u64) << 32) | addr;
            self.memblock_write_log.push((encoded_addr, val));
        }

        // 1. MMIO Devices
        if Self::in_clint(addr) {
            if self.clint.write(addr, val) {
                Ok(())
            } else {
                eprintln!("[bus-debug] CLINT write fail: addr=0x{:08X}", addr);
                Err(MemoryError { addr, size: 4 })
            }
        } else if super::uart::Uart::contains(addr) {
            self.uart.write_word(addr, val);
            Ok(())
        } else if super::plic::Plic::contains(addr) {
            if self.plic.write(addr, val) {
                Ok(())
            } else {
                eprintln!("[bus-debug] PLIC write fail: addr=0x{:08X}", addr);
                Err(MemoryError { addr, size: 4 })
            }
        } else if super::virtio_blk::VirtioBlk::contains(addr) {
            // VirtioBlk::write() returns Some(queue_idx) on QUEUE_NOTIFY
            if let Some(queue_idx) = self.virtio_blk.write(addr, val) {
                self.process_virtio_blk_queue(queue_idx);
            }
            Ok(())
        } else if super::virtio_net::VirtioNet::contains(addr) {
            if let Some(queue_idx) = self.virtio_net.write(addr, val) {
                self.process_virtio_net_queue(queue_idx);
            }
            Ok(())
        } else if super::virtio_gpu::VirtioGpu::contains(addr) {
            let offset = (addr - super::virtio_gpu::VIRTIO_GPU_BASE) as usize;
            if let Some(queue_idx) = self.virtio_gpu.write(offset, val) {
                self.process_virtio_gpu_queue(queue_idx);
            }
            Ok(())
        } else if super::virtio_serial::VirtioSerial::contains(addr) {
            if let Some(queue_idx) = self.virtio_serial.write(addr, val) {
                self.process_virtio_serial_queue(queue_idx);
            }
            Ok(())
        } else if super::spi_sd::SpiSd::contains(addr) {
            self.spi_sd
                .write(addr, val)
                .ok_or(MemoryError { addr, size: 4 })
        } else if addr >= GSFS_MMIO_BASE && addr < GSFS_MMIO_END {
            // GSFS MMIO command registers
            let offset = (addr - GSFS_MMIO_BASE) as usize;
            match offset {
                0x00 => {
                    // GSFS_CMD: 1=format, 2=mount, 3=unmount
                    match val {
                        1 => {
                            // Format: write superblock + bitmap + root inode
                            let _ = self.gsfs.format(&mut self.spi_sd);
                        },
                        2 => {
                            // Mount: read superblock + bitmap + root inode
                            let _ = self.gsfs.mount(&mut self.spi_sd);
                        },
                        3 => {
                            self.gsfs.unmount();
                        },
                        _ => {},
                    }
                    Ok(())
                },
                _ => Ok(()),
            }
        } else if super::vfs_surface::VfsSurface::contains(addr) {
            self.vfs_surface.write(addr, val);
            Ok(())
        } else if super::framebuf::Framebuffer::contains(addr) {
            self.framebuf.write(addr, val);
            Ok(())
        } else if SubstrateDevice::contains(addr) {
            // Substrate Coprocessor MMIO at 0x4000_0000
            if self.substrate.write(addr, val) {
                Ok(())
            } else {
                Err(MemoryError { addr, size: 4 })
            }
        } else if addr >= self.mem.ram_base && addr < self.mem.ram_base + self.mem.size() as u64 {
            // 2. RAM Access
            // Real-time PTE write interception: if this address is in a known
            // page table page, fix virtual PPNs before storing.
            let fixed_val = self.intercept_pte_write(addr, val);
            let res = self.mem.write_word(addr, fixed_val);
            if res.is_err() {
                eprintln!(
                    "[bus-debug] MEM write fail: addr=0x{:08X} ram_base=0x{:08X} size=0x{:X}",
                    addr,
                    self.mem.ram_base,
                    self.mem.size()
                );
            }
            res
        } else if addr < self.mem.ram_base {
            if self.low_addr_identity_map {
                Ok(())
            } else {
                Err(MemoryError { addr, size: 4 })
            }
        } else {
            // Unmapped address above everything
            Err(MemoryError { addr, size: 4 })
        }
    }

    /// Initialize the VirtIO-backed GSFS filesystem.
    /// Tries to mount an existing GSFS on the VirtIO disk.
    /// If no GSFS is found, formats the disk with a fresh filesystem.
    pub fn init_virtio_blk_gsfs(&mut self) {
        // Try to mount existing GSFS on the VirtIO disk
        match self.virtio_blk_gsfs.mount(&mut self.virtio_blk) {
            Ok(crate::riscv::gsfs::MountState::Mounted) => {
                let file_count = self.virtio_blk_gsfs.list_files().len();
                eprintln!(
                    "[virtio-blk-gsfs] Mounted existing GSFS: {} files, {} sectors",
                    file_count,
                    self.virtio_blk.capacity()
                );
                // Scan for .building files
                let building_count = self
                    .virtio_blk_gsfs
                    .list_files()
                    .iter()
                    .filter(|e| e.name.ends_with(".building"))
                    .count();
                if building_count > 0 {
                    eprintln!("[virtio-blk-gsfs] Found {} building files", building_count);
                }
            },
            Ok(crate::riscv::gsfs::MountState::NoFilesystem) => {
                eprintln!(
                    "[virtio-blk-gsfs] No GSFS found on VirtIO disk ({} sectors). Formatting...",
                    self.virtio_blk.capacity()
                );
                if self.virtio_blk_gsfs.format(&mut self.virtio_blk) {
                    eprintln!("[virtio-blk-gsfs] Formatted as GSFS");
                } else {
                    eprintln!("[virtio-blk-gsfs] Format FAILED");
                }
            },
            Ok(_) | Err(_) => {
                eprintln!("[virtio-blk-gsfs] Mount error, formatting...");
                if self.virtio_blk_gsfs.format(&mut self.virtio_blk) {
                    eprintln!("[virtio-blk-gsfs] Formatted as GSFS");
                } else {
                    eprintln!("[virtio-blk-gsfs] Format FAILED");
                }
            },
        }
        let _ = std::io::stderr().flush();
    }

    /// Scan the VirtIO-backed GSFS for .building files and return parsed building data.
    /// Returns a vec of (id, x, y, type_color, name) tuples.
    /// The file format is:
    ///   Bytes 0-3:   x (i32 LE)
    ///   Bytes 4-7:   y (i32 LE)
    ///   Bytes 8-11:  type_color (u32 LE)
    ///   Bytes 12+:   name (UTF-8, rest of file)
    pub fn scan_buildings_from_gsfs(&mut self) -> Vec<(u32, i32, i32, u32, String)> {
        let mut buildings = Vec::new();
        let files: Vec<_> = self
            .virtio_blk_gsfs
            .list_files()
            .iter()
            .filter(|e| e.name.ends_with(".building"))
            .map(|e| e.name.clone())
            .collect();

        for name in &files {
            // Parse building ID from filename: "42.building" → 42
            let id_str = name.trim_end_matches(".building");
            let id: u32 = match id_str.parse() {
                Ok(id) => id,
                Err(_) => continue,
            };

            match self.virtio_blk_gsfs.read_file(&mut self.virtio_blk, name) {
                Some(data) if data.len() >= 12 => {
                    let x = i32::from_le_bytes([data[0], data[1], data[2], data[3]]);
                    let y = i32::from_le_bytes([data[4], data[5], data[6], data[7]]);
                    let type_color = u32::from_le_bytes([data[8], data[9], data[10], data[11]]);
                    let name_str = String::from_utf8_lossy(&data[12..]).to_string();
                    buildings.push((id, x, y, type_color, name_str));
                },
                _ => {
                    eprintln!("[virtio-blk-gsfs] Could not read building file: {}", name);
                },
            }
        }
        buildings
    }

    /// Write a building to the VirtIO-backed GSFS as a .building file.
    /// The file is named "<id>.building" with binary format:
    ///   Bytes 0-3:   x (i32 LE)
    ///   Bytes 4-7:   y (i32 LE)
    ///   Bytes 8-11:  type_color (u32 LE)
    ///   Bytes 12+:   name (UTF-8)
    pub fn write_building_to_gsfs(
        &mut self,
        id: u32,
        x: i32,
        y: i32,
        type_color: u32,
        name: &str,
    ) -> bool {
        let filename = format!("{}.building", id);
        let mut data = Vec::with_capacity(12 + name.len());
        data.extend_from_slice(&x.to_le_bytes());
        data.extend_from_slice(&y.to_le_bytes());
        data.extend_from_slice(&type_color.to_le_bytes());
        data.extend_from_slice(name.as_bytes());
        self.virtio_blk_gsfs
            .write_file(&mut self.virtio_blk, &filename, &data)
    }

    /// Delete a building file from the VirtIO-backed GSFS.
    pub fn delete_building_from_gsfs(&mut self, id: u32) -> bool {
        let filename = format!("{}.building", id);
        self.virtio_blk_gsfs
            .delete_file(&mut self.virtio_blk, &filename)
    }

    /// Process pending requests on the virtio-blk virtqueue.
    ///
    /// Called when the guest writes to QUEUE_NOTIFY. Reads descriptor chains
    /// from guest memory, performs read/write operations on the disk image,
    /// and writes results back to guest memory.
    fn process_virtio_blk_queue(&mut self, queue_idx: u32) {
        let bus = self as *mut Bus;
        // SAFETY: We need to split the mutable borrow of self so that
        // virtio_blk can be passed to process_queue while we also provide
        // closures that read/write self.mem. This is safe because:
        // 1. process_queue only accesses disk (no MMIO routing)
        // 2. The closures only access self.mem (no device state)
        // 3. There's no aliasing conflict between these two parts
        unsafe {
            let virtio_blk = &mut (*bus).virtio_blk;

            let mut read_word = |addr: u64| -> u32 { (*bus).mem.read_word(addr).unwrap_or(0) };
            let mut write_word = |addr: u64, val: u32| {
                let _ = (*bus).mem.write_word(addr, val);
            };
            let mut read_bytes = |addr: u64, len: usize| -> Vec<u8> {
                let mut data = vec![0u8; len];
                for i in 0..len {
                    match (*bus).mem.read_byte(addr + i as u64) {
                        Ok(b) => data[i] = b,
                        Err(_) => break,
                    }
                }
                data
            };
            let mut write_bytes = |addr: u64, data: &[u8]| {
                for (i, &b) in data.iter().enumerate() {
                    let _ = (*bus).mem.write_byte(addr + i as u64, b);
                }
            };

            let processed = virtio_blk.process_queue(
                queue_idx,
                &mut read_word,
                &mut write_word,
                &mut read_bytes,
                &mut write_bytes,
            );

            if processed > 0 {
                // Signal PLIC interrupt for virtio device
                (*bus).plic.signal(super::plic::IRQ_VIRTIO);
            }
        }
    }

    /// Process pending requests on the virtio-net virtqueues.
    ///
    /// Called when the guest writes to QUEUE_NOTIFY. Queue 0 is RX,
    /// queue 1 is TX. For TX, packets are read from guest memory and
    /// optionally sent via UDP. For RX, pending packets are delivered
    /// to guest-provided buffers.
    fn process_virtio_net_queue(&mut self, queue_idx: u32) {
        let bus = self as *mut Bus;
        // SAFETY: Same pattern as process_virtio_blk_queue --
        // virtio_net only accesses its own state, closures only access mem.
        unsafe {
            let virtio_net = &mut (*bus).virtio_net;

            let mut read_word = |addr: u64| -> u32 { (*bus).mem.read_word(addr).unwrap_or(0) };
            let mut write_word = |addr: u64, val: u32| {
                let _ = (*bus).mem.write_word(addr, val);
            };
            let mut read_bytes = |addr: u64, len: usize| -> Vec<u8> {
                let mut data = vec![0u8; len];
                for i in 0..len {
                    match (*bus).mem.read_byte(addr + i as u64) {
                        Ok(b) => data[i] = b,
                        Err(_) => break,
                    }
                }
                data
            };
            let mut write_bytes = |addr: u64, data: &[u8]| {
                for (i, &b) in data.iter().enumerate() {
                    let _ = (*bus).mem.write_byte(addr + i as u64, b);
                }
            };

            let processed = match queue_idx {
                1 => {
                    // TX queue
                    virtio_net.process_tx_queue(&mut read_word, &mut write_word, &mut read_bytes)
                },
                0 => {
                    // RX queue -- first poll UDP socket, then deliver
                    virtio_net.poll_udp_socket();
                    virtio_net.process_rx_queue(&mut read_word, &mut write_word, &mut write_bytes)
                },
                _ => 0, // Control queue (2) not implemented
            };

            if processed > 0 {
                // Signal PLIC interrupt for virtio-net device
                (*bus).plic.signal(super::plic::IRQ_VIRTIO_NET);
            }
        }
    }

    /// Process pending requests on the virtio-gpu virtqueue.
    ///
    /// Called when the guest writes to QUEUE_NOTIFY. Queue 0 is the control
    /// queue (display info, resource management, scanout, transfer-to-host).
    fn process_virtio_gpu_queue(&mut self, queue_idx: u32) {
        let bus = self as *mut Bus;
        // SAFETY: Same pattern as process_virtio_blk_queue --
        // virtio_gpu only accesses its own state, closures only access mem.
        unsafe {
            let virtio_gpu = &mut (*bus).virtio_gpu;

            let mut read_word = |addr: u64| -> u32 { (*bus).mem.read_word(addr).unwrap_or(0) };
            let mut write_word = |addr: u64, val: u32| {
                let _ = (*bus).mem.write_word(addr, val);
            };
            let mut read_bytes = |addr: u64, len: usize| -> Vec<u8> {
                let mut data = vec![0u8; len];
                for i in 0..len {
                    match (*bus).mem.read_byte(addr + i as u64) {
                        Ok(b) => data[i] = b,
                        Err(_) => break,
                    }
                }
                data
            };
            let mut write_bytes = |addr: u64, data: &[u8]| {
                for (i, &b) in data.iter().enumerate() {
                    let _ = (*bus).mem.write_byte(addr + i as u64, b);
                }
            };

            let processed = virtio_gpu.process_queue(
                queue_idx,
                &mut read_word,
                &mut write_word,
                &mut read_bytes,
                &mut write_bytes,
            );

            if processed > 0 {
                // Signal PLIC interrupt for virtio-gpu device
                (*bus).plic.signal(super::plic::IRQ_VIRTIO_GPU);
            }
        }
    }

    /// Process pending requests on the virtio-serial virtqueue.
    fn process_virtio_serial_queue(&mut self, queue_idx: u32) {
        let bus = self as *mut Bus;
        // SAFETY: Same pattern as process_virtio_blk_queue --
        // virtio_serial only accesses its own state, closures only access mem.
        unsafe {
            let virtio_serial = &mut (*bus).virtio_serial;

            let mut read_word = |addr: u64| -> u32 { (*bus).mem.read_word(addr).unwrap_or(0) };
            let mut write_word = |addr: u64, val: u32| {
                let _ = (*bus).mem.write_word(addr, val);
            };
            let mut read_bytes = |addr: u64, len: usize| -> Vec<u8> {
                let mut data = vec![0u8; len];
                for i in 0..len {
                    match (*bus).mem.read_byte(addr + i as u64) {
                        Ok(b) => data[i] = b,
                        Err(_) => break,
                    }
                }
                data
            };
            let mut write_bytes = |addr: u64, data: &[u8]| {
                for (i, &b) in data.iter().enumerate() {
                    let _ = (*bus).mem.write_byte(addr + i as u64, b);
                }
            };

            let processed = match queue_idx {
                0 => {
                    // RX queue (host -> guest)
                    virtio_serial.process_rx_queue(
                        &mut read_word,
                        &mut write_word,
                        &mut write_bytes,
                    )
                },
                1 => {
                    // TX queue (guest -> host)
                    virtio_serial.process_tx_queue(&mut read_word, &mut write_word, &mut read_bytes)
                },
                _ => 0,
            };

            if processed > 0 {
                // Signal PLIC interrupt for virtio-serial device
                (*bus).plic.signal(super::plic::IRQ_VIRTIO_SERIAL);
            }
        }
    }

    /// Read a byte. Routes to device MMIO or RAM.
    /// Takes &mut self because device reads can have side effects.
    pub fn read_byte(&mut self, addr: u64) -> Result<u8, MemoryError> {
        // Write-protected address check: return the appropriate byte from protected value.
        for &(pa, protected_val) in &self.protected_addrs {
            if addr >= pa && addr < pa + 4 {
                let byte_off = (addr - pa) as usize;
                return Ok(((protected_val >> (byte_off * 8)) & 0xFF) as u8);
            }
        }

        // 1. RAM Access (Highest priority for low addresses when ram_base=0)
        if addr >= self.mem.ram_base && addr < self.mem.ram_base + self.mem.size() as u64 {
            return self.mem.read_byte(addr);
        }

        // 2. MMIO Devices
        if Self::in_clint(addr) {
            let word = self
                .clint
                .read(addr & !3)
                .ok_or(MemoryError { addr, size: 1 })?;
            let byte_off = (addr & 3) as usize;
            Ok((word >> (byte_off * 8)) as u8)
        } else if super::uart::Uart::contains(addr) {
            Ok(self.uart.read_byte(addr - super::uart::UART_BASE))
        } else if super::plic::Plic::contains(addr) {
            let word = self
                .plic
                .read(addr & !3)
                .ok_or(MemoryError { addr, size: 1 })?;
            let byte_off = (addr & 3) as usize;
            Ok((word >> (byte_off * 8)) as u8)
        } else if super::virtio_blk::VirtioBlk::contains(addr) {
            let word = self
                .virtio_blk
                .read(addr & !3)
                .ok_or(MemoryError { addr, size: 1 })?;
            let byte_off = (addr & 3) as usize;
            Ok((word >> (byte_off * 8)) as u8)
        } else if super::virtio_net::VirtioNet::contains(addr) {
            let word = self
                .virtio_net
                .read(addr & !3)
                .ok_or(MemoryError { addr, size: 1 })?;
            let byte_off = (addr & 3) as usize;
            Ok((word >> (byte_off * 8)) as u8)
        } else if super::virtio_gpu::VirtioGpu::contains(addr) {
            let offset = ((addr - super::virtio_gpu::VIRTIO_GPU_BASE) & !3) as usize;
            let word = self
                .virtio_gpu
                .read(offset)
                .ok_or(MemoryError { addr, size: 1 })?;
            let byte_off = (addr & 3) as usize;
            Ok((word >> (byte_off * 8)) as u8)
        } else if super::spi_sd::SpiSd::contains(addr) {
            let word = self
                .spi_sd
                .read(addr & !3)
                .ok_or(MemoryError { addr, size: 1 })?;
            let byte_off = (addr & 3) as usize;
            Ok((word >> (byte_off * 8)) as u8)
        } else if super::vfs_surface::VfsSurface::contains(addr) {
            let word = self
                .vfs_surface
                .read(addr & !3)
                .ok_or(MemoryError { addr, size: 1 })?;
            let byte_off = (addr & 3) as usize;
            Ok((word >> (byte_off * 8)) as u8)
        } else if super::framebuf::Framebuffer::contains(addr) {
            let word = self
                .framebuf
                .read(addr & !3)
                .ok_or(MemoryError { addr, size: 1 })?;
            let byte_off = (addr & 3) as usize;
            Ok((word >> (byte_off * 8)) as u8)
        } else if addr < self.mem.ram_base {
            if self.low_addr_identity_map {
                Ok(0)
            } else {
                Err(MemoryError { addr, size: 1 })
            }
        } else {
            self.mem.read_byte(addr)
        }
    }

    /// Write a byte. Routes to device MMIO or RAM.
    pub fn write_byte(&mut self, addr: u64, val: u8) -> Result<(), MemoryError> {
        // Write-protected address check: silently drop writes to protected addresses.
        for &(pa, _protected_val) in &self.protected_addrs {
            if addr >= pa && addr < pa + 4 {
                return Ok(());
            }
        }
        // Permanent value watchpoint check (word-level approximation for byte writes)
        let word_val = val as u32;
        self.check_value_watches(addr, word_val);

        // 1. RAM Access (Highest priority for low addresses when ram_base=0)
        if addr >= self.mem.ram_base && addr < self.mem.ram_base + self.mem.size() as u64 {
            return self.mem.write_byte(addr, val);
        }

        // 2. MMIO Devices
        if Self::in_clint(addr) {
            let word_addr = addr & !3;
            let byte_off = (addr & 3) as usize;
            let mut word = self.clint.read(word_addr).unwrap_or(0);
            word = (word & !(0xFF << (byte_off * 8))) | ((val as u32) << (byte_off * 8));
            if self.clint.write(word_addr, word) {
                Ok(())
            } else {
                Err(MemoryError { addr, size: 1 })
            }
        } else if super::uart::Uart::contains(addr) {
            self.uart.write_byte(addr - super::uart::UART_BASE, val);
            Ok(())
        } else if super::plic::Plic::contains(addr) {
            let word_addr = addr & !3;
            let byte_off = (addr & 3) as usize;
            let mut word = self.plic.read(word_addr).unwrap_or(0);
            word = (word & !(0xFF << (byte_off * 8))) | ((val as u32) << (byte_off * 8));
            if self.plic.write(word_addr, word) {
                Ok(())
            } else {
                Err(MemoryError { addr, size: 1 })
            }
        } else if super::virtio_blk::VirtioBlk::contains(addr) {
            // Virtio doesn't have byte-level writes; ignore
            Ok(())
        } else if super::virtio_net::VirtioNet::contains(addr) {
            // Virtio doesn't have byte-level writes; ignore
            Ok(())
        } else if super::virtio_gpu::VirtioGpu::contains(addr) {
            // VirtIO GPU doesn't have byte-level writes; ignore
            Ok(())
        } else if super::spi_sd::SpiSd::contains(addr) {
            let word_addr = addr & !3;
            let byte_off = (addr & 3) as usize;
            let mut word = self.spi_sd.read(word_addr).unwrap_or(0);
            word = (word & !(0xFF << (byte_off * 8))) | ((val as u32) << (byte_off * 8));
            self.spi_sd.write(word_addr, word);
            Ok(())
        } else if super::vfs_surface::VfsSurface::contains(addr) {
            let word_addr = addr & !3;
            let byte_off = (addr & 3) as usize;
            let mut word = self.vfs_surface.read(word_addr).unwrap_or(0);
            word = (word & !(0xFF << (byte_off * 8))) | ((val as u32) << (byte_off * 8));
            self.vfs_surface.write(word_addr, word);
            Ok(())
        } else if super::framebuf::Framebuffer::contains(addr) {
            let word_addr = addr & !3;
            let byte_off = (addr & 3) as usize;
            let mut word = self.framebuf.read(word_addr).unwrap_or(0);
            word = (word & !(0xFF << (byte_off * 8))) | ((val as u32) << (byte_off * 8));
            self.framebuf.write(word_addr, word);
            Ok(())
        } else if addr < self.mem.ram_base {
            if self.low_addr_identity_map {
                Ok(())
            } else {
                Err(MemoryError { addr, size: 1 })
            }
        } else {
            self.mem.write_byte(addr, val)
        }
    }

    /// Read a 16-bit half-word. Routes to device MMIO or RAM.
    pub fn read_half(&mut self, addr: u64) -> Result<u16, MemoryError> {
        // Write-protected address check: return the appropriate half from protected value.
        for &(pa, protected_val) in &self.protected_addrs {
            if addr >= pa && addr < pa + 4 {
                let half_off = ((addr - pa) >> 1) as usize;
                return Ok(((protected_val >> (half_off * 16)) & 0xFFFF) as u16);
            }
        }

        // 1. RAM Access (Highest priority for low addresses when ram_base=0)
        if addr >= self.mem.ram_base && addr < self.mem.ram_base + self.mem.size() as u64 {
            return self.mem.read_half(addr);
        }

        // 2. MMIO Devices
        if Self::in_clint(addr) {
            let word = self
                .clint
                .read(addr & !3)
                .ok_or(MemoryError { addr, size: 2 })?;
            let half_off = ((addr >> 1) & 1) as usize;
            Ok((word >> (half_off * 16)) as u16)
        } else if super::uart::Uart::contains(addr) {
            let word = self.uart.read_word(addr & !3).unwrap_or(0);
            let half_off = ((addr >> 1) & 1) as usize;
            Ok((word >> (half_off * 16)) as u16)
        } else if super::plic::Plic::contains(addr) {
            let word = self
                .plic
                .read(addr & !3)
                .ok_or(MemoryError { addr, size: 2 })?;
            let half_off = ((addr >> 1) & 1) as usize;
            Ok((word >> (half_off * 16)) as u16)
        } else if super::virtio_blk::VirtioBlk::contains(addr) {
            let word = self
                .virtio_blk
                .read(addr & !3)
                .ok_or(MemoryError { addr, size: 2 })?;
            let half_off = ((addr >> 1) & 1) as usize;
            Ok((word >> (half_off * 16)) as u16)
        } else if super::virtio_net::VirtioNet::contains(addr) {
            let word = self
                .virtio_net
                .read(addr & !3)
                .ok_or(MemoryError { addr, size: 2 })?;
            let half_off = ((addr >> 1) & 1) as usize;
            Ok((word >> (half_off * 16)) as u16)
        } else if super::virtio_gpu::VirtioGpu::contains(addr) {
            let offset = ((addr - super::virtio_gpu::VIRTIO_GPU_BASE) & !3) as usize;
            let word = self
                .virtio_gpu
                .read(offset)
                .ok_or(MemoryError { addr, size: 2 })?;
            let half_off = ((addr >> 1) & 1) as usize;
            Ok((word >> (half_off * 16)) as u16)
        } else if super::spi_sd::SpiSd::contains(addr) {
            let word = self
                .spi_sd
                .read(addr & !3)
                .ok_or(MemoryError { addr, size: 2 })?;
            let byte_off = (addr & 2) as usize;
            Ok((word >> (byte_off * 8)) as u16)
        } else if super::vfs_surface::VfsSurface::contains(addr) {
            let word = self
                .vfs_surface
                .read(addr & !3)
                .ok_or(MemoryError { addr, size: 2 })?;
            let half_off = ((addr >> 1) & 1) as usize;
            Ok((word >> (half_off * 16)) as u16)
        } else if super::framebuf::Framebuffer::contains(addr) {
            let word = self
                .framebuf
                .read(addr & !3)
                .ok_or(MemoryError { addr, size: 2 })?;
            let half_off = ((addr >> 1) & 1) as usize;
            Ok((word >> (half_off * 16)) as u16)
        } else if addr < self.mem.ram_base {
            if self.low_addr_identity_map {
                Ok(0)
            } else {
                Err(MemoryError { addr, size: 2 })
            }
        } else {
            self.mem.read_half(addr)
        }
    }

    /// Write a 16-bit half-word. Routes to device MMIO or RAM.
    pub fn write_half(&mut self, addr: u64, val: u16) -> Result<(), MemoryError> {
        // Write-protected address check: silently drop writes to protected addresses.
        for &(pa, _protected_val) in &self.protected_addrs {
            if addr >= pa && addr < pa + 4 {
                return Ok(());
            }
        }

        // 1. RAM Access (Highest priority for low addresses when ram_base=0)
        if addr >= self.mem.ram_base && addr < self.mem.ram_base + self.mem.size() as u64 {
            return self.mem.write_half(addr, val);
        }

        // 2. MMIO Devices
        if Self::in_clint(addr) {
            let word_addr = addr & !3;
            let half_off = ((addr >> 1) & 1) as usize;
            let mut word = self.clint.read(word_addr).unwrap_or(0);
            word = (word & !(0xFFFF << (half_off * 16))) | ((val as u32) << (half_off * 16));
            if self.clint.write(word_addr, word) {
                Ok(())
            } else {
                Err(MemoryError { addr, size: 2 })
            }
        } else if super::uart::Uart::contains(addr) {
            // UART doesn't have half-word writes; read-modify-write at word level
            let word_addr = addr & !3;
            let half_off = ((addr >> 1) & 1) as usize;
            let mut word = self.uart.read_word(word_addr).unwrap_or(0);
            word = (word & !(0xFFFF << (half_off * 16))) | ((val as u32) << (half_off * 16));
            self.uart.write_word(word_addr, word);
            Ok(())
        } else if super::plic::Plic::contains(addr) {
            let word_addr = addr & !3;
            let half_off = ((addr >> 1) & 1) as usize;
            let mut word = self.plic.read(word_addr).unwrap_or(0);
            word = (word & !(0xFFFF << (half_off * 16))) | ((val as u32) << (half_off * 16));
            if self.plic.write(word_addr, word) {
                Ok(())
            } else {
                Err(MemoryError { addr, size: 2 })
            }
        } else if super::virtio_blk::VirtioBlk::contains(addr) {
            // Virtio doesn't have half-word writes; ignore
            Ok(())
        } else if super::virtio_net::VirtioNet::contains(addr) {
            // Virtio doesn't have half-word writes; ignore
            Ok(())
        } else if super::virtio_gpu::VirtioGpu::contains(addr) {
            // VirtIO GPU doesn't have half-word writes; ignore
            Ok(())
        } else if super::spi_sd::SpiSd::contains(addr) {
            let word_addr = addr & !3;
            let byte_off = (addr & 2) as usize;
            let mut word = self.spi_sd.read(word_addr).unwrap_or(0);
            word = (word & !(0xFFFF << (byte_off * 8))) | ((val as u32) << (byte_off * 8));
            self.spi_sd.write(word_addr, word);
            Ok(())
        } else if super::vfs_surface::VfsSurface::contains(addr) {
            let word_addr = addr & !3;
            let half_off = ((addr >> 1) & 1) as usize;
            let mut word = self.vfs_surface.read(word_addr).unwrap_or(0);
            word = (word & !(0xFFFF << (half_off * 16))) | ((val as u32) << (half_off * 16));
            self.vfs_surface.write(word_addr, word);
            Ok(())
        } else if super::framebuf::Framebuffer::contains(addr) {
            let word_addr = addr & !3;
            let half_off = ((addr >> 1) & 1) as usize;
            let mut word = self.framebuf.read(word_addr).unwrap_or(0);
            word = (word & !(0xFFFF << (half_off * 16))) | ((val as u32) << (half_off * 16));
            self.framebuf.write(word_addr, word);
            Ok(())
        } else if addr < self.mem.ram_base {
            if self.low_addr_identity_map {
                Ok(())
            } else {
                Err(MemoryError { addr, size: 2 })
            }
        } else {
            self.mem.write_half(addr, val)
        }
    }

    /// Advance the CLINT timer by one tick.
    pub fn tick_clint(&mut self) {
        self.clint.tick();
    }

    /// Advance the CLINT timer by N ticks.
    /// Used during Linux boot to simulate realistic CPU/timebase ratio.
    pub fn tick_clint_n(&mut self, n: u64) {
        self.clint.tick_n(n);
    }

    /// Sync CLINT + PLIC hardware state into the MIP register.
    ///
    /// Sets/clears MTIP (bit 7) AND STIP (bit 5) based on mtime >= mtimecmp.
    /// Sets/clears MSIP (bit 3) based on msip register.
    /// Sets/clears MEIP (bit 11) based on PLIC pending+enabled interrupts.
    ///
    /// Both MTIP and STIP are set when the timer fires. The pending_interrupt()
    /// function in csr/bank.rs handles priority correctly:
    /// - M-mode with MTIE enabled → MTI fires (bit 7 checked first, higher priority)
    /// - S-mode → STI fires (MTI skipped for non-Machine privilege when not delegated)
    /// - Linux boot (S-mode with OpenSBI emulation) still works because S-mode
    ///   sees STI via pending_interrupt(), not MTI.
    ///
    /// Previous code only set STIP for OpenSBI emulation, which broke M-mode
    /// timer tests (test_clint_timer_interrupt_via_vm_step, etc.) that expect
    /// MTIP to be set when mtime >= mtimecmp.
    pub fn sync_mip(&self, mip: &mut u32) {
        self.sync_mip_inner(mip, true);
    }

    /// Like sync_mip but skips CLINT timer state (MTIP/STIP).
    /// Used by step_no_clint to avoid level-triggered timer storms:
    /// when CLINT isn't ticking, we shouldn't keep asserting timer pending.
    pub fn sync_mip_skip_timer(&self, mip: &mut u32) {
        self.sync_mip_inner(mip, false);
    }

    fn sync_mip_inner(&self, mip: &mut u32, include_timer: bool) {
        if include_timer {
            let timer_pending = self.clint.timer_pending();
            if timer_pending {
                *mip |= (1 << 7) | (1 << 5); // Set both MTIP and STIP
            } else {
                *mip &= !((1 << 7) | (1 << 5)); // Clear both MTIP and STIP
            }
        } else {
            // When skipping timer sync, always clear MTIP/STIP.
            // This prevents level-triggered timer storms: if the timer
            // fired on a previous step_with_clint_ticks, STIP/MTIP would
            // stay set. Without clearing them here, every subsequent
            // step_no_clint would still see the timer as pending.
            *mip &= !((1 << 7) | (1 << 5));
        }

        // MSIP (bit 3) and SSIP (bit 1): machine/supervisor software interrupt pending.
        // Both bits are set when msip is asserted, mirroring the timer pattern where
        // both MTIP and STIP are asserted. This allows the software interrupt to reach
        // S-mode via mideleg[INT_SSI]=1 (bit 1), just as the timer reaches S-mode via
        // mideleg[INT_STI]=1 (bit 5). The S-mode handler clears SSIP by writing 0 to sip.
        if self.clint.software_pending() {
            *mip |= (1 << 3) | (1 << 1); // Set both MSIP and SSIP
        } else {
            *mip &= !((1 << 3) | (1 << 1)); // Clear both MSIP and SSIP
        }

        // MEIP (bit 11): machine external interrupt pending from PLIC context 0 (M-mode).
        // Set whenever PLIC M-mode context has an enabled, pending interrupt above threshold.
        if self
            .plic
            .pending_interrupt_ctx(super::plic::CTX_MMODE)
            .is_some()
        {
            *mip |= 1 << 11;
        } else {
            *mip &= !(1 << 11);
        }

        // SEIP (bit 9): supervisor external interrupt pending from PLIC context 1 (S-mode).
        // Critical for Linux, which runs in S-mode and claims external interrupts via context 1.
        if self
            .plic
            .pending_interrupt_ctx(super::plic::CTX_SMODE)
            .is_some()
        {
            *mip |= 1 << 9;
        } else {
            *mip &= !(1 << 9);
        }
    }

    fn in_clint(addr: u64) -> bool {
        (CLINT_START..CLINT_END).contains(&addr)
    }

    /// Intercept a word write to check if it targets a known page table page.
    ///
    /// When `auto_pte_fixup` is enabled and the write address falls within a
    /// registered page table page (tracked in `known_pt_pages`), this method:
    /// 1. Checks if the written value is a valid PTE with V=1
    /// 2. If the PPN >= PAGE_OFFSET/4096 (0xC0000), subtracts the offset to
    ///    convert from virtual PPN to physical PPN
    /// 3. If the PTE is a non-leaf entry (R=W=X=0), registers the pointed-to
    ///    L2 table page as a known page table page for future interception
    ///
    /// This handles the Linux demand paging case where the page fault handler
    /// creates NEW PTEs with virtual PPNs after the initial SATP fixup.
    fn intercept_pte_write(&mut self, addr: u64, val: u32) -> u32 {
        if !self.auto_pte_fixup || self.known_pt_pages.is_empty() {
            return val;
        }

        // Check if this address is in a known page table page
        let page_base = addr & !0xFFF; // 4KB page alignment
        if !self.known_pt_pages.contains(&page_base) {
            return val;
        }

        // Check if the value looks like a valid PTE (V=1)
        const PTE_V: u32 = 1;
        const PPN_MASK: u32 = 0xFFFF_FC00;
        const LEAF_FLAGS: u32 = 2 | 4 | 8; // R | W | X
        let kernel_va_ppn: u32 = 0xC0000;
        let ram_base_ppn: u32 = (self.mem.ram_base >> 12) as u32;
        let ram_end_ppn: u32 = ram_base_ppn + (self.mem.size() >> 12) as u32;
        let ram_end_pa: u64 = self.mem.ram_base + self.mem.size() as u64;

        // PPN fixup that matches fixup_kernel_page_table's logic exactly.
        // Must handle three cases:
        //   1. Virtual PPNs (>= PAGE_OFFSET>>12): subtract kernel_va_ppn, add ram_base_ppn
        //   2. Already guest-physical (>= ram_base_ppn, < ram_end_ppn): unchanged
        //   3. Linux-physical PPNs (everything else): add ram_base_ppn ONLY if result
        //      is in valid guest RAM range. Device MMIO PPNs (PLIC, UART, CLINT)
        //      are left unchanged because they don't map into guest RAM.
        let fix_ppn = |ppn: u32| -> u32 {
            if ppn >= kernel_va_ppn {
                (ppn - kernel_va_ppn) + ram_base_ppn // Virtual -> guest-physical
            } else if ppn >= ram_base_ppn && ppn < ram_end_ppn {
                ppn // Already guest-physical
            } else {
                // Linux-physical RAM or device MMIO. Only fix if it maps into guest RAM.
                let candidate = ppn + ram_base_ppn;
                if candidate < ram_end_ppn {
                    candidate // Linux-physical RAM -> guest-physical
                } else {
                    ppn // Device MMIO or out of range — leave unchanged
                }
            }
        };

        if (val & PTE_V) == 0 {
            return val;
        }

        let ppn = (val & PPN_MASK) >> 10;

        // Guard: skip fixup for values that don't look like real PTEs.
        // A non-leaf PTE (R=W=X=0) must have PPN > 0 (pointing to a page table).
        // A value like `1` (V=1, no flags, PPN=0) is never a real PTE — it's
        // kernel data (e.g., a cred usage counter) that happens to have bit 0 set.
        // Without this guard, the fixup adds ram_base_ppn to PPN 0, corrupting
        // small values (1 → 0x20000001). Leaf PTEs (R|W|X != 0) with PPN=0
        // are still valid (e.g., megapage at PA 0 → guest PA 0x80000000).
        if ppn == 0 && (val & LEAF_FLAGS) == 0 {
            return val; // Not a real PTE — skip fixup
        }

        let final_ppn = fix_ppn(ppn);
        let fixed_val = (val & !PPN_MASK) | (final_ppn << 10);

        // Dynamic L2 page discovery: unregister old L2, register new L2
        let is_nonleaf = (val & LEAF_FLAGS) == 0;
        // If overwriting a previous L1 entry, unregister the old L2 target.
        let old_val = self.mem.read_word(addr).unwrap_or(0);
        if (old_val & PTE_V) != 0 && (old_val & LEAF_FLAGS) == 0 {
            let old_ppn = (old_val & PPN_MASK) >> 10;
            let old_l2_base = (old_ppn as u64) << 12;
            if old_l2_base >= self.mem.ram_base && old_l2_base < ram_end_pa {
                self.known_pt_pages.remove(&old_l2_base);
            }
        }

        // For non-leaf entries: register the new L2 table page
        if is_nonleaf && ppn > 0 {
            let l2_base = (final_ppn as u64) << 12;
            if l2_base >= self.mem.ram_base
                && l2_base < ram_end_pa
                && !self.known_pt_pages.contains(&l2_base)
            {
                self.known_pt_pages.insert(l2_base);
                eprintln!(
                    "[pte_intercept] Registered new L2 table at PA 0x{:08X} (from L1 write at PA 0x{:08X})",
                    l2_base, addr
                );
                // Retroactive scan: same as above — the kernel may have written leaf PTEs
                // into this L2 before wiring it into L1. Fix any virtual PPNs now.
                let mut fixed = 0u32;
                for j in 0..1024u32 {
                    let ea = l2_base + (j as u64) * 4;
                    let entry = match self.read_word(ea) {
                        Ok(v) => v,
                        Err(_) => continue,
                    };
                    if (entry & PTE_V) == 0 {
                        continue;
                    }
                    let e_ppn = (entry & PPN_MASK) >> 10;
                    if e_ppn == 0 {
                        continue;
                    }
                    let e_fixed = fix_ppn(e_ppn);
                    if e_fixed != e_ppn {
                        self.mem
                            .write_word(ea, (entry & !PPN_MASK) | (e_fixed << 10))
                            .ok();
                        fixed += 1;
                    }
                }
                if fixed > 0 {
                    eprintln!("[pte_intercept] Retroactively fixed {} entries in newly-registered L2 at PA 0x{:08X}", fixed, l2_base);
                }
            }
        }

        // Fix PPNs: apply ram_base offset to convert Linux-physical to Guest-physical
        if final_ppn != ppn {
            let fixed_val = (val & !PPN_MASK) | (final_ppn << 10);
            return fixed_val;
        }

        // NOTE: Previous LEAF-stripping removed. The bad pgd warning appears to be
        // harmless -- it only affects per-process page table copies, not swapper_pg_dir.
        // The real boot blocker was the missing console device.
        // See NEAR_ESCALATIONS.md for analysis.

        val
    }

    /// Fix virtual PPNs in a kernel page table.
    ///
    /// Linux's setup_vm() creates PTEs with virtual PPNs because __pa() is a no-op
    /// without real SBI firmware. This scans all L1 and L2 entries and subtracts
    /// PAGE_OFFSET (0xC0000000 >> 12 = 0xC0000) from any PPN >= 0xC0000.
    ///
    /// Also registers all discovered page table pages in `known_pt_pages` so that
    /// `intercept_pte_write` can fix future PTE writes (demand paging) in real-time.
    ///
    /// Called automatically from write_csr(SATP) when auto_pte_fixup is true.
    pub fn fixup_kernel_page_table(&mut self, pg_dir_phys: u64) {
        const PPN_MASK: u32 = 0xFFFF_FC00;
        const LEAF_FLAGS: u32 = 2 | 4 | 8; // R | W | X

        // Linux's __pa() returns VA - PAGE_OFFSET. For a kernel linked at
        // VA 0xC0000000 with p_paddr=0, __pa(&_start) = 0. But our VM loads
        // the kernel at PA ram_base (0x80000000). So every PPN in the kernel's
        // page tables is off by ram_base >> 12.
        //
        // Two cases for PPN values in kernel PTEs:
        //   1. Virtual PPNs (>= PAGE_OFFSET>>12): need (PPN - PAGE_OFFSET_PPN) + RAM_BASE_PPN
        //   2. Linux-physical PPNs (< PAGE_OFFSET>>12): need PPN + RAM_BASE_PPN
        // Both simplify to: convert virtual PPN to Linux-physical, then add RAM_BASE_PPN.
        let kernel_va_ppn: u32 = (0xC000_0000u32) >> 12; // 0xC0000
        let ram_base_ppn: u32 = (self.mem.ram_base >> 12) as u32; // 0x80000
        let ram_end_ppn: u32 = ram_base_ppn + (self.mem.size() >> 12) as u32;
        let ram_end_pa: u64 = self.mem.ram_base + self.mem.size() as u64;

        // Helper: convert any PPN to the correct guest-physical PPN.
        // Idempotent — safe to apply repeatedly.
        // Matches the same logic in intercept_pte_write exactly.
        let fix_ppn = |ppn: u32| -> u32 {
            if ppn >= kernel_va_ppn {
                (ppn - kernel_va_ppn) + ram_base_ppn // Virtual -> guest-physical
            } else if ppn >= ram_base_ppn && ppn < ram_end_ppn {
                ppn // Already guest-physical
            } else {
                // Linux-physical RAM or device MMIO. Only fix if it maps into guest RAM.
                let candidate = ppn + ram_base_ppn;
                if candidate < ram_end_ppn {
                    candidate // Linux-physical RAM -> guest-physical
                } else {
                    ppn // Device MMIO or out of range — leave unchanged
                }
            }
        };

        let mut l2_tables_to_fix: Vec<u64> = Vec::new();

        // Register the L1 page directory itself as a known page table page.
        self.known_pt_pages.insert(pg_dir_phys);
        self.l1_pg_dirs.insert(pg_dir_phys);

        // Diagnostic: read kernel_map fields to understand PA calculation
        let kernel_map_pa: u64 = 0x80C7A098;
        let km_page_offset = self.mem.read_word(kernel_map_pa).unwrap_or(0xDEAD);
        let km_virt_addr = self.mem.read_word(kernel_map_pa + 4).unwrap_or(0xDEAD);
        let km_phys_addr = self.mem.read_word(kernel_map_pa + 8).unwrap_or(0xDEAD);
        let km_size = self.mem.read_word(kernel_map_pa + 12).unwrap_or(0xDEAD);
        let km_va_pa_offset = self.mem.read_word(kernel_map_pa + 20).unwrap_or(0xDEAD);
        let km_va_kernel_pa_offset = self.mem.read_word(kernel_map_pa + 24).unwrap_or(0xDEAD);
        let phys_ram_base_pa: u64 = 0x80C7A0B4;
        let phys_ram_base = self.mem.read_word(phys_ram_base_pa).unwrap_or(0xDEAD);
        eprintln!("[pte_fixup] kernel_map: page_offset=0x{:08X} virt_addr=0x{:08X} phys_addr=0x{:08X} size=0x{:08X}", km_page_offset, km_virt_addr, km_phys_addr, km_size);
        eprintln!(
            "[pte_fixup] kernel_map: va_pa_offset=0x{:08X} va_kernel_pa_offset=0x{:08X}",
            km_va_pa_offset, km_va_kernel_pa_offset
        );
        eprintln!("[pte_fixup] phys_ram_base=0x{:08X}", phys_ram_base);

        // Patch kernel_map.va_pa_offset to 0x40000000 (PAGE_OFFSET - ram_base).
        //
        // On RV32, setup_vm sets va_pa_offset = PAGE_OFFSET - &_start = 0 because
        // the kernel is linked at VA 0xC0000000 with &_start = 0xC0000000. But our
        // VM loads the kernel at guest-PA 0x80000000, so the correct offset is
        // 0xC0000000 - 0x80000000 = 0x40000000.
        //
        // Without this patch, __pa(va) returns va (identity), and the kernel computes
        // PFNs like 0xC080C instead of 0x8080C. The PPN fixup in this function handles
        // the initial page tables, but runtime allocations (buddy allocator, execve user
        // stack) create PTEs in untracked pages with wrong PPNs.
        //
        // After patching, __pa(va) = va - 0x40000000, giving correct guest-physical
        // addresses for ALL kernel code, not just page tables.
        //
        // kernel_map is at VA 0xC0C7A098 (from System.map). Guest-PA = 0x80C7A098.
        // va_pa_offset is at kernel_map + 20 = 0x80C7A0AC.
        let kernel_map_pa_patch: u64 = 0x80C7A098;
        let va_pa_offset_pa = kernel_map_pa_patch + 20;
        let correct_va_pa_offset: u32 = 0x4000_0000; // PAGE_OFFSET - ram_base
        if let Ok(current) = self.mem.read_word(va_pa_offset_pa) {
            if current != correct_va_pa_offset {
                eprintln!(
                    "[pte_fixup] Patching kernel_map.va_pa_offset: 0x{:08X} -> 0x{:08X} at PA 0x{:08X}",
                    current, correct_va_pa_offset, va_pa_offset_pa
                );
                let _ = self.mem.write_word(va_pa_offset_pa, correct_va_pa_offset);
            }
        }

        // Also patch va_kernel_pa_offset (kernel_map + 24) if needed.
        // This is used by __pa_symbol() for kernel symbol addresses.
        // On RV32 with relocated kernel: virt_addr - phys_addr.
        // virt_addr = KERNEL_LINK_ADDR (0xC0000000), phys_addr should be 0x80000000.
        // So va_kernel_pa_offset = 0xC0000000 - 0x80000000 = 0x40000000.
        let va_kernel_pa_offset_pa = kernel_map_pa + 24;
        if let Ok(current) = self.mem.read_word(va_kernel_pa_offset_pa) {
            if current != correct_va_pa_offset {
                eprintln!(
                    "[pte_fixup] Patching kernel_map.va_kernel_pa_offset: 0x{:08X} -> 0x{:08X} at PA 0x{:08X}",
                    current, correct_va_pa_offset, va_kernel_pa_offset_pa
                );
                let _ = self
                    .mem
                    .write_word(va_kernel_pa_offset_pa, correct_va_pa_offset);
            }
        }

        // Scan all 1024 L1 entries
        for i in 0..1024u32 {
            let l1_addr = pg_dir_phys + (i as u64) * 4;
            let l1_pte = match self.read_word(l1_addr) {
                Ok(v) => v,
                Err(_) => continue,
            };

            if (l1_pte & 1) == 0 {
                continue;
            }

            let l1_ppn = (l1_pte & PPN_MASK) >> 10;
            let final_ppn = fix_ppn(l1_ppn);

            // Rewrite the PTE if the PPN changed
            let mut l1_pte = l1_pte;
            if final_ppn != l1_ppn {
                let fixed_pte = (l1_pte & !PPN_MASK) | (final_ppn << 10);
                eprintln!(
                    "[pte_fixup] Fixed L1[{}] at PA 0x{:08X}: PPN 0x{:05X} -> 0x{:05X} (0x{:08X} -> 0x{:08X})",
                    i, l1_addr, l1_ppn, final_ppn, l1_pte, fixed_pte
                );
                self.mem.write_word(l1_addr, fixed_pte).ok();
                l1_pte = fixed_pte;
            }

            // If leaf (megapage) L1 entry in kernel space (VPN1 >= 512),
            // convert to non-leaf to prevent pmd_bad() from flagging it
            // during copy_page_range (execve). The kernel's pmd_bad() checks
            // for R|W|X (leaf) flags at the PGD level and clears "bad" entries.
            // For entries pointing to valid RAM, just strip LEAF flags.
            // For entries outside RAM, redirect to scratch pages.
            if (l1_pte & LEAF_FLAGS) != 0 && i >= 512 {
                let megapage_pa = (final_ppn as u64) << 12;
                if megapage_pa >= self.mem.ram_base && megapage_pa < ram_end_pa {
                    // Valid RAM megapage: strip LEAF flags, keep same PPN.
                    // The PPN now points to a 4KB page that acts as an L2 table.
                    // Zero it so the kernel doesn't walk garbage L2 entries.
                    let non_leaf_val = (l1_pte & !(LEAF_FLAGS as u32)) & !0x3FF // clear low flags
                        | 1; // set V only
                    let l2_page_pa = (final_ppn as u64) << 12;
                    // Zero the page so it's a valid empty L2 table
                    for off in (0..0x1000).step_by(4) {
                        let _ = self.mem.write_word(l2_page_pa + off, 0);
                    }
                    self.mem.write_word(l1_addr, non_leaf_val).ok();
                    // Register as known L2 table page
                    self.known_pt_pages.insert(l2_page_pa);
                    continue;
                } else {
                    // Out-of-range: redirect to scratch page (non-leaf)
                    let ram_end = self.mem.ram_base + self.mem.size() as u64;
                    let pool_base = ram_end - VMALLOC_SCRATCH_POOL_SIZE;
                    let pool_pages = VMALLOC_SCRATCH_POOL_SIZE / 0x1000;
                    let vpn_index = i as u64;
                    let scratch_ppn =
                        ((pool_base + ((vpn_index % pool_pages) * 0x1000)) >> 12) as u32;
                    let fixed_val = (scratch_ppn << 10) | 1; // PPN + V only, no LEAF
                    self.mem.write_word(l1_addr, fixed_val).ok();
                    continue;
                }
            }

            // If non-leaf L1 entry, queue the L2 table for fixup and register it
            if (l1_pte & LEAF_FLAGS) == 0 {
                let l2_base = (final_ppn as u64) << 12;
                if l2_base >= self.mem.ram_base && l2_base < ram_end_pa {
                    self.known_pt_pages.insert(l2_base);
                    l2_tables_to_fix.push(l2_base);
                }
            }
        }

        // Fix L2 tables
        for l2_base in &l2_tables_to_fix {
            let mut fixed_count = 0;
            for j in 0..1024u32 {
                let l2_addr = *l2_base + (j as u64) * 4;
                let l2_pte = match self.read_word(l2_addr) {
                    Ok(v) => v,
                    Err(_) => continue,
                };

                if (l2_pte & 1) == 0 {
                    continue;
                }

                let l2_ppn = (l2_pte & PPN_MASK) >> 10;
                let final_ppn = fix_ppn(l2_ppn);

                if final_ppn != l2_ppn {
                    let fixed_pte = (l2_pte & !PPN_MASK) | (final_ppn << 10);
                    self.mem.write_word(l2_addr, fixed_pte).ok();
                    fixed_count += 1;
                }
            }
        }

        // Force-map kernel and low identity range if missing.
        // This prevents kernel panics when swapper_pg_dir doesn't map itself or DTB.
        let mega_pte_flags: u32 = 0xCF; // V+R+W+X+A+D

        // 1. Kernel range: VA 0xC0000000..0xC2800000 (10 megapages = 40MB)
        //    Maps to PA ram_base..ram_base+40MB. For megapages, PPN[9:0] must be 0,
        //    and PPN[19:10] = PA[31:22].
        for i in 0..10u32 {
            let idx = 768 + i;
            let addr = pg_dir_phys + (idx as u64) * 4;
            let existing = self.read_word(addr).unwrap_or(0);
            if existing == 0 {
                let pa = self.mem.ram_base + ((i as u64) << 22);
                let ppn = (pa >> 12) as u32; // ram_base_ppn + i * megapage_ppn_stride
                let pte = (ppn << 10) | mega_pte_flags;
                eprintln!(
                    "[pte_fixup] Force-map L1[{}] at PA 0x{:08X}: megapage PA 0x{:08X} -> VA 0x{:08X}",
                    idx, addr, pa, 0xC000_0000 + ((i as u32) << 22)
                );
                self.mem.write_word(addr, pte).ok();
            } else {
                eprintln!(
                    "[pte_fixup] L1[{}] at PA 0x{:08X} already set: 0x{:08X} (PPN 0x{:05X}, flags 0x{:02X}), skipping force-map",
                    idx, addr, existing, (existing >> 10) & 0xFFFFF, existing & 0x3FF
                );
            }
        }
        eprintln!(
            "[pte_fixup] Registered {} page table pages (L1 at PA 0x{:08X})",
            self.known_pt_pages.len(),
            pg_dir_phys
        );
    }

    // Phase 201: Socket syscall intercept helpers.
    // These avoid borrow-checker issues when guest_sockets and read_word/write_word
    // both need &mut self. We read guest memory inline here.

    /// Intercept connect(fd, addr_ptr, addr_len) -- reads sockaddr from guest RAM.
    pub fn intercept_connect(&mut self, fd: i32, addr_ptr: u32, _addr_len: u32) -> i32 {
        // Read sockaddr_in from guest memory: family(2) + port(2) + addr(4) = 8 bytes
        // Stored as two u32 words (little-endian on RV32).
        // struct sockaddr_in layout in RAM (LE):
        //   word0 bytes: [family_lo, family_hi, port_lo, port_hi]  -- port is network-order
        //   word1 bytes: [addr_b0, addr_b1, addr_b2, addr_b3]     -- addr is network-order
        let w0 = self.mem.read_word(addr_ptr as u64).unwrap_or(0);
        let w1 = self.mem.read_word((addr_ptr + 4) as u64).unwrap_or(0);
        // family: low 16 bits of w0 (already correct, stored LE)
        let _family = w0 & 0xFFFF;
        // port: high 16 bits of w0 in LE → bytes 2-3 of struct → network-order port
        // (w0 >> 16) gives port_hi<<8 | port_lo which IS the big-endian port value.
        // u16::from_be() converts it to host (LE) order for Rust's TcpStream.
        let port = u16::from_be(((w0 >> 16) & 0xFFFF) as u16);
        // addr: word1 LE bytes are the 4 octets in network order (b0.b1.b2.b3)
        let addr_bytes = w1.to_le_bytes();
        let addr_str = format!(
            "{}.{}.{}.{}",
            addr_bytes[0], addr_bytes[1], addr_bytes[2], addr_bytes[3]
        );
        let ret = self.guest_sockets.connect_guest(fd, &addr_str, port);
        eprintln!(
            "[socket] connect(fd={}, addr={}:{}, ret={})",
            fd, addr_str, port, ret
        );
        ret
    }

    /// Intercept sendto(fd, buf_ptr, len, flags, addr_ptr, addr_len) -- reads buf from guest RAM.
    pub fn intercept_sendto(
        &mut self,
        fd: i32,
        buf_ptr: u32,
        len: u32,
        _flags: u32,
        addr_ptr: u32,
        _addr_len: u32,
    ) -> i32 {
        let mut data = Vec::with_capacity(len as usize);
        for i in 0..len {
            let w = self.mem.read_word((buf_ptr + i) as u64).unwrap_or(0);
            data.push(w as u8);
        }
        // Read dest address (same sockaddr_in parsing as intercept_connect)
        let w0 = self.mem.read_word(addr_ptr as u64).unwrap_or(0);
        let w1 = self.mem.read_word((addr_ptr + 4) as u64).unwrap_or(0);
        let port = u16::from_be(((w0 >> 16) & 0xFFFF) as u16);
        let addr_bytes = w1.to_le_bytes();
        let addr_str = format!(
            "{}.{}.{}.{}",
            addr_bytes[0], addr_bytes[1], addr_bytes[2], addr_bytes[3]
        );

        // Use guest_sockets which holds the TCP stream
        let ret = self.guest_sockets.sendto_guest(fd, &data, &addr_str, port);
        eprintln!(
            "[socket] sendto(fd={}, len={}, addr={}:{}, ret={})",
            fd, len, addr_str, port, ret
        );
        ret
    }

    /// Intercept recvfrom(fd, buf_ptr, len, flags, addr_ptr, addr_len_ptr) -- writes buf to guest RAM.
    pub fn intercept_recvfrom(&mut self, fd: i32, buf_ptr: u32, len: u32, _flags: u32) -> i32 {
        let mut buf = vec![0u8; len as usize];
        let ret = self.guest_sockets.recvfrom_guest(fd, &mut buf);

        if ret > 0 {
            // Write received bytes back to guest RAM
            for i in 0..(ret as u32) {
                let _ = self
                    .mem
                    .write_word((buf_ptr + i) as u64, buf[i as usize] as u32);
            }
        }
        eprintln!("[socket] recvfrom(fd={}, len={}, ret={})", fd, len, ret);
        ret
    }

    // ── Value Watchpoint API ──

    /// Check all active value watchpoints against a write to `addr` with `val`.
    /// Called from write_word, write_byte, write_half. No-op when no watches active.
    #[inline]
    pub fn check_value_watches(&mut self, addr: u64, val: u32) {
        if self.value_watches.is_empty() {
            return; // fast path: no watches active
        }
        for w in &mut self.value_watches {
            w.check(addr, val, self.current_pc, 0);
        }
    }

    /// Add a watchpoint for any write to the 4-byte word at `addr`.
    pub fn add_watch_addr(&mut self, addr: u64) -> usize {
        let idx = self.value_watches.len();
        self.value_watches.push(ValueWatch::new(addr, addr + 4));
        idx
    }

    /// Add a watchpoint for any write to the range [start, end).
    pub fn add_watch_range(&mut self, start: u64, end: u64) -> usize {
        let idx = self.value_watches.len();
        self.value_watches.push(ValueWatch::new(start, end));
        idx
    }

    /// Add a watchpoint that only triggers on writes of `val` to address `addr`.
    pub fn add_watch_value_at(&mut self, addr: u64, val: u32) -> usize {
        let mut w = ValueWatch::new_value(addr, addr + 4, val);
        w.verbose = true;
        let idx = self.value_watches.len();
        self.value_watches.push(w);
        idx
    }

    /// Add a watchpoint that only triggers on writes of `val` anywhere in [start, end).
    pub fn add_watch_value_range(&mut self, start: u64, end: u64, val: u32) -> usize {
        let mut w = ValueWatch::new_value(start, end, val);
        w.verbose = true;
        let idx = self.value_watches.len();
        self.value_watches.push(w);
        idx
    }

    /// Get a summary of all active watchpoints and their hit counts.
    pub fn watch_summary(&self) -> String {
        if self.value_watches.is_empty() {
            return "  (no active watchpoints)".to_string();
        }
        let mut s = String::new();
        for (i, w) in self.value_watches.iter().enumerate() {
            let val_desc = match w.match_value {
                Some(v) => format!("val=0x{:08X}", v),
                None => "any".to_string(),
            };
            s.push_str(&format!(
                "  [{}] PA 0x{:08X}-0x{:08X} {} hits={} entries={}\n",
                i,
                w.start,
                w.end,
                val_desc,
                w.hits,
                w.log.len()
            ));
        }
        s
    }

    /// Clear all watchpoints.
    pub fn clear_watches(&mut self) {
        self.value_watches.clear();
    }

    /// Remove a watchpoint by index (returned by add_* methods).
    pub fn remove_watch(&mut self, idx: usize) -> bool {
        if idx < self.value_watches.len() {
            self.value_watches.remove(idx);
            true
        } else {
            false
        }
    }
}

#[cfg(test)]
mod tests {
    use super::super::clint;
    use super::super::plic;
    use super::super::uart;
    use super::*;

    #[test]
    fn bus_ram_read_write() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        bus.write_word(0x8000_0000, 0xDEAD_BEEF)
            .expect("operation should succeed");
        assert_eq!(
            bus.read_word(0x8000_0000)
                .expect("operation should succeed"),
            0xDEAD_BEEF
        );
    }

    #[test]
    fn bus_ram_base_zero_read_write() {
        // With ram_base=0, all physical addresses map directly to RAM
        let mut bus = Bus::new(0, 4096);
        bus.write_word(0x0000_0000, 0xDEAD_BEEF)
            .expect("operation should succeed");
        assert_eq!(
            bus.read_word(0x0000_0000)
                .expect("operation should succeed"),
            0xDEAD_BEEF
        );
    }

    #[test]
    fn bus_clint_mmio_mtimecmp() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        bus.write_word(clint::MTIMECMP_BASE, 0x0000_0100)
            .expect("operation should succeed");
        assert_eq!(
            bus.read_word(clint::MTIMECMP_BASE)
                .expect("operation should succeed"),
            0x0000_0100
        );
    }

    #[test]
    fn bus_clint_msip() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        bus.write_word(clint::MSIP_BASE, 1)
            .expect("operation should succeed");
        assert_eq!(
            bus.read_word(clint::MSIP_BASE)
                .expect("operation should succeed"),
            1
        );
        assert!(bus.clint.software_pending());
    }

    #[test]
    fn bus_sync_mip_timer() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        bus.clint.mtimecmp = 0; // Timer fires immediately (mtime=0 >= mtimecmp=0)
        let mut mip = 0u32;
        bus.sync_mip(&mut mip);
        // Both MTIP (bit 7) and STIP (bit 5) are set when timer fires.
        // pending_interrupt() in csr/bank.rs handles priority:
        // M-mode sees MTI (higher priority), S-mode sees STI.
        assert_eq!(mip & (1 << 5), 1 << 5, "STIP should be set");
        assert_eq!(mip & (1 << 7), 1 << 7, "MTIP should be set");
    }

    #[test]
    fn bus_sync_mip_software() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        bus.clint.msip = 1;
        let mut mip = 0u32;
        bus.sync_mip(&mut mip);
        assert_eq!(mip & (1 << 3), 1 << 3, "MSIP should be set");
    }

    #[test]
    fn bus_sync_mip_clears_when_not_pending() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        // Set both STIP and MTIP to verify both are cleared when timer not pending
        let mut mip: u32 = (1 << 5) | (1 << 7) | (1 << 3);
        bus.sync_mip(&mut mip);
        assert_eq!(mip & (1 << 5), 0, "STIP should be cleared");
        assert_eq!(mip & (1 << 7), 0, "MTIP should be cleared");
        assert_eq!(mip & (1 << 3), 0, "MSIP should be cleared");
    }

    #[test]
    fn bus_sync_mip_meip_from_plic_m_mode() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        bus.plic.priority[1] = 5;
        bus.plic.contexts[super::super::plic::CTX_MMODE].enable = 1 << 1;
        bus.plic.signal(1);
        let mut mip = 0u32;
        bus.sync_mip(&mut mip);
        assert_eq!(
            mip & (1 << 11),
            1 << 11,
            "MEIP should be set for M-mode context"
        );
    }

    #[test]
    fn bus_sync_mip_seip_from_plic_s_mode() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        bus.plic.priority[1] = 5;
        bus.plic.contexts[super::super::plic::CTX_SMODE].enable = 1 << 1;
        bus.plic.signal(1);
        let mut mip = 0u32;
        bus.sync_mip(&mut mip);
        assert_eq!(
            mip & (1 << 9),
            1 << 9,
            "SEIP should be set for S-mode context"
        );
        // MEIP should NOT be set because M-mode context doesn't have it enabled
        assert_eq!(mip & (1 << 11), 0, "MEIP should not be set");
    }

    #[test]
    fn bus_sync_mip_seip_cleared_after_claim() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        bus.plic.priority[1] = 5;
        bus.plic.contexts[super::super::plic::CTX_SMODE].enable = 1 << 1;
        bus.plic.signal(1);
        // Claim on S-mode context clears pending, so SEIP should clear
        bus.plic.claim(super::super::plic::CTX_SMODE);
        let mut mip = 0u32;
        bus.sync_mip(&mut mip);
        assert_eq!(mip & (1 << 9), 0, "SEIP should be cleared after claim");
    }

    #[test]
    fn bus_out_of_range_fails() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        bus.low_addr_identity_map = true;
        // Low addresses return 0 (unmapped below ram_base)
        assert_eq!(
            bus.read_word(0x0000_0000)
                .expect("operation should succeed"),
            0
        );
        assert!(bus.read_word(0x0200_1000).is_err()); // CLINT gap
    }

    #[test]
    fn bus_tick_advances_mtime() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        assert_eq!(bus.clint.mtime, 0);
        bus.tick_clint();
        assert_eq!(bus.clint.mtime, 1);
    }

    #[test]
    fn pte_intercept_fixes_virtual_ppn() {
        // Simulate Linux demand paging: kernel writes PTE with virtual PPN
        // to a known page table page, and the intercept translates it.
        // Use RAM base 0x80000000 to match real kernel boot layout.
        let mut bus = Bus::new(0x8000_0000, 64 * 1024 * 1024); // 64MB RAM at 0x80000000
        bus.auto_pte_fixup = true;

        // Register a page table page at PA 0x80001000
        let pt_page = 0x8000_1000u64;
        bus.known_pt_pages.insert(pt_page);

        // Write a leaf PTE with virtual PPN (0xC0000 = 0xC0000000 >> 12)
        // PTE format: V=1, R=1, W=1, X=0, A=1, D=1 = 0x07, PPN = 0xC0000
        // PPN bits [31:10], so val = (0xC0000 << 10) | 0x07 = 0x30000007
        let virtual_pte: u32 = (0xC0000 << 10) | 0x07; // 0x30000007
        bus.write_word(pt_page, virtual_pte)
            .expect("operation should succeed");

        // The intercept should have fixed it: PPN 0xC0000 -> 0x80000 (subtract VA_PA_OFFSET 0x40000)
        let stored = bus.read_word(pt_page).expect("operation should succeed");
        let expected: u32 = (0x80000 << 10) | 0x07; // 0x20000007
        assert_eq!(
            stored, expected,
            "Virtual PTE 0x{:08X} should be fixed to 0x{:08X}, got 0x{:08X}",
            virtual_pte, expected, stored
        );
    }

    #[test]
    fn pte_intercept_skips_non_pt_page() {
        // Writes to non-page-table pages should pass through unchanged
        let mut bus = Bus::new(0, 1024 * 1024);
        bus.auto_pte_fixup = true;
        bus.known_pt_pages.insert(0x1000);

        // Write to a non-registered page
        bus.write_word(0x2000, 0xDEADBEEF)
            .expect("operation should succeed");
        assert_eq!(
            bus.read_word(0x2000).expect("operation should succeed"),
            0xDEADBEEF
        );
    }

    #[test]
    fn pte_intercept_discovers_new_l2_tables() {
        // Writing a non-leaf PTE should register the pointed-to L2 page.
        // Use RAM base 0x80000000 to match real kernel boot layout.
        let mut bus = Bus::new(0x8000_0000, 64 * 1024 * 1024);
        bus.auto_pte_fixup = true;

        let l1_page = 0x8000_1000u64;
        bus.known_pt_pages.insert(l1_page);

        // Write a non-leaf PTE pointing to L2 at PA 0x80002000.
        // In the real kernel, PPNs in page tables use full physical addresses:
        //   page_to_pfn(page) = PA >> PAGE_SHIFT
        // For PA 0x80002000, PPN = 0x80002 (>= ram_base_ppn = 0x80000).
        // Non-leaf: V=1, R=0, W=0, X=0 = 0x01, PPN = 0x80002
        let guest_ppn: u32 = 0x80002; // Full guest-physical PPN for PA 0x80002000
        let non_leaf_pte: u32 = (guest_ppn << 10) | 0x01;
        bus.write_word(l1_page, non_leaf_pte)
            .expect("operation should succeed");

        // After fixup: PPN 0x80002 >= ram_base_ppn → idempotent (0x80002)
        // The L2 page should now be registered at guest PA 0x80002000
        assert!(
            bus.known_pt_pages.contains(&0x8000_2000),
            "L2 page at 0x80002000 should be auto-discovered"
        );

        // And subsequent writes to the L2 page should be intercepted
        // Virtual PPN 0xC0001 -> linux-phys 0x1 -> guest-phys 0x80001
        let virtual_l2_pte: u32 = (0xC0001 << 10) | 0x07;
        bus.write_word(0x8000_2000, virtual_l2_pte)
            .expect("operation should succeed");
        let stored = bus
            .read_word(0x8000_2000)
            .expect("operation should succeed");
        let expected: u32 = (0x80001 << 10) | 0x07;
        assert_eq!(
            stored, expected,
            "Virtual L2 PTE should be fixed to 0x{:08X}, got 0x{:08X}",
            expected, stored
        );
    }

    #[test]
    fn pte_intercept_disabled_when_flag_off() {
        // When auto_pte_fixup is false, no interception should occur
        let mut bus = Bus::new(0, 1024 * 1024);
        bus.auto_pte_fixup = false;
        bus.known_pt_pages.insert(0x1000);

        let virtual_pte: u32 = (0xC0000 << 10) | 0x07;
        bus.write_word(0x1000, virtual_pte)
            .expect("operation should succeed");
        assert_eq!(
            bus.read_word(0x1000).expect("operation should succeed"),
            virtual_pte,
            "PTE should NOT be fixed when auto_pte_fixup is false"
        );
    }

    #[test]
    fn pte_intercept_skips_non_valid_pte() {
        // PTEs with V=0 should pass through unchanged
        let mut bus = Bus::new(0, 1024 * 1024);
        bus.auto_pte_fixup = true;
        bus.known_pt_pages.insert(0x1000);

        let invalid_pte: u32 = (0xC0000 << 10) | 0x00; // V=0
        bus.write_word(0x1000, invalid_pte)
            .expect("operation should succeed");
        assert_eq!(
            bus.read_word(0x1000).expect("operation should succeed"),
            invalid_pte,
            "Invalid PTE (V=0) should pass through unchanged"
        );
    }

    #[test]
    fn pte_intercept_skips_low_ppn() {
        // PTEs with PPN < PAGE_OFFSET_PPN should pass through unchanged
        let mut bus = Bus::new(0, 1024 * 1024);
        bus.auto_pte_fixup = true;
        bus.known_pt_pages.insert(0x1000);

        // PPN 0x50 maps to PA 0x50000 (320KB), within the 1MB RAM range
        let normal_pte: u32 = (0x50 << 10) | 0x07; // PPN 0x50, well below 0xC0000
        bus.write_word(0x1000, normal_pte)
            .expect("operation should succeed");
        assert_eq!(
            bus.read_word(0x1000).expect("operation should succeed"),
            normal_pte,
            "Low PPN PTE should pass through unchanged"
        );
    }

    // ---- VirtIO Network integration tests ----

    #[test]
    fn bus_virtio_net_read_magic_and_device_id() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        // Read magic value at VIRTIO_NET_BASE
        let magic = bus
            .read_word(super::super::virtio_net::VIRTIO_NET_BASE)
            .expect("should read magic");
        assert_eq!(magic, 0x7472_6976); // "virt"

        // Read device ID (net = 1)
        let dev_id = bus
            .read_word(super::super::virtio_net::VIRTIO_NET_BASE + 8)
            .expect("should read device ID");
        assert_eq!(dev_id, 1);
    }

    #[test]
    fn bus_virtio_net_read_write_status() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        let base = super::super::virtio_net::VIRTIO_NET_BASE;

        // STATUS register is at offset 0x28
        let status_addr = base + 0x28;

        // Write ACKNOWLEDGE | DRIVER
        bus.write_word(status_addr, 0x03).expect("write status");
        let val = bus.read_word(status_addr).expect("read status");
        assert_eq!(val, 0x03);

        // Reset by writing 0
        bus.write_word(status_addr, 0).expect("reset status");
        let val = bus.read_word(status_addr).expect("read status");
        assert_eq!(val, 0);
    }

    #[test]
    fn bus_virtio_net_queue_setup_and_ready() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        let base = super::super::virtio_net::VIRTIO_NET_BASE;

        // QUEUE_SEL=0x30, QUEUE_NUM=0x38, QUEUE_READY=0x44
        bus.write_word(base + 0x30, 0).expect("queue_sel=0");
        bus.write_word(base + 0x38, 8).expect("queue_num=8");
        bus.write_word(base + 0x44, 1).expect("queue_ready=1");

        // Verify via the device field
        assert!(bus.virtio_net.queues[0].ready);
        assert_eq!(bus.virtio_net.queues[0].size, 8);

        // Select TX queue (1), set size, mark ready
        bus.write_word(base + 0x30, 1).expect("queue_sel=1");
        bus.write_word(base + 0x38, 16).expect("queue_num=16");
        bus.write_word(base + 0x44, 1).expect("queue_ready=1");

        assert!(bus.virtio_net.queues[1].ready);
        assert_eq!(bus.virtio_net.queues[1].size, 16);
    }

    #[test]
    fn bus_virtio_net_features() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        let base = super::super::virtio_net::VIRTIO_NET_BASE;

        let features = bus.read_word(base + 16).expect("device_features");
        // MAC and STATUS feature bits should be set
        assert!(
            features & (1 << 5) != 0,
            "MAC feature (bit 5) should be set"
        );
        assert!(
            features & (1 << 16) != 0,
            "STATUS feature (bit 16) should be set"
        );
    }

    #[test]
    fn bus_virtio_net_config_mac() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        let base = super::super::virtio_net::VIRTIO_NET_BASE;

        // Config space starts at offset 0x100 (256 bytes after common regs)
        let config_base = base + 0x100;
        let mac_lo = bus.read_word(config_base).expect("mac_lo");
        // Default MAC: DE:AD:BE:EF:00:01
        assert_eq!(mac_lo, u32::from_le_bytes([0xDE, 0xAD, 0xBE, 0xEF]));

        let mac_hi = bus.read_word(config_base + 4).expect("mac_hi");
        assert_eq!(mac_hi, u32::from_le_bytes([0x00, 0x01, 0x01, 0x00]));
    }

    #[test]
    fn bus_virtio_net_interrupt_ack() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        let base = super::super::virtio_net::VIRTIO_NET_BASE;

        // Simulate an interrupt pending
        bus.virtio_net.int_status = 0x03; // CONFIG | USED_RING

        // INTERRUPT_STATUS=0x70, INTERRUPT_ACK=0x64
        let status = bus.read_word(base + 0x70).expect("int_status");
        assert_eq!(status, 0x03);

        // Acknowledge USED_RING interrupt
        bus.write_word(base + 0x64, 0x02).expect("int_ack=0x02");
        let status = bus.read_word(base + 0x70).expect("int_status after ack");
        assert_eq!(status, 0x01); // Only CONFIG remains
    }

    #[test]
    fn bus_virtio_net_inject_and_rx_pending_count() {
        let mut bus = Bus::new(0x8000_0000, 4096);

        assert_eq!(bus.virtio_net.rx_pending_count(), 0);

        // Inject a packet directly
        bus.virtio_net.inject_packet(&[0x45, 0x00, 0x00, 0x28]);
        assert_eq!(bus.virtio_net.rx_pending_count(), 1);

        bus.virtio_net.inject_packet(&[0xFF, 0xFF]);
        assert_eq!(bus.virtio_net.rx_pending_count(), 2);
    }

    #[test]
    fn bus_virtio_net_read_half_byte_routing() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        let base = super::super::virtio_net::VIRTIO_NET_BASE;

        // Write a full word to STATUS (offset 0x28), read back as half-word
        bus.write_word(base + 0x28, 0x1234_5678)
            .expect("write status word");
        // LE: word 0x12345678 stored as bytes [0x78, 0x56, 0x34, 0x12]
        // Half-word at 0x28 = 0x5678, half-word at 0x2A = 0x1234
        let lo_half = bus.read_half(base + 0x28).expect("read lo half");
        let hi_half = bus.read_half(base + 0x2A).expect("read hi half");
        assert_eq!(lo_half, 0x5678);
        assert_eq!(hi_half, 0x1234);

        // Byte reads
        let b0 = bus.read_byte(base + 0x28).expect("read byte 0");
        let b1 = bus.read_byte(base + 0x29).expect("read byte 1");
        assert_eq!(b0, 0x78);
        assert_eq!(b1, 0x56);
    }

    #[test]
    fn bus_virtio_net_does_not_overlap_virtio_blk() {
        let mut bus = Bus::new(0x8000_0000, 4096);

        // VirtIO-blk is at 0x1000_1000, virtio-net at 0x1000_2000
        let blk_magic = bus.read_word(0x1000_1000).expect("blk magic");
        assert_eq!(blk_magic, 0x7472_6976); // same magic

        let net_magic = bus.read_word(0x1000_2000).expect("net magic");
        assert_eq!(net_magic, 0x7472_6976);

        // Device IDs differ
        let blk_id = bus.read_word(0x1000_1000 + 8).expect("blk dev_id");
        let net_id = bus.read_word(0x1000_2000 + 8).expect("net dev_id");
        assert_eq!(net_id, 1); // network
    }

    // ============================================================
    // Phase 348: UART bus routing tests
    // ============================================================

    #[test]
    fn bus_uart_read_write_lcr() {
        // UART_BASE = 0x10000000, LCR at offset 3
        let mut bus = Bus::new(0x8000_0000, 4096);
        let uart_lcr_addr = 0x1000_0000 + 3; // LCR offset

        // Write 0x03 to LCR (8 data bits, 1 stop bit, no parity)
        bus.write_word(uart_lcr_addr, 0x03)
            .expect("UART LCR write should succeed");

        // Read back via word read
        let val = bus.read_word(uart_lcr_addr).expect("UART LCR read");
        // LCR is at byte offset 3, word read packs 4 bytes starting from offset
        // The LCR byte should be in the lowest byte of the word
        assert!(val & 0xFF == 0x03 || val == 0x03);
    }

    #[test]
    fn bus_uart_tx_rx_roundtrip() {
        // Test TX and RX separately — UART does NOT echo TX to RX.
        let mut bus = Bus::new(0x8000_0000, 4096);

        // TX: write character 'A' (0x41) to THR, verify it lands in tx_buf
        bus.write_word(0x1000_0000, 0x41).expect("UART THR write");
        let tx = bus.uart.drain_tx();
        assert_eq!(tx, vec![0x41], "TX should contain 'A'");

        // RX: inject 'A' via receive_byte, then read from RBR
        bus.uart.receive_byte(0x41);
        let val = bus.read_word(0x1000_0000).expect("UART RBR read");
        assert_eq!(val & 0xFF, 0x41, "RX should return 'A' in low byte");
    }

    #[test]
    fn bus_uart_lsr_read() {
        // LSR at offset 5 should have THRE bit set (TX holding register empty)
        let mut bus = Bus::new(0x8000_0000, 4096);
        let lsr_addr = 0x1000_0000 + 5;
        let val = bus.read_word(lsr_addr).expect("LSR read");
        // LSR bit 5 (THRE) should be set on a fresh UART
        assert!(val & 0x20 != 0 || val == 0x20);
    }

    #[test]
    fn bus_uart_address_range() {
        // Verify UART addresses are within range but adjacent addresses are not
        let mut bus = Bus::new(0x8000_0000, 4096);
        // UART_BASE + 0 should work
        assert!(bus.read_word(0x1000_0000).is_ok());
        // Just past UART_SIZE (8 bytes) should not be UART
        // 0x1000_0008 is past UART range, may hit another device or error
        // The important thing is that 0x1000_0000..=0x1000_0007 is UART
        assert!(uart::Uart::contains(0x1000_0000));
        assert!(uart::Uart::contains(0x1000_0007));
        assert!(!uart::Uart::contains(0x1000_0008));
    }

    // ============================================================
    // Phase 348: PLIC bus routing tests
    // ============================================================

    #[test]
    fn bus_plic_priority_read_write() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        let priority_addr = 0x0C00_0000 + 4; // Source 1 priority

        // Write priority 7 for source 1
        bus.write_word(priority_addr, 7)
            .expect("PLIC priority write");

        let val = bus.read_word(priority_addr).expect("PLIC priority read");
        assert_eq!(val, 7);
    }

    #[test]
    fn bus_plic_pending_read() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        let pending_addr = 0x0C00_1000;

        // No interrupts pending initially
        let val = bus.read_word(pending_addr).expect("PLIC pending read");
        assert_eq!(val, 0);
    }

    #[test]
    fn bus_plic_enable_read_write() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        let enable_addr = 0x0C00_2000;

        // Enable all interrupts for context 0
        bus.write_word(enable_addr, 0xFFFF)
            .expect("PLIC enable write");

        let val = bus.read_word(enable_addr).expect("PLIC enable read");
        assert_eq!(val, 0xFFFF);
    }

    #[test]
    fn bus_plic_address_range() {
        // Verify PLIC address containment
        assert!(plic::Plic::contains(0x0C00_0000));
        assert!(plic::Plic::contains(0x0C00_0004));
        assert!(plic::Plic::contains(0x0C00_1000)); // pending
        assert!(plic::Plic::contains(0x0C00_2000)); // enable
        assert!(!plic::Plic::contains(0x0C00_0000 - 4)); // below
        assert!(!plic::Plic::contains(0x0C20_0000)); // above
    }

    #[test]
    fn bus_plic_does_not_overlap_clint() {
        // CLINT is at 0x02000000, PLIC at 0x0C000000
        assert!(uart::Uart::contains(0x1000_0000));
        assert!(plic::Plic::contains(0x0C00_0000));
        // These should not overlap
        assert!(!plic::Plic::contains(0x1000_0000)); // UART addr not in PLIC
        assert!(!uart::Uart::contains(0x0C00_0000)); // PLIC addr not in UART
    }

    #[test]
    fn bus_virtio_blk_read_magic() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        let magic = bus.read_word(0x1000_1000).expect("virtio-blk magic");
        assert_eq!(magic, 0x7472_6976); // "vtrd"
    }

    #[test]
    fn bus_virtio_blk_device_id() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        let dev_id = bus.read_word(0x1000_1000 + 8).expect("virtio-blk dev_id");
        assert_eq!(dev_id, 2); // VirtIO block device
    }

    // ============================================================
    // Phase 348: VirtIO-GPU bus routing tests
    // ============================================================

    #[test]
    fn bus_virtio_gpu_read_magic_and_device_id() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        let gpu_base = super::super::virtio_gpu::VIRTIO_GPU_BASE;

        // Magic register at offset 0x00
        let magic = bus.read_word(gpu_base).expect("virtio-gpu magic");
        assert_eq!(magic, 0x7472_6976); // "vtrd"

        // Device ID at offset 0x08 = 16 (GPU)
        let dev_id = bus.read_word(gpu_base + 8).expect("virtio-gpu dev_id");
        assert_eq!(dev_id, 16);
    }

    #[test]
    fn bus_virtio_gpu_read_write_status() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        let gpu_base = super::super::virtio_gpu::VIRTIO_GPU_BASE;

        // STATUS at offset 0x70 (VirtIO MMIO spec) — write 0 (reset), then read back
        bus.write_word(gpu_base + 0x70, 0)
            .expect("virtio-gpu status write");
        let status = bus
            .read_word(gpu_base + 0x70)
            .expect("virtio-gpu status read");
        assert_eq!(status, 0, "status should be 0 after reset");

        // Write ACKNOWLEDGE (1)
        bus.write_word(gpu_base + 0x70, 1)
            .expect("virtio-gpu status write");
        let status = bus
            .read_word(gpu_base + 0x70)
            .expect("virtio-gpu status read");
        assert_eq!(status, 1);
    }

    #[test]
    fn bus_virtio_gpu_queue_num_max() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        let gpu_base = super::super::virtio_gpu::VIRTIO_GPU_BASE;

        // QUEUE_NUM_MAX at offset 0x34 (VirtIO MMIO spec)
        let max = bus
            .read_word(gpu_base + 0x34)
            .expect("virtio-gpu queue_num_max");
        assert_eq!(max, 64);
    }

    #[test]
    fn bus_virtio_gpu_address_range() {
        // Verify VirtIO-GPU address containment
        assert!(super::super::virtio_gpu::VirtioGpu::contains(0x1000_3000));
        assert!(super::super::virtio_gpu::VirtioGpu::contains(0x1000_3FFF));
        assert!(!super::super::virtio_gpu::VirtioGpu::contains(0x1000_2FFF)); // below
        assert!(!super::super::virtio_gpu::VirtioGpu::contains(0x1000_4000)); // above
    }

    #[test]
    fn bus_virtio_gpu_does_not_overlap_virtio_blk() {
        // VirtIO-blk at 0x1000_1000, virtio-gpu at 0x1000_3000
        assert!(super::super::virtio_gpu::VirtioGpu::contains(0x1000_3000));
        assert!(!super::super::virtio_gpu::VirtioGpu::contains(0x1000_1000)); // blk addr
        assert!(!super::super::virtio_blk::VirtioBlk::contains(0x1000_3000)); // gpu addr
    }

    #[test]
    fn bus_virtio_gpu_read_write_half_byte_routing() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        let gpu_base = super::super::virtio_gpu::VIRTIO_GPU_BASE;

        // Write a full word to STATUS (offset 0x70), read back as half-word
        bus.write_word(gpu_base + 0x70, 0x1234_5678)
            .expect("write status word");
        // LE: word 0x12345678 stored as bytes [0x78, 0x56, 0x34, 0x12]
        let lo_half = bus.read_half(gpu_base + 0x70).expect("read lo half");
        let hi_half = bus.read_half(gpu_base + 0x72).expect("read hi half");
        assert_eq!(lo_half, 0x5678);
        assert_eq!(hi_half, 0x1234);

        // Byte reads
        let b0 = bus.read_byte(gpu_base + 0x70).expect("read byte 0");
        let b1 = bus.read_byte(gpu_base + 0x71).expect("read byte 1");
        assert_eq!(b0, 0x78);
        assert_eq!(b1, 0x56);
    }

    #[test]
    fn bus_virtio_gpu_interrupt_status() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        let gpu_base = super::super::virtio_gpu::VIRTIO_GPU_BASE;

        // INTERRUPT_STATUS at offset 0x60 (VirtIO MMIO spec) — initially 0
        let int_status = bus
            .read_word(gpu_base + 0x60)
            .expect("virtio-gpu interrupt_status");
        assert_eq!(int_status, 0);
    }
    // ============================================================
    // Phase 348: Additional bus routing edge cases
    // ============================================================

    #[test]
    fn bus_clint_read_write_byte() {
        // Byte-level routing to CLINT MTIMECMP
        let mut bus = Bus::new(0x8000_0000, 4096);
        let mtimecmp_lo = clint::MTIMECMP_BASE;

        // Write byte 0xFF to MTIMECMP_LO
        bus.write_byte(mtimecmp_lo, 0xFF).expect("CLINT byte write");
        let val = bus.read_byte(mtimecmp_lo).expect("CLINT byte read");
        assert_eq!(val, 0xFF);

        // Verify word read is consistent (LE: byte 0 in LSB)
        let word = bus.read_word(mtimecmp_lo).expect("CLINT word read");
        assert_eq!(word & 0xFF, 0xFF);
    }

    #[test]
    fn bus_clint_read_write_half() {
        // Half-word routing to CLINT MSIP
        let mut bus = Bus::new(0x8000_0000, 4096);

        bus.write_half(clint::MSIP_BASE, 1)
            .expect("CLINT half write");
        let val = bus.read_half(clint::MSIP_BASE).expect("CLINT half read");
        assert_eq!(val, 1);
        assert!(bus.clint.software_pending());
    }

    #[test]
    fn bus_uart_read_write_byte() {
        // Byte-level UART routing
        let mut bus = Bus::new(0x8000_0000, 4096);

        // Write byte to THR (offset 0)
        bus.write_byte(0x1000_0000, 0x42).expect("UART byte write");
        let tx = bus.uart.drain_tx();
        assert_eq!(tx, vec![0x42], "TX should contain 'B'");

        // Read byte from LSR (offset 5)
        let lsr = bus.read_byte(0x1000_0005).expect("UART byte read LSR");
        assert!(lsr & 0x20 != 0, "THRE bit should be set");
    }

    #[test]
    fn bus_plic_read_write_byte() {
        // Byte-level PLIC routing to priority register
        let mut bus = Bus::new(0x8000_0000, 4096);
        let priority_addr = 0x0C00_0004; // Source 1 priority

        bus.write_byte(priority_addr, 5).expect("PLIC byte write");
        let val = bus.read_byte(priority_addr).expect("PLIC byte read");
        assert_eq!(val, 5);
    }

    #[test]
    fn bus_multiple_device_isolation() {
        // Verify that writing to one device doesn't affect another
        let mut bus = Bus::new(0x8000_0000, 4096);

        // Write to UART
        bus.write_word(0x1000_0000, 0x41).expect("UART write");
        // Write to VirtIO-blk status (offset 0x28 per VirtIO MMIO spec)
        bus.write_word(0x1000_1000 + 0x28, 15)
            .expect("blk status write");
        // Write to PLIC priority
        bus.write_word(0x0C00_0004, 3).expect("PLIC priority write");

        // Read back each — they should be independent
        let blk_status = bus.read_word(0x1000_1000 + 0x28).expect("blk status read");
        assert_eq!(blk_status, 15);

        let plic_priority = bus.read_word(0x0C00_0004).expect("PLIC priority read");
        assert_eq!(plic_priority, 3);

        // UART TX should still have the byte
        let tx = bus.uart.drain_tx();
        assert_eq!(tx, vec![0x41]);
    }

    #[test]
    fn bus_ram_alignment_word_read() {
        // Verify word reads are properly aligned
        let mut bus = Bus::new(0x8000_0000, 4096);

        // Write two adjacent words
        bus.write_word(0x8000_0000, 0xAAAA_BBBB).unwrap();
        bus.write_word(0x8000_0004, 0xCCCC_DDDD).unwrap();

        // Verify they don't overlap
        assert_eq!(bus.read_word(0x8000_0000).unwrap(), 0xAAAA_BBBB);
        assert_eq!(bus.read_word(0x8000_0004).unwrap(), 0xCCCC_DDDD);
    }

    #[test]
    fn bus_ram_boundary_last_word() {
        // Write to the very last word of RAM
        let mut bus = Bus::new(0, 4096); // RAM at 0x0, 4KB

        let last_addr = 4092; // 4096 - 4
        bus.write_word(last_addr as u64, 0xDEAD).unwrap();
        assert_eq!(bus.read_word(last_addr as u64).unwrap(), 0xDEAD);

        // One past the end should fail
        assert!(bus.read_word(4096).is_err());
    }

    // ── Framebuffer routing tests ──

    #[test]
    fn bus_framebuf_pixel_write_read() {
        // Write a pixel to the framebuffer and read it back
        let mut bus = Bus::new(0x8000_0000, 4096);
        let fb_addr = super::super::framebuf::FB_BASE; // 0x6000_0000

        bus.write_word(fb_addr, 0xFF00FF00).unwrap();
        assert_eq!(bus.read_word(fb_addr).unwrap(), 0xFF00FF00);
    }

    #[test]
    fn bus_framebuf_control_write_read() {
        // Write to the framebuffer control register (after pixel buffer)
        let mut bus = Bus::new(0x8000_0000, 4096);
        let ctrl_addr = super::super::framebuf::FB_CONTROL_ADDR;

        bus.write_word(ctrl_addr, 1).unwrap();
        assert_eq!(bus.read_word(ctrl_addr).unwrap(), 1);
    }

    #[test]
    fn bus_framebuf_clip_write_read() {
        // Write to the framebuffer clip register
        let mut bus = Bus::new(0x8000_0000, 4096);
        let clip_addr = super::super::framebuf::FB_CLIP_ADDR;

        bus.write_word(clip_addr, 0x00FF00FF).unwrap();
        assert_eq!(bus.read_word(clip_addr).unwrap(), 0x00FF00FF);
    }

    #[test]
    fn bus_framebuf_multiple_pixels() {
        // Write and read multiple pixels across the framebuffer
        let mut bus = Bus::new(0x8000_0000, 4096);
        let fb_base = super::super::framebuf::FB_BASE;

        // Write three consecutive pixels (each is one u32 word)
        bus.write_word(fb_base, 0xFF0000FF).unwrap(); // pixel 0: blue
        bus.write_word(fb_base + 4, 0xFF00FF00).unwrap(); // pixel 1: green
        bus.write_word(fb_base + 8, 0xFFFF0000).unwrap(); // pixel 2: red

        assert_eq!(bus.read_word(fb_base).unwrap(), 0xFF0000FF);
        assert_eq!(bus.read_word(fb_base + 4).unwrap(), 0xFF00FF00);
        assert_eq!(bus.read_word(fb_base + 8).unwrap(), 0xFFFF0000);
    }

    #[test]
    fn bus_framebuf_does_not_overlap_vfs() {
        // Ensure framebuffer writes don't leak into VFS surface region
        let mut bus = Bus::new(0x8000_0000, 4096);

        // Write to last pixel of framebuffer
        let fb_last =
            super::super::framebuf::FB_BASE + super::super::framebuf::FB_PIXEL_SIZE as u64 - 4;
        bus.write_word(fb_last, 0xAAAAAAAA).unwrap();
        assert_eq!(bus.read_word(fb_last).unwrap(), 0xAAAAAAAA);

        // VFS surface starts at 0x7000_0000, well above framebuffer
        let vfs_first = super::super::vfs_surface::VFS_SURFACE_BASE;
        // Reading from VFS should return 0 (uninitialized), not our framebuffer value
        assert_ne!(bus.read_word(vfs_first).unwrap(), 0xAAAAAAAA);
    }

    // ── VFS Surface routing tests ──

    #[test]
    fn bus_vfs_surface_pixel_write_read() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        let vfs_base = super::super::vfs_surface::VFS_SURFACE_BASE; // 0x7000_0000

        bus.write_word(vfs_base, 0x12345678).unwrap();
        assert_eq!(bus.read_word(vfs_base).unwrap(), 0x12345678);
    }

    #[test]
    fn bus_vfs_surface_control_write_read() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        let ctrl_addr = super::super::vfs_surface::VFS_CONTROL_ADDR;

        // Control register is write-only (flush trigger); write should succeed
        bus.write_word(ctrl_addr, 1).unwrap();
        // Read returns 0 (no status bits defined)
        assert_eq!(bus.read_word(ctrl_addr).unwrap(), 0);
    }

    #[test]
    fn bus_vfs_surface_multiple_pixels() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        let vfs_base = super::super::vfs_surface::VFS_SURFACE_BASE;

        bus.write_word(vfs_base + 0, 0xAA).unwrap();
        bus.write_word(vfs_base + 4, 0xBB).unwrap();
        bus.write_word(vfs_base + 8, 0xCC).unwrap();

        assert_eq!(bus.read_word(vfs_base + 0).unwrap(), 0xAA);
        assert_eq!(bus.read_word(vfs_base + 4).unwrap(), 0xBB);
        assert_eq!(bus.read_word(vfs_base + 8).unwrap(), 0xCC);
    }

    #[test]
    fn bus_vfs_surface_byte_routing() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        let vfs_base = super::super::vfs_surface::VFS_SURFACE_BASE;

        // Write a word, then read individual bytes
        bus.write_word(vfs_base, 0xAABBCCDD).unwrap();
        assert_eq!(bus.read_byte(vfs_base).unwrap(), 0xDD); // little-endian byte 0
        assert_eq!(bus.read_byte(vfs_base + 1).unwrap(), 0xCC);
        assert_eq!(bus.read_byte(vfs_base + 2).unwrap(), 0xBB);
        assert_eq!(bus.read_byte(vfs_base + 3).unwrap(), 0xAA);
    }

    // ── Protected address tests ──

    #[test]
    fn bus_protected_addr_blocks_write() {
        let mut bus = Bus::new(0, 4096);
        let pa = 0x100u64;
        let protected_val = 0xCAFEBABEu32;

        bus.protected_addrs.push((pa, protected_val));

        // Write should be silently dropped
        bus.write_word(pa, 0xDEADBEEF).unwrap();

        // Read should return the protected value, not the written value
        assert_eq!(bus.read_word(pa).unwrap(), protected_val);
    }

    #[test]
    fn bus_protected_addr_byte_read() {
        let mut bus = Bus::new(0, 4096);
        let pa = 0x200u64;
        let protected_val = 0x12345678u32;

        bus.protected_addrs.push((pa, protected_val));

        // Byte reads should extract from the protected word value
        assert_eq!(bus.read_byte(pa).unwrap(), 0x78); // byte 0
        assert_eq!(bus.read_byte(pa + 1).unwrap(), 0x56); // byte 1
        assert_eq!(bus.read_byte(pa + 2).unwrap(), 0x34); // byte 2
        assert_eq!(bus.read_byte(pa + 3).unwrap(), 0x12); // byte 3
    }

    #[test]
    fn bus_protected_addr_no_effect_on_other_addrs() {
        let mut bus = Bus::new(0, 4096);
        bus.protected_addrs.push((0x100, 0xBEEF));

        // Other addresses should work normally
        bus.write_word(0x200, 0xAAAA).unwrap();
        assert_eq!(bus.read_word(0x200).unwrap(), 0xAAAA);
    }

    #[test]
    fn bus_protected_addr_halfword_read() {
        let mut bus = Bus::new(0, 4096);
        let pa = 0x300u64;
        let protected_val = 0xAABBCCDDu32;

        bus.protected_addrs.push((pa, protected_val));

        // Halfword reads
        assert_eq!(bus.read_half(pa).unwrap(), 0xCCDD); // low half
        assert_eq!(bus.read_half(pa + 2).unwrap(), 0xAABB); // high half
    }

    #[test]
    fn bus_protected_addr_halfword_write_dropped() {
        let mut bus = Bus::new(0, 4096);
        let pa = 0x400u64;
        let protected_val = 0x11111111u32;

        bus.protected_addrs.push((pa, protected_val));

        // Halfword write should be dropped
        bus.write_half(pa, 0xFFFF).unwrap();
        assert_eq!(bus.read_word(pa).unwrap(), protected_val);
    }

    #[test]
    fn bus_protected_addr_byte_write_dropped() {
        let mut bus = Bus::new(0, 4096);
        let pa = 0x500u64;
        let protected_val = 0x22222222u32;

        bus.protected_addrs.push((pa, protected_val));

        // Byte write should be dropped
        bus.write_byte(pa, 0xFF).unwrap();
        assert_eq!(bus.read_word(pa).unwrap(), protected_val);
    }

    #[test]
    fn bus_protected_addr_multiple_entries() {
        let mut bus = Bus::new(0, 4096);
        bus.protected_addrs.push((0x100, 0xAAAA));
        bus.protected_addrs.push((0x200, 0xBBBB));

        // Both protected addresses should return their values
        assert_eq!(bus.read_word(0x100).unwrap(), 0xAAAA);
        assert_eq!(bus.read_word(0x200).unwrap(), 0xBBBB);

        // And block writes
        bus.write_word(0x100, 0x1111).unwrap();
        bus.write_word(0x200, 0x2222).unwrap();
        assert_eq!(bus.read_word(0x100).unwrap(), 0xAAAA);
        assert_eq!(bus.read_word(0x200).unwrap(), 0xBBBB);
    }

    // ── Value watchpoint tests ──

    #[test]
    fn bus_value_watch_triggers_on_match() {
        let mut bus = Bus::new(0, 4096);
        bus.add_watch_addr(0x100);

        // Write to the watched address
        bus.write_word(0x100, 0xDEADBEEF).unwrap();

        // Should have recorded the hit
        assert_eq!(bus.value_watches[0].hits, 1);
        assert_eq!(bus.value_watches[0].log.len(), 1);
        assert_eq!(bus.value_watches[0].log[0].val, 0xDEADBEEF);
        assert_eq!(bus.value_watches[0].log[0].addr, 0x100);
    }

    #[test]
    fn bus_value_watch_no_trigger_on_miss() {
        let mut bus = Bus::new(0, 4096);
        bus.add_watch_addr(0x100);

        // Write to a different address
        bus.write_word(0x200, 0xBEEF).unwrap();

        assert_eq!(bus.value_watches[0].hits, 0);
        assert_eq!(bus.value_watches[0].log.len(), 0);
    }

    #[test]
    fn bus_value_watch_value_filter() {
        let mut bus = Bus::new(0, 4096);
        let mut w = ValueWatch::new_value(0x100, 0x104, 0xCAFE);
        w.verbose = false; // silence for test
        bus.value_watches.push(w);

        // Write a different value — should not trigger
        bus.write_word(0x100, 0xBEEF).unwrap();
        assert_eq!(bus.value_watches[0].hits, 0);

        // Write the matching value — should trigger
        bus.write_word(0x100, 0xCAFE).unwrap();
        assert_eq!(bus.value_watches[0].hits, 1);
        assert_eq!(bus.value_watches[0].log[0].val, 0xCAFE);
    }

    #[test]
    fn bus_value_watch_ring_buffer() {
        let mut bus = Bus::new(0, 4096);
        let mut w = ValueWatch::new(0x100, 0x104);
        w.verbose = false; // silence for test
        w.max_log = 3;
        bus.value_watches.push(w);

        // Write 5 times — only last 3 should be in log
        for i in 0..5u32 {
            bus.write_word(0x100, i).unwrap();
        }

        assert_eq!(bus.value_watches[0].hits, 5);
        assert_eq!(bus.value_watches[0].log.len(), 3);
        // Should have the last 3 values: 2, 3, 4
        assert_eq!(bus.value_watches[0].log[0].val, 2);
        assert_eq!(bus.value_watches[0].log[1].val, 3);
        assert_eq!(bus.value_watches[0].log[2].val, 4);
    }

    #[test]
    fn bus_value_watch_range() {
        let mut bus = Bus::new(0, 4096);
        let mut w = ValueWatch::new(0x100, 0x200);
        w.verbose = false;
        bus.value_watches.push(w);

        // Write inside range
        bus.write_word(0x150, 0xAAAA).unwrap();
        assert_eq!(bus.value_watches[0].hits, 1);

        // Write at boundary (start=0x100)
        bus.write_word(0x100, 0xBBBB).unwrap();
        assert_eq!(bus.value_watches[0].hits, 2);

        // Write at boundary (end=0x200, exclusive)
        bus.write_word(0x200, 0xCCCC).unwrap();
        assert_eq!(bus.value_watches[0].hits, 2); // should NOT trigger

        // Write outside range
        bus.write_word(0x300, 0xDDDD).unwrap();
        assert_eq!(bus.value_watches[0].hits, 2);
    }

    #[test]
    fn bus_value_watch_clear() {
        let mut bus = Bus::new(0, 4096);
        bus.add_watch_addr(0x100);
        bus.add_watch_addr(0x200);
        assert_eq!(bus.value_watches.len(), 2);

        bus.clear_watches();
        assert_eq!(bus.value_watches.len(), 0);
    }

    #[test]
    fn bus_value_watch_summary() {
        let mut bus = Bus::new(0, 4096);
        bus.add_watch_addr(0x100);
        bus.write_word(0x100, 0xCAFE).unwrap();

        let summary = bus.watch_summary();
        assert!(summary.contains("hits=1"));
        assert!(summary.contains("PA 0x00000100"));
    }

    #[test]
    fn bus_value_watch_records_pc() {
        let mut bus = Bus::new(0, 4096);
        let mut w = ValueWatch::new(0x100, 0x104);
        w.verbose = false;
        bus.value_watches.push(w);
        bus.current_pc = 0xC0001234;

        bus.write_word(0x100, 0xCAFE).unwrap();

        assert_eq!(bus.value_watches[0].hits, 1);
        assert_eq!(bus.value_watches[0].log[0].pc, 0xC0001234);
    }

    #[test]
    fn bus_value_watch_fast_path_empty() {
        let mut bus = Bus::new(0, 4096);
        // No watches — fast path should skip
        bus.write_word(0x100, 0xDEAD).unwrap();
        // Nothing to assert — just shouldn't crash
    }

    // ── Low address behavior tests ──

    #[test]
    fn bus_low_addr_returns_zero_on_read() {
        // Addresses below ram_base should return 0
        let mut bus = Bus::new(0x8000_0000, 4096);
        bus.low_addr_identity_map = true;

        assert_eq!(bus.read_word(0x0000_0000).unwrap(), 0);
        assert_eq!(bus.read_word(0x0000_1000).unwrap(), 0);
        assert_eq!(bus.read_word(0x0FFF_FFFC).unwrap(), 0);
    }

    #[test]
    fn bus_low_addr_accepts_writes_silently() {
        // Writes below ram_base should succeed silently
        let mut bus = Bus::new(0x8000_0000, 4096);
        bus.low_addr_identity_map = true;

        assert!(bus.write_word(0x0000_0000, 0xDEAD).is_ok());
        assert!(bus.write_word(0x0000_1000, 0xBEEF).is_ok());
    }

    #[test]
    fn bus_low_addr_writes_do_not_persist() {
        // Writes below ram_base are silently accepted but data is lost
        let mut bus = Bus::new(0x8000_0000, 4096);
        bus.low_addr_identity_map = true;

        bus.write_word(0x0000_0000, 0xDEADBEEF).unwrap();
        // Reading back should still return 0
        assert_eq!(bus.read_word(0x0000_0000).unwrap(), 0);
    }

    #[test]
    fn bus_low_addr_byte_read_returns_zero() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        bus.low_addr_identity_map = true;
        assert_eq!(bus.read_byte(0x0000_0000).unwrap(), 0);
        assert_eq!(bus.read_byte(0x0000_0001).unwrap(), 0);
    }

    #[test]
    fn bus_low_addr_half_read_returns_zero() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        bus.low_addr_identity_map = true;
        assert_eq!(bus.read_half(0x0000_0000).unwrap(), 0);
    }

    #[test]
    fn bus_unmapped_high_addr_fails() {
        // Addresses above RAM and all devices should fail
        let mut bus = Bus::new(0x8000_0000, 4096);

        // 0x8000_1000 is past the 4KB RAM
        assert!(bus.read_word(0x8000_1000).is_err());
    }

    #[test]
    fn bus_unmapped_high_addr_write_fails() {
        let mut bus = Bus::new(0x8000_0000, 4096);
        assert!(bus.write_word(0x8000_1000, 0xBEEF).is_err());
    }

    // ── Memblock write log tests ──

    #[test]
    fn bus_memblock_write_log_records() {
        let mut bus = Bus::new(0, 64 * 1024 * 1024);
        bus.current_pc = 0xC0001000;

        // Write to the memblock region (0x0080348C - 0x00803A8C)
        bus.write_word(0x0080348C, 0x12345678).unwrap();

        assert_eq!(bus.memblock_write_log.len(), 1);
        let (encoded_addr, val) = bus.memblock_write_log[0];
        // PC is encoded in upper 32 bits
        let recorded_pc = (encoded_addr >> 32) as u32;
        let recorded_addr = encoded_addr & 0xFFFFFFFF;
        assert_eq!(recorded_pc, 0xC0001000);
        assert_eq!(recorded_addr, 0x0080348C);
        assert_eq!(val, 0x12345678);
    }

    #[test]
    fn bus_memblock_write_log_capped_at_100() {
        let mut bus = Bus::new(0, 64 * 1024 * 1024);
        bus.current_pc = 0;

        // Write 101 times to the memblock region
        for i in 0..101 {
            bus.write_word(0x0080348C, i).unwrap();
        }

        // Should be capped at 100 entries
        assert_eq!(bus.memblock_write_log.len(), 100);
    }

    #[test]
    fn bus_memblock_write_log_ignores_outside_range() {
        let mut bus = Bus::new(0, 64 * 1024 * 1024);
        bus.current_pc = 0xC0001000;

        // Write outside the memblock range
        bus.write_word(0x00803000, 0xDEAD).unwrap();
        assert!(bus.memblock_write_log.is_empty());
    }

    // ── RAM priority over low-addr fallback ──

    #[test]
    fn bus_ram_base_zero_reads_persist() {
        // When ram_base=0, writes to low addresses persist in RAM
        let mut bus = Bus::new(0, 4096);

        bus.write_word(0x100, 0xCAFEBABE).unwrap();
        assert_eq!(bus.read_word(0x100).unwrap(), 0xCAFEBABE);
    }

    #[test]
    fn bus_ram_base_zero_byte_persistence() {
        let mut bus = Bus::new(0, 4096);

        bus.write_byte(0x100, 0xAB).unwrap();
        assert_eq!(bus.read_byte(0x100).unwrap(), 0xAB);
    }

    #[test]
    fn bus_ram_base_zero_half_persistence() {
        let mut bus = Bus::new(0, 4096);

        bus.write_half(0x100, 0xABCD).unwrap();
        assert_eq!(bus.read_half(0x100).unwrap(), 0xABCD);
    }
}
