//! Spatial Memory System - Phase 8.1.5
//!
//! Implements spatial memory for RISC-V load/store instructions.
//! Memory is laid out as an isolated grid region with WALL cells for security.

use crate::geoasm_materializer::{CellState, TYPE_NOP, TYPE_WALL, TYPE_LDI, TYPE_COPY};
use crate::spatial::path_cache::PathCache;
use thiserror::Error;

/// Memory access errors
#[derive(Debug, Error)]
pub enum MemoryError {
    #[error("Address {0} out of memory bounds (max: {1})")]
    AddressOutOfBounds(u32, u32),
    
    #[error("Source register {0} at ({1},{2}) unreachable from memory {3}")]
    SourceUnreachable(u32, usize, usize, u32),
    
    #[error("Destination register {0} at ({1},{2}) unreachable from memory {3}")]
    DestUnreachable(u32, usize, usize, u32),
    
    #[error("Path from memory to itself blocked by WALL")]
    MemoryPathBlocked,
    
    #[error("Memory region not initialized")]
    MemoryNotInitialized,
}

/// Spatial memory configuration
pub struct MemoryConfig {
    /// Starting X coordinate of memory region
    pub base_x: usize,
    /// Starting Y coordinate of memory region
    pub base_y: usize,
    /// Width of memory region (number of words)
    pub width: usize,
    /// Height of memory region (for layout, typically 1 for linear memory)
    pub height: usize,
}

impl MemoryConfig {
    /// Create a new memory configuration
    pub fn new(base_x: usize, base_y: usize, width: usize) -> Self {
        Self {
            base_x,
            base_y,
            width,
            height: 1,
        }
    }
    
    /// Get spatial coordinates for a memory address
    pub fn addr_to_coord(&self, addr: u32) -> Option<(usize, usize)> {
        if addr >= self.width as u32 {
            return None;
        }
        Some((self.base_x + addr as usize, self.base_y))
    }
}

/// Spatial memory manager
pub struct SpatialMemory {
    config: MemoryConfig,
    cells: Vec<CellState>,
    path_cache: PathCache,
}

impl SpatialMemory {
    /// Create a new spatial memory region
    pub fn new(config: MemoryConfig, path_cache: PathCache) -> Self {
        let total_cells = config.width * config.height;
        
        // Initialize memory with NOP cells (zeroed)
        let cells = vec![CellState::new(TYPE_NOP, 0, 0); total_cells];
        
        Self {
            config,
            cells,
            path_cache,
        }
    }
    
    /// Generate spatial cells for the memory region (including WALLs)
    pub fn emit_region(&self) -> Vec<(usize, usize, CellState)> {
        let mut cells = Vec::new();
        
        // Emit memory cells
        for (idx, cell) in self.cells.iter().enumerate() {
            let x = self.config.base_x + idx;
            let y = self.config.base_y;
            cells.push((x, y, *cell));
        }
        
        // Emit WALL cells around the memory region
        // Left WALL
        for y in 0..self.config.height {
            cells.push((self.config.base_x - 1, self.config.base_y + y, CellState::new(TYPE_WALL, 0, 0)));
        }
        
        // Right WALL
        for y in 0..self.config.height {
            cells.push((self.config.base_x + self.config.width, self.config.base_y + y, CellState::new(TYPE_WALL, 0, 0)));
        }
        
        // Top WALL
        for x in 0..=self.config.width {
            cells.push((self.config.base_x + x, self.config.base_y - 1, CellState::new(TYPE_WALL, 0, 0)));
        }
        
        // Bottom WALL
        for x in 0..=self.config.width {
            cells.push((self.config.base_x + x, self.config.base_y + self.config.height, CellState::new(TYPE_WALL, 0, 0)));
        }
        
        cells
    }
    
    /// Validate and emit LW (load word) instruction
    /// Returns cells for: load effective address, then copy to destination
    pub fn emit_lw(
        &self,
        rd: u32,
        rs1: u32,
        imm: i32,
        rs1_coord: (usize, usize),
        rd_coord: (usize, usize),
    ) -> Result<Vec<(usize, usize, CellState)>, MemoryError> {
        // Calculate effective address
        let base_addr = imm as u32; // For simplicity, treat rs1 as address base
        
        // Get memory cell coordinates
        let mem_coord = self.config.addr_to_coord(base_addr)
            .ok_or(MemoryError::AddressOutOfBounds(base_addr, self.config.width as u32))?;
        
        // Validate source (memory) -> destination (register) path
        if !self.path_cache.path_clear(mem_coord.0, mem_coord.1, rd_coord.0, rd_coord.1) {
            return Err(MemoryError::DestUnreachable(rd, rd_coord.0, rd_coord.1, base_addr));
        }
        
        // Emit memory read cells
        let mut cells = Vec::new();
        
        // Copy from memory to rd
        // Use COPY opcode: rd <- memory[base_addr]
        let copy_cell = CellState::new(TYPE_COPY, rd_coord.0 as i32 - mem_coord.0 as i32, rd_coord.1 as i32 - mem_coord.1 as i32);
        cells.push((mem_coord.0, mem_coord.1, copy_cell));
        
        Ok(cells)
    }
    
    /// Validate and emit SW (store word) instruction
    /// Returns cells for: copy source to memory address
    pub fn emit_sw(
        &self,
        rs2: u32,
        rs1: u32,
        imm: i32,
        rs1_coord: (usize, usize),
        rs2_coord: (usize, usize),
    ) -> Result<Vec<(usize, usize, CellState)>, MemoryError> {
        // Calculate effective address
        let base_addr = imm as u32;
        
        // Get memory cell coordinates
        let mem_coord = self.config.addr_to_coord(base_addr)
            .ok_or(MemoryError::AddressOutOfBounds(base_addr, self.config.width as u32))?;
        
        // Validate source (register) -> destination (memory) path
        if !self.path_cache.path_clear(rs2_coord.0, rs2_coord.1, mem_coord.0, mem_coord.1) {
            return Err(MemoryError::SourceUnreachable(rs2, rs2_coord.0, rs2_coord.1, base_addr));
        }
        
        // Emit memory write cells
        let mut cells = Vec::new();
        
        // Copy from rs2 to memory
        let copy_cell = CellState::new(TYPE_COPY, mem_coord.0 as i32 - rs2_coord.0 as i32, mem_coord.1 as i32 - rs2_coord.1 as i32);
        cells.push((rs2_coord.0, rs2_coord.1, copy_cell));
        
        Ok(cells)
    }
    
    /// Load a value into memory cell (for initialization)
    pub fn store(&mut self, addr: u32, value: u32) -> Result<(), MemoryError> {
        let coord = self.config.addr_to_coord(addr)
            .ok_or(MemoryError::AddressOutOfBounds(addr, self.config.width as u32))?;
        
        let idx = coord.0 - self.config.base_x;
        if idx < self.cells.len() {
            self.cells[idx] = CellState::data(value);
            Ok(())
        } else {
            Err(MemoryError::MemoryNotInitialized)
        }
    }
    
    /// Read a value from memory cell
    pub fn load(&self, addr: u32) -> Result<u32, MemoryError> {
        let coord = self.config.addr_to_coord(addr)
            .ok_or(MemoryError::AddressOutOfBounds(addr, self.config.width as u32))?;
        
        let idx = coord.0 - self.config.base_x;
        if idx < self.cells.len() {
            Ok(self.cells[idx].data_buffer)
        } else {
            Err(MemoryError::MemoryNotInitialized)
        }
    }
    
    /// Get memory configuration
    pub fn config(&self) -> &MemoryConfig {
        &self.config
    }
    
    /// Get all memory cells
    pub fn cells(&self) -> &[CellState] {
        &self.cells
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    fn setup_memory() -> SpatialMemory {
        let cells = vec![CellState::new(TYPE_NOP, 0, 0); 128 * 64];
        let path_cache = PathCache::from_cells(&cells);
        let config = MemoryConfig::new(50, 20, 256); // 256 words starting at (50, 20)
        SpatialMemory::new(config, path_cache)
    }
    
    #[test]
    fn test_memory_config() {
        let config = MemoryConfig::new(50, 20, 256);
        assert_eq!(config.addr_to_coord(0), Some((50, 20)));
        assert_eq!(config.addr_to_coord(100), Some((150, 20)));
        assert_eq!(config.addr_to_coord(255), Some((305, 20)));
        assert_eq!(config.addr_to_coord(256), None); // Out of bounds
    }
    
    #[test]
    fn test_emit_memory_region() {
        let memory = setup_memory();
        let cells = memory.emit_region();
        
        // Should have memory cells + WALL cells
        // 256 memory cells + (2 * 1) side walls + (2 * 257) top/bottom walls
        assert!(cells.len() > 256);
        
        // Check that memory cells are present
        let memory_cells: Vec<_> = cells.iter()
            .filter(|(_, _, c)| c.opcode() == TYPE_NOP)
            .collect();
        assert_eq!(memory_cells.len(), 256);
    }
    
    #[test]
    fn test_store_and_load() {
        let mut memory = setup_memory();
        
        // Store a value
        memory.store(100, 0xDEADBEEF).unwrap();
        
        // Load it back
        let value = memory.load(100).unwrap();
        assert_eq!(value, 0xDEADBEEF);
    }
    
    #[test]
    fn test_store_out_of_bounds() {
        let mut memory = setup_memory();
        let result = memory.store(1000, 0);
        assert!(matches!(result, Err(MemoryError::AddressOutOfBounds(1000, _))));
    }
    
    #[test]
    fn test_load_out_of_bounds() {
        let memory = setup_memory();
        let result = memory.load(1000);
        assert!(matches!(result, Err(MemoryError::AddressOutOfBounds(1000, _))));
    }
    
    #[test]
    fn test_emit_lw_valid() {
        let memory = setup_memory();
        
        // Store a value in memory
        let mut mem = memory;
        mem.store(50, 0x12345678).unwrap();
        
        // Emit LW instruction: rd=5, rs1=10, imm=50
        let result = mem.emit_lw(5, 10, 50, (60, 10), (70, 10));
        assert!(result.is_ok());
        
        let cells = result.unwrap();
        assert!(!cells.is_empty());
    }
    
    #[test]
    fn test_emit_sw_valid() {
        let memory = setup_memory();
        
        // Emit SW instruction: rs2=5, rs1=10, imm=50 (must be < 256)
        let result = memory.emit_sw(5, 10, 50, (60, 10), (70, 10));
        assert!(result.is_ok());
        
        let cells = result.unwrap();
        assert!(!cells.is_empty());
    }
    
    #[test]
    fn test_emit_lw_out_of_bounds() {
        let memory = setup_memory();
        
        // Try to load from address 1000 (out of bounds)
        let result = memory.emit_lw(5, 10, 1000, (60, 10), (70, 10));
        assert!(matches!(result, Err(MemoryError::AddressOutOfBounds(1000, _))));
    }
    
    #[test]
    fn test_emit_sw_out_of_bounds() {
        let memory = setup_memory();
        
        // Try to store to address 1000 (out of bounds)
        let result = memory.emit_sw(5, 10, 1000, (60, 10), (70, 10));
        assert!(matches!(result, Err(MemoryError::AddressOutOfBounds(1000, _))));
    }
}