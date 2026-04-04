// Pixels Move Pixels - Core Library
//
// The GPU is the computer. A texture IS memory. Each pixel IS an instruction.
// Programs read from the texture, execute, and write back to the texture.
// Programs write programs. Pixels move pixels.

pub mod hilbert;
pub mod substrate;
pub mod assembler;
pub mod vm;

pub const TEXTURE_SIZE: u32 = 4096;
pub const MAX_VMS: u32 = 8;
pub const CYCLES_PER_FRAME: u32 = 1024;
