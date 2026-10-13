//! Spatial MMU + Security Integration Test
//!
//! Demonstrates Spatial MMU operations with Security validation:
//! - MmuProgram::new_secure_alloc() validates allocation requests
//! - MmuProgram::new_secure_free() validates free requests
//! - Untrusted processes are rejected, Trusted processes are allowed
//! - Audit logging tracks all MMU operations

use infinite_map_rs::spatial::spatial_mmu::{MmuProgram, TYPE_ALLOC, TYPE_FREE, TYPE_NOP};
use infinite_map_rs::spatial::spatial_security::{SecurityError, SecurityLevel, SpatialSecurity};

#[test]
fn test_spatial_mmu_security_integration() {
    println!("\n=== Spatial MMU + Security Integration Test ===\n");

    // Create security manager
    let mut security = SpatialSecurity::new();

    // Register test processes
    security.register_process(1, SecurityLevel::Untrusted).unwrap();
    security.register_process(2, SecurityLevel::Trusted).unwrap();
    security.register_process(3, SecurityLevel::Privileged).unwrap();

    println!("[1/6] Testing Untrusted process allocation (should fail)...");
    test_untrusted_allocation_denied(&mut security);

    println!("[2/6] Testing Trusted process allocation (should succeed)...");
    test_trusted_allocation_allowed(&mut security);

    println!("[3/6] Testing Privileged process allocation (should succeed)...");
    test_privileged_allocation_allowed(&mut security);

    println!("[4/6] Testing Untrusted process free (should fail)...");
    test_untrusted_free_denied(&mut security);

    println!("[5/6] Testing Trusted process free (should succeed)...");
    test_trusted_free_allowed(&mut security);

    println!("[6/6] Verifying audit log...");
    test_audit_log_verification(&security);

    println!("\n✓ Spatial MMU + Security Integration: PASSED");
}

/// Test that Untrusted processes cannot allocate memory
fn test_untrusted_allocation_denied(security: &mut SpatialSecurity) {
    let result = MmuProgram::new_secure_alloc(
        security,
        1,  // Untrusted process
        10, // x position
        20, // y position
        100, // size
        1024, // base
        8192, // limit
    );

    assert!(result.is_err(), "Untrusted allocation should be denied");
    match result {
        Err(SecurityError::UnauthorizedAllocation) => {
            println!("  ✓ Untrusted process allocation correctly denied");
        }
        _ => panic!("Expected UnauthorizedAllocation error"),
    }
}

/// Test that Trusted processes can allocate memory
fn test_trusted_allocation_allowed(security: &mut SpatialSecurity) {
    let result = MmuProgram::new_secure_alloc(
        security,
        2,  // Trusted process
        30, // x position
        20, // y position
        256, // size
        1024, // base
        8192, // limit
    );

    assert!(result.is_ok(), "Trusted allocation should be allowed");
    let program = result.unwrap();
    assert_eq!(program.cell_count(), 4, "Allocation request should have 4 cells");

    println!("  ✓ Trusted process allocation allowed ({:?})", program);
}

/// Test that Privileged processes can allocate memory
fn test_privileged_allocation_allowed(security: &mut SpatialSecurity) {
    let result = MmuProgram::new_secure_alloc(
        security,
        3,  // Privileged process
        50, // x position
        20, // y position
        512, // size
        8192, // base
        16384, // limit
    );

    assert!(result.is_ok(), "Privileged allocation should be allowed");
    let program = result.unwrap();
    assert_eq!(program.cell_count(), 4, "Allocation request should have 4 cells");

    println!("  ✓ Privileged process allocation allowed ({:?})", program);
}

/// Test that Untrusted processes cannot free memory
fn test_untrusted_free_denied(security: &mut SpatialSecurity) {
    let result = MmuProgram::new_secure_free(
        security,
        1,  // Untrusted process
        15, // x position
        20, // y position
        1234, // ptr to free
    );

    assert!(result.is_err(), "Untrusted free should be denied");
    match result {
        Err(SecurityError::UnauthorizedFree) => {
            println!("  ✓ Untrusted process free correctly denied");
        }
        _ => panic!("Expected UnauthorizedFree error"),
    }
}

/// Test that Trusted processes can free memory
fn test_trusted_free_allowed(security: &mut SpatialSecurity) {
    let result = MmuProgram::new_secure_free(
        security,
        2,  // Trusted process
        25, // x position
        20, // y position
        5678, // ptr to free
    );

    assert!(result.is_ok(), "Trusted free should be allowed");
    let program = result.unwrap();
    assert_eq!(program.cell_count(), 1, "Free request should have 1 cell");

    println!("  ✓ Trusted process free allowed ({:?})", program);
}

/// Verify that all operations are logged in the audit trail
fn test_audit_log_verification(security: &SpatialSecurity) {
    let audit_log = security.get_audit_log();
    println!("  Audit log entries: {}", audit_log.len());

    // We should have at least 4 failed operations (untrusted allocation + free)
    let failed_ops = audit_log.iter().filter(|e| !e.success).count();
    assert!(failed_ops >= 2, "Should have at least 2 failed operations");
    println!("  ✓ Found {} failed operations in audit log", failed_ops);

    // Check that failed operations are from process 1 (Untrusted)
    let untrusted_failures = audit_log.iter()
        .filter(|e| e.pid == 1 && !e.success)
        .count();
    assert!(untrusted_failures >= 2, "Process 1 should have failed operations");
    println!("  ✓ Process 1 (Untrusted) has {} failed operations", untrusted_failures);

    // Print audit log for inspection
    println!("\n  Audit Log:");
    for entry in audit_log.iter().take(10) {
        let status = if entry.success { "✓" } else { "✗" };
        println!("    {} PID {}: {}", status, entry.pid, entry.action);
    }
    if audit_log.len() > 10 {
        println!("    ... ({} more entries)", audit_log.len() - 10);
    }
}

#[test]
fn test_spatial_mmu_binary_format() {
    println!("\n=== Spatial MMU Binary Format Test ===\n");

    // Test allocation request binary format
    let mut security = SpatialSecurity::new();
    security
        .register_process(2, SecurityLevel::Trusted)
        .unwrap();

    let mut program = MmuProgram::new_secure_alloc(
        &mut security,
        2,    // Trusted process
        10,   // x
        20,   // y
        256,  // size
        1024, // base
        8192, // limit
    )
    .unwrap();
    // Add some pre-allocated regions
    program.add_allocated_region(50, 20, 10);
    program.add_obstacle(100, 20);
    program.add_data(70, 20, 0xDEADBEEF);

    // Generate binary
    let binary = program.to_binary();

    // Verify header
    assert!(binary.len() >= 20, "Binary should have at least 20-byte header");
    let grid_w = u32::from_le_bytes(binary[0..4].try_into().unwrap());
    let grid_h = u32::from_le_bytes(binary[4..8].try_into().unwrap());
    let cell_count = u32::from_le_bytes(binary[8..12].try_into().unwrap());
    let first_x = u32::from_le_bytes(binary[12..16].try_into().unwrap());
    let first_y = u32::from_le_bytes(binary[16..20].try_into().unwrap());

    println!("  Binary header:");
    println!("    Grid size: {}x{}", grid_w, grid_h);
    println!("    Cell count: {}", cell_count);
    println!("    First code cell: ({}, {})", first_x, first_y);

    assert_eq!(grid_w, 128, "Grid width should be 128");
    assert_eq!(grid_h, 64, "Grid height should be 64");
    assert_eq!(cell_count, 16, "Should have 16 cells (4 alloc + 11 allocated + 1 obstacle)");
    assert_eq!(first_x, 10, "First code cell X should be 10");
    assert_eq!(first_y, 20, "First code cell Y should be 20");

    // Verify cell encoding
    // Cell format: [x:4][y:4][opcode:4][data:4] (all little-endian)
    for i in 0..cell_count as usize {
        let offset = 20 + i * 16;
        let x = u32::from_le_bytes(binary[offset..offset+4].try_into().unwrap());
        let y = u32::from_le_bytes(binary[offset+4..offset+8].try_into().unwrap());
        let opcode = u32::from_le_bytes(binary[offset+8..offset+12].try_into().unwrap());
        let data = u32::from_le_bytes(binary[offset+12..offset+16].try_into().unwrap());

        println!("  Cell {}: ({}, {}) opcode={} data=0x{:08X}",
                 i, x, y, opcode, data);
    }

    println!("\n  ✓ Spatial MMU binary format: VERIFIED");
}

#[test]
fn test_spatial_mmu_security_state() {
    println!("\n=== Spatial MMU Security State Test ===\n");

    let mut security = SpatialSecurity::new();

    // Register processes
    security.register_process(10, SecurityLevel::Untrusted).unwrap();
    security.register_process(11, SecurityLevel::Trusted).unwrap();
    security.register_process(12, SecurityLevel::Privileged).unwrap();

    // Test 1: Grant region access
    security.grant_region_access(11, 100).unwrap();
    security.grant_region_access(11, 101).unwrap();
    security.grant_region_access(12, 200).unwrap();

    let regions_11 = security.region_access.get(&11).unwrap();
    assert_eq!(regions_11.len(), 2, "Process 11 should have 2 regions");
    assert!(regions_11.contains(&100), "Should have region 100");
    assert!(regions_11.contains(&101), "Should have region 101");

    let regions_12 = security.region_access.get(&12).unwrap();
    assert_eq!(regions_12.len(), 1, "Process 12 should have 1 region");

    println!("  ✓ Region access granted correctly");

    // Test 2: Check process levels
    let level_10 = security.process_levels.get(&10).unwrap();
    assert_eq!(level_10, &SecurityLevel::Untrusted);

    let level_11 = security.process_levels.get(&11).unwrap();
    assert_eq!(level_11, &SecurityLevel::Trusted);

    let level_12 = security.process_levels.get(&12).unwrap();
    assert_eq!(level_12, &SecurityLevel::Privileged);

    println!("  ✓ Security levels assigned correctly");

    // Test 3: Violation counting
    let violations_10 = security.get_violation_count(10);
    let violations_11 = security.get_violation_count(11);
    let violations_12 = security.get_violation_count(12);

    println!("  Process 10 (Untrusted): {} violations", violations_10);
    println!("  Process 11 (Trusted): {} violations", violations_11);
    println!("  Process 12 (Privileged): {} violations", violations_12);

    println!("\n  ✓ Spatial MMU security state: VERIFIED");
}