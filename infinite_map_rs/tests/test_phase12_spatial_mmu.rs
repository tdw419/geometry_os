//! Phase 12.2: Spatial MMU integration tests
//!
//! Proves that memory allocation happens on the GPU: a TYPE_ALLOC request
//! cell first-fit scans its heap window in the shader, marks the region with
//! TYPE_ALLOC cells, and delivers the pointer — the CPU only loads the binary
//! and calls tick(). TYPE_FREE cells release regions the same way.

use infinite_map_rs::spatial::grid_runner::GridRunner;
use infinite_map_rs::spatial::spatial_mmu::{
    cell_index, MmuProgram, MMU_FAIL, TYPE_ALLOC, TYPE_NOP,
};

/// First-fit allocation: the scan skips a pre-placed allocated region and
/// claims the first free run after it.
#[tokio::test]
async fn test_spatial_alloc_first_fit() {
    println!("\n═══════════════════════════════════════════════════════════════");
    println!("  Phase 12.2 Test: first-fit allocation on the GPU");
    println!("═══════════════════════════════════════════════════════════════\n");

    // Heap window: 20 cells in row 30, starting at x=4
    let base = cell_index(4, 30);
    let limit = base + 20;

    // Alloc block at (2,2); a 3-cell region already occupies the window start
    let mut program = MmuProgram::new_alloc(2, 2, 4, base, limit);
    program.add_allocated_region(4, 30, 3);

    let mut runner = GridRunner::new().await.expect("GPU init failed");
    runner
        .load_binary(&program.to_binary())
        .expect("load_binary failed");

    let mut cells = Vec::new();
    for _ in 0..4 {
        cells = runner.tick().await.expect("tick failed");
    }

    let expected_ptr = base + 3; // first free cell after the pre-placed region
    let request = &cells[program.request_index() as usize];
    let result = &cells[program.result_index() as usize];

    println!(
        "request: data={} active={} | result cell: {}",
        request.data_buffer, request.is_active, result.data_buffer
    );

    assert_eq!(result.data_buffer, expected_ptr, "first fit lands after the obstacle region");
    assert_eq!(request.data_buffer, expected_ptr, "request cell records the pointer");
    assert_eq!(request.is_active, 0, "request cell released its token when done");

    let header = &cells[expected_ptr as usize];
    assert_eq!(header.opcode_or_type, TYPE_ALLOC, "header cell marked allocated");
    assert_eq!(header.data_buffer, 4, "header cell records the region size");
    for j in 1..4u32 {
        let c = &cells[(expected_ptr + j) as usize];
        assert_eq!(c.opcode_or_type, TYPE_ALLOC, "region cell {} marked allocated", j);
        assert_eq!(c.data_buffer, 0, "region data cell {} zeroed", j);
    }
    assert_eq!(
        cells[(expected_ptr + 4) as usize].opcode_or_type,
        TYPE_NOP,
        "cell past the region stays free"
    );

    println!("✓ GPU allocator found first fit at {} and marked the region", expected_ptr);
}

/// Allocation fails with MMU_FAIL when the window has no free run of the
/// requested size, even though space exists elsewhere on the grid.
#[tokio::test]
async fn test_spatial_alloc_respects_window_isolation() {
    println!("\n═══════════════════════════════════════════════════════════════");
    println!("  Phase 12.2 Test: allocation confined to its heap window");
    println!("═══════════════════════════════════════════════════════════════\n");

    // Window of only 3 cells; request 4. The rest of the grid is free, but
    // the allocator must not touch memory outside [base, limit).
    let base = cell_index(4, 30);
    let limit = base + 3;
    let program = MmuProgram::new_alloc(2, 2, 4, base, limit);

    let mut runner = GridRunner::new().await.expect("GPU init failed");
    runner
        .load_binary(&program.to_binary())
        .expect("load_binary failed");

    let mut cells = Vec::new();
    for _ in 0..4 {
        cells = runner.tick().await.expect("tick failed");
    }

    let request = &cells[program.request_index() as usize];
    let result = &cells[program.result_index() as usize];

    println!(
        "request: data={:#x} active={} | result cell: {:#x}",
        request.data_buffer, request.is_active, result.data_buffer
    );

    assert_eq!(result.data_buffer, MMU_FAIL, "allocation must fail");
    assert_eq!(request.data_buffer, MMU_FAIL, "request cell records the failure");
    assert_eq!(request.is_active, 0, "request cell released its token");

    // Nothing inside or after the window was claimed
    for j in 0..6u32 {
        assert_eq!(
            cells[(base + j) as usize].opcode_or_type,
            TYPE_NOP,
            "cell base+{} must stay free (no partial allocation, no overflow past limit)",
            j
        );
    }

    println!("✓ Allocator failed cleanly instead of escaping its window");
}

/// A fragmented window (1-cell obstacles) cannot satisfy the request.
#[tokio::test]
async fn test_spatial_alloc_fails_when_fragmented() {
    println!("\n═══════════════════════════════════════════════════════════════");
    println!("  Phase 12.2 Test: fragmented window rejects allocation");
    println!("═══════════════════════════════════════════════════════════════\n");

    // Window of 8 cells with obstacles every 2 cells: max free run = 2 < 3
    let base = cell_index(4, 30);
    let limit = base + 8;
    let mut program = MmuProgram::new_alloc(2, 2, 3, base, limit);
    program.add_obstacle(4, 30);
    program.add_obstacle(7, 30);
    program.add_obstacle(10, 30);

    let mut runner = GridRunner::new().await.expect("GPU init failed");
    runner
        .load_binary(&program.to_binary())
        .expect("load_binary failed");

    let mut cells = Vec::new();
    for _ in 0..4 {
        cells = runner.tick().await.expect("tick failed");
    }

    let result = &cells[program.result_index() as usize];
    println!("result cell: {:#x}", result.data_buffer);

    assert_eq!(result.data_buffer, MMU_FAIL, "no free run of 3 exists");

    println!("✓ First-fit scan correctly rejected a fragmented window");
}

/// Freeing a region turns all its cells back into free NOP space and reports
/// the freed size; freeing a bad pointer fails with MMU_FAIL.
#[tokio::test]
async fn test_spatial_free_releases_region() {
    println!("\n═══════════════════════════════════════════════════════════════");
    println!("  Phase 12.2 Test: free releases an allocated region");
    println!("═══════════════════════════════════════════════════════════════\n");

    // Pre-placed 5-cell region at row 40; free request cell at (2,2)
    let region_ptr = cell_index(10, 40);
    let mut program = MmuProgram::new_free(2, 2, region_ptr);
    program.add_allocated_region(10, 40, 5);

    let mut runner = GridRunner::new().await.expect("GPU init failed");
    runner
        .load_binary(&program.to_binary())
        .expect("load_binary failed");

    let mut cells = Vec::new();
    for _ in 0..4 {
        cells = runner.tick().await.expect("tick failed");
    }

    let request = &cells[program.request_index() as usize];
    println!("request: data={} active={}", request.data_buffer, request.is_active);

    assert_eq!(request.data_buffer, 5, "free reports the released size");
    assert_eq!(request.is_active, 0, "free cell released its token");
    for j in 0..5u32 {
        let c = &cells[(region_ptr + j) as usize];
        assert_eq!(c.opcode_or_type, TYPE_NOP, "region cell {} back to free NOP", j);
        assert_eq!(c.data_buffer, 0, "region cell {} data cleared", j);
    }

    println!("✓ Region released on the GPU, header convention verified");
}

/// Freeing a pointer that is not a region header fails with MMU_FAIL.
#[tokio::test]
async fn test_spatial_free_bad_pointer_fails() {
    println!("\n═══════════════════════════════════════════════════════════════");
    println!("  Phase 12.2 Test: free rejects a non-header pointer");
    println!("═══════════════════════════════════════════════════════════════\n");

    // Points at a free NOP cell, not an allocated region header
    let program = MmuProgram::new_free(2, 2, cell_index(10, 40));

    let mut runner = GridRunner::new().await.expect("GPU init failed");
    runner
        .load_binary(&program.to_binary())
        .expect("load_binary failed");

    let mut cells = Vec::new();
    for _ in 0..4 {
        cells = runner.tick().await.expect("tick failed");
    }

    let request = &cells[program.request_index() as usize];
    println!("request: data={:#x} active={}", request.data_buffer, request.is_active);

    assert_eq!(request.data_buffer, MMU_FAIL, "bad pointer must be rejected");
    assert_eq!(request.is_active, 0, "free cell still completes and halts");

    println!("✓ Double-free / wild-free rejected via header check");
}
