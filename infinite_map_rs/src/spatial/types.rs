//! GPU-compatible types for spatial routing

use bytemuck::{Pod, Zeroable};

/// Represents a write request in the spatial compute pipeline
///
/// Used for cross-cell mutations. Active instructions post write requests
/// to the write buffer, then a second pass applies them.
#[repr(C)]
#[derive(Debug, Copy, Clone, Pod, Zeroable)]
pub struct WriteRequest {
    /// Whether this request is valid (1 = valid, 0 = invalid)
    pub valid: u32,
    /// Opcode of the instruction making the request
    pub opcode: u32,
    /// Source register value (for register-register ops)
    pub src_value: u32,
    /// Immediate value (for register-immediate ops)
    pub imm_value: u32,
}

impl WriteRequest {
    /// Create an invalid (empty) write request
    pub fn invalid() -> Self {
        Self {
            valid: 0,
            opcode: 0,
            src_value: 0,
            imm_value: 0,
        }
    }

    /// Create a valid write request
    pub fn new(opcode: u32, src_value: u32, imm_value: u32) -> Self {
        Self {
            valid: 1,
            opcode,
            src_value,
            imm_value,
        }
    }
}