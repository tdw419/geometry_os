// Pixels Move Pixels - Core Library
//
// The GPU is the computer. A texture IS memory. Each pixel IS an instruction.
// Programs read from the texture, execute, and write back to the texture.
// Programs write programs. Pixels move pixels.

pub mod assembler;
pub mod cpu_stub;
pub mod evolution;
pub mod filmstrip;
pub mod fitness;
pub mod font_atlas;
pub mod gasm;
pub mod gasp;
pub mod geoasm_mem;
pub mod gasp_compiler;
pub mod governance;
pub mod hilbert;
pub mod hl_compiler;
pub mod mutation;
pub mod software_vm;
pub mod stdlib;
pub mod substrate;
pub mod visualization;
pub mod vm;
pub mod rv64;
pub mod self_improvement;
pub mod vm_hud;
pub const TEXTURE_SIZE: u32 = 4096;
pub const MAX_VMS: u32 = 8;
pub const CYCLES_PER_FRAME: u32 = 1024;

// ── IPC Shared Memory Layout ──
//
// The message queue lives in a dedicated region of the Hilbert-addressed RAM.
// Address layout (Hilbert pixel indices, not byte addresses):
//
//   MSGQ_BASE .. MSGQ_BASE + MAX_VMS*2 - 1     : Mailbox headers (1 pixel per VM)
//     Header pixel format:
//       R = flags (bit 0: has_message, bit 1: was_read)
//       G = sender_vm_id
//       B = data_length (number of data pixels, max MSGQ_MAX_DATA)
//       A = reserved
//
//   MSGQ_DATA_BASE .. MSGQ_DATA_BASE + MAX_VMS*MSGQ_MAX_DATA - 1 : Mailbox data
//     Each VM gets MSGQ_MAX_DATA pixels of message payload.
//     VM N's data starts at MSGQ_DATA_BASE + N * MSGQ_MAX_DATA.
//
// Protocol: VM A sends to VM B by writing to B's mailbox data, then
// setting B's header. VM B reads its header, reads its data, then
// clears the header.

/// Base address of mailbox headers (Hilbert pixel index).
pub const MSGQ_BASE: u32 = 0x00E0_0000;
/// Number of pixels per mailbox data slot.
pub const MSGQ_MAX_DATA: u32 = 16;
/// Base address of mailbox data payloads.
pub const MSGQ_DATA_BASE: u32 = MSGQ_BASE + MAX_VMS * 2;
/// Total message queue region size in pixels.
pub const _MSGQ_REGION_SIZE: u32 = (MAX_VMS * 2) + (MAX_VMS * MSGQ_MAX_DATA);

// ── Screen Display Region ──
//
// A 256x256 pixel display region for visual output.
// Programs write pixels here using PSET and read them with PGET.
// The daemon renders this region as a PNG in the outbox.
//
//   SCREEN_BASE .. SCREEN_BASE + SCREEN_SIZE*SCREEN_SIZE - 1 : 256x256 RGBA display
//
// PSET/PGET use Cartesian (x, y) coordinates: 0 <= x < 256, 0 <= y < 256.
// Internally mapped to Hilbert addresses starting at SCREEN_BASE.

// ── Event Queue Region ──
//
// External events (keyboard, timer, network) are injected into VMs
// via a per-VM event slot in the texture.
//
//   EVENTQ_BASE .. EVENTQ_BASE + MAX_VMS*2 - 1    : Event headers
//     Header pixel format:
//       word[0] = event_type (1=keyboard, 2=timer, 3=network, 4=custom)
//       word[1] = param1 (e.g., key code)
//
//   EVENTQ_DATA_BASE .. EVENTQ_DATA_BASE + MAX_VMS*EVENTQ_MAX_DATA - 1 : Event payloads
//     VM N's event data starts at EVENTQ_DATA_BASE + N * EVENTQ_MAX_DATA.
//
// Protocol: Host writes event to VM N's slot, sets header non-zero.
// VM executes WAIT_EVENT, reads header + payload, clears header.

/// Base address of per-VM event headers.
pub const EVENTQ_BASE: u32 = 0x00E1_0000;
/// Max data words per event.
pub const EVENTQ_MAX_DATA: u32 = 8;
/// Base address of event data payloads.
pub const EVENTQ_DATA_BASE: u32 = EVENTQ_BASE + MAX_VMS * 2;
/// Event types.
pub const EVENT_KEYBOARD: u32 = 1;
pub const EVENT_TIMER: u32 = 2;
pub const EVENT_NETWORK: u32 = 3;
pub const EVENT_CUSTOM: u32 = 4;

/// Base address of the display region (Hilbert pixel index).
pub const SCREEN_BASE: u32 = 0x00F30000;
/// Screen dimensions (256x256 = 64K pixels = 256KB).
pub const SCREEN_SIZE: u32 = 256;

// ── Dashboard Region ──
//
// A 480x240 pixel region for external dashboard/overlay content.
// External clients (web UIs, formula engines, tools) blit RGBA frames here
// via the POST /api/v1/blit endpoint. The GPU render pipeline can then
// display this region as an overlay or texture.
//
//   DASHBOARD_BASE .. DASHBOARD_BASE + 480*240 - 1 : 480x240 RGBA8 frame

/// Base address of the dashboard region (Hilbert pixel index).
pub const DASHBOARD_BASE: u32 = 0x00F40000;
/// Dashboard frame width in pixels.
pub const DASHBOARD_WIDTH: u32 = 480;
/// Dashboard frame height in pixels.
pub const DASHBOARD_HEIGHT: u32 = 240;
/// Total dashboard region size in pixels (115,200).
pub const DASHBOARD_PIXELS: u32 = DASHBOARD_WIDTH * DASHBOARD_HEIGHT;

// ── System Input Bus ──
//
// Read-only region updated by the host every frame with hardware state.
// VMs read via LOAD instructions. Written by the daemon/window manager
// before each frame tick.
//
//   SYS_INPUT_BASE + 0 : MOUSE_X  (i32, pixel coordinate)
//   SYS_INPUT_BASE + 1 : MOUSE_Y  (i32, pixel coordinate)
//   SYS_INPUT_BASE + 2 : MOUSE_BTN (u32 bitmask: bit0=left, bit1=right, bit2=middle)
//
// The GASP compiler generates LOAD instructions that read these addresses
// for hit-test dispatch (onPress, onRollOver, etc).

/// Base address of the system input bus (Hilbert pixel index).
pub const SYS_INPUT_BASE: u32 = 0x00E2_0000;

// ── Issue Queue Region (Phase 13A) ──
//
// A VM-managed task queue that lives entirely in texture memory.
// This is the foundation for self-hosting: the OS manages its own work.
//
// Address layout (Hilbert pixel indices):
//
//   ISSUEQ_BASE + 0 : head       (u32, index of next issue to pick)
//   ISSUEQ_BASE + 1 : tail       (u32, index where next create goes)
//   ISSUEQ_BASE + 2 : count      (u32, number of issues in queue)
//   ISSUEQ_BASE + 3 : capacity   (u32, max issues = ISSUEQ_CAPACITY)
//
//   ISSUEQ_BASE + ISSUEQ_HEADER_SIZE .. end : Issue slots
//     Each issue is ISSUEQ_SLOT_SIZE pixels:
//       Pixel 0: metadata = (status << 24) | (priority << 16) | (assignee_id_low)
//         status: 0=todo, 1=in_progress, 2=done
//         priority: 0=none, 1=low, 2=medium, 3=high, 4=critical
//         assignee_id: 0=unassigned, 1..8=VM ID
//       Pixel 1: issue_id (auto-incremented, unique)
//       Pixels 2-25: title (packed ASCII, 4 bytes/pixel = 96 chars max, null-terminated)
//       Pixels 26-31: reserved (future: description, labels, etc.)

/// Base address of the issue queue region (Hilbert pixel index).
pub const ISSUEQ_BASE: u32 = 0x00E3_0000;
/// Number of pixels in the queue header.
pub const ISSUEQ_HEADER_SIZE: u32 = 4;
/// Maximum number of issues in the queue.
pub const ISSUEQ_CAPACITY: u32 = 64;
/// Number of pixels per issue slot.
pub const ISSUEQ_SLOT_SIZE: u32 = 32;
/// Base address of the first issue slot.
pub const ISSUEQ_SLOTS_BASE: u32 = ISSUEQ_BASE + ISSUEQ_HEADER_SIZE;
/// Total issue queue region size in pixels.
pub const ISSUEQ_REGION_SIZE: u32 = ISSUEQ_HEADER_SIZE + ISSUEQ_CAPACITY * ISSUEQ_SLOT_SIZE;

/// Issue status values.
pub const ISSUE_STATUS_TODO: u32 = 0;
pub const ISSUE_STATUS_IN_PROGRESS: u32 = 1;
pub const ISSUE_STATUS_DONE: u32 = 2;

/// Issue list filter sentinel: 0xFF means "match all statuses".
pub const ISSUE_FILTER_ALL: u32 = 0xFF;

/// Issue priority values.
pub const ISSUE_PRIORITY_NONE: u32 = 0;
pub const ISSUE_PRIORITY_LOW: u32 = 1;
pub const ISSUE_PRIORITY_MEDIUM: u32 = 2;
pub const ISSUE_PRIORITY_HIGH: u32 = 3;
pub const ISSUE_PRIORITY_CRITICAL: u32 = 4;

// ── Metrics Region (Phase 13C) ──
//
// Performance counters for the self-orchestrating loop.
// Written by VM programs, read by tests.
//
//   METRICS_BASE + 0 : cycles_completed   (u32, total scheduler frames)
//   METRICS_BASE + 1 : issues_created     (u32, total issues pushed)
//   METRICS_BASE + 2 : issues_done        (u32, total issues completed)
//   METRICS_BASE + 3 : issues_in_progress (u32, currently being worked)
//   METRICS_BASE + 4 : batch_number       (u32, current batch iteration)

/// Base address of the metrics region.
pub const METRICS_BASE: u32 = 0x00E4_0000;
/// Metrics region size in pixels.
pub const METRICS_SIZE: u32 = 8;

/// Offset from SYS_INPUT_BASE for mouse X coordinate.
pub const SYS_MOUSE_X: u32 = SYS_INPUT_BASE;
/// Offset from SYS_INPUT_BASE for mouse Y coordinate.
pub const SYS_MOUSE_Y: u32 = SYS_INPUT_BASE + 1;
/// Offset from SYS_INPUT_BASE for mouse button bitmask.
pub const SYS_MOUSE_BTN: u32 = SYS_INPUT_BASE + 2;
