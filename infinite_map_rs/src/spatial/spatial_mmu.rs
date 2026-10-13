//! Phase 12.2: Spatial Memory Management Unit
//!
//! Dynamic memory allocation lives in spatial cells on the GPU. A TYPE_ALLOC
//! request cell holding the execution token performs a first-fit scan of its
//! heap window [base, limit) (linear cell indices) in the WGSL shader
//! (spatial_compute_v6.wgsl), marks the found region with TYPE_ALLOC cells,
//! and writes the pointer back — no CPU-side allocator.
//!
//! Alloc block layout (four adjacent cells in a row):
//!   [TYPE_ALLOC size][TYPE_MMU_BASE base][TYPE_MMU_LIMIT limit][TYPE_MMU_PAGE result]
//!
//! Free block layout (one cell): [TYPE_FREE ptr]
//!
//! Conventions:
//! - The heap window [base, limit) must not overlap program code or other
//!   MMU blocks: the scan treats any non-NOP cell as occupied, but NOP cells
//!   holding instruction words look free.
//! - The region header cell at ptr holds the region size; usable data cells
//!   are ptr+1 .. ptr+size. Overwriting the header breaks the matching free.
//! - The result cell receives the region pointer, or MMU_FAIL on failure.
//! - One allocator per heap window per tick: two TYPE_ALLOC cells scanning
//!   overlapping windows in the same tick can claim the same region.
//!
//! Draft generated with local Ollama (qwen2.5-coder:14b), reviewed and
//! corrected by hand.

use crate::spatial::path_cache::{GRID_H, GRID_W};

/// Passive cell type (free heap cells are NOP)
pub const TYPE_NOP: u32 = 0;
/// Heap window start register (data_buffer = linear cell index)
pub const TYPE_MMU_BASE: u32 = 40;
/// Heap window end register (exclusive)
pub const TYPE_MMU_LIMIT: u32 = 41;
/// Result pointer cell; also the WriteRequest opcode for MMU request completion
pub const TYPE_MMU_PAGE: u32 = 42;
/// Allocation request cell; also marks allocated cells
pub const TYPE_ALLOC: u32 = 43;
/// Free request cell
pub const TYPE_FREE: u32 = 44;
/// Returned in the result cell when allocation or free fails
pub const MMU_FAIL: u32 = 0xFFFF_FFFF;

/// Linear cell index for grid coordinates.
pub fn cell_index(x: u32, y: u32) -> u32 {
    y * GRID_W as u32 + x
}

/// Builder for MMU request programs in GridRunner binary format.
/// The request cell at (first_x, first_y) is the first-code cell, so
/// load_binary() gives it the execution token.
#[derive(Debug)]
pub struct MmuProgram {
    cells: Vec<(u32, u32, u32, u32)>, // (x, y, opcode_or_type, data_buffer)
    first_x: u32,
    first_y: u32,
}

impl MmuProgram {
    /// Create an allocation request block at (x, y): request `size` cells
    /// from the heap window [base, limit) of linear indices.
    /// 
    /// This is the unsecure version - for secure allocation, use
    /// `new_secure_alloc` which validates with SpatialSecurity first.
    pub fn new_alloc(x: u32, y: u32, size: u32, base: u32, limit: u32) -> Self {
        let cells = vec![
            (x, y, TYPE_ALLOC, size),
            (x + 1, y, TYPE_MMU_BASE, base),
            (x + 2, y, TYPE_MMU_LIMIT, limit),
            (x + 3, y, TYPE_MMU_PAGE, 0),
        ];
        MmuProgram { cells, first_x: x, first_y: y }
    }

    /// Phase 16.7: Secure allocation with SpatialSecurity validation.
    /// 
    /// This is the RECOMMENDED way to create allocation requests. It validates
    /// the allocation with SpatialSecurity before creating the TYPE_ALLOC cells.
    /// 
    /// # Arguments
    /// * `security` - Mutable reference to SpatialSecurity (for validation)
    /// * `process_id` - Process ID requesting allocation
    /// * `x, y` - Location for allocation request cells
    /// * `size` - Requested allocation size in cells
    /// * `base` - Heap window start (linear cell index)
    /// * `limit` - Heap window end (exclusive)
    /// 
    /// # Returns
    /// * `Ok(MmuProgram)` - Allocation validated, program created successfully
    /// * `Err(SecurityError)` - Allocation denied by security policy
    /// 
    /// # Security Checks
    /// 1. Process is registered and not blocked
    /// 2. Process has write permission
    /// 3. Allocation size is within quota (max 4096 cells)
    /// 4. Heap window is valid and within allowed regions
    /// 
    /// # Example
    /// ```ignore
    /// let mut security = SpatialSecurity::new();
    /// security.register_process(1, SecurityLevel::Trusted)?;
    /// 
    /// let program = MmuProgram::new_secure_alloc(
    ///     &mut security, 1, 10, 20, 100, 1024, 8192
    /// )?;
    /// ```
    pub fn new_secure_alloc(
        security: &mut super::spatial_security::SpatialSecurity,
        process_id: u32,
        x: u32,
        y: u32,
        size: u32,
        base: u32,
        limit: u32,
    ) -> Result<Self, super::spatial_security::SecurityError> {
        // Validate with security first
        security.validate_allocation(process_id, size, base, limit)?;

        // If validation passed, create the allocation request
        Ok(Self::new_alloc(x, y, size, base, limit))
    }

    /// Create a free request block at (x, y): release the region whose
    /// header cell is at linear index `ptr`.
    /// 
    /// This is the unsecure version - for secure freeing, use
    /// `new_secure_free` which validates with SpatialSecurity first.
    pub fn new_free(x: u32, y: u32, ptr: u32) -> Self {
        let cells = vec![(x, y, TYPE_FREE, ptr)];
        MmuProgram { cells, first_x: x, first_y: y }
    }

    /// Phase 16.7: Secure free with SpatialSecurity validation.
    /// 
    /// This is the RECOMMENDED way to create free requests. It validates
    /// the free with SpatialSecurity before creating the TYPE_FREE cell.
    /// 
    /// # Arguments
    /// * `security` - Mutable reference to SpatialSecurity (for validation)
    /// * `process_id` - Process ID requesting free
    /// * `x, y` - Location for free request cell
    /// * `ptr` - Linear cell index of region header to free
    /// 
    /// # Returns
    /// * `Ok(MmuProgram)` - Free validated, program created successfully
    /// * `Err(SecurityError)` - Free denied by security policy
    /// 
    /// # Security Checks
    /// 1. Process is registered and not blocked
    /// 2. Process has write permission
    /// 
    /// # Example
    /// ```ignore
    /// let mut security = SpatialSecurity::new();
    /// security.register_process(1, SecurityLevel::Trusted)?;
    /// 
    /// let program = MmuProgram::new_secure_free(
    ///     &mut security, 1, 15, 20, 1234
    /// )?;
    /// ```
    pub fn new_secure_free(
        security: &mut super::spatial_security::SpatialSecurity,
        process_id: u32,
        x: u32,
        y: u32,
        ptr: u32,
    ) -> Result<Self, super::spatial_security::SecurityError> {
        // Validate with security first
        security.validate_free(process_id, ptr)?;

        // If validation passed, create the free request
        Ok(Self::new_free(x, y, ptr))
    }

    /// Pre-place an allocated region of `size` cells starting at
    /// (start_x, start_y), walking +x (must fit in the row): the first cell
    /// is the header (data_buffer = size), the rest hold 0.
    pub fn add_allocated_region(&mut self, start_x: u32, start_y: u32, size: u32) {
        for i in 0..size {
            let data = if i == 0 { size } else { 0 };
            self.cells.push((start_x + i, start_y, TYPE_ALLOC, data));
        }
    }

    /// Pre-place a single allocated cell (a 1-cell region blocking the scan).
    pub fn add_obstacle(&mut self, x: u32, y: u32) {
        self.cells.push((x, y, TYPE_ALLOC, 1));
    }

    /// Add a passive data cell at (x, y).
    pub fn add_data(&mut self, x: u32, y: u32, value: u32) {
        self.cells.push((x, y, TYPE_NOP, value));
    }

    /// Get the number of cells in this MMU program.
    pub fn cell_count(&self) -> usize {
        self.cells.len()
    }

    /// Linear index of the request cell (receives ptr/status when done).
    pub fn request_index(&self) -> u32 {
        cell_index(self.first_x, self.first_y)
    }

    /// Linear index of the result cell (alloc blocks only).
    pub fn result_index(&self) -> u32 {
        self.request_index() + 3
    }

    /// Serialize to GridRunner binary format.
    /// Header (20 bytes): grid_w, grid_h, cell_count, first_code_x, first_code_y.
    pub fn to_binary(&self) -> Vec<u8> {
        let mut binary = Vec::with_capacity(20 + self.cells.len() * 16);
        binary.extend_from_slice(&(GRID_W as u32).to_le_bytes());
        binary.extend_from_slice(&(GRID_H as u32).to_le_bytes());
        binary.extend_from_slice(&(self.cells.len() as u32).to_le_bytes());
        binary.extend_from_slice(&self.first_x.to_le_bytes());
        binary.extend_from_slice(&self.first_y.to_le_bytes());

        for &(x, y, opcode_or_type, data_buffer) in &self.cells {
            binary.extend_from_slice(&x.to_le_bytes());
            binary.extend_from_slice(&y.to_le_bytes());
            binary.extend_from_slice(&opcode_or_type.to_le_bytes());
            binary.extend_from_slice(&data_buffer.to_le_bytes());
        }

        binary
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_cell_index() {
        assert_eq!(cell_index(0, 0), 0);
        assert_eq!(cell_index(127, 63), GRID_W as u32 * GRID_H as u32 - 1);
    }

    #[test]
    fn test_alloc_block_layout() {
        let program = MmuProgram::new_alloc(2, 3, 10, 1024, 2048);
        assert_eq!(program.cells.len(), 4);
        assert_eq!(program.cells[0], (2, 3, TYPE_ALLOC, 10));
        assert_eq!(program.cells[1], (3, 3, TYPE_MMU_BASE, 1024));
        assert_eq!(program.cells[2], (4, 3, TYPE_MMU_LIMIT, 2048));
        assert_eq!(program.cells[3], (5, 3, TYPE_MMU_PAGE, 0));
        assert_eq!(program.request_index(), 3 * 128 + 2);
        assert_eq!(program.result_index(), 3 * 128 + 5);
    }

    #[test]
    fn test_free_block_layout() {
        let program = MmuProgram::new_free(4, 5, 1234);
        assert_eq!(program.cells.len(), 1);
        assert_eq!(program.cells[0], (4, 5, TYPE_FREE, 1234));
        assert_eq!(program.request_index(), 5 * 128 + 4);
    }

    #[test]
    fn test_add_allocated_region_header() {
        let mut program = MmuProgram::new_free(0, 0, 0);
        program.add_allocated_region(10, 20, 5);
        assert_eq!(program.cells.len(), 1 + 5);
        assert_eq!(program.cells[1], (10, 20, TYPE_ALLOC, 5)); // header holds size
        for i in 2..6 {
            assert_eq!(program.cells[i], (10 + i as u32 - 1, 20, TYPE_ALLOC, 0));
        }
    }

    #[test]
    fn test_to_binary_header() {
        let mut program = MmuProgram::new_alloc(2, 3, 4, 100, 200);
        program.add_obstacle(50, 3);
        let binary = program.to_binary();
        assert_eq!(binary.len(), 20 + 5 * 16);
        assert_eq!(&binary[..4], &(GRID_W as u32).to_le_bytes());
        assert_eq!(&binary[4..8], &(GRID_H as u32).to_le_bytes());
        assert_eq!(&binary[8..12], &5u32.to_le_bytes());
        assert_eq!(&binary[12..16], &2u32.to_le_bytes()); // first_code_x = request cell
        assert_eq!(&binary[16..20], &3u32.to_le_bytes());
    }
}
