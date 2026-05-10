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
}

impl Sbi {
    pub fn new() -> Self {
        Self {
            ecall_log: Vec::new(),
            console_output: Vec::new(),
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
        _clint: &mut super::clint::Clint,
    ) -> Option<(u32, u32)> {
        if a7 == SBI_CONSOLE_PUTCHAR || (a7 == SBI_EXT_DBCN && a6 == SBI_DBCN_CONSOLE_WRITE_BYTE) {
             let ch = a0 as u8;
             if ch != 0 { eprintln!("[sbi-out] '{}'", ch as char); }
        }
        self.ecall_log.push((a7, a6, a0));
        match a7 {
            SBI_CONSOLE_PUTCHAR => {
                let ch = a0 as u8;
                if ch != 0 { self.console_output.push(ch); }
                Some((SBI_SUCCESS as u32, 0))
            }
            SBI_CONSOLE_GETCHAR => {
                if !uart.rx_buf.is_empty() {
                    Some((uart.rx_buf.remove(0) as u32, 0))
                } else { Some((0xFFFFFFFF, 0)) }
            }
            SBI_EXT_BASE => {
                match a6 {
                    SBI_BASE_GET_SPEC_VERSION => Some((SBI_SUCCESS as u32, (2 << 24) | 0)),
                    SBI_BASE_GET_IMPL_ID => Some((SBI_SUCCESS as u32, 0x47454F53)),
                    SBI_BASE_GET_IMPL_VERSION => Some((SBI_SUCCESS as u32, 1)),
                    SBI_BASE_PROBE_EXTENSION => {
                        let available = matches!(a0, SBI_EXT_BASE | SBI_EXT_TIME | SBI_EXT_IPI | SBI_EXT_RFENCE | SBI_EXT_HSM | SBI_EXT_SRST | SBI_EXT_DBCN | SBI_EXT_STA | SBI_EXT_SUSP | SBI_EXT_GEOMETRY | SBI_EXT_NET);
                        Some((SBI_SUCCESS as u32, if available { 1 } else { 0 }))
                    }
                    _ => Some((SBI_SUCCESS as u32, 0)),
                }
            }
            SBI_EXT_TIME => {
                self.timer_alarm = Some((a0 as u64) | ((a1 as u64) << 32));
                Some((SBI_SUCCESS as u32, 0))
            }
            SBI_EXT_SRST => {
                if a6 == SBI_SRST_SYSTEM_RESET { self.shutdown_requested = true; Some((SBI_SUCCESS as u32, 0)) }
                else { Some((SBI_ERR_NOT_SUPPORTED as u32, 0)) }
            }
            // Legacy SBI v0.1 shutdown (a7=8) -- bare-metal programs use this
            8 => {
                self.shutdown_requested = true;
                Some((SBI_SUCCESS as u32, 0))
            }
            SBI_EXT_DBCN => {
                match a6 {
                    SBI_DBCN_CONSOLE_WRITE => {
                        let phys_addr = (a1 as u64) | ((a2 as u64) << 32);
                        eprintln!("[sbi] DBCN_WRITE requested: {} bytes at PA 0x{:08X}", a0, phys_addr);
                        self.dbcn_pending_write = Some((phys_addr, a0 as usize));
                        Some((SBI_SUCCESS as u32, a0))
                    }
                    _ => Some((SBI_ERR_NOT_SUPPORTED as u32, 0)),
                }
            }
            SBI_EXT_GEOMETRY => {
                match a6 {
                    SBI_GEOM_GET_SCREEN_SIZE => Some((256, 256)),
                    SBI_GEOM_VFS_READ => {
                        self.geo_vfs_read_pending = Some(GeoVfsReadReq {
                            buf_addr: a0 as u64,
                            path_addr: a1 as u64,
                            len: a2 as usize,
                            name_addr: 0, name_len: 0, buf_len: 0,
                        });
                        Some((SBI_SUCCESS as u32, 0))
                    }
                    SBI_GEOM_SPAWN => {
                        self.spawn_requested = Some((a0, 0));
                        Some((SBI_SUCCESS as u32, 0))
                    }
                    SBI_GEOM_KILL => Some((SBI_SUCCESS as u32, 0)),
                    SBI_GEOM_YIELD => {
                        self.yield_requested = true;
                        self.yield_to_context = None;
                        Some((SBI_SUCCESS as u32, 0))
                    }
                    SBI_GEOM_YIELD_TO => {
                        self.yield_requested = true;
                        self.yield_to_context = Some(a0);
                        Some((SBI_SUCCESS as u32, 0))
                    }
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
                    }
                    _ => Some((SBI_ERR_NOT_SUPPORTED as u32, 0)),
                }
            }
            _ => Some((SBI_ERR_NOT_SUPPORTED as u32, 0)),
        }
    }
}
