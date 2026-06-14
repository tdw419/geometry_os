//! Memory layout constants for the self-hosting GEOASM assembler.
//!
//! The mini-assembler runs ON the VM and uses a fixed memory layout:
//!   - Source text: byte-addressed region starting at GEOASM_SRC_BASE_BYTE
//!   - Output: pixel-addressed region starting at GEOASM_OUTPUT_BASE_PIXEL
//!
//! Key constant: GEOASM_REGION_SIZE = 0x10000 (64K pixels = 64K bytes)

/// Size of each GEOASM region in pixels (and bytes).
pub const GEOASM_REGION_SIZE: u32 = 0x10000;
pub const GEOASM_BYTE_REGION_SIZE: u32 = 0x10000;

/// Base byte address for source text input.
pub const GEOASM_SRC_BASE_BYTE: u32 = 0x10000;

/// Base pixel index for assembled output.
pub const GEOASM_OUTPUT_BASE_PIXEL: u32 = 0x10000;

/// Convert a source byte offset to an absolute byte address.
#[inline]
pub fn src_byte_addr(offset: u32) -> u32 {
    GEOASM_SRC_BASE_BYTE + offset
}

/// Convert an output pixel offset to an absolute pixel index.
#[inline]
pub fn output_pixel(offset: u32) -> u32 {
    GEOASM_OUTPUT_BASE_PIXEL + offset
}

// ── Error reporting scratch region ──────────────────────────────
// On error, the mini-assembler writes diagnostics here, then HALTs.

/// Base address for error scratch region (pixel 0x50000).
pub const GEOASM_ERR_SCRATCH: u32 = 0x50000;

/// Error codes written to byte 0 of scratch region.
pub const ERR_UNKNOWN_MNEMONIC: u32 = 1;
pub const ERR_MISSING_OPERAND: u32 = 2;
pub const ERR_BAD_REGISTER: u32 = 3;
pub const ERR_UNDEFINED_LABEL: u32 = 4;
pub const ERR_OUTPUT_OVERFLOW: u32 = 5;

/// Magic value written to output pixel 0 on error.
pub const GEOASM_ERR_MAGIC: u32 = 0xDEAD;
