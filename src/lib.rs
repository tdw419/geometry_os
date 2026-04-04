// Pixels Move Pixels - Core Library
//
// The GPU is the computer. A texture IS memory. Each pixel IS an instruction.
// Programs read from the texture, execute, and write back to the texture.
// Programs write programs. Pixels move pixels.

pub mod assembler;
pub mod font_atlas;
pub mod gasm;
pub mod hilbert;
pub mod software_vm;
pub mod substrate;
pub mod visualization;
pub mod vm;
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

/// Base address of the display region (Hilbert pixel index).
pub const SCREEN_BASE: u32 = 0x00F30000;
/// Screen dimensions (256x256 = 64K pixels = 256KB).
pub const SCREEN_SIZE: u32 = 256;
