// riscv/sbi.rs -- Minimal RISC-V SBI (Supervisor Binary Interface) implementation
//
// Handles SBI ECALLs from the kernel and provides HTIF-compatible
// memory-mapped I/O for early boot console writes.
//
// SBI Specification: https://github.com/riscv-software-src/riscv-sbi-doc
//
// Currently implements:
// - SBI v0.1 legacy console (putchar/getchar)
// - SBI v0.2 base (get_sbi_spec_version, get_sbi_impl_id, etc.)
// - SBI v0.2 hart state (hart_start, hart_stop)
// - SBI v0.2 system reset (shutdown, reboot)
// - SBI v0.2 timer (set_timer)
// - HTIF tohost/fromhost memory-mapped writes (silently accepted)
//
// COMPATIBILITY NOTE: We do NOT support SBI v0.2 extension 0x02 (console
// putchar). The extension ID 0x02 collides with legacy a7=2 (console getchar)
// at the same numeric value. Our bare-metal guest programs use legacy a7=1
// for putchar and a7=2 for getchar. Linux earlycon=sbi uses extension 0x02
// with a6=0 for putchar, which would be misrouted to getchar. If Linux boot
// support is ever needed, the SBI dispatch must be restructured to separate
// legacy (a7 < 0x10, no a6) from extension (a7 >= 0x10, uses a6) namespaces.

use super::uart::Uart;

/// SBI error codes (negative values returned in a0).
pub const SBI_SUCCESS: i32 = 0;
pub const SBI_ERR_FAILURE: i32 = -1;
pub const SBI_ERR_NOT_SUPPORTED: i32 = -2;
pub const SBI_ERR_INVALID_PARAM: i32 = -3;
pub const SBI_ERR_DENIED: i32 = -4;
pub const SBI_ERR_INVALID_ADDRESS: i32 = -5;
pub const SBI_ERR_ALREADY_AVAILABLE: i32 = -6;

// SBI v0.1 legacy extension IDs
const SBI_SET_TIMER: u32 = 0;
const SBI_CONSOLE_PUTCHAR: u32 = 1;
const SBI_CONSOLE_GETCHAR: u32 = 2;
const SBI_CLEAR_IPI: u32 = 3;
const SBI_SEND_IPI: u32 = 4;
const SBI_REMOTE_FENCE_I: u32 = 5;
const SBI_REMOTE_SFENCE_VMA: u32 = 6;
const SBI_REMOTE_SFENCE_VMA_ASID: u32 = 7;
const SBI_SHUTDOWN: u32 = 8;

// SBI v0.2 extension IDs
const SBI_EXT_BASE: u32 = 0x10;
const SBI_EXT_CONSOLE_PUTCHAR: u32 = 0x02;
const SBI_EXT_HART_STATE: u32 = 0x48534F; // "HSM"
const SBI_EXT_SYSTEM_RESET: u32 = 0x53525354; // "SRST"
const SBI_EXT_TIMER: u32 = 0x54494D45; // "TIME"
const SBI_EXT_IPI: u32 = 0x735049; // "sPI" (note: lowercase to avoid confusion)
const SBI_EXT_RFENCE: u32 = 0x52464E43; // "RFNC"
const SBI_EXT_DBCN: u32 = 0x4442434E; // "DBCN"
const SBI_DBCN_CONSOLE_WRITE: u32 = 0;
const SBI_DBCN_CONSOLE_READ: u32 = 1;
const SBI_DBCN_CONSOLE_WRITE_BYTE: u32 = 2;

// Geometry OS-specific SBI extension. EID is ASCII "GEO\0".
// Function 0: GEO_VFS_READ (DEPRECATED -- use Pixel VFS Surface at 0x7000_0000)
// Function 1: GEO_YIELD -- cooperative yield to Layer 2 scheduler (round-robin)
// Function 2: GEO_YIELD_TO -- yield to specific context ID (a0=target)
// Function 3: GEO_SPAWN -- create new context at entry point (a0=entry)
// Function 4: GEO_KILL -- terminate a context (a0=context_id)
// Function 5: GEO_GPU_COMPUTE -- GPU compute offload
// Function 6: GEO_SHM_ALLOC -- allocate shared memory region (a0=size_bytes, a1=flags)
// Function 7: GEO_SHM_MAP -- map shared region into guest physical address (a0=shm_id, a1=phys_addr)
// Function 8: GEO_SHM_UNMAP -- unmap shared region (a0=shm_id)
// Function 9: GEO_SHM_SIZE -- get size of shared region (a0=shm_id)
// Function 10: GEO_SHM_WRITE -- write bytes to shared region (a0=shm_id, a1=offset, a2=src_phys_addr, a3=len)
// Function 11: GEO_SHM_READ -- read bytes from shared region (a0=shm_id, a1=offset, a2=dst_phys_addr, a3=len)
// Pixel access is via the MMIO framebuffer at 0x6000_0000 (256x256 RGBA).
const SBI_EXT_GEOMETRY: u32 = 0x47454F00; // "GEO\0"
const GEO_FN_VFS_READ: u32 = 0;
const GEO_FN_YIELD: u32 = 1;
const GEO_FN_YIELD_TO: u32 = 2;
const GEO_FN_SPAWN: u32 = 3;
const GEO_FN_KILL: u32 = 4;
const GEO_FN_GPU_COMPUTE: u32 = 5;
const GEO_FN_SHM_ALLOC: u32 = 6;
const GEO_FN_SHM_MAP: u32 = 7;
const GEO_FN_SHM_UNMAP: u32 = 8;
const GEO_FN_SHM_SIZE: u32 = 9;
const GEO_FN_SHM_WRITE: u32 = 10;
const GEO_FN_SHM_READ: u32 = 11;

// Phase 257: Timer and Sleep syscalls
// Function 12: GEO_UPTIME -- get elapsed ticks since boot
// Function 13: GEO_ALARM_SET -- register a one-shot alarm
// Function 14: GEO_ALARM_CANCEL -- cancel a registered alarm
// Function 15: GEO_MSLEEP -- yield and sleep for N milliseconds
const GEO_FN_UPTIME: u32 = 12;
const GEO_FN_ALARM_SET: u32 = 13;
const GEO_FN_ALARM_CANCEL: u32 = 14;
const GEO_FN_MSLEEP: u32 = 15;

/// Maximum number of concurrent alarms.
const GEO_MAX_ALARMS: usize = 4;

/// Approximate ticks per millisecond.
/// On real RISC-V hardware with a 52MHz timebase, this is exact.
/// For the emulator, this ratio is used to convert ms -> CLINT ticks.
const GEO_TICKS_PER_MS: u64 = 52_000;

/// Maximum number of shared memory regions.
const SHM_MAX_REGIONS: usize = 16;
/// Maximum size per shared memory region in bytes.
const SHM_MAX_SIZE: usize = 64 * 1024; // 64KB

/// A shared memory region that contexts can map into their address space.
/// The data lives in a separate buffer (not in GuestMemory) until mapped.
/// After SHM_MAP, the data is copied into GuestMemory at the specified
/// physical address, and both the shared buffer and the mapped address
/// are tracked so multiple contexts can see the same data.
#[derive(Debug, Clone)]
pub struct SharedMemoryRegion {
    /// Unique shared memory ID.
    pub id: u32,
    /// Size in bytes.
    pub size: usize,
    /// The shared data buffer.
    pub data: Vec<u8>,
    /// Whether this region has been mapped into guest physical memory.
    pub mapped: bool,
    /// Guest physical address where the region is mapped (if mapped).
    pub map_addr: u64,
    /// Number of contexts that have mapped this region.
    pub ref_count: usize,
}

// Phase 244: Network extension -- TCP via SBI
// EID is ASCII "NET\0"
const SBI_EXT_NET: u32 = 0x4E4554;
const NET_FN_CONNECT: u32 = 0;
const NET_FN_SEND: u32 = 1;
const NET_FN_RECV: u32 = 2;
const NET_FN_DISCONNECT: u32 = 3;

// SBI error codes
/// which has access to guest memory. The caller reads the filename bytes from
/// `name_addr..name_addr+name_len`, looks up the file in the host VFS, writes up
/// to `buf_len` bytes to `buf_addr`, and overwrites a0 with the byte count (or
/// SBI_ERR_INVALID_PARAM / SBI_ERR_FAILURE on error).
///
/// DEPRECATED: GEO_VFS_READ is replaced by the Pixel VFS Surface at 0x7000_0000.
/// This struct is retained for reference but the ecall now returns NOT_SUPPORTED.
#[derive(Debug, Clone, Copy)]
#[deprecated(note = "Use Pixel VFS Surface at 0x7000_0000 instead")]
pub struct GeoVfsReadReq {
    pub name_addr: u64,
    pub name_len: u32,
    pub buf_addr: u64,
    pub buf_len: u32,
}

/// Phase 244: Pending network operation for TCP send/recv.
/// Set by handle_ecall when NET_FN_SEND or NET_FN_RECV is called.
/// The step loop fulfills the operation using bus memory access.
#[derive(Debug, Clone)]
pub struct NetPendingOp {
    /// Operation kind: Send or Recv.
    pub kind: NetOpKind,
    /// Socket ID (0-3).
    pub socket_id: u8,
    /// Guest physical address of the data buffer.
    pub buf_addr: u64,
    /// Number of bytes to send/receive.
    pub len: usize,
}

/// Network operation kind for pending ops.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum NetOpKind {
    Send,
    Recv,
}

/// Phase 257: Alarm descriptor for timer syscalls.
#[derive(Debug, Clone, Copy)]
pub struct AlarmEntry {
    /// Whether this alarm slot is active.
    pub active: bool,
    /// CLINT mtime when the alarm fires (absolute).
    pub expire_mtime: u64,
    /// Callback function pointer (0 = just wake, no callback).
    pub callback: u32,
    /// Owner context ID (for permission checking).
    pub owner: usize,
}

/// SBI device: handles ECALL-based SBI calls and HTIF memory-mapped I/O.
pub struct Sbi {
    /// UART for console output (shared reference via write callback).
    /// We store characters to be read by the bus/bridge later.
    pub console_output: Vec<u8>,
    /// Whether the guest has requested shutdown.
    pub shutdown_requested: bool,
    /// Log of SBI ECALL arguments (a7, a6, a0) for debugging.
    #[allow(dead_code)]
    pub ecall_log: Vec<(u32, u32, u32)>,
    /// Pending DBCN console write: (physical_address, num_bytes).
    /// Set by handle_ecall when DBCN_CONSOLE_WRITE is called.
    /// The caller must read from bus memory and fulfill the request.
    pub dbcn_pending_write: Option<(u64, usize)>,
    /// Pending DBCN console read byte.
    /// Set by handle_ecall when DBCN_CONSOLE_READ has data.
    pub dbcn_pending_read: Option<u8>,
    /// Pending GEO_VFS_READ request. DEPRECATED -- no longer set by handle_ecall.
    /// Retained for struct compatibility. Will be removed in a future version.
    #[deprecated(note = "Use Pixel VFS Surface")]
    pub geo_vfs_read_pending: Option<GeoVfsReadReq>,
    /// Guest requested cooperative yield (GEO_YIELD or GEO_YIELD_TO).
    pub yield_requested: bool,
    /// Target context ID for GEO_YIELD_TO. None = round-robin.
    pub yield_to_context: Option<usize>,
    /// Guest requested spawn of a new context (GEO_SPAWN).
    pub spawn_requested: Option<(u32, usize)>,
    /// Guest requested GPU compute offload (GEO_FN_GPU_COMPUTE).
    /// Stores (code_addr, num_words, max_steps, num_tiles, result_addr).
    pub gpu_compute_requested: Option<(u64, u32, u32, u32, u64)>,
    /// Phase 244: Up to 4 concurrent TCP sockets.
    pub net_sockets: [Option<std::net::TcpStream>; 4],
    /// Phase 244: Pending network operation (send/recv) for step loop.
    pub net_pending: Option<NetPendingOp>,
    /// Phase 256: Shared memory regions for inter-context IPC.
    /// Up to SHM_MAX_REGIONS (16) regions, each up to SHM_MAX_SIZE (64KB).
    pub shm_regions: Vec<SharedMemoryRegion>,
    /// Next shared memory ID to assign.
    pub shm_next_id: u32,
    /// Pending shared memory write: (shm_id, offset, src_phys_addr, len).
    /// Set by GEO_FN_SHM_WRITE ecall, fulfilled by step loop.
    pub shm_pending_write: Option<(u32, usize, u64, usize)>,
    /// Pending shared memory read: (shm_id, offset, dst_phys_addr, len).
    /// Set by GEO_FN_SHM_READ ecall, fulfilled by step loop.
    pub shm_pending_read: Option<(u32, usize, u64, usize)>,
    /// Phase 257: Alarm table for timer syscalls.
    pub alarms: [AlarmEntry; GEO_MAX_ALARMS],
    /// Phase 257: CLINT mtime captured at SBI creation (boot time).
    pub boot_mtime: u64,
}

impl Sbi {
    /// Create a new SBI handler with empty console output.
    #[allow(deprecated)]
    pub fn new() -> Self {
        #[allow(deprecated)]
        Self {
            console_output: Vec::new(),
            shutdown_requested: false,
            ecall_log: Vec::new(),
            dbcn_pending_write: None,
            dbcn_pending_read: None,
            geo_vfs_read_pending: None,
            yield_requested: false,
            yield_to_context: None,
            spawn_requested: None,
            gpu_compute_requested: None,
            net_sockets: [None, None, None, None],
            net_pending: None,
            shm_regions: Vec::new(),
            shm_next_id: 1, // start IDs at 1 (0 = error/null)
            shm_pending_write: None,
            shm_pending_read: None,
            alarms: [AlarmEntry {
                active: false,
                expire_mtime: 0,
                callback: 0,
                owner: 0,
            }; GEO_MAX_ALARMS],
            boot_mtime: 0, // will be set from clint.mtime at boot
        }
    }

    /// Phase 257: Check all active alarms against current CLINT mtime.
    /// Returns a list of (alarm_id, callback_addr) for alarms that have fired.
    /// Each fired alarm is deactivated after this call.
    /// Called from the step loop each tick.
    pub fn check_alarms(&mut self, current_mtime: u64) -> Vec<(u32, u32)> {
        let mut fired = Vec::new();
        for (i, alarm) in self.alarms.iter_mut().enumerate() {
            if alarm.active && current_mtime >= alarm.expire_mtime {
                alarm.active = false;
                fired.push(((i + 1) as u32, alarm.callback));
            }
        }
        fired
    }

    /// Handle an SBI ECALL.
    ///
    /// Called from the CPU when an ECALL from S-mode is detected.
    /// The CPU should check if a7 contains an SBI extension ID before
    /// delivering the trap normally.
    ///
    /// Arguments:
    /// - a7: SBI extension ID (function group)
    /// - a6: SBI function ID (within the extension)
    /// - a0..a5: function-specific arguments
    ///
    /// Returns (a0, a1) pair to set in registers after the ECALL.
    /// If this is NOT an SBI call, returns None and the CPU should
    /// handle the ECALL as a normal trap.
    #[allow(clippy::too_many_arguments)]
    pub fn handle_ecall(
        &mut self,
        a7: u32,
        a6: u32,
        a0: u32,
        a1: u32,
        _a2: u32,
        _a3: u32,
        _a4: u32,
        _a5: u32,
        uart: &mut Uart,
        clint: &mut super::clint::Clint,
    ) -> Option<(u32, u32)> {
        // Log ECALL arguments for debugging (before they're modified)
        self.ecall_log.push((a7, a6, a0));
        match a7 {
            // SBI v0.1 legacy calls (extension ID is the function ID, a6=0)
            SBI_CONSOLE_PUTCHAR => {
                // a0 = character to print
                let ch = a0 as u8;
                if ch != 0 {
                    uart.write_byte(0, ch);
                    self.console_output.push(ch);
                }
                Some((SBI_SUCCESS as u32, 0))
            }
            SBI_CONSOLE_GETCHAR => {
                // Legacy SBI_CONSOLE_GETCHAR (a7=2): always read from UART rx_buf.
                // Note: SBI v0.2 extension 0x02 (console putchar) is handled separately
                // in the extension match block below. Legacy a7=2 is getchar only.
                if !uart.rx_buf.is_empty() {
                    let ch = uart.rx_buf.remove(0) as u32;
                    if uart.rx_buf.is_empty() {
                        uart.lsr &= !0x01; // Clear Data Ready
                    }
                    Some((ch, 0))
                } else {
                    Some((0xFFFFFFFF_u32, 0)) // -1 = no char available
                }
            }
            SBI_SET_TIMER => {
                // Set the timer: a0:a1 = 64-bit next timer event (absolute time)
                // a0 = low bits, a1 = high bits
                clint.mtimecmp = (a1 as u64) << 32 | (a0 as u64);
                Some((SBI_SUCCESS as u32, 0))
            }
            SBI_CLEAR_IPI => Some((SBI_SUCCESS as u32, 0)),
            SBI_SEND_IPI => Some((SBI_SUCCESS as u32, 0)),
            SBI_REMOTE_FENCE_I => Some((SBI_SUCCESS as u32, 0)),
            SBI_REMOTE_SFENCE_VMA => Some((SBI_SUCCESS as u32, 0)),
            SBI_REMOTE_SFENCE_VMA_ASID => Some((SBI_SUCCESS as u32, 0)),
            SBI_SHUTDOWN => {
                self.shutdown_requested = true;
                Some((SBI_SUCCESS as u32, 0))
            }

            // SBI v0.2 extensions
            // IMPORTANT: SBI v0.2 return convention is (a0=error, a1=value).
            // a0=0 means success, a0<0 means error. The actual return value
            // goes in a1. The Linux kernel's __sbi_base_ecall wrapper checks
            // a0 for error and returns a1 on success.
            SBI_EXT_BASE => {
                match a6 {
                    // SBI_BASE_GET_SPEC_VERSION (0)
                    // Encoded as (major << 24 | minor). Report v2.0 so the kernel
                    // probes DBCN (Debug Console) extension for earlycon output.
                    // Note: major shift is 24 (not 16) per SBI spec v0.2+.
                    0 => Some((0, 0x02000000)), // a0=success, a1=version 2.0
                    // SBI_BASE_GET_IMPL_ID (1)
                    1 => Some((0, 0)), // a0=success, a1=implementation ID 0
                    // SBI_BASE_GET_IMPL_VERSION (2)
                    2 => Some((0, 1)), // a0=success, a1=implementation version 1
                    // SBI_BASE_PROBE_EXTENSION (3)
                    3 => {
                        // Probe if extension `a0` is available
                        // NOTE: SBI_EXT_GEOMETRY removed -- GEO_VFS_READ deprecated.
                        //       Use Pixel VFS Surface (0x7000_0000) instead.
                        let available = matches!(
                            a0,
                            SBI_EXT_BASE
                                | SBI_CONSOLE_PUTCHAR
                                | SBI_EXT_CONSOLE_PUTCHAR
                                | SBI_EXT_TIMER
                                | SBI_EXT_HART_STATE
                                | SBI_EXT_SYSTEM_RESET
                                | SBI_SET_TIMER
                                | SBI_SHUTDOWN
                                | SBI_EXT_RFENCE
                                | SBI_EXT_IPI
                                | SBI_EXT_DBCN
                                | SBI_EXT_GEOMETRY
                                | SBI_EXT_NET
                        );
                        Some((0, if available { 1 } else { 0 }))
                    }
                    // SBI_BASE_GET_MVENDORID (4)
                    4 => Some((0, 0)),
                    // SBI_BASE_GET_MARCHID (5)
                    5 => Some((0, 0x80000000)), // generic RISC-V
                    // SBI_BASE_GET_MIMPID (6)
                    6 => Some((0, 0)),
                    _ => Some((SBI_ERR_NOT_SUPPORTED as u32, 0)),
                }
            }
            // SBI_EXT_CONSOLE_PUTCHAR (0x02) is the same numeric value as
            // SBI_CONSOLE_GETCHAR (2). Both handled by the legacy arm above.
            // Linux earlycon=sbi would use a7=0x02,a6=0 for putchar, but our
            // guest programs use legacy a7=1 for putchar and a7=2 for getchar.
            SBI_EXT_TIMER => {
                // Timer extension: function 0 = sbi_set_timer
                // a0:a1 = 64-bit next timer event (absolute time)
                if a6 == 0 {
                    clint.mtimecmp = (a1 as u64) << 32 | (a0 as u64);
                }
                Some((SBI_SUCCESS as u32, 0))
            }
            SBI_EXT_HART_STATE => {
                match a6 {
                    // hart_start (0) -- only allow hart 0 (ourselves)
                    0 => {
                        if a0 == 0 {
                            Some((SBI_SUCCESS as u32, 0))
                        } else {
                            // Reject secondary CPU start -- we only emulate 1 hart
                            Some((SBI_ERR_FAILURE as u32, 0))
                        }
                    }
                    // hart_stop (1)
                    1 => Some((SBI_SUCCESS as u32, 0)),
                    // hart_get_status (2)
                    2 => {
                        if a0 == 0 {
                            Some((0, 0)) // started
                        } else {
                            Some((SBI_ERR_FAILURE as u32, 0)) // not available
                        }
                    }
                    _ => Some((SBI_ERR_NOT_SUPPORTED as u32, 0)),
                }
            }
            SBI_EXT_SYSTEM_RESET => {
                match a6 {
                    // system_reset (0)
                    0 => {
                        self.shutdown_requested = true;
                        Some((SBI_SUCCESS as u32, 0))
                    }
                    _ => Some((SBI_ERR_NOT_SUPPORTED as u32, 0)),
                }
            }
            // RFENCE extension - remote fence operations (single-hart, NOP)
            SBI_EXT_RFENCE => Some((SBI_SUCCESS as u32, 0)), // single-hart, NOP
            // IPI extension - inter-processor interrupts (single-hart, NOP)
            SBI_EXT_IPI => Some((SBI_SUCCESS as u32, 0)),
            // DBCN extension - Debug Console (SBI v2.0)
            // On RV32: a0=num_bytes, a1=low32(phys_addr), a2=high32(phys_addr)
            // We store the request for the caller to fulfill via bus memory read.
            SBI_EXT_DBCN => {
                match a6 {
                    SBI_DBCN_CONSOLE_WRITE => {
                        // Store pending DBCN write request for caller to fulfill.
                        // Return success immediately -- the caller (step function)
                        // will read from guest memory and output to UART.
                        let num_bytes = a0 as usize;
                        let base_low = a1 as u64;
                        let base_high = (_a2 as u64) << 32;
                        let phys_addr = base_high | base_low;
                        self.dbcn_pending_write = Some((phys_addr, num_bytes));
                        // Return success -- caller handles the actual write
                        Some((SBI_SUCCESS as u32, num_bytes as u32))
                    }
                    SBI_DBCN_CONSOLE_READ => {
                        // Read bytes from UART rx_buf.
                        // Since handle_ecall doesn't have &mut Bus, we use
                        // a simpler approach: return the first available byte in a0.
                        if !uart.rx_buf.is_empty() {
                            let b = uart.rx_buf.remove(0);
                            if uart.rx_buf.is_empty() {
                                uart.lsr &= !0x01; // Clear Data Ready
                            }
                            // Return (success, num_bytes_read=1, byte in a0 via pending)
                            self.dbcn_pending_read = Some(b);
                            Some((SBI_SUCCESS as u32, 1))
                        } else {
                            Some((SBI_ERR_FAILURE as u32, 0))
                        }
                    }
                    SBI_DBCN_CONSOLE_WRITE_BYTE => {
                        // Write single byte: a0 = byte value
                        let ch = a0 as u8;
                        if ch != 0 {
                            uart.write_byte(0, ch);
                            self.console_output.push(ch);
                        }
                        Some((SBI_SUCCESS as u32, 0))
                    }
                    _ => Some((SBI_ERR_NOT_SUPPORTED as u32, 0)),
                }
            }
            SBI_EXT_GEOMETRY => match a6 {
                GEO_FN_VFS_READ => {
                    // DEPRECATED: GEO_VFS_READ is replaced by the Pixel VFS Surface
                    // at 0x7000_0000. Guests should use lw/sw to read/write file data
                    // as pixels instead of using this ecall. See docs/design/pixel-vfs-surface.md.
                    eprintln!(
                        "WARNING: GEO_VFS_READ ecall is deprecated. \
                         Use Pixel VFS Surface at 0x7000_0000 instead."
                    );
                    Some((SBI_ERR_NOT_SUPPORTED as u32, 0))
                }
                GEO_FN_YIELD => {
                    // Cooperative yield: round-robin to next context.
                    // Sets yield_requested flag; context switch is handled by RiscvVm.
                    self.yield_requested = true;
                    self.yield_to_context = None; // round-robin
                    Some((SBI_SUCCESS as u32, 0))
                }
                GEO_FN_YIELD_TO => {
                    // Yield to a specific context by ID (a0 = target context ID).
                    // Returns SBI_ERR_INVALID_PARAM if context does not exist.
                    self.yield_requested = true;
                    self.yield_to_context = Some(a0 as usize);
                    Some((SBI_SUCCESS as u32, 0))
                }
                GEO_FN_SPAWN => {
                    // Spawn a new context at entry point a0.
                    // Returns the new context ID in a0, or error.
                    // Actual context creation is handled by RiscvVm.
                    self.spawn_requested = Some((a0, 0)); // (entry, placeholder id)
                    Some((SBI_SUCCESS as u32, 0))
                }
                GEO_FN_KILL => {
                    // Kill context a0. Returns SBI_SUCCESS.
                    // Actual cleanup is handled by RiscvVm.
                    // For now, just acknowledge.
                    Some((SBI_SUCCESS as u32, 0))
                }
                GEO_FN_GPU_COMPUTE => {
                    // GPU compute offload:
                    //   a0 = guest_phys_addr  (base address of code to offload)
                    //   a1 = num_words        (number of u32 words of code)
                    //   a2 = max_steps        (instruction step limit per tile)
                    //   a3 = num_tiles        (number of parallel GPU tiles)
                    //   a4 = result_addr      (guest physical address for results)
                    // The bridge is fulfilled by RiscvVm::step() which has
                    // access to guest memory for the actual data transfer.
                    let code_addr = a0 as u64;
                    let num_words = a1;
                    let max_steps = _a2;
                    let num_tiles = _a3;
                    let result_addr = (_a4 as u64) | ((_a5 as u64) << 32);
                    self.gpu_compute_requested =
                        Some((code_addr, num_words, max_steps, num_tiles, result_addr));
                    Some((SBI_SUCCESS as u32, 0))
                }
                GEO_FN_SHM_ALLOC => {
                    // Allocate a shared memory region.
                    // a0 = size in bytes (rounded up to 4)
                    // a1 = flags (reserved, must be 0)
                    // Returns: a0=SBI_SUCCESS, a1=shm_id
                    let size = if a0 == 0 || a0 as usize > SHM_MAX_SIZE {
                        return Some((SBI_ERR_INVALID_PARAM as u32, 0));
                    } else {
                        a0 as usize
                    };
                    if a1 != 0 {
                        return Some((SBI_ERR_INVALID_PARAM as u32, 0));
                    }
                    if self.shm_regions.len() >= SHM_MAX_REGIONS {
                        return Some((SBI_ERR_FAILURE as u32, 0));
                    }
                    let id = self.shm_next_id;
                    self.shm_next_id += 1;
                    self.shm_regions.push(SharedMemoryRegion {
                        id,
                        size,
                        data: vec![0u8; size],
                        mapped: false,
                        map_addr: 0,
                        ref_count: 0,
                    });
                    Some((SBI_SUCCESS as u32, id))
                }
                GEO_FN_SHM_MAP => {
                    // Map a shared region into guest physical memory.
                    // a0 = shm_id
                    // a1 = phys_addr (low 32 bits) where to map
                    // Returns: a0=SBI_SUCCESS
                    // The data is NOT copied here -- the step loop fulfills this
                    // by writing shm data into guest memory. We just record the
                    // mapping intent. Multiple contexts can map the same shm_id.
                    let shm_id = a0;
                    let phys_addr = a1 as u64;
                    let region = match self.shm_regions.iter_mut().find(|r| r.id == shm_id) {
                        Some(r) => r,
                        None => return Some((SBI_ERR_INVALID_PARAM as u32, 0)),
                    };
                    region.mapped = true;
                    region.map_addr = phys_addr;
                    region.ref_count = region.ref_count.saturating_add(1);
                    Some((SBI_SUCCESS as u32, region.size as u32))
                }
                GEO_FN_SHM_UNMAP => {
                    // Unmap a shared region for the calling context.
                    // a0 = shm_id
                    // Returns: a0=SBI_SUCCESS
                    let shm_id = a0;
                    let region = match self.shm_regions.iter_mut().find(|r| r.id == shm_id) {
                        Some(r) => r,
                        None => return Some((SBI_ERR_INVALID_PARAM as u32, 0)),
                    };
                    region.ref_count = region.ref_count.saturating_sub(1);
                    if region.ref_count == 0 {
                        region.mapped = false;
                        region.map_addr = 0;
                    }
                    Some((SBI_SUCCESS as u32, 0))
                }
                GEO_FN_SHM_SIZE => {
                    // Get the size of a shared memory region.
                    // a0 = shm_id
                    // Returns: a0=SBI_SUCCESS, a1=size_in_bytes
                    let shm_id = a0;
                    match self.shm_regions.iter().find(|r| r.id == shm_id) {
                        Some(r) => Some((SBI_SUCCESS as u32, r.size as u32)),
                        None => Some((SBI_ERR_INVALID_PARAM as u32, 0)),
                    }
                }
                GEO_FN_SHM_WRITE => {
                    // Write bytes from guest memory into a shared region.
                    // a0 = shm_id, a1 = offset, a2 = src_phys_addr, a3 = len
                    // The actual data copy is fulfilled by the step loop which
                    // has access to guest memory. Here we store the request.
                    let shm_id = a0;
                    let offset = a1 as usize;
                    let src_addr = _a2 as u64;
                    let len = _a3 as usize;
                    let region = match self.shm_regions.iter().find(|r| r.id == shm_id) {
                        Some(r) => r,
                        None => return Some((SBI_ERR_INVALID_PARAM as u32, 0)),
                    };
                    if offset.saturating_add(len) > region.size || len == 0 {
                        return Some((SBI_ERR_INVALID_PARAM as u32, 0));
                    }
                    // Store pending write for step loop to fulfill.
                    // The step loop will read `len` bytes from guest phys `src_addr`
                    // and write them into region.data[offset..offset+len].
                    // For simplicity, since we don't have a generic pending-op
                    // field, we perform the write inline by storing a marker.
                    // The caller (step loop) must check sbi.shm_pending_write.
                    self.shm_pending_write = Some((shm_id, offset, src_addr, len));
                    Some((SBI_SUCCESS as u32, len as u32))
                }
                GEO_FN_SHM_READ => {
                    // Read bytes from a shared region into guest memory.
                    // a0 = shm_id, a1 = offset, a2 = dst_phys_addr, a3 = len
                    // Similar to SHM_WRITE, the actual copy is fulfilled by step loop.
                    let shm_id = a0;
                    let offset = a1 as usize;
                    let dst_addr = _a2 as u64;
                    let len = _a3 as usize;
                    let region = match self.shm_regions.iter().find(|r| r.id == shm_id) {
                        Some(r) => r,
                        None => return Some((SBI_ERR_INVALID_PARAM as u32, 0)),
                    };
                    if offset.saturating_add(len) > region.size || len == 0 {
                        return Some((SBI_ERR_INVALID_PARAM as u32, 0));
                    }
                    self.shm_pending_read = Some((shm_id, offset, dst_addr, len));
                    Some((SBI_SUCCESS as u32, len as u32))
                }
                // Phase 257: Timer and Sleep syscalls
                GEO_FN_UPTIME => {
                    // Returns elapsed ticks since boot.
                    // a0 = unused, a1 = unused
                    // Returns: a0 = SBI_SUCCESS, a1 = elapsed ticks (u32)
                    let current_mtime = clint.mtime as u32;
                    let elapsed = current_mtime.wrapping_sub(self.boot_mtime as u32);
                    Some((SBI_SUCCESS as u32, elapsed))
                }
                GEO_FN_ALARM_SET => {
                    // Register a one-shot alarm.
                    // a0 = delay_ticks (how many ticks from now to fire)
                    // a1 = callback_phys_addr (physical address to jump to on fire)
                    // Returns: a0 = SBI_SUCCESS, a1 = alarm_id (1-based) or SBI_ERR on failure
                    let delay_ticks = a0;
                    let callback = a1;
                    if delay_ticks == 0 || callback == 0 {
                        return Some((SBI_ERR_INVALID_PARAM as u32, 0));
                    }
                    let current_mtime = clint.mtime as u32;
                    let expire = (current_mtime as u64).wrapping_add(delay_ticks as u64);
                    // Find a free alarm slot (with index tracking)
                    let mut alarm_idx = None;
                    for (i, a) in self.alarms.iter_mut().enumerate() {
                        if !a.active {
                            a.active = true;
                            a.expire_mtime = expire;
                            a.callback = callback;
                            a.owner = 0; // no multi-process owner tracking yet
                            alarm_idx = Some(i + 1); // 1-based ID
                            break;
                        }
                    }
                    match alarm_idx {
                        Some(id) => Some((SBI_SUCCESS as u32, id as u32)),
                        None => Some((SBI_ERR_FAILURE as u32, 0)),
                    }
                }
                GEO_FN_ALARM_CANCEL => {
                    // Cancel a previously registered alarm.
                    // a0 = alarm_id (1-based, as returned by ALARM_SET)
                    // Returns: a0 = SBI_SUCCESS or SBI_ERR_INVALID_PARAM
                    let alarm_id = a0 as usize;
                    if alarm_id == 0 || alarm_id > self.alarms.len() {
                        return Some((SBI_ERR_INVALID_PARAM as u32, 0));
                    }
                    let slot = &mut self.alarms[alarm_id - 1];
                    if !slot.active {
                        return Some((SBI_ERR_INVALID_PARAM as u32, 0));
                    }
                    slot.active = false;
                    Some((SBI_SUCCESS as u32, 0))
                }
                GEO_FN_MSLEEP => {
                    // Sleep for N virtual ticks by advancing CLINT mtime directly.
                    // a0 = sleep_ticks (number of CLINT ticks to wait)
                    // a1 = unused
                    // Returns: a0 = SBI_SUCCESS, a1 = actual ticks elapsed
                    //
                    // In the virtual environment there is no real-time clock.
                    // Instead of busy-waiting (which would loop forever since
                    // mtime only advances in the step loop), we advance mtime
                    // directly to simulate time passage.
                    let sleep_ticks = a0;
                    if sleep_ticks == 0 {
                        return Some((SBI_ERR_INVALID_PARAM as u32, 0));
                    }
                    clint.tick_n(sleep_ticks as u64);
                    Some((SBI_SUCCESS as u32, sleep_ticks))
                }
                _ => Some((SBI_ERR_NOT_SUPPORTED as u32, 0)),
            },
            // Phase 244: Network extension (TCP connect/send/recv/disconnect)
            SBI_EXT_NET => {
                let a1 = a1;
                let a2 = _a2;
                match a6 {
                    NET_FN_CONNECT => {
                        // a0 = IP address packed as big-endian octets
                        //       (0x7F000001 = 127.0.0.1)
                        // a1 = port (u16)
                        let ip_bytes = a0.to_be_bytes();
                        let ip = std::net::Ipv4Addr::new(
                            ip_bytes[0],
                            ip_bytes[1],
                            ip_bytes[2],
                            ip_bytes[3],
                        );
                        let port = a1 as u16;
                        let addr = std::net::SocketAddr::new(ip.into(), port);
                        match self.net_sockets.iter().position(|s| s.is_none()) {
                            None => Some((SBI_ERR_FAILURE as u32, 0)),
                            Some(slot) => {
                                match std::net::TcpStream::connect_timeout(
                                    &addr,
                                    std::time::Duration::from_secs(2),
                                ) {
                                    Ok(mut stream) => {
                                        stream
                                            .set_read_timeout(Some(std::time::Duration::from_secs(
                                                1,
                                            )))
                                            .ok();
                                        stream
                                            .set_write_timeout(Some(
                                                std::time::Duration::from_secs(1),
                                            ))
                                            .ok();
                                        self.net_sockets[slot] = Some(stream);
                                        // a0=success, a1=socket_id
                                        Some((SBI_SUCCESS as u32, slot as u32))
                                    }
                                    Err(_) => Some((SBI_ERR_FAILURE as u32, 0)),
                                }
                            }
                        }
                    }
                    NET_FN_SEND => {
                        // a0 = socket_id, a1 = buf_phys_addr, a2 = len
                        let sid = a0 as u8;
                        if sid >= 4 || self.net_sockets[sid as usize].is_none() {
                            Some((SBI_ERR_INVALID_PARAM as u32, 0))
                        } else {
                            self.net_pending = Some(NetPendingOp {
                                kind: NetOpKind::Send,
                                socket_id: sid,
                                buf_addr: a1 as u64,
                                len: a2 as usize,
                            });
                            Some((SBI_SUCCESS as u32, 0))
                        }
                    }
                    NET_FN_RECV => {
                        // a0 = socket_id, a1 = buf_phys_addr, a2 = len
                        let sid = a0 as u8;
                        if sid >= 4 || self.net_sockets[sid as usize].is_none() {
                            Some((SBI_ERR_INVALID_PARAM as u32, 0))
                        } else {
                            self.net_pending = Some(NetPendingOp {
                                kind: NetOpKind::Recv,
                                socket_id: sid,
                                buf_addr: a1 as u64,
                                len: a2 as usize,
                            });
                            Some((SBI_SUCCESS as u32, 0))
                        }
                    }
                    NET_FN_DISCONNECT => {
                        // a0 = socket_id
                        let sid = a0 as u8;
                        if sid < 4 {
                            self.net_sockets[sid as usize] = None;
                            Some((SBI_SUCCESS as u32, 0))
                        } else {
                            Some((SBI_ERR_INVALID_PARAM as u32, 0))
                        }
                    }
                    _ => Some((SBI_ERR_NOT_SUPPORTED as u32, 0)),
                }
            }
            _ => None, // Not an SBI call
        }
    }
}

impl Default for Sbi {
    #[allow(deprecated)]
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::super::clint::Clint;
    use super::*;

    #[test]
    fn test_sbi_console_putchar() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        let result = sbi.handle_ecall(
            SBI_CONSOLE_PUTCHAR,
            0,
            b'A' as u32,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert!(result.is_some());
        let (a0, a1) = result.expect("operation should succeed");
        assert_eq!(a0, SBI_SUCCESS as u32);
        assert_eq!(a1, 0);
        assert_eq!(sbi.console_output, vec![b'A']);
    }

    #[test]
    fn test_sbi_console_putchar_null() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        sbi.handle_ecall(
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
    fn test_sbi_getchar() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        // Legacy SBI_CONSOLE_GETCHAR uses a6!=0 (e.g., a6=1)
        let result = sbi.handle_ecall(
            SBI_CONSOLE_GETCHAR,
            1,
            0,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert!(result.is_some());
        let (a0, _) = result.expect("operation should succeed");
        assert_eq!(a0, 0xFFFFFFFF); // -1 = no char
    }

    #[test]
    fn test_sbi_v02_console_putchar() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        // Legacy SBI console putchar: a7=1, a0=char
        let result = sbi.handle_ecall(
            SBI_CONSOLE_PUTCHAR,
            0,
            b'X' as u32,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert!(result.is_some());
        let (a0, _) = result.expect("operation should succeed");
        assert_eq!(a0, SBI_SUCCESS as u32);
        assert_eq!(sbi.console_output, vec![b'X']);
    }

    #[test]
    fn test_sbi_base_get_spec_version() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        let result = sbi.handle_ecall(SBI_EXT_BASE, 0, 0, 0, 0, 0, 0, 0, &mut uart, &mut clint);
        assert_eq!(result, Some((0, 0x02000000))); // a0=success, a1=version 2.0
    }

    #[test]
    fn test_sbi_unknown_extension() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        let result = sbi.handle_ecall(0x999, 0, 0, 0, 0, 0, 0, 0, &mut uart, &mut clint);
        assert!(result.is_none());
    }

    #[test]
    fn test_sbi_shutdown() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        sbi.handle_ecall(SBI_SHUTDOWN, 0, 0, 0, 0, 0, 0, 0, &mut uart, &mut clint);
        assert!(sbi.shutdown_requested);
    }

    #[test]
    fn test_sbi_system_reset() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        sbi.handle_ecall(
            SBI_EXT_SYSTEM_RESET,
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
        assert!(sbi.shutdown_requested);
    }

    #[test]
    fn test_sbi_base_probe_extension() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();

        // Probe known extension
        let result = sbi.handle_ecall(
            SBI_EXT_BASE,
            3,
            SBI_EXT_CONSOLE_PUTCHAR,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(result, Some((0, 1))); // a0=success, a1=available

        // Probe unknown extension
        let result = sbi.handle_ecall(SBI_EXT_BASE, 3, 0x999, 0, 0, 0, 0, 0, &mut uart, &mut clint);
        assert_eq!(result, Some((0, 0))); // a0=success, a1=not available
    }

    #[test]
    fn test_sbi_set_timer_64bit() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        // Test with 64-bit value: a0=low bits, a1=high bits
        let result = sbi.handle_ecall(
            SBI_SET_TIMER,
            0,
            0xDEAD,
            0xBEEF,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(result, Some((SBI_SUCCESS as u32, 0)));
        assert_eq!(clint.mtimecmp, 0xBEEF0000DEAD);
    }

    #[test]
    fn test_sbi_set_timer_v02_ext_64bit() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        // SBI v0.2 timer extension: a0=low, a1=high
        let result = sbi.handle_ecall(
            SBI_EXT_TIMER,
            0,
            0xCAFE,
            0xF00D,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(result, Some((SBI_SUCCESS as u32, 0)));
        assert_eq!(clint.mtimecmp, 0xF00D0000CAFE);
    }

    #[test]
    fn test_sbi_hart_state_start_primary() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        // hart 0 (our CPU) should succeed
        let r = sbi.handle_ecall(
            SBI_EXT_HART_STATE,
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
        assert_eq!(r, Some((SBI_SUCCESS as u32, 0)));
        // hart 1 (secondary) should fail -- we only emulate 1 hart
        let r = sbi.handle_ecall(
            SBI_EXT_HART_STATE,
            0,
            1,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_ERR_FAILURE as u32, 0)));
    }

    #[test]
    fn test_sbi_hart_state_get_status() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        // hart 0 should report started
        let r = sbi.handle_ecall(
            SBI_EXT_HART_STATE,
            2,
            0,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((0, 0)));
        // hart 1 should report not available
        let r = sbi.handle_ecall(
            SBI_EXT_HART_STATE,
            2,
            1,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_ERR_FAILURE as u32, 0)));
    }

    #[test]
    fn test_sbi_geo_gpu_compute_sets_pending() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();

        // GEO_FN_GPU_COMPUTE = 5, a0=code_addr, a1=num_words, a2=max_steps,
        // a3=num_tiles, a4=low(result_addr), a5=high(result_addr)
        let r = sbi.handle_ecall(
            SBI_EXT_GEOMETRY,
            5,              // GEO_FN_GPU_COMPUTE
            0x8000_1000u32, // code_addr (low 32 bits)
            16,             // num_words
            1000,           // max_steps
            4,              // num_tiles
            0x2000u32,      // result_addr low
            0x8000u32,      // result_addr high
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((SBI_SUCCESS as u32, 0)));

        // Check that gpu_compute_requested was set
        let req = sbi
            .gpu_compute_requested
            .expect("GPU compute should be pending");
        assert_eq!(req.0, 0x8000_1000u64); // code_addr
        assert_eq!(req.1, 16); // num_words
        assert_eq!(req.2, 1000); // max_steps
        assert_eq!(req.3, 4); // num_tiles
        assert_eq!(req.4, 0x0000_8000_0000_2000u64); // result_addr
    }

    #[test]
    fn test_sbi_geo_gpu_compute_probe_reports_available() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();

        // SBI_EXT_GEOMETRY should be reported as available in PROBE_EXTENSION
        let r = sbi.handle_ecall(
            SBI_EXT_BASE,
            3, // PROBE_EXTENSION
            SBI_EXT_GEOMETRY,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert_eq!(r, Some((0, 1))); // available
    }

    #[test]
    fn test_sbi_net_probe_extension() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        // SBI_BASE_PROBE_EXTENSION (function 3) with a0=SBI_EXT_NET
        let result = sbi.handle_ecall(
            SBI_EXT_BASE,
            3,
            SBI_EXT_NET,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert!(result.is_some());
        let (a0, a1) = result.unwrap();
        assert_eq!(a0, 0); // success
        assert_eq!(a1, 1); // available
    }

    #[test]
    fn test_sbi_net_connect_invalid_socket() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        // NET_FN_RECV on non-existent socket should return INVALID_PARAM
        let result = sbi.handle_ecall(
            SBI_EXT_NET,
            NET_FN_RECV,
            0,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert!(result.is_some());
        let (a0, _) = result.unwrap();
        assert_eq!(a0, SBI_ERR_INVALID_PARAM as u32);
    }

    #[test]
    fn test_sbi_net_disconnect_invalid() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        // NET_FN_DISCONNECT on slot >= 4 should return INVALID_PARAM
        let result = sbi.handle_ecall(
            SBI_EXT_NET,
            NET_FN_DISCONNECT,
            5,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert!(result.is_some());
        let (a0, _) = result.unwrap();
        assert_eq!(a0, SBI_ERR_INVALID_PARAM as u32);
    }

    #[test]
    fn test_sbi_net_send_invalid_socket() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        // NET_FN_SEND on non-existent socket should return INVALID_PARAM
        let result = sbi.handle_ecall(
            SBI_EXT_NET,
            NET_FN_SEND,
            2,
            0x1000,
            100,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert!(result.is_some());
        let (a0, _) = result.unwrap();
        assert_eq!(a0, SBI_ERR_INVALID_PARAM as u32);
    }

    #[test]
    fn test_sbi_net_unknown_function() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        // Unknown NET function should return NOT_SUPPORTED
        let result = sbi.handle_ecall(SBI_EXT_NET, 99, 0, 0, 0, 0, 0, 0, &mut uart, &mut clint);
        assert!(result.is_some());
        let (a0, _) = result.unwrap();
        assert_eq!(a0, SBI_ERR_NOT_SUPPORTED as u32);
    }

    /// Integration test: full TCP connect/send/recv/disconnect lifecycle
    /// against a real local TCP server.
    #[test]
    fn test_sbi_net_connect_send_recv_lifecycle() {
        use std::io::{Read, Write};
        use std::net::TcpListener;
        use std::thread;

        // Start a local TCP echo server
        let listener = TcpListener::bind("127.0.0.1:0").expect("bind");
        let port = listener.local_addr().unwrap().port();
        let server = thread::spawn(move || {
            let (mut conn, _) = listener.accept().expect("accept");
            // Read until we get all 5 bytes (may take multiple read calls)
            let mut buf = [0u8; 256];
            let mut total = 0usize;
            while total < 5 {
                let n = conn.read(&mut buf[total..]).expect("read");
                if n == 0 {
                    break;
                }
                total += n;
            }
            // Echo back with prefix
            conn.write_all(b"ACK:").expect("write prefix");
            conn.write_all(&buf[..total]).expect("write data");
            conn.flush().expect("flush");
        });

        // Pack IP as big-endian: 127.0.0.1 = 0x7F000001
        let ip_packed: u32 = (127u32 << 24) | (0u32 << 16) | (0u32 << 8) | 1u32;

        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();

        // Step 1: Connect
        let result = sbi.handle_ecall(
            SBI_EXT_NET,
            NET_FN_CONNECT,
            ip_packed,
            port as u32,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert!(result.is_some());
        let (a0, a1) = result.unwrap();
        assert_eq!(a0, SBI_SUCCESS as u32, "connect should succeed");
        let socket_id = a1 as u8;
        assert!(socket_id < 4, "socket_id should be 0-3");

        // Step 2: Send (sets net_pending)
        let result = sbi.handle_ecall(
            SBI_EXT_NET,
            NET_FN_SEND,
            socket_id as u32,
            0x1000,
            5,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert!(result.is_some());
        let (a0, _) = result.unwrap();
        assert_eq!(a0, SBI_SUCCESS as u32, "send should set pending");
        assert!(sbi.net_pending.is_some());

        // Simulate the system.rs pending-op handler by processing the send
        // with a mock bus that has "HELLO" at address 0x1000
        if let Some(op) = sbi.net_pending.take() {
            let sid = op.socket_id as usize;
            let socket = sbi.net_sockets[sid].take();
            if let Some(mut stream) = socket {
                stream.set_nodelay(true).ok();
                // Write "HELLO" directly (simulating guest memory at 0x1000)
                let data = b"HELLO";
                let result = match stream.write_all(data) {
                    Ok(()) => {
                        stream.flush().ok();
                        data.len() as u32
                    }
                    Err(_) => SBI_ERR_FAILURE as u32,
                };
                sbi.net_sockets[sid] = Some(stream);
                assert_eq!(result, 5);
            }
        }

        // Small delay to let server process and respond
        thread::sleep(std::time::Duration::from_millis(50));

        // Step 3: Recv (sets net_pending)
        let result = sbi.handle_ecall(
            SBI_EXT_NET,
            NET_FN_RECV,
            socket_id as u32,
            0x2000,
            32,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert!(result.is_some());
        let (a0, _) = result.unwrap();
        assert_eq!(a0, SBI_SUCCESS as u32, "recv should set pending");
        assert!(sbi.net_pending.is_some());

        // Simulate recv processing
        let mut recv_buf = vec![0u8; 32];
        if let Some(op) = sbi.net_pending.take() {
            let sid = op.socket_id as usize;
            let socket = sbi.net_sockets[sid].take();
            if let Some(mut stream) = socket {
                let n = stream.read(&mut recv_buf[..op.len]).expect("recv read");
                sbi.net_sockets[sid] = Some(stream);
                assert!(n > 0, "should receive data");
                let response = String::from_utf8_lossy(&recv_buf[..n]);
                assert!(
                    response.starts_with("ACK:HELLO"),
                    "expected 'ACK:HELLO', got '{}'",
                    response
                );
            }
        }

        // Step 4: Disconnect
        let result = sbi.handle_ecall(
            SBI_EXT_NET,
            NET_FN_DISCONNECT,
            socket_id as u32,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert!(result.is_some());
        let (a0, _) = result.unwrap();
        assert_eq!(a0, SBI_SUCCESS as u32, "disconnect should succeed");
        assert!(sbi.net_sockets[socket_id as usize].is_none());

        // Wait for server thread
        server.join().expect("server thread");
    }

    /// Test that socket slots are reused after disconnect.
    #[test]
    fn test_sbi_net_socket_slot_reuse() {
        use std::io::{Read, Write};
        use std::net::TcpListener;
        use std::thread;

        let listener = TcpListener::bind("127.0.0.1:0").expect("bind");
        let port = listener.local_addr().unwrap().port();
        let server = thread::spawn(move || {
            // Accept two connections sequentially
            for _ in 0..2 {
                let (mut conn, _) = listener.accept().expect("accept");
                let mut buf = [0u8; 64];
                let _ = conn.read(&mut buf);
                conn.write_all(b"OK").expect("write");
                conn.flush().expect("flush");
            }
        });

        let ip_packed: u32 = (127u32 << 24) | 1u32;

        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();

        // Connect first socket
        let result = sbi.handle_ecall(
            SBI_EXT_NET,
            NET_FN_CONNECT,
            ip_packed,
            port as u32,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        let (_, slot1) = result.unwrap();
        assert_eq!(slot1, 0, "first socket should be slot 0");

        // Connect second socket
        let result = sbi.handle_ecall(
            SBI_EXT_NET,
            NET_FN_CONNECT,
            ip_packed,
            port as u32,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        let (_, slot2) = result.unwrap();
        assert_eq!(slot2, 1, "second socket should be slot 1");

        // Disconnect slot 0
        sbi.handle_ecall(
            SBI_EXT_NET,
            NET_FN_DISCONNECT,
            slot1,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert!(sbi.net_sockets[0].is_none());

        // Connect again -- should reuse slot 0
        let result = sbi.handle_ecall(
            SBI_EXT_NET,
            NET_FN_CONNECT,
            ip_packed,
            port as u32,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        let (_, slot3) = result.unwrap();
        assert_eq!(slot3, 0, "should reuse freed slot 0");

        // Disconnect remaining
        sbi.handle_ecall(
            SBI_EXT_NET,
            NET_FN_DISCONNECT,
            slot2,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        sbi.handle_ecall(
            SBI_EXT_NET,
            NET_FN_DISCONNECT,
            slot3,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );

        server.join().expect("server thread");
    }

    // Phase 256: Shared memory SBI extension tests
    #[test]
    fn test_shm_alloc_basic() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        // Allocate 256 bytes
        let result = sbi.handle_ecall(
            SBI_EXT_GEOMETRY,
            GEO_FN_SHM_ALLOC,
            256, // size
            0,   // flags
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        assert!(result.is_some());
        let (a0, a1) = result.unwrap();
        assert_eq!(a0, SBI_SUCCESS as u32);
        assert_eq!(a1, 1); // first ID
        assert_eq!(sbi.shm_regions.len(), 1);
        assert_eq!(sbi.shm_regions[0].size, 256);
        assert_eq!(sbi.shm_regions[0].data.len(), 256);
        assert!(!sbi.shm_regions[0].mapped);
        assert_eq!(sbi.shm_regions[0].ref_count, 0);
    }

    #[test]
    fn test_shm_alloc_sequential_ids() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        let (_, id1) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_ALLOC,
                64,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        let (_, id2) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_ALLOC,
                128,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(id1, 1);
        assert_eq!(id2, 2);
        assert_eq!(sbi.shm_regions.len(), 2);
    }

    #[test]
    fn test_shm_alloc_zero_size_fails() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        let (a0, _) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_ALLOC,
                0,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_ERR_INVALID_PARAM as u32);
        assert_eq!(sbi.shm_regions.len(), 0);
    }

    #[test]
    fn test_shm_alloc_too_large_fails() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        let (a0, _) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_ALLOC,
                (SHM_MAX_SIZE + 1) as u32,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_ERR_INVALID_PARAM as u32);
    }

    #[test]
    fn test_shm_alloc_invalid_flags_fails() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        let (a0, _) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_ALLOC,
                64,
                1,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_ERR_INVALID_PARAM as u32);
    }

    #[test]
    fn test_shm_alloc_max_regions() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        // Fill all 16 slots
        for _ in 0..SHM_MAX_REGIONS {
            let (a0, _) = sbi
                .handle_ecall(
                    SBI_EXT_GEOMETRY,
                    GEO_FN_SHM_ALLOC,
                    64,
                    0,
                    0,
                    0,
                    0,
                    0,
                    &mut uart,
                    &mut clint,
                )
                .unwrap();
            assert_eq!(a0, SBI_SUCCESS as u32);
        }
        assert_eq!(sbi.shm_regions.len(), SHM_MAX_REGIONS);
        // 17th should fail
        let (a0, _) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_ALLOC,
                64,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_ERR_FAILURE as u32);
    }

    #[test]
    fn test_shm_map_basic() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        let (_, shm_id) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_ALLOC,
                256,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        // Map at physical address 0x100000
        let (a0, a1) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_MAP,
                shm_id,
                0x100000,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_SUCCESS as u32);
        assert_eq!(a1, 256); // returns size
        let region = sbi.shm_regions.iter().find(|r| r.id == shm_id).unwrap();
        assert!(region.mapped);
        assert_eq!(region.map_addr, 0x100000);
        assert_eq!(region.ref_count, 1);
    }

    #[test]
    fn test_shm_map_invalid_id() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        let (a0, _) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_MAP,
                99,
                0x100000,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_ERR_INVALID_PARAM as u32);
    }

    #[test]
    fn test_shm_unmap() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        let (_, shm_id) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_ALLOC,
                128,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        // Map twice (two contexts)
        sbi.handle_ecall(
            SBI_EXT_GEOMETRY,
            GEO_FN_SHM_MAP,
            shm_id,
            0x100000,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        sbi.handle_ecall(
            SBI_EXT_GEOMETRY,
            GEO_FN_SHM_MAP,
            shm_id,
            0x200000,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        let region = sbi.shm_regions.iter().find(|r| r.id == shm_id).unwrap();
        assert_eq!(region.ref_count, 2);

        // Unmap once
        let (a0, _) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_UNMAP,
                shm_id,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_SUCCESS as u32);
        let region = sbi.shm_regions.iter().find(|r| r.id == shm_id).unwrap();
        assert_eq!(region.ref_count, 1);
        assert!(region.mapped); // still mapped by other context

        // Unmap again
        sbi.handle_ecall(
            SBI_EXT_GEOMETRY,
            GEO_FN_SHM_UNMAP,
            shm_id,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        let region = sbi.shm_regions.iter().find(|r| r.id == shm_id).unwrap();
        assert_eq!(region.ref_count, 0);
        assert!(!region.mapped); // fully unmapped
    }

    #[test]
    fn test_shm_size() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        let (_, shm_id) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_ALLOC,
                1024,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        let (a0, a1) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_SIZE,
                shm_id,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_SUCCESS as u32);
        assert_eq!(a1, 1024);
    }

    #[test]
    fn test_shm_size_invalid_id() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        let (a0, _) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_SIZE,
                99,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_ERR_INVALID_PARAM as u32);
    }

    #[test]
    fn test_shm_write_sets_pending() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        let (_, shm_id) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_ALLOC,
                64,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        // Write 4 bytes at offset 0 from phys addr 0x500000
        let (a0, a1) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_WRITE,
                shm_id,
                0, // offset
                0x500000,
                4, // src_phys_addr, len
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_SUCCESS as u32);
        assert_eq!(a1, 4);
        assert!(sbi.shm_pending_write.is_some());
        let (w_id, w_off, w_addr, w_len) = sbi.shm_pending_write.unwrap();
        assert_eq!(w_id, shm_id);
        assert_eq!(w_off, 0);
        assert_eq!(w_addr, 0x500000);
        assert_eq!(w_len, 4);
    }

    #[test]
    fn test_shm_write_out_of_bounds() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        let (_, shm_id) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_ALLOC,
                64,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        // Write past end of region
        let (a0, _) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_WRITE,
                shm_id,
                60,
                0x500000,
                10, // offset=60, len=10 -> 70 > 64
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_ERR_INVALID_PARAM as u32);
    }

    #[test]
    fn test_shm_read_sets_pending() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        let (_, shm_id) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_ALLOC,
                64,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        let (a0, a1) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_READ,
                shm_id,
                8, // offset
                0x600000,
                16, // dst_phys_addr, len
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_SUCCESS as u32);
        assert_eq!(a1, 16);
        assert!(sbi.shm_pending_read.is_some());
        let (r_id, r_off, r_addr, r_len) = sbi.shm_pending_read.unwrap();
        assert_eq!(r_id, shm_id);
        assert_eq!(r_off, 8);
        assert_eq!(r_addr, 0x600000);
        assert_eq!(r_len, 16);
    }

    #[test]
    fn test_shm_read_out_of_bounds() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        let (_, shm_id) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_ALLOC,
                32,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        let (a0, _) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_READ,
                shm_id,
                0,
                0x600000,
                0, // len=0 -> invalid
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_ERR_INVALID_PARAM as u32);
    }

    #[test]
    fn test_shm_probe_extension_available() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        // PROBE_EXTENSION for GEO should return available (1)
        let (a0, a1) = sbi
            .handle_ecall(
                SBI_EXT_BASE,
                3,
                SBI_EXT_GEOMETRY,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, 0); // success
        assert_eq!(a1, 1); // available
    }

    #[test]
    fn test_shm_data_isolated_between_regions() {
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        // Allocate two regions
        let (_, id1) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_ALLOC,
                16,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        let (_, id2) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_SHM_ALLOC,
                16,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        // Write to region 1
        sbi.shm_regions
            .iter_mut()
            .find(|r| r.id == id1)
            .unwrap()
            .data[0] = 0xAB;
        sbi.shm_regions
            .iter_mut()
            .find(|r| r.id == id2)
            .unwrap()
            .data[0] = 0xCD;
        // Verify isolation
        let r1 = sbi.shm_regions.iter().find(|r| r.id == id1).unwrap();
        let r2 = sbi.shm_regions.iter().find(|r| r.id == id2).unwrap();
        assert_eq!(r1.data[0], 0xAB);
        assert_eq!(r2.data[0], 0xCD);
    }

    // --- Phase 257: Timer and Sleep syscall tests ---

    #[test]
    fn test_uptime_returns_zero_initially() {
        use super::*;
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        // mtime starts at 0, boot_mtime starts at 0, so elapsed = 0
        let (a0, a1) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_UPTIME,
                0,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_SUCCESS as u32);
        assert_eq!(a1, 0);
    }

    #[test]
    fn test_uptime_returns_elapsed_after_ticks() {
        use super::*;
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        // Advance CLINT by 1000 ticks
        clint.tick_n(1000);
        let (a0, a1) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_UPTIME,
                0,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_SUCCESS as u32);
        assert_eq!(a1, 1000);
    }

    #[test]
    fn test_uptime_wrapping() {
        use super::*;
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        // Set boot_mtime to u64::MAX - 50, then advance 100 ticks
        sbi.boot_mtime = u64::MAX - 50;
        clint.tick_n(100);
        let (a0, a1) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_UPTIME,
                0,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_SUCCESS as u32);
        // 100 - (MAX - 50) = 100 + 50 + 1 = 151 (wrapping)
        assert_eq!(a1, 151);
    }

    #[test]
    fn test_alarm_set_and_cancel() {
        use super::*;
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();
        // Set alarm: fire in 100 ticks, callback at PA 0x2000
        let (a0, a1) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_ALARM_SET,
                100,
                0x2000,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_SUCCESS as u32);
        assert_eq!(a1, 1); // alarm_id = 1

        // Cancel alarm 1
        let (a0, _) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_ALARM_CANCEL,
                1,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_SUCCESS as u32);

        // Canceling again should fail (already inactive)
        let (a0, _) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_ALARM_CANCEL,
                1,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_ERR_INVALID_PARAM as u32);
    }

    #[test]
    fn test_alarm_set_invalid_params() {
        use super::*;
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();

        // delay_ticks = 0
        let (a0, _) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_ALARM_SET,
                0,
                0x1000,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_ERR_INVALID_PARAM as u32);

        // callback = 0
        let (a0, _) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_ALARM_SET,
                50,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_ERR_INVALID_PARAM as u32);
    }

    #[test]
    fn test_alarm_set_multiple() {
        use super::*;
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();

        // Fill all alarm slots
        for i in 0..GEO_MAX_ALARMS {
            let (a0, a1) = sbi
                .handle_ecall(
                    SBI_EXT_GEOMETRY,
                    GEO_FN_ALARM_SET,
                    (100 + i * 10) as u32,
                    (0x1000 + i as u32) * 4,
                    0,
                    0,
                    0,
                    0,
                    &mut uart,
                    &mut clint,
                )
                .unwrap();
            assert_eq!(a0, SBI_SUCCESS as u32);
            assert_eq!(a1, (i + 1) as u32);
        }

        // Next one should fail (all slots used)
        let (a0, _) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_ALARM_SET,
                999,
                0xBEEF,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_ERR_FAILURE as u32);
    }

    #[test]
    fn test_alarm_cancel_invalid_id() {
        use super::*;
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();

        // alarm_id = 0 (invalid)
        let (a0, _) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_ALARM_CANCEL,
                0,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_ERR_INVALID_PARAM as u32);

        // alarm_id > max (invalid)
        let (a0, _) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_ALARM_CANCEL,
                (GEO_MAX_ALARMS + 1) as u32,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_ERR_INVALID_PARAM as u32);
    }

    #[test]
    fn test_check_alarms_fires_correctly() {
        use super::*;
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();

        // Set alarm: fire in 50 ticks
        sbi.handle_ecall(
            SBI_EXT_GEOMETRY,
            GEO_FN_ALARM_SET,
            50,
            0x2000,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );

        // Check at mtime=49: no fire
        clint.tick_n(49);
        let fired = sbi.check_alarms(clint.mtime);
        assert!(fired.is_empty());

        // Check at mtime=50: fires
        clint.tick_n(1);
        let fired = sbi.check_alarms(clint.mtime);
        assert_eq!(fired.len(), 1);
        assert_eq!(fired[0], (1, 0x2000)); // alarm_id=1, callback=0x2000

        // Check again at mtime=50: already deactivated, no fire
        let fired = sbi.check_alarms(clint.mtime);
        assert!(fired.is_empty());
    }

    #[test]
    fn test_check_alarms_multiple_fire() {
        use super::*;
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();

        // Set two alarms: one at +10, one at +20
        sbi.handle_ecall(
            SBI_EXT_GEOMETRY,
            GEO_FN_ALARM_SET,
            10,
            0x1000,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );
        sbi.handle_ecall(
            SBI_EXT_GEOMETRY,
            GEO_FN_ALARM_SET,
            20,
            0x2000,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );

        // At mtime=15: only first fires
        clint.tick_n(15);
        let fired = sbi.check_alarms(clint.mtime);
        assert_eq!(fired.len(), 1);
        assert_eq!(fired[0].0, 1); // alarm 1

        // At mtime=25: second fires
        clint.tick_n(10);
        let fired = sbi.check_alarms(clint.mtime);
        assert_eq!(fired.len(), 1);
        assert_eq!(fired[0].0, 2); // alarm 2
    }

    #[test]
    fn test_msleep_advances_clint() {
        use super::*;
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();

        // mtime starts at 0
        assert_eq!(clint.mtime, 0);

        // Sleep for 500 ticks
        let (a0, a1) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_MSLEEP,
                500,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_SUCCESS as u32);
        assert_eq!(a1, 500);

        // mtime should now be 500
        assert_eq!(clint.mtime, 500);
    }

    #[test]
    fn test_msleep_zero_invalid() {
        use super::*;
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();

        let (a0, _) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_MSLEEP,
                0,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_ERR_INVALID_PARAM as u32);
    }

    #[test]
    fn test_msleep_then_uptime() {
        use super::*;
        let mut sbi = Sbi::new();
        let mut uart = Uart::new();
        let mut clint = Clint::new();

        // Sleep for 200 ticks
        sbi.handle_ecall(
            SBI_EXT_GEOMETRY,
            GEO_FN_MSLEEP,
            200,
            0,
            0,
            0,
            0,
            0,
            &mut uart,
            &mut clint,
        );

        // Uptime should reflect the 200 ticks
        let (a0, a1) = sbi
            .handle_ecall(
                SBI_EXT_GEOMETRY,
                GEO_FN_UPTIME,
                0,
                0,
                0,
                0,
                0,
                0,
                &mut uart,
                &mut clint,
            )
            .unwrap();
        assert_eq!(a0, SBI_SUCCESS as u32);
        assert_eq!(a1, 200);
    }

    /// End-to-end integration test: guest program exercises timer/sleep syscalls
    /// via the full CPU step loop (decode -> execute -> ECALL -> SBI dispatch).
    ///
    /// This verifies the complete instruction path, not just the SBI handler in isolation.
    /// The test writes RISC-V instructions to guest RAM, sets registers, and steps
    /// the VM through ECALL sequences.
    ///
    /// ECALL instruction encoding: 0x00000073
    /// Register convention: a7=extension, a6=function, a0-a5=args, a0=return
    #[test]
    fn test_timer_sleep_e2e_via_step_loop() {
        use crate::riscv::RiscvVm;

        let mut vm = RiscvVm::new_with_base(0x8000_0000, 1024 * 1024);
        vm.cpu.privilege = crate::riscv::cpu::Privilege::Supervisor;

        // Write ECALL instruction at address 0x8000_0000
        // We'll reuse the same address by setting PC back before each ecall
        let base_addr = 0x8000_0000u64;
        let _ = vm.bus.mem.write_word(base_addr, 0x0000_0073); // ECALL

        // ---- Test 1: geos_uptime() via ECALL ----
        // a7 = SBI_EXT_GEOMETRY (0x47454F00), a6 = GEO_FN_UPTIME (12)
        vm.cpu.x[17] = 0x47454F00;
        vm.cpu.x[16] = 12; // GEO_FN_UPTIME
        vm.cpu.x[10] = 0;
        vm.cpu.x[11] = 0;
        vm.cpu.pc = base_addr as u32;
        let result = vm.step();
        assert_eq!(result, crate::riscv::StepResult::Ok);
        // a0 should be SBI_SUCCESS (0), a1 should be elapsed ticks (initially 0)
        assert_eq!(vm.cpu.x[10], 0); // SBI_SUCCESS
        assert_eq!(vm.cpu.x[11], 0); // 0 ticks elapsed

        // ---- Test 2: geos_msleep(500) via ECALL ----
        vm.cpu.x[17] = 0x47454F00;
        vm.cpu.x[16] = 15; // GEO_FN_MSLEEP
        vm.cpu.x[10] = 500; // sleep 500 ticks
        vm.cpu.pc = base_addr as u32;
        let result = vm.step();
        assert_eq!(result, crate::riscv::StepResult::Ok);
        // a0 should be SBI_SUCCESS (0)
        assert_eq!(vm.cpu.x[10], 0);

        // ---- Test 3: geos_uptime() should now show 500 ticks ----
        vm.cpu.x[17] = 0x47454F00;
        vm.cpu.x[16] = 12; // GEO_FN_UPTIME
        vm.cpu.x[10] = 0;
        vm.cpu.x[11] = 0;
        vm.cpu.pc = base_addr as u32;
        let result = vm.step();
        assert_eq!(result, crate::riscv::StepResult::Ok);
        assert_eq!(vm.cpu.x[10], 0); // SBI_SUCCESS
        assert_eq!(vm.cpu.x[11], 500); // 500 ticks elapsed after msleep(500)

        // ---- Test 4: geos_alarm_set(1000, 0x80100000) via ECALL ----
        // Register alarm with callback=0x80100000 (no actual code there, but tests the path)
        vm.cpu.x[17] = 0x47454F00;
        vm.cpu.x[16] = 13; // GEO_FN_ALARM_SET
        vm.cpu.x[10] = 1000; // delay in ticks
        vm.cpu.x[11] = 0x8010_0000; // callback address
        vm.cpu.pc = base_addr as u32;
        let result = vm.step();
        assert_eq!(result, crate::riscv::StepResult::Ok);
        // a0 should be SBI_SUCCESS (0), a1 should be alarm_id (0)
        assert_eq!(vm.cpu.x[10], 0);
        assert_eq!(vm.cpu.x[11], 0); // first alarm slot

        // ---- Test 5: geos_alarm_cancel(0) via ECALL ----
        vm.cpu.x[17] = 0x47454F00;
        vm.cpu.x[16] = 14; // GEO_FN_ALARM_CANCEL
        vm.cpu.x[10] = 0; // alarm_id to cancel
        vm.cpu.pc = base_addr as u32;
        let result = vm.step();
        assert_eq!(result, crate::riscv::StepResult::Ok);
        // a0 should be SBI_SUCCESS (0)
        assert_eq!(vm.cpu.x[10], 0);

        // ---- Test 6: geos_msleep(0) should return error ----
        vm.cpu.x[17] = 0x47454F00;
        vm.cpu.x[16] = 15; // GEO_FN_MSLEEP
        vm.cpu.x[10] = 0; // zero ticks = invalid
        vm.cpu.pc = base_addr as u32;
        let result = vm.step();
        assert_eq!(result, crate::riscv::StepResult::Ok);
        // a0 should be SBI_ERR_INVALID_PARAM (-2)
        assert_eq!(vm.cpu.x[10] as i32, -2);
    }

    /// End-to-end test: alarm fires after CLINT advances past expiry.
    /// Verifies that the step loop in RiscvVm::step() correctly fires
    /// alarms by jumping to the callback address.
    #[test]
    fn test_alarm_fires_e2e_via_step_loop() {
        use crate::riscv::RiscvVm;

        let mut vm = RiscvVm::new_with_base(0x8000_0000, 1024 * 1024);
        vm.cpu.privilege = crate::riscv::cpu::Privilege::Supervisor;

        let base_addr = 0x8000_0000u64;
        let _ = vm.bus.mem.write_word(base_addr, 0x0000_0073); // ECALL

        // Set up alarm: delay=100 ticks, callback=0x8010_0000
        vm.cpu.x[17] = 0x47454F00;
        vm.cpu.x[16] = 13; // GEO_FN_ALARM_SET
        vm.cpu.x[10] = 100;
        vm.cpu.x[11] = 0x8010_0000; // callback address
        vm.cpu.pc = base_addr as u32;
        let result = vm.step();
        assert_eq!(result, crate::riscv::StepResult::Ok);
        assert_eq!(vm.cpu.x[10], 0); // SBI_SUCCESS

        // PC should be past the ECALL (base_addr + 4)
        assert_eq!(vm.cpu.pc, (base_addr + 4) as u32);

        // Now advance CLINT by stepping enough times.
        // Each step() calls tick_clint() which increments mtime by 1.
        // The alarm was set for boot_mtime + 100. Since boot_mtime was captured
        // at construction and we already stepped once, we need ~99 more steps.
        let callback_addr = 0x8010_0000u32;
        let mut alarm_fired = false;
        for _ in 0..200 {
            vm.cpu.x[17] = 0; // not an SBI call
            vm.cpu.pc = base_addr as u32;
            let _ = vm.step();
            if vm.cpu.pc == callback_addr {
                alarm_fired = true;
                // Verify ra was saved (return address = base_addr + 4)
                assert_eq!(vm.cpu.x[1], (base_addr + 4) as u32);
                break;
            }
        }
        assert!(alarm_fired, "Alarm should have fired within 200 steps");
    }
}
