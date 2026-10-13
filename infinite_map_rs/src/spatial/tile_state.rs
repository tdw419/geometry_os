// RISC-V TileState structure for GPU/Rust integration - Phase 9.2
//
// This matches the TileState structure in riscv_spatial_execute.wgsl

use bytemuck::{Pod, Zeroable};

/// RISC-V Tile State - matches WGSL TileState structure
#[repr(C)]
#[derive(Debug, Clone, Copy)]
pub struct TileState {
    /// 32 general-purpose registers (x0-x31)
    pub regs: [u32; 32],
    /// Program counter
    pub pc: u32,
    /// Status flags (0=running, 1=halted, 2=error)
    pub status: u32,
    /// Instructions executed so far
    pub instruction_count: u32,
    /// Maximum instructions before halt
    pub max_steps: u32,
    /// Unique tile ID (for multi-tile systems)
    pub tile_id: u32,
    /// UART output buffer length
    pub uart_len: u32,
    /// Reserved padding
    pub _reserved: [u32; 2],
    /// UART output buffer (128 words = 512 bytes)
    pub uart_buf: [u32; 128],
    /// General purpose RAM (992 words = 3968 bytes)
    pub ram: [u32; 992],
}

impl TileState {
    /// Convert TileState to a flat u32 vector for GPU upload (1160 u32s total)
    pub fn to_u32_vec(&self) -> Vec<u32> {
        let mut vec = Vec::with_capacity(1160);

        // Copy regs[32]
        vec.extend_from_slice(&self.regs);

        // Copy scalar fields (pc, status, instruction_count, max_steps, tile_id, uart_len)
        vec.push(self.pc);
        vec.push(self.status);
        vec.push(self.instruction_count);
        vec.push(self.max_steps);
        vec.push(self.tile_id);
        vec.push(self.uart_len);

        // Copy _reserved[2]
        vec.extend_from_slice(&self._reserved);

        // Copy uart_buf[128]
        vec.extend_from_slice(&self.uart_buf);

        // Copy ram[992]
        vec.extend_from_slice(&self.ram);

        vec
    }

    /// Reconstruct TileState from a flat u32 vector (inverse of to_u32_vec)
    pub fn from_u32_vec(vec: &[u32]) -> Result<Self, &'static str> {
        if vec.len() != 1160 {
            return Err("Invalid length of input vector. Expected 1160 elements.");
        }

        let regs: [u32; 32] = vec[0..32].try_into().map_err(|_| "Failed to convert regs slice to array")?;
        let pc = vec[32];
        let status = vec[33];
        let instruction_count = vec[34];
        let max_steps = vec[35];
        let tile_id = vec[36];
        let uart_len = vec[37];
        let _reserved: [u32; 2] = vec[38..40].try_into().map_err(|_| "Failed to convert reserved slice to array")?;
        let uart_buf: [u32; 128] = vec[40..168].try_into().map_err(|_| "Failed to convert uart_buf slice to array")?;
        let ram: [u32; 992] = vec[168..1160].try_into().map_err(|_| "Failed to convert ram slice to array")?;

        Ok(TileState {
            regs,
            pc,
            status,
            instruction_count,
            max_steps,
            tile_id,
            uart_len,
            _reserved,
            uart_buf,
            ram,
        })
    }

    /// Create a new TileState with default values
    pub fn new(entry_point: u32, max_steps: u32, tile_id: u32) -> Self {
        Self {
            regs: [0; 32],  // x0-x31 initialized to 0
            pc: entry_point,
            status: 0,  // Running
            instruction_count: 0,
            max_steps,
            tile_id,
            uart_len: 0,
            _reserved: [0; 2],
            uart_buf: [0; 128],
            ram: [0; 992],
        }
    }

    /// Create a minimal TileState for testing
    pub fn minimal(entry_point: u32) -> Self {
        Self::new(entry_point, 10000, 0)
    }

    /// Check if the tile is still running
    pub fn is_running(&self) -> bool {
        self.status == 0
    }

    /// Check if the tile is halted
    pub fn is_halted(&self) -> bool {
        self.status == 1
    }

    /// Check if the tile has encountered an error
    pub fn is_error(&self) -> bool {
        self.status == 2
    }

    /// Halt the tile
    pub fn halt(&mut self) {
        self.status = 1;
    }

    /// Mark the tile as having an error
    pub fn set_error(&mut self) {
        self.status = 2;
    }

    /// Read a register (x0 always returns 0)
    pub fn read_reg(&self, reg: usize) -> u32 {
        if reg == 0 {
            0
        } else if reg < 32 {
            self.regs[reg]
        } else {
            0
        }
    }

    /// Write to a register (x0 is read-only)
    pub fn write_reg(&mut self, reg: usize, val: u32) {
        if reg > 0 && reg < 32 {
            self.regs[reg] = val;
        }
    }

    /// Read from RAM
    pub fn read_ram(&self, addr: u32) -> u32 {
        let word_addr = (addr / 4) as usize;
        if word_addr < 992 {
            self.ram[word_addr]
        } else {
            0
        }
    }

    /// Write to RAM
    pub fn write_ram(&mut self, addr: u32, val: u32) {
        let word_addr = (addr / 4) as usize;
        if word_addr < 992 {
            self.ram[word_addr] = val;
        }
    }

    /// Get UART output as bytes
    pub fn get_uart_output(&self) -> Vec<u8> {
        let mut output = Vec::with_capacity(self.uart_len as usize);
        for i in 0..self.uart_len as usize {
            output.push(self.uart_buf[i] as u8);
        }
        output
    }

    /// Get a summary of the tile state
    pub fn summary(&self) -> String {
        format!(
            "TileState{{ pc=0x{:08x}, status={}, instructions={}/{}, regs=[x1=0x{:08x}, x2=0x{:08x}, x10=0x{:08x}] }}",
            self.pc,
            self.status,
            self.instruction_count,
            self.max_steps,
            self.regs[1],
            self.regs[2],
            self.regs[10]
        )
    }
}

impl Default for TileState {
    fn default() -> Self {
        Self::new(0, 10000, 0)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_tile_state_creation() {
        let state = TileState::minimal(0x80000000);
        assert_eq!(state.pc, 0x80000000);
        assert!(state.is_running());
        assert!(!state.is_halted());
        assert_eq!(state.instruction_count, 0);
        assert_eq!(state.max_steps, 10000);
    }

    #[test]
    fn test_register_access() {
        let mut state = TileState::minimal(0x1000);

        // x0 is always 0
        assert_eq!(state.read_reg(0), 0);
        state.write_reg(0, 42);
        assert_eq!(state.read_reg(0), 0);  // Still 0

        // Other registers work
        state.write_reg(5, 100);
        assert_eq!(state.read_reg(5), 100);

        state.write_reg(10, 0xDEADBEEF);
        assert_eq!(state.read_reg(10), 0xDEADBEEF);
    }

    #[test]
    fn test_ram_access() {
        let mut state = TileState::minimal(0x1000);

        // Write and read
        state.write_ram(0x1000, 0x12345678);
        assert_eq!(state.read_ram(0x1000), 0x12345678);

        // Different addresses
        state.write_ram(0x2000, 0xABCDEF01);
        assert_eq!(state.read_ram(0x1000), 0x12345678);
        assert_eq!(state.read_ram(0x2000), 0xABCDEF01);

        // Out of bounds
        state.write_ram(0x4000, 0xFFFFFFFF);
        assert_eq!(state.read_ram(0x4000), 0);  // Returns 0 (out of bounds)
    }

    #[test]
    fn test_halt_and_error() {
        let mut state = TileState::minimal(0x1000);

        assert!(state.is_running());

        state.halt();
        assert!(state.is_halted());
        assert!(!state.is_running());

        let mut state2 = TileState::minimal(0x1000);
        state2.set_error();
        assert!(state2.is_error());
    }

    #[test]
    fn test_uart() {
        let mut state = TileState::minimal(0x1000);

        // Write to UART buffer
        state.uart_buf[0] = b'H' as u32;
        state.uart_buf[1] = b'i' as u32;
        state.uart_len = 2;

        let output = state.get_uart_output();
        assert_eq!(output, vec![b'H', b'i']);
    }
}