// riscv/sbi.rs -- Supervisor Binary Interface (SBI) emulation (Phase 35)
//
// Emulates the RISC-V SBI for the guest kernel.

use super::uart::Uart;

/// SBI error codes.
pub const SBI_SUCCESS: i32 = 0;
pub const SBI_ERR_NOT_SUPPORTED: i32 = -1;
pub const SBI_ERR_INVALID_PARAM: i32 = -3;
pub const SBI_ERR_DENIED: i32 = -4;
pub const SBI_ERR_INVALID_ADDRESS: i32 = -5;
pub const SBI_ERR_ALREADY_AVAILABLE: i32 = -6;
pub const SBI_ERR_ALREADY_STARTED: i32 = -7;
pub const SBI_ERR_ALREADY_STOPPED: i32 = -8;
pub const SBI_ERR_NO_SHMEM: i32 = -9;
pub const SBI_ERR_FAILURE: i32 = -2;

/// SBI Extension IDs.
pub const SBI_EXT_BASE: u32 = 0x10;
pub const SBI_EXT_TIME: u32 = 0x54494D45;
pub const SBI_EXT_IPI: u32 = 0x735049;
pub const SBI_EXT_RFENCE: u32 = 0x52464E43;
pub const SBI_EXT_HSM: u32 = 0x48534D;
pub const SBI_EXT_SRST: u32 = 0x53525354;
pub const SBI_EXT_PMU: u32 = 0x504D55;
pub const SBI_EXT_DBCN: u32 = 0x4442434E;
pub const SBI_EXT_SUSP: u32 = 0x53555350;
pub const SBI_EXT_CPPC: u32 = 0x43505043;
pub const SBI_EXT_NACL: u32 = 0x4E41434C;
pub const SBI_EXT_STA: u32 = 0x535441;

/// Geometry OS custom SBI extensions.
pub const SBI_EXT_GEOMETRY: u32 = 0x47454F4D; // "GEOM"
pub const SBI_EXT_NET: u32 = 0x4E455400; // "NET"
pub const SBI_EXT_JIT_DRIVER: u32 = 0x4A495400; // "JIT\0" -- JIT driver synthesis

/// SBI Base Extension function IDs.
pub const SBI_BASE_GET_SPEC_VERSION: u32 = 0;
pub const SBI_BASE_GET_IMPL_ID: u32 = 1;
pub const SBI_BASE_GET_IMPL_VERSION: u32 = 2;
pub const SBI_BASE_PROBE_EXTENSION: u32 = 3;
pub const SBI_BASE_GET_MVENDORID: u32 = 4;
pub const SBI_BASE_GET_MARCHID: u32 = 5;
pub const SBI_BASE_GET_MIMPID: u32 = 6;

/// SBI legacy Console extension (v0.1).
pub const SBI_CONSOLE_PUTCHAR: u32 = 0x01;
pub const SBI_CONSOLE_GETCHAR: u32 = 0x02;

/// SBI DBCN extension functions.
pub const SBI_DBCN_CONSOLE_WRITE: u32 = 0;
pub const SBI_DBCN_CONSOLE_READ: u32 = 1;
pub const SBI_DBCN_CONSOLE_WRITE_BYTE: u32 = 2;

/// SBI SRST extension functions.
pub const SBI_SRST_SYSTEM_RESET: u32 = 0;

/// SBI HSM extension functions.
pub const SBI_HSM_HART_START: u32 = 0;
pub const SBI_HSM_HART_STOP: u32 = 1;
pub const SBI_HSM_HART_GET_STATUS: u32 = 2;
pub const SBI_HSM_HART_SUSPEND: u32 = 3;

/// GEOMETRY extension functions.
pub const SBI_GEOM_GET_FRAMEBUFFER: u32 = 0;
pub const SBI_GEOM_FLUSH_FRAMEBUFFER: u32 = 1;
pub const SBI_GEOM_PUT_PIXEL: u32 = 2;
pub const SBI_GEOM_FILL_RECT: u32 = 3;
pub const SBI_GEOM_DRAW_LINE: u32 = 4;
pub const SBI_GEOM_GET_SCREEN_SIZE: u32 = 5;
pub const SBI_GEOM_DRAW_GLYPH: u32 = 6;
pub const SBI_GEOM_SET_CLIP: u32 = 7;
pub const SBI_GEOM_DRAW_SPRITE: u32 = 8;
pub const SBI_GEOM_GET_KEY: u32 = 9;
pub const SBI_GEOM_GET_MOUSE: u32 = 10;
pub const SBI_GEOM_SET_PALETTE: u32 = 11;
pub const SBI_GEOM_VFS_READ: u32 = 12;
pub const SBI_GEOM_SET_TIMER: u32 = 13;
pub const SBI_GEOM_SPAWN: u32 = 14;
pub const SBI_GEOM_KILL: u32 = 15;
pub const SBI_GEOM_YIELD: u32 = 16;
pub const SBI_GEOM_YIELD_TO: u32 = 17;
pub const SBI_GEOM_GPU_COMPUTE: u32 = 18;

/// JIT Driver Synthesis function IDs.
pub const SBI_JIT_REQUEST: u32 = 0; // Request driver synthesis: a0=device_type, a1=mmio_base
pub const SBI_JIT_STATUS: u32 = 1; // Poll synthesis status
pub const SBI_JIT_PROBE_REPORT: u32 = 2; // Specless: a0=mmio_base, a1=magic, a2=signature_lo, a3=signature_hi

/// Device types for JIT driver requests.
pub const JIT_DEV_UART: u32 = 0;
pub const JIT_DEV_FRAMEBUFFER: u32 = 1;
pub const JIT_DEV_VIRTIO_BLK: u32 = 2;
pub const JIT_DEV_VIRTIO_NET: u32 = 3;

/// Behavioral signature constants for specless inference.
/// magic = 0x74726976 => VirtIO device, signature distinguishes sub-type
/// magic = 0 and signature has THRE bits => UART
/// magic = high address range => Framebuffer
pub const VIRTIO_MAGIC: u32 = 0x74726976;
pub const UART_LSR_THRE: u32 = 0x60;

/// Guest RAM arena base where injected drivers are loaded.
/// Each device type gets a 16KB slot offset from this base.
pub const JIT_DRIVER_ARENA: u32 = 0x80080000;
pub const JIT_SLOT_SIZE: u32 = 0x4000; // 16KB per driver

/// ELF filenames for each device type (relative to examples/jit_drivers/).
pub const JIT_DRIVER_ELFS: &[&str] = &[
    "uart_driver.elf",        // JIT_DEV_UART
    "framebuffer_driver.elf", // JIT_DEV_FRAMEBUFFER
    "virtio_blk_driver.elf",  // JIT_DEV_VIRTIO_BLK
    "virtio_net_driver.elf",  // JIT_DEV_VIRTIO_NET
];

/// Return the arena load address for a given device type.
pub const fn jit_arena_for_device(device_type: u32) -> u32 {
    JIT_DRIVER_ARENA + (device_type * JIT_SLOT_SIZE)
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum NetOpKind {
    Send,
    Recv,
}

pub struct NetPendingOp {
    pub kind: NetOpKind,
    pub socket_id: usize,
    pub buf_addr: u64,
    pub len: usize,
}

pub struct ShmRegion {
    pub id: u32,
    pub data: Vec<u8>,
}

#[derive(Clone, Copy)]
pub struct GeoVfsReadReq {
    pub buf_addr: u64,
    pub path_addr: u64,
    pub len: usize,
    pub name_addr: u64,
    pub name_len: u32,
    pub buf_len: u32,
}

/// SBI Firmware Emulator.
pub struct Sbi {
    pub ecall_log: Vec<(u32, u32, u32)>,
    pub console_output: Vec<u8>,
    pub console_input: Vec<u8>,
    pub shutdown_requested: bool,
    pub timer_alarm: Option<u64>,
    pub dbcn_pending_write: Option<(u64, usize)>,
    pub dbcn_pending_read: Option<u8>,
    pub stimecmp_addr: Option<u64>,
    pub mac_addr: [u8; 6],
    pub net_rx_queue: Vec<Vec<u8>>,
    pub boot_mtime: u64,
    pub sta_shmem_pa: Option<u64>,
    pub geo_vfs_read_pending: Option<GeoVfsReadReq>,
    pub net_sockets: Vec<Option<std::net::TcpStream>>,
    pub net_pending: Option<NetPendingOp>,
    pub shm_regions: Vec<ShmRegion>,
    pub shm_pending_write: Option<(u32, u32, u64, usize)>, // shm_id, offset, src_addr, len
    pub shm_pending_read: Option<(u32, u32, u64, usize)>,  // shm_id, offset, dst_addr, len
    pub yield_requested: bool,
    pub yield_to_context: Option<u32>,
    pub spawn_requested: Option<(u32, u32)>,
    pub gpu_compute_requested: Option<(u64, u64, u32, u32, u64)>,
    /// JIT driver synthesis pending request: (device_type, mmio_base)
    pub jit_driver_pending: Option<(u32, u32)>,
    /// Specless probe report: (mmio_base, magic, signature_lo, signature_hi)
    pub jit_probe_pending: Option<(u32, u32, u32, u32)>,
    /// Global tracing flag (Phase 41/Phase 20-25 optimization).
    pub tracing_enabled: bool,
    /// Memory allocation pointer for geos-native MALLOC stubs (0x100).
    pub next_alloc_addr: u64,
    /// List of freed page addresses for Geos-native FREE stubs (0x101).
    pub free_pages: Vec<u64>,
}

impl Sbi {
    pub fn new() -> Self {
        Self {
            ecall_log: Vec::new(),
            console_output: Vec::new(),
            console_input: Vec::new(),
            shutdown_requested: false,
            timer_alarm: None,
            dbcn_pending_write: None,
            dbcn_pending_read: None,
            stimecmp_addr: None,
            mac_addr: [0xDE, 0xAD, 0xBE, 0xEF, 0x00, 0x01],
            net_rx_queue: Vec::new(),
            boot_mtime: 0,
            sta_shmem_pa: None,
            geo_vfs_read_pending: None,
            net_sockets: Vec::new(),
            net_pending: None,
            shm_regions: Vec::new(),
            shm_pending_write: None,
            shm_pending_read: None,
            yield_requested: false,
            yield_to_context: None,
            spawn_requested: None,
            gpu_compute_requested: None,
            jit_driver_pending: None,
            jit_probe_pending: None,
            tracing_enabled: false,
            next_alloc_addr: 0x80500000, // allocate well above typical kernel load range
            free_pages: Vec::new(),
        }
    }

    pub fn check_alarms(&mut self, current_mtime: u64) -> Vec<(u64, u32)> {
        let mut fired = Vec::new();
        if let Some(alarm) = self.timer_alarm {
            if current_mtime >= alarm {
                fired.push((0, 0));
                self.timer_alarm = None;
            }
        }
        fired
    }

    pub fn handle_ecall(
        &mut self,
        a7: u32,
        a6: u32,
        a0: u32,
        a1: u32,
        a2: u32,
        a3: u32,
        a4: u32,
        a5: u32,
        uart: &mut Uart,
        clint: &mut super::clint::Clint,
        mem: &mut super::memory::GuestMemory,
        virtio_blk: &mut super::virtio_blk::VirtioBlk,
    ) -> Option<(u32, u32)> {
        if a7 == SBI_CONSOLE_PUTCHAR || (a7 == SBI_EXT_DBCN && a6 == SBI_DBCN_CONSOLE_WRITE_BYTE) {
            let ch = a0 as u8;
            if ch != 0 {
                // Per-character debug output disabled for speed
                // Use console_output buffer for actual guest output
            }
        }
        self.ecall_log.push((a7, a6, a0));
        match a7 {
            0x100 => {
                // Geos-native MALLOC: allocate a 4096-byte page, zero it, return address.
                let addr = if let Some(free_addr) = self.free_pages.pop() {
                    free_addr
                } else {
                    let allocated = self.next_alloc_addr;
                    self.next_alloc_addr += 4096;
                    allocated
                };
                // Debug tracing suppressed — 22+ lines on boot
                // Zero the allocated page in GuestMemory
                for i in 0..4096 {
                    let _ = mem.write_byte(addr + i, 0);
                }
                Some((addr as u32, 0))
            },
            0x101 => {
                // Geos-native FREE: free the page at address a0.
                let addr = a0 as u64;
                if addr != 0 && (addr % 4096 == 0) && !self.free_pages.contains(&addr) {
                    self.free_pages.push(addr);
                }
                Some((SBI_SUCCESS as u32, 0))
            },
            0x200 => {
                // DISK_READ: a0 = block_number, a1 = buffer_address.
                let block_no = a0 as u64;
                let buf_addr = a1 as u64;
                let offset = block_no * 512;
                if offset + 512 <= virtio_blk.disk.len() as u64 {
                    for i in 0..512 {
                        let val = virtio_blk.disk[(offset + i) as usize];
                        let _ = mem.write_byte(buf_addr + i, val);
                    }
                    Some((SBI_SUCCESS as u32, 0))
                } else {
                    Some((SBI_ERR_INVALID_PARAM as u32, 0))
                }
            },
            0x201 => {
                // DISK_WRITE: a0 = block_number, a1 = buffer_address.
                let block_no = a0 as u64;
                let buf_addr = a1 as u64;
                let offset = block_no * 512;
                if offset + 512 <= virtio_blk.disk.len() as u64 {
                    for i in 0..512 {
                        if let Ok(val) = mem.read_byte(buf_addr + i) {
                            virtio_blk.disk[(offset + i) as usize] = val;
                        }
                    }
                    virtio_blk.dirty = true;
                    virtio_blk.save_disk();
                    Some((SBI_SUCCESS as u32, 0))
                } else {
                    Some((SBI_ERR_INVALID_PARAM as u32, 0))
                }
            },
            SBI_CONSOLE_PUTCHAR => {
                let ch = a0 as u8;
                if ch != 0 {
                    self.console_output.push(ch);
                }
                Some((SBI_SUCCESS as u32, 0))
            },
            SBI_CONSOLE_GETCHAR => {
                if !uart.rx_buf.is_empty() {
                    Some((uart.rx_buf.remove(0) as u32, 0))
                } else {
                    Some((0xFFFFFFFF, 0))
                }
            },
            SBI_EXT_BASE => match a6 {
                SBI_BASE_GET_SPEC_VERSION => Some((SBI_SUCCESS as u32, (2 << 24) | 0)),
                SBI_BASE_GET_IMPL_ID => Some((SBI_SUCCESS as u32, 0x47454F53)),
                SBI_BASE_GET_IMPL_VERSION => Some((SBI_SUCCESS as u32, 1)),
                SBI_BASE_PROBE_EXTENSION => {
                    let available = matches!(
                        a0,
                        SBI_EXT_BASE
                            | SBI_EXT_TIME
                            | SBI_EXT_IPI
                            | SBI_EXT_RFENCE
                            | SBI_EXT_HSM
                            | SBI_EXT_SRST
                            | SBI_EXT_DBCN
                            | SBI_EXT_STA
                            | SBI_EXT_SUSP
                            | SBI_EXT_GEOMETRY
                            | SBI_EXT_NET
                            | SBI_EXT_JIT_DRIVER
                            | SBI_CONSOLE_PUTCHAR
                            | SBI_CONSOLE_GETCHAR
                    );
                    Some((SBI_SUCCESS as u32, if available { 1 } else { 0 }))
                },
                _ => Some((SBI_SUCCESS as u32, 0)),
            },
            SBI_EXT_TIME => {
                let next_time = (a0 as u64) | ((a1 as u64) << 32);
                self.timer_alarm = Some(next_time);
                // Program CLINT mtimecmp so sync_mip() asserts MTIP/STIP when mtime >= next_time.
                // On real hardware, OpenSBI writes the timer value to the CLINT MMIO register.
                // Without this, mtimecmp stays at u64::MAX and timer interrupts never fire.
                clint.mtimecmp = next_time;
                clint.timer_set_count = clint.timer_set_count.saturating_add(1);
                Some((SBI_SUCCESS as u32, 0))
            },
            SBI_EXT_SRST => {
                if a6 == SBI_SRST_SYSTEM_RESET {
                    self.shutdown_requested = true;
                    Some((SBI_SUCCESS as u32, 0))
                } else {
                    Some((SBI_ERR_NOT_SUPPORTED as u32, 0))
                }
            },
            // Legacy SBI v0.1 shutdown (a7=8) -- bare-metal programs use this
            8 => {
                self.shutdown_requested = true;
                Some((SBI_SUCCESS as u32, 0))
            },
            SBI_EXT_DBCN => match a6 {
                SBI_DBCN_CONSOLE_WRITE => {
                    let phys_addr = (a1 as u64) | ((a2 as u64) << 32);
                    // Debug tracing suppressed — fires on every console write
                    self.dbcn_pending_write = Some((phys_addr, a0 as usize));
                    Some((SBI_SUCCESS as u32, a0))
                },
                SBI_DBCN_CONSOLE_WRITE_BYTE => {
                    // fid=2: write single byte in a0
                    let ch = a0 as u8;
                    self.console_output.push(ch);
                    Some((SBI_SUCCESS as u32, 0))
                },
                SBI_DBCN_CONSOLE_READ => {
                    // fid=1: read one character into a1
                    // Return (success, char) or (error, ...)
                    if let Some(ch) = self.console_input.get(0).copied() {
                        self.console_input.remove(0);
                        Some((SBI_SUCCESS as u32, ch as u32))
                    } else {
                        Some((SBI_ERR_FAILURE as u32, 0))
                    }
                },
                _ => Some((SBI_ERR_NOT_SUPPORTED as u32, 0)),
            },
            SBI_EXT_GEOMETRY => {
                match a6 {
                    SBI_GEOM_GET_SCREEN_SIZE => Some((256, 256)),
                    SBI_GEOM_VFS_READ => {
                        self.geo_vfs_read_pending = Some(GeoVfsReadReq {
                            buf_addr: a0 as u64,
                            path_addr: a1 as u64,
                            len: a2 as usize,
                            name_addr: 0,
                            name_len: 0,
                            buf_len: 0,
                        });
                        Some((SBI_SUCCESS as u32, 0))
                    },
                    SBI_GEOM_SPAWN => {
                        self.spawn_requested = Some((a0, 0));
                        Some((SBI_SUCCESS as u32, 0))
                    },
                    SBI_GEOM_KILL => Some((SBI_SUCCESS as u32, 0)),
                    SBI_GEOM_YIELD => {
                        self.yield_requested = true;
                        self.yield_to_context = None;
                        Some((SBI_SUCCESS as u32, 0))
                    },
                    SBI_GEOM_YIELD_TO => {
                        self.yield_requested = true;
                        self.yield_to_context = Some(a0);
                        Some((SBI_SUCCESS as u32, 0))
                    },
                    SBI_GEOM_GPU_COMPUTE => {
                        // Validate params before queueing (mirror gpu_bridge checks)
                        let num_words = a1 as u64;
                        let num_tiles = a3;
                        if num_words == 0 || num_tiles == 0 {
                            Some((SBI_ERR_INVALID_PARAM as u32, 0))
                        } else {
                            let code_addr = a0 as u64;
                            let max_steps = a2;
                            let result_addr = (a4 as u64) | ((a5 as u64) << 32);
                            self.gpu_compute_requested =
                                Some((code_addr, num_words, max_steps, num_tiles, result_addr));
                            Some((SBI_SUCCESS as u32, 0))
                        }
                    },
                    _ => Some((SBI_ERR_NOT_SUPPORTED as u32, 0)),
                }
            },
            // JIT Driver Synthesis extension.
            // Guest calls SBI_JIT_REQUEST with a0=device_type, a1=mmio_base.
            // Host queues the request, processes it after this step returns,
            // and returns the arena address in a1 for the guest to call.
            SBI_EXT_JIT_DRIVER => match a6 {
                SBI_JIT_REQUEST => {
                    let device_type = a0;
                    let mmio_base = a1;
                    self.jit_driver_pending = Some((device_type, mmio_base));
                    Some((SBI_SUCCESS as u32, JIT_DRIVER_ARENA))
                },
                SBI_JIT_PROBE_REPORT => {
                    // Specless probe: guest reports raw observations, host infers device type
                    let mmio_base = a0;
                    let magic = a1;
                    let sig_lo = a2; // e.g., register[5] (LSR offset) or DeviceID
                    let sig_hi = a3; // e.g., address-range hint
                    self.jit_probe_pending = Some((mmio_base, magic, sig_lo, sig_hi));
                    Some((SBI_SUCCESS as u32, JIT_DRIVER_ARENA))
                },
                _ => Some((SBI_ERR_NOT_SUPPORTED as u32, 0)),
            },
            // IPI extension: send IPI by pulsing msip on target harts.
            // On real hardware, OpenSBI writes to the CLINT msip MMIO register.
            // For single-hart (hart 0 only), we pulse msip=1 so that sync_mip
            // asserts MSIP/SSIP and the interrupt reaches S-mode via mideleg.
            // The S-mode handler should clear SSIP via CSR write to sip.
            SBI_EXT_IPI => match a6 {
                0 => {
                    // a0 = hart_mask, a1 = hart_mask_base (unused for single-hart)
                    // Pulse msip for hart 0 — triggers software interrupt.
                    clint.msip = 1;
                    Some((SBI_SUCCESS as u32, 0))
                },
                _ => Some((SBI_ERR_NOT_SUPPORTED as u32, 0)),
            },
            // RFENCE extension: remote TLB fence. On single-hart, nothing to do.
            SBI_EXT_RFENCE => match a6 {
                _ => Some((SBI_SUCCESS as u32, 0)),
            },
            // HSM extension: hart state management. Single-hart, return NOT_SUPPORTED
            // for anything except hart 0 which is already started.
            SBI_EXT_HSM => match a6 {
                _ => Some((SBI_ERR_NOT_SUPPORTED as u32, 0)),
            },
            // STA extension: steal-time accounting. Return NOT_SUPPORTED.
            SBI_EXT_STA => match a6 {
                _ => Some((SBI_ERR_NOT_SUPPORTED as u32, 0)),
            },
            // SUSP extension: suspend. Return NOT_SUPPORTED.
            SBI_EXT_SUSP => match a6 {
                _ => Some((SBI_ERR_NOT_SUPPORTED as u32, 0)),
            },
            // Unrecognized SBI extension: return NOT_SUPPORTED instead of None.
            // Returning None causes deliver_trap(CAUSE_ECALL_S) which traps to M-mode
            // (since medeleg[9]=0 for ECALL_S). With mtvec=0x80000000 (kernel entry),
            // this re-executes _start_kernel in M-mode in an infinite loop.
            // Per SBI v2.0, unrecognized extensions should return NOT_SUPPORTED.
            _ => Some((SBI_ERR_NOT_SUPPORTED as u32, 0)),
        }
    }

    #[cfg(test)]
    pub fn handle_ecall_test(
        &mut self,
        a7: u32,
        a6: u32,
        a0: u32,
        a1: u32,
        a2: u32,
        a3: u32,
        a4: u32,
        a5: u32,
        uart: &mut Uart,
        clint: &mut super::clint::Clint,
    ) -> Option<(u32, u32)> {
        let mut mem = super::memory::GuestMemory::new(0x8000_0000, 4096);
        let mut virtio_blk = super::virtio_blk::VirtioBlk::new();
        self.handle_ecall(
            a7,
            a6,
            a0,
            a1,
            a2,
            a3,
            a4,
            a5,
            uart,
            clint,
            &mut mem,
            &mut virtio_blk,
        )
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::riscv::clint::Clint;
    use crate::riscv::uart::Uart;

    /// Helper: create Sbi + Uart + Clint for handle_ecall tests.
    fn new_test_sbi() -> (Sbi, Uart, Clint) {
        (Sbi::new(), Uart::new(), Clint::new())
    }

    // ============================================================
    // SBI struct initialization
    // ============================================================

    #[test]
    fn sbi_new_defaults() {
        let sbi = Sbi::new();
        assert!(sbi.ecall_log.is_empty());
        assert!(sbi.console_output.is_empty());
        assert!(!sbi.shutdown_requested);
        assert!(sbi.timer_alarm.is_none());
        assert!(sbi.dbcn_pending_write.is_none());
        assert!(sbi.net_rx_queue.is_empty());
        assert_eq!(sbi.mac_addr, [0xDE, 0xAD, 0xBE, 0xEF, 0x00, 0x01]);
        assert!(!sbi.yield_requested);
        assert!(sbi.yield_to_context.is_none());
        assert!(sbi.spawn_requested.is_none());
        assert!(sbi.gpu_compute_requested.is_none());
        assert!(sbi.jit_driver_pending.is_none());
        assert!(sbi.net_pending.is_none());
        assert!(sbi.shm_regions.is_empty());
        assert_eq!(sbi.boot_mtime, 0);
    }

    // ============================================================
    // Console putchar/getchar (legacy v0.1)
    // ============================================================

    #[test]
    fn sbi_console_putchar_appends_to_output() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(
            SBI_CONSOLE_PUTCHAR,
            0,
            0x41,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_SUCCESS as u32, 0)));
        assert_eq!(sbi.console_output, vec![0x41]); // 'A'
        assert_eq!(sbi.ecall_log.len(), 1);
    }

    #[test]
    fn sbi_console_putchar_null_is_ignored() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        sbi.handle_ecall_test(
            SBI_CONSOLE_PUTCHAR,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert!(sbi.console_output.is_empty());
    }

    #[test]
    fn sbi_console_putchar_multiple_chars() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        for &ch in &[b'H', b'e', b'l', b'l', b'o'] {
            sbi.handle_ecall_test(
                SBI_CONSOLE_PUTCHAR,
                0,
                ch as u32,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            );
        }
        assert_eq!(sbi.console_output, b"Hello");
        assert_eq!(sbi.ecall_log.len(), 5);
    }

    #[test]
    fn sbi_console_getchar_returns_byte_from_uart() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        uart.rx_buf.push(0x42); // 'B'
        let r = sbi.handle_ecall_test(
            SBI_CONSOLE_GETCHAR,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((0x42, 0)));
        assert!(uart.rx_buf.is_empty()); // consumed
    }

    #[test]
    fn sbi_console_getchar_empty_returns_negative_one() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(
            SBI_CONSOLE_GETCHAR,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((0xFFFFFFFF, 0)));
    }

    // ============================================================
    // Base extension (0x10)
    // ============================================================

    #[test]
    fn sbi_base_get_spec_version() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(
            SBI_EXT_BASE,
            SBI_BASE_GET_SPEC_VERSION,
            0,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_SUCCESS as u32, (2 << 24) | 0))); // v2.0
    }

    #[test]
    fn sbi_base_get_impl_id() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(
            SBI_EXT_BASE,
            SBI_BASE_GET_IMPL_ID,
            0,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_SUCCESS as u32, 0x47454F53))); // "GEOS"
    }

    #[test]
    fn sbi_base_get_impl_version() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(
            SBI_EXT_BASE,
            SBI_BASE_GET_IMPL_VERSION,
            0,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_SUCCESS as u32, 1)));
    }

    #[test]
    fn sbi_base_probe_known_extension() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        // Probe TIME extension
        let r = sbi.handle_ecall_test(
            SBI_EXT_BASE,
            SBI_BASE_PROBE_EXTENSION,
            SBI_EXT_TIME,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_SUCCESS as u32, 1))); // available
    }

    #[test]
    fn sbi_base_probe_unknown_extension() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        // Probe some random extension
        let r = sbi.handle_ecall_test(
            SBI_EXT_BASE,
            SBI_BASE_PROBE_EXTENSION,
            0xDEAD,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_SUCCESS as u32, 0))); // not available
    }

    #[test]
    fn sbi_base_probe_all_known_extensions() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let known = [
            SBI_EXT_BASE,
            SBI_EXT_TIME,
            SBI_EXT_IPI,
            SBI_EXT_RFENCE,
            SBI_EXT_HSM,
            SBI_EXT_SRST,
            SBI_EXT_DBCN,
            SBI_EXT_STA,
            SBI_EXT_SUSP,
            SBI_EXT_GEOMETRY,
            SBI_EXT_NET,
        ];
        for &ext in &known {
            let r = sbi.handle_ecall_test(
                SBI_EXT_BASE,
                SBI_BASE_PROBE_EXTENSION,
                ext,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            );
            assert_eq!(
                r,
                Some((SBI_SUCCESS as u32, 1)),
                "extension 0x{:08X} should be available",
                ext
            );
        }
    }

    #[test]
    fn sbi_base_unknown_function_returns_zero() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(SBI_EXT_BASE, 99, 0, 0, 0, 0, 0, 0, &mut uart, &mut clint);
        assert_eq!(r, Some((SBI_SUCCESS as u32, 0)));
    }

    // ============================================================
    // Timer extension (SET_TIMER)
    // ============================================================

    #[test]
    fn sbi_set_timer() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(
            SBI_EXT_TIME,
            0,
            0x1000,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_SUCCESS as u32, 0)));
        assert_eq!(sbi.timer_alarm, Some(0x1000));
    }

    #[test]
    fn sbi_set_timer_high_bits() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        // a0 = low 32 bits, a1 = high 32 bits
        let r = sbi.handle_ecall_test(
            SBI_EXT_TIME,
            0,
            0x80000000,
            1,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_SUCCESS as u32, 0)));
        assert_eq!(sbi.timer_alarm, Some(0x1_8000_0000));
    }

    // ============================================================
    // Timer alarm checking
    // ============================================================

    #[test]
    fn sbi_check_alarms_no_alarm_set() {
        let mut sbi = Sbi::new();
        let fired = sbi.check_alarms(1000);
        assert!(fired.is_empty());
    }

    #[test]
    fn sbi_check_alarms_not_yet_fired() {
        let mut sbi = Sbi::new();
        sbi.timer_alarm = Some(5000);
        let fired = sbi.check_alarms(1000);
        assert!(fired.is_empty());
        assert_eq!(sbi.timer_alarm, Some(5000)); // still set
    }

    #[test]
    fn sbi_check_alarms_fired_at_threshold() {
        let mut sbi = Sbi::new();
        sbi.timer_alarm = Some(5000);
        let fired = sbi.check_alarms(5000);
        assert_eq!(fired.len(), 1);
        assert!(sbi.timer_alarm.is_none()); // cleared after fire
    }

    #[test]
    fn sbi_check_alarms_fired_past_threshold() {
        let mut sbi = Sbi::new();
        sbi.timer_alarm = Some(5000);
        let fired = sbi.check_alarms(9999);
        assert_eq!(fired.len(), 1);
        assert!(sbi.timer_alarm.is_none());
    }

    #[test]
    fn sbi_check_alarms_only_fires_once() {
        let mut sbi = Sbi::new();
        sbi.timer_alarm = Some(100);
        sbi.check_alarms(200); // fires
        let fired2 = sbi.check_alarms(300); // no alarm set
        assert!(fired2.is_empty());
    }

    // ============================================================
    // SRST (system reset) extension
    // ============================================================

    #[test]
    fn sbi_srst_system_reset() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        assert!(!sbi.shutdown_requested);
        let r = sbi.handle_ecall_test(
            SBI_EXT_SRST,
            SBI_SRST_SYSTEM_RESET,
            0,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_SUCCESS as u32, 0)));
        assert!(sbi.shutdown_requested);
    }

    #[test]
    fn sbi_srst_unknown_function() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(SBI_EXT_SRST, 99, 0, 0, 0, 0, 0, 0, &mut uart, &mut clint);
        assert_eq!(r, Some((SBI_ERR_NOT_SUPPORTED as u32, 0)));
        assert!(!sbi.shutdown_requested);
    }

    // ============================================================
    // Legacy v0.1 shutdown (a7=8)
    // ============================================================

    #[test]
    fn sbi_legacy_shutdown() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(8, 0, 0, 0, 0, 0, 0, 0, &mut uart, &mut clint);
        assert_eq!(r, Some((SBI_SUCCESS as u32, 0)));
        assert!(sbi.shutdown_requested);
    }

    // ============================================================
    // DBCN (debug console) extension
    // ============================================================

    #[test]
    fn sbi_dbcn_write_byte_implemented() {
        // DBCN_CONSOLE_WRITE_BYTE (function 2) writes a single byte to console.
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(
            SBI_EXT_DBCN,
            SBI_DBCN_CONSOLE_WRITE_BYTE,
            0x48,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_SUCCESS as u32, 0)));
        assert_eq!(sbi.console_output, vec![0x48u8]);
    }

    #[test]
    fn sbi_dbcn_write_byte_null_pushed() {
        // Null bytes are pushed to console_output (no filtering).
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        sbi.handle_ecall_test(
            SBI_EXT_DBCN,
            SBI_DBCN_CONSOLE_WRITE_BYTE,
            0,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(sbi.console_output, vec![0u8]);
    }

    #[test]
    fn sbi_dbcn_write_pending() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(
            SBI_EXT_DBCN,
            SBI_DBCN_CONSOLE_WRITE,
            16,
            0x2000,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_SUCCESS as u32, 16)));
        assert_eq!(sbi.dbcn_pending_write, Some((0x2000u64, 16)));
    }

    #[test]
    fn sbi_dbcn_write_high_address() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        // a1=low bits, a2=high bits -> phys_addr = 0x1_0000_0000
        let r = sbi.handle_ecall_test(
            SBI_EXT_DBCN,
            SBI_DBCN_CONSOLE_WRITE,
            64,
            0,
            1,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_SUCCESS as u32, 64)));
        assert_eq!(sbi.dbcn_pending_write, Some((0x1_0000_0000u64, 64)));
    }

    #[test]
    fn sbi_dbcn_unknown_function() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(SBI_EXT_DBCN, 99, 0, 0, 0, 0, 0, 0, &mut uart, &mut clint);
        assert_eq!(r, Some((SBI_ERR_NOT_SUPPORTED as u32, 0)));
    }

    // ============================================================
    // GEOMETRY extension
    // ============================================================

    #[test]
    fn sbi_geom_get_screen_size() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(
            SBI_EXT_GEOMETRY,
            SBI_GEOM_GET_SCREEN_SIZE,
            0,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((256, 256)));
    }

    #[test]
    fn sbi_geom_vfs_read() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(
            SBI_EXT_GEOMETRY,
            SBI_GEOM_VFS_READ,
            0x8000,
            0x9000,
            128,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_SUCCESS as u32, 0)));
        let pending = sbi.geo_vfs_read_pending.unwrap();
        assert_eq!(pending.buf_addr, 0x8000);
        assert_eq!(pending.path_addr, 0x9000);
        assert_eq!(pending.len, 128);
    }

    #[test]
    fn sbi_geom_kill() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(
            SBI_EXT_GEOMETRY,
            SBI_GEOM_KILL,
            42,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_SUCCESS as u32, 0)));
    }

    #[test]
    fn sbi_geom_yield() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(
            SBI_EXT_GEOMETRY,
            SBI_GEOM_YIELD,
            0,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_SUCCESS as u32, 0)));
        assert!(sbi.yield_requested);
        assert!(sbi.yield_to_context.is_none());
    }

    #[test]
    fn sbi_geom_yield_to() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(
            SBI_EXT_GEOMETRY,
            SBI_GEOM_YIELD_TO,
            5,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_SUCCESS as u32, 0)));
        assert!(sbi.yield_requested);
        assert_eq!(sbi.yield_to_context, Some(5));
    }

    #[test]
    fn sbi_geom_spawn() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(
            SBI_EXT_GEOMETRY,
            SBI_GEOM_SPAWN,
            0x4000,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_SUCCESS as u32, 0)));
        assert_eq!(sbi.spawn_requested, Some((0x4000, 0)));
    }

    #[test]
    fn sbi_geom_gpu_compute_valid() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(
            SBI_EXT_GEOMETRY,
            SBI_GEOM_GPU_COMPUTE,
            0x1000,
            100,
            500,
            4,
            0x5000,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_SUCCESS as u32, 0)));
        let req = sbi.gpu_compute_requested.unwrap();
        assert_eq!(req.0, 0x1000); // code_addr
        assert_eq!(req.1, 100); // num_words
        assert_eq!(req.2, 500); // max_steps
        assert_eq!(req.3, 4); // num_tiles
        assert_eq!(req.4, 0x5000); // result_addr
    }

    #[test]
    fn sbi_geom_gpu_compute_zero_words_rejected() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(
            SBI_EXT_GEOMETRY,
            SBI_GEOM_GPU_COMPUTE,
            0x1000,
            0,
            500,
            4,
            0x5000,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_ERR_INVALID_PARAM as u32, 0)));
        assert!(sbi.gpu_compute_requested.is_none());
    }

    #[test]
    fn sbi_geom_gpu_compute_zero_tiles_rejected() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(
            SBI_EXT_GEOMETRY,
            SBI_GEOM_GPU_COMPUTE,
            0x1000,
            100,
            500,
            0,
            0x5000,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_ERR_INVALID_PARAM as u32, 0)));
        assert!(sbi.gpu_compute_requested.is_none());
    }

    #[test]
    fn sbi_geom_gpu_compute_high_result_addr() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        // a4=low bits, a5=high bits -> result_addr = 0x1_0000_0000
        let r = sbi.handle_ecall_test(
            SBI_EXT_GEOMETRY,
            SBI_GEOM_GPU_COMPUTE,
            0x1000,
            100,
            500,
            4,
            0,
            1,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_SUCCESS as u32, 0)));
        let req = sbi.gpu_compute_requested.unwrap();
        assert_eq!(req.4, 0x1_0000_0000);
    }

    #[test]
    fn sbi_geom_unknown_function() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(
            SBI_EXT_GEOMETRY,
            99,
            0,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_ERR_NOT_SUPPORTED as u32, 0)));
    }

    // ============================================================
    // Unknown extension returns NOT_SUPPORTED (not None)
    // ============================================================
    // Previously returned None which caused deliver_trap to M-mode,
    // restarting the kernel in an infinite loop. Now returns NOT_SUPPORTED
    // so the kernel can handle it gracefully in S-mode.

    #[test]
    fn sbi_unknown_extension_returns_not_supported() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(0xDEAD, 0, 0, 0, 0, 0, 0, 0, &mut uart, &mut clint);
        assert!(r.is_some());
        let (a0, _a1) = r.unwrap();
        assert_eq!(a0, SBI_ERR_NOT_SUPPORTED as u32);
        // Still logged
        assert_eq!(sbi.ecall_log.len(), 1);
    }

    #[test]
    fn sbi_unknown_extension_a7_zero_returns_not_supported() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        let r = sbi.handle_ecall_test(0, 0, 0, 0, 0, 0, 0, 0, &mut uart, &mut clint);
        assert!(r.is_some());
        let (a0, _a1) = r.unwrap();
        assert_eq!(a0, SBI_ERR_NOT_SUPPORTED as u32);
    }

    // ============================================================
    // ECALL logging
    // ============================================================

    #[test]
    fn sbi_ecall_log_records_all_calls() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        sbi.handle_ecall_test(
            SBI_CONSOLE_PUTCHAR,
            0,
            0x41,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        sbi.handle_ecall_test(
            SBI_EXT_BASE,
            SBI_BASE_GET_SPEC_VERSION,
            0,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        sbi.handle_ecall_test(SBI_EXT_TIME, 0, 1000, 0, 0, 0, 0, 0, &mut uart, &mut clint);

        assert_eq!(sbi.ecall_log.len(), 3);
        assert_eq!(sbi.ecall_log[0], (SBI_CONSOLE_PUTCHAR, 0, 0x41));
        assert_eq!(
            sbi.ecall_log[1],
            (SBI_EXT_BASE, SBI_BASE_GET_SPEC_VERSION, 0)
        );
        assert_eq!(sbi.ecall_log[2], (SBI_EXT_TIME, 0, 1000));
    }

    #[test]
    fn sbi_ecall_log_records_unknown_extensions() {
        let (mut sbi, mut uart, mut clint) = new_test_sbi();
        sbi.handle_ecall_test(0xBEEF, 1, 2, 0, 0, 0, 0, 0, &mut uart, &mut clint);
        assert_eq!(sbi.ecall_log[0], (0xBEEF, 1, 2));
    }

    // ============================================================
    // Error code constants
    // ============================================================

    #[test]
    fn sbi_error_codes() {
        assert_eq!(SBI_SUCCESS, 0);
        assert_eq!(SBI_ERR_NOT_SUPPORTED, -1);
        assert_eq!(SBI_ERR_INVALID_PARAM, -3);
        assert_eq!(SBI_ERR_DENIED, -4);
        assert_eq!(SBI_ERR_INVALID_ADDRESS, -5);
    }

    #[test]
    fn sbi_extension_id_constants() {
        assert_eq!(SBI_EXT_BASE, 0x10);
        assert_eq!(SBI_EXT_TIME, 0x54494D45); // "TIME"
        assert_eq!(SBI_EXT_IPI, 0x735049); // "IPI"
        assert_eq!(SBI_EXT_RFENCE, 0x52464E43); // "RFNC"
        assert_eq!(SBI_EXT_HSM, 0x48534D); // "HSM"
        assert_eq!(SBI_EXT_SRST, 0x53525354); // "SRST"
        assert_eq!(SBI_EXT_DBCN, 0x4442434E); // "DBCN"
        assert_eq!(SBI_EXT_GEOMETRY, 0x47454F4D); // "GEOM"
        assert_eq!(SBI_EXT_NET, 0x4E455400); // "NET\0"
    }

    // ============================================================
    // NetOpKind enum
    // ============================================================

    #[test]
    fn net_op_kind_values() {
        assert_eq!(NetOpKind::Send, NetOpKind::Send);
        assert_eq!(NetOpKind::Recv, NetOpKind::Recv);
        assert_ne!(NetOpKind::Send, NetOpKind::Recv);
    }

    // ============================================================
    // GeoVfsReadReq struct
    // ============================================================

    #[test]
    fn geo_vfs_read_req_fields() {
        let req = GeoVfsReadReq {
            buf_addr: 0x1000,
            path_addr: 0x2000,
            len: 256,
            name_addr: 0x3000,
            name_len: 32,
            buf_len: 512,
        };
        assert_eq!(req.buf_addr, 0x1000);
        assert_eq!(req.path_addr, 0x2000);
        assert_eq!(req.len, 256);
        assert_eq!(req.name_addr, 0x3000);
        assert_eq!(req.name_len, 32);
        assert_eq!(req.buf_len, 512);
    }

    // ============================================================
    // ShmRegion struct
    // ============================================================

    #[test]
    fn shm_region_fields() {
        let region = ShmRegion {
            id: 42,
            data: vec![0xAA, 0xBB, 0xCC],
        };
        assert_eq!(region.id, 42);
        assert_eq!(region.data.len(), 3);
        assert_eq!(region.data[0], 0xAA);
    }
}
