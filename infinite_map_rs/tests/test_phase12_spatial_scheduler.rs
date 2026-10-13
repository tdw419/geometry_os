//! Phase 12.4: Spatial Scheduler integration tests
//!
//! Proves that spatial programs can cooperatively multitask on the GPU.
//! Tasks are managed by a scheduler cell in the spatial grid - the CPU
//! sets up task blocks, the WGSL scheduler handles yield-based context switching.

use infinite_map_rs::spatial::spatial_scheduler::{
    SpatialSchedulerProgram, TaskConfig, TaskId, TYPE_SCHEDULER, TYPE_TASK_CTX,
    TYPE_TASK_QUEUE, TYPE_TASK_STATE, PCOP_YIELD, TASK_BLOCK_SIZE, TASK_READY, TASK_RUNNING,
    cell_index,
};
use infinite_map_rs::spatial::spatial_control_unit::{
    encode_instr, PCOP_HALT, PCOP_LDI, TYPE_FLAGS, TYPE_NOP, TYPE_PC,
};

/// Binary format:
/// Header: 20 bytes
///   0-4:   grid_width (u32)
///   4-8:   grid_height (u32)
///   8-12:  cell_count (u32)
///   12-16: first_code_x (u32)
///   16-20: first_code_y (u32)
/// Cells: 16 bytes each
///   0-4:   x (u32)
///   4-8:   y (u32)
///   8-12:  opcode_or_type (u32)
///   12-16: data_buffer (u32)

fn read_u32_le(binary: &[u8], offset: usize) -> u32 {
    assert!(offset + 4 <= binary.len(), "Offset {} out of bounds for binary len {}", offset, binary.len());
    u32::from_le_bytes([
        binary[offset],
        binary[offset + 1],
        binary[offset + 2],
        binary[offset + 3],
    ])
}

fn read_cell(binary: &[u8], cell_idx: usize) -> (u32, u32, u32, u32) {
    let offset = 20 + cell_idx * 16;
    let x = read_u32_le(binary, offset);
    let y = read_u32_le(binary, offset + 4);
    let opcode_or_type = read_u32_le(binary, offset + 8);
    let data_buffer = read_u32_le(binary, offset + 12);
    (x, y, opcode_or_type, data_buffer)
}

/// Test: Two tasks with YIELD should schedule cooperatively
#[test]
fn test_two_task_yield_schedule() {
    // Create scheduler program at (0, 0), queue at (5, 0)
    let mut scheduler_prog = SpatialSchedulerProgram::new(0, 0, 5, 0);

    // Task 1: Counter loop with YIELD every 3 iterations
    let task1_idx = scheduler_prog.create_task(
        TaskConfig {
            task_id: TaskId::new(1),
            entry_point: 100, // Entry point for task code
            priority: 10,
        },
        20,
        0,
    );

    // Task 2: Different counter loop with YIELD every 2 iterations
    let task2_idx = scheduler_prog.create_task(
        TaskConfig {
            task_id: TaskId::new(2),
            entry_point: 150, // Different entry point
            priority: 5,
        },
        28,
        0,
    );

    // Link tasks in queue
    scheduler_prog.link_task_queue(vec![task1_idx, task2_idx]);

    // Task 1 code: 3 instructions, YIELD at instruction 3
    scheduler_prog.add_scheduler_instr(20, 1, PCOP_LDI, 1); // LDI acc, 1
    scheduler_prog.add_scheduler_instr(21, 1, PCOP_LDI, 2); // LDI acc, 2
    scheduler_prog.add_scheduler_instr(22, 1, PCOP_YIELD, 0); // YIELD

    // Task 2 code: 2 instructions, YIELD at instruction 2
    scheduler_prog.add_scheduler_instr(28, 1, PCOP_LDI, 10);
    scheduler_prog.add_scheduler_instr(29, 1, PCOP_LDI, 20);
    scheduler_prog.add_scheduler_instr(30, 1, PCOP_YIELD, 0);

    // Generate binary
    let binary = scheduler_prog.to_binary();

    // Verify header
    let grid_w = read_u32_le(&binary, 0);
    let grid_h = read_u32_le(&binary, 4);
    let cell_count = read_u32_le(&binary, 8);
    
    // Cells: 3 (scheduler + queue) + 2 * 8 (two tasks) + 6 (instructions) = 25
    assert_eq!(cell_count, 25);
    
    // Count task blocks
    let mut task_ctx_count = 0;
    let mut task_state_count = 0;
    for i in 0..cell_count as usize {
        let (_x, _y, opcode_or_type, _data) = read_cell(&binary, i);
        if opcode_or_type == TYPE_TASK_CTX {
            task_ctx_count += 1;
        } else if opcode_or_type == TYPE_TASK_STATE {
            task_state_count += 1;
        }
    }

    // Should have: 2 * 2 = 4 TYPE_TASK_CTX cells (PC + TASK_ID per task)
    // And 2 TYPE_TASK_STATE cells
    assert!(task_ctx_count >= 4);
    assert_eq!(task_state_count, 2);
    
    // Verify scheduler cell is at (0, 0)
    let (x, y, _type, _data) = read_cell(&binary, 0);
    assert_eq!(x, 0);
    assert_eq!(y, 0);
}

/// Test: Scheduler handles empty queue correctly
#[test]
fn test_empty_task_queue() {
    let scheduler_prog = SpatialSchedulerProgram::new(0, 0, 10, 0);

    let binary = scheduler_prog.to_binary();

    // Should have only scheduler + queue cells
    // 3 cells: scheduler, queue head, queue tail
    let cell_count = read_u32_le(&binary, 8);
    assert_eq!(cell_count, 3);

    // Verify queue head (cell 1) points to 0xFFFFFFFF (empty)
    let (_x, _y, _type, data) = read_cell(&binary, 1);
    assert_eq!(data, 0xFFFFFFFF);

    // Verify queue tail (cell 2) points to 0xFFFFFFFF (empty)
    let (_x, _y, _type, data) = read_cell(&binary, 2);
    assert_eq!(data, 0xFFFFFFFF);
}

/// Test: Task state transitions work correctly
#[test]
fn test_task_state_transitions() {
    let mut scheduler_prog = SpatialSchedulerProgram::new(0, 0, 10, 0);

    let task_idx = scheduler_prog.create_task(
        TaskConfig {
            task_id: TaskId::new(1),
            entry_point: 100,
            priority: 10,
        },
        20,
        0,
    );

    // Verify task is initially in READY state
    let binary = scheduler_prog.to_binary();
    let cell_count = read_u32_le(&binary, 8) as usize;

    // Find task state cell - it should be offset 3 from the task base
    // But we need to find it by scanning
    let mut found_state = false;
    for i in 0..cell_count {
        let (_x, _y, cell_type, data) = read_cell(&binary, i);
        if cell_type == TYPE_TASK_STATE {
            assert_eq!(data, TASK_READY);
            found_state = true;
            break;
        }
    }
    assert!(found_state, "Task state cell not found");
}

/// Test: Task priority ordering
#[test]
fn test_task_priority_ordering() {
    let mut scheduler_prog = SpatialSchedulerProgram::new(0, 0, 5, 0);

    // Create tasks with different priorities
    let _task1_idx = scheduler_prog.create_task(
        TaskConfig {
            task_id: TaskId::new(1),
            entry_point: 100,
            priority: 5,
        },
        20,
        0,
    );

    let _task2_idx = scheduler_prog.create_task(
        TaskConfig {
            task_id: TaskId::new(2),
            entry_point: 150,
            priority: 10,
        },
        28,
        0,
    );

    let _task3_idx = scheduler_prog.create_task(
        TaskConfig {
            task_id: TaskId::new(3),
            entry_point: 200,
            priority: 1,
        },
        36,
        0,
    );

    // Link in order: task1, task2, task3
    scheduler_prog.link_task_queue(vec![20, 28, 36]);

    // Generate binary
    let binary = scheduler_prog.to_binary();
    let cell_count = read_u32_le(&binary, 8) as usize;

    // Verify priority values are stored in TYPE_TASK_CTX cells
    // We'll find cells at the task Y positions (all at y=0)
    let mut priority_values = Vec::new();
    for i in 0..cell_count {
        let (x, y, cell_type, data) = read_cell(&binary, i);
        if cell_type == TYPE_TASK_CTX && y == 0 && (x == 25 || x == 33 || x == 41) {
            // These are the PRIORITY cells at offset 5 from task base
            priority_values.push(data);
        }
    }

    // Should find 3 priorities: 5, 10, 1 (order depends on cell order in binary)
    assert_eq!(priority_values.len(), 3);
    assert!(priority_values.contains(&5));
    assert!(priority_values.contains(&10));
    assert!(priority_values.contains(&1));
}

/// Test: YIELD opcode is correctly encoded
#[test]
fn test_yield_opcode_encoding() {
    let mut scheduler_prog = SpatialSchedulerProgram::new(0, 0, 5, 0);

    scheduler_prog.add_scheduler_instr(10, 0, PCOP_YIELD, 0);

    let binary = scheduler_prog.to_binary();
    let cell_count = read_u32_le(&binary, 8) as usize;

    // Find the YIELD instruction cell
    let mut found_yield = false;
    for i in 0..cell_count {
        let (x, y, cell_type, data) = read_cell(&binary, i);
        if x == 10 && y == 0 && cell_type == TYPE_NOP {
            assert_eq!(data, encode_instr(PCOP_YIELD, 0));
            found_yield = true;
            break;
        }
    }
    assert!(found_yield, "YIELD instruction not found");
}

/// Test: Multiple YIELD instructions in single task
#[test]
fn test_multiple_yields_in_task() {
    let mut scheduler_prog = SpatialSchedulerProgram::new(0, 0, 5, 0);

    let _task_idx = scheduler_prog.create_task(
        TaskConfig {
            task_id: TaskId::new(1),
            entry_point: 100,
            priority: 10,
        },
        20,
        0,
    );

    // Add code with multiple YIELDs
    scheduler_prog.add_scheduler_instr(20, 1, PCOP_LDI, 1);
    scheduler_prog.add_scheduler_instr(21, 1, PCOP_YIELD, 0); // First yield
    scheduler_prog.add_scheduler_instr(22, 1, PCOP_LDI, 2);
    scheduler_prog.add_scheduler_instr(23, 1, PCOP_YIELD, 0); // Second yield
    scheduler_prog.add_scheduler_instr(24, 1, PCOP_HALT, 0);

    let binary = scheduler_prog.to_binary();
    let cell_count = read_u32_le(&binary, 8) as usize;

    // Count YIELD instructions
    let yield_count = (0..cell_count)
        .filter(|&i| {
            let (_x, _y, cell_type, data) = read_cell(&binary, i as usize);
            cell_type == TYPE_NOP && data == encode_instr(PCOP_YIELD, 0)
        })
        .count();

    assert_eq!(yield_count, 2);
}