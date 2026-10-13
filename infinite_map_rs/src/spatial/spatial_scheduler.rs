//! Phase 12.4: Spatial Scheduler
//!
//! Cooperative multitasking for spatial programs running on the GPU.
//! Tasks are managed entirely in WGSL - the scheduler cell controls task
//! queues, context switching, and yield-based cooperative scheduling.
//!
//! Cell types:
//!   TYPE_SCHEDULER=60   - Scheduler control cell (data_buffer = head task ID)
//!   TYPE_TASK_QUEUE=61  - Task queue head/tail pointers
//!   TYPE_TASK_CTX=62    - Task context pointer (points to task block)
//!   TYPE_TASK_STATE=63  - Task state: 0=Blocked, 1=Ready, 2=Running
//!
//! Task block layout (8 consecutive cells):
//!   [TYPE_TASK_CTX pc][ACC][FLAGS][TASK_STATE][TASK_ID][PRIORITY][NEXT][SPARE]
//!
//! Task queue is a linked list in grid cells:
//!   Each task block has a "next" cell at offset+8 storing the next task ID

use crate::spatial::path_cache::GRID_W;

/// Cell type for scheduler control cell (matches spatial_compute_v6.wgsl)
pub const TYPE_SCHEDULER: u32 = 60;
/// Cell type for task queue pointer cells
pub const TYPE_TASK_QUEUE: u32 = 61;
/// Cell type for task context pointer cells
pub const TYPE_TASK_CTX: u32 = 62;
/// Cell type for task state cells
pub const TYPE_TASK_STATE: u32 = 63;

/// Task states (matches spatial_compute_v6.wgsl)
pub const TASK_BLOCKED: u32 = 0;
pub const TASK_READY: u32 = 1;
pub const TASK_RUNNING: u32 = 2;

/// Task block size (8 cells)
pub const TASK_BLOCK_SIZE: u32 = 8;

/// PC opcodes for scheduling (must match spatial_compute_v6.wgsl)
pub const PCOP_YIELD: u32 = 9; // Yield control to next task
pub const PCOP_TASK_CREATE: u32 = 10; // Create new task at entry point
pub const PCOP_TASK_SWITCH: u32 = 11; // Force context switch

/// Linear cell index for grid coordinates.
pub fn cell_index(x: u32, y: u32) -> u32 {
    y * GRID_W as u32 + x
}

/// Task ID (simple counter, wraps at 2^16)
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct TaskId(pub u16);

impl TaskId {
    pub fn new(id: u16) -> Self {
        TaskId(id)
    }
    pub fn as_u32(self) -> u32 {
        self.0 as u32
    }
}

/// Task configuration for creation.
#[derive(Debug, Clone)]
pub struct TaskConfig {
    pub task_id: TaskId,
    pub entry_point: u32, // Linear index of first instruction
    pub priority: u32,    // Higher = higher priority
}

/// Builder for spatial programs with task scheduling.
#[derive(Debug)]
pub struct SpatialSchedulerProgram {
    cells: Vec<(u32, u32, u32, u32)>, // (x, y, opcode_or_type, data_buffer)
    scheduler_x: u32,
    scheduler_y: u32,
    task_queue_x: u32,
    task_queue_y: u32,
    task_counter: u16,
}

impl SpatialSchedulerProgram {
    /// Create a program with scheduler at (scheduler_x, scheduler_y).
    pub fn new(scheduler_x: u32, scheduler_y: u32, task_queue_x: u32, task_queue_y: u32) -> Self {
        let mut cells = Vec::new();

        // Scheduler control cell (head_task_id = 0xFFFFFFFF means empty)
        cells.push((scheduler_x, scheduler_y, TYPE_SCHEDULER, 0xFFFFFFFF));

        // Task queue: [head_task_id][tail_task_id]
        cells.push((task_queue_x, task_queue_y, TYPE_TASK_QUEUE, 0xFFFFFFFF));
        cells.push((
            task_queue_x + 1,
            task_queue_y,
            TYPE_TASK_QUEUE,
            0xFFFFFFFF,
        ));

        SpatialSchedulerProgram {
            cells,
            scheduler_x,
            scheduler_y,
            task_queue_x,
            task_queue_y,
            task_counter: 0,
        }
    }

    /// Allocate a task block and add to task queue.
    /// Returns the linear index of the task block.
    pub fn create_task(&mut self, config: TaskConfig, start_x: u32, start_y: u32) -> u32 {
        let task_id = self.task_counter;
        self.task_counter = self.task_counter.wrapping_add(1);

        let base_idx = cell_index(start_x, start_y);

        // Task block layout: [CTX][ACC][FLAGS][STATE][ID][PRIORITY][NEXT][SPARE]
        // CTY (PC) stores entry point
        self.cells
            .push((start_x, start_y, TYPE_TASK_CTX, config.entry_point));
        self.cells.push((
            start_x + 1,
            start_y,
            crate::spatial::spatial_control_unit::TYPE_NOP,
            0,
        )); // ACC
        self.cells.push((
            start_x + 2,
            start_y,
            crate::spatial::spatial_control_unit::TYPE_FLAGS,
            0,
        )); // FLAGS
        self.cells
            .push((start_x + 3, start_y, TYPE_TASK_STATE, TASK_READY)); // STATE
        self.cells
            .push((start_x + 4, start_y, TYPE_TASK_CTX, task_id as u32)); // TASK_ID
        self.cells
            .push((start_x + 5, start_y, TYPE_TASK_CTX, config.priority)); // PRIORITY
        self.cells
            .push((start_x + 6, start_y, TYPE_TASK_CTX, 0xFFFFFFFF)); // NEXT (no next task)
        self.cells.push((
            start_x + 7,
            start_y,
            crate::spatial::spatial_control_unit::TYPE_NOP,
            0,
        )); // SPARE

        base_idx
    }

    /// Link task blocks in the task queue.
    pub fn link_task_queue(&mut self, task_indices: Vec<u32>) {
        if task_indices.is_empty() {
            // Empty queue - already set up in constructor
            return;
        }

        // Link tasks: each task's NEXT cell points to next task's TASK_ID cell
        for i in 0..task_indices.len() - 1 {
            let current_task_idx = task_indices[i];
            let next_task_idx = task_indices[i + 1];

            // Find and update NEXT cell
            for cell in &mut self.cells {
                let cell_idx = cell_index(cell.0, cell.1);
                if cell_idx == current_task_idx + 6 {
                    cell.3 = next_task_idx + 4; // Points to next task's TASK_ID cell
                    break;
                }
            }
        }

        // Set head and tail of queue
        let head_idx = task_indices[0] + 4; // TASK_ID cell of first task
        let tail_idx = task_indices[task_indices.len() - 1] + 4; // TASK_ID cell of last task

        // Update queue head and tail cells
        for cell in &mut self.cells {
            if cell.0 == self.task_queue_x
                && cell.1 == self.task_queue_y
                && cell.2 == TYPE_TASK_QUEUE
            {
                cell.3 = head_idx;
            }
            if cell.0 == self.task_queue_x + 1
                && cell.1 == self.task_queue_y
                && cell.2 == TYPE_TASK_QUEUE
            {
                cell.3 = tail_idx;
            }
        }
    }

    /// Add a scheduler instruction (passive cell data).
    pub fn add_scheduler_instr(&mut self, x: u32, y: u32, op: u32, arg: u32) {
        let instr = crate::spatial::spatial_control_unit::encode_instr(op, arg);
        self.cells.push((
            x,
            y,
            crate::spatial::spatial_control_unit::TYPE_NOP,
            instr,
        ));
    }

    /// Linear index of scheduler cell.
    pub fn scheduler_index(&self) -> u32 {
        cell_index(self.scheduler_x, self.scheduler_y)
    }

    /// Linear index of task queue head.
    pub fn task_queue_head_index(&self) -> u32 {
        cell_index(self.task_queue_x, self.task_queue_y)
    }

    /// Serialize to GridRunner binary format.
    pub fn to_binary(&self) -> Vec<u8> {
        let mut binary = Vec::with_capacity(20 + self.cells.len() * 16);
        binary.extend_from_slice(&(crate::spatial::path_cache::GRID_W as u32).to_le_bytes());
        binary.extend_from_slice(&(crate::spatial::path_cache::GRID_H as u32).to_le_bytes());
        binary.extend_from_slice(&(self.cells.len() as u32).to_le_bytes());
        binary.extend_from_slice(&0u32.to_le_bytes()); // first_code_x
        binary.extend_from_slice(&0u32.to_le_bytes()); // first_code_y

        for &(x, y, opcode_or_type, data_buffer) in &self.cells {
            binary.extend_from_slice(&x.to_le_bytes());
            binary.extend_from_slice(&y.to_le_bytes());
            binary.extend_from_slice(&opcode_or_type.to_le_bytes());
            binary.extend_from_slice(&data_buffer.to_le_bytes());
        }

        binary
    }

    /// Get cell count.
    pub fn cell_count(&self) -> usize {
        self.cells.len()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_scheduler_program_creation() {
        let program = SpatialSchedulerProgram::new(0, 0, 10, 0);

        assert_eq!(program.cell_count(), 3); // Scheduler + 2 queue cells
        assert_eq!(program.scheduler_index(), 0);
        assert_eq!(program.task_queue_head_index(), 10);
    }

    #[test]
    fn test_task_creation() {
        let mut program = SpatialSchedulerProgram::new(0, 0, 10, 0);

        let task_idx = program.create_task(
            TaskConfig {
                task_id: TaskId::new(0),
                entry_point: 100,
                priority: 10,
            },
            20,
            0,
        );

        assert_eq!(task_idx, cell_index(20, 0));
        assert_eq!(program.cell_count(), 11); // 3 + 8 task cells
    }

    #[test]
    fn test_binary_format() {
        let mut program = SpatialSchedulerProgram::new(0, 0, 10, 0);

        program.create_task(
            TaskConfig {
                task_id: TaskId::new(0),
                entry_point: 100,
                priority: 10,
            },
            20,
            0,
        );

        let binary = program.to_binary();

        // Header: 20 bytes
        let read_u32 = |b: &[u8]| u32::from_le_bytes(b.try_into().unwrap());
        assert_eq!(
            read_u32(&binary[0..4]),
            crate::spatial::path_cache::GRID_W as u32
        );
        assert_eq!(
            read_u32(&binary[4..8]),
            crate::spatial::path_cache::GRID_H as u32
        );
        assert_eq!(read_u32(&binary[8..12]), 11); // 11 cells
    }
}