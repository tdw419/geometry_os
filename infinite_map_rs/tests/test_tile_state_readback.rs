//! Phase 9.2-B: Verify TileState GPU readback
//!
//! Tests that read_tile_state() correctly reads back TileState from GPU
//! and verifies that PC advances and GPRs change during execution.

use infinite_map_rs::spatial::grid_runner::GridRunner;
use infinite_map_rs::spatial::payload_loader::PayloadLoader;

/// Create minimal synthetic kernel (matches minimal_xv6_execution_test)
fn create_synthetic_kernel() -> Vec<u8> {
    let mut elf = Vec::new();

    // ELF header (52 bytes)
    elf.extend_from_slice(b"\x7fELF"); // e_ident magic
    elf.push(1); // e_ident.class = ELFCLASS32
    elf.extend_from_slice(&[0u8; 11]); // e_ident padding
    elf.extend_from_slice(&2u16.to_le_bytes()); // e_type = ET_EXEC
    elf.extend_from_slice(&0xF3u16.to_le_bytes()); // e_machine = EM_RISCV
    elf.extend_from_slice(&1u32.to_le_bytes()); // e_version = 1
    elf.extend_from_slice(&0x8000_0000u32.to_le_bytes()); // e_entry = 0x80000000
    elf.extend_from_slice(&52u32.to_le_bytes()); // e_phoff = 52
    elf.extend_from_slice(&0u32.to_le_bytes()); // e_shoff = 0
    elf.extend_from_slice(&0u32.to_le_bytes()); // e_flags = 0
    elf.extend_from_slice(&52u16.to_le_bytes()); // e_ehsize = 52
    elf.extend_from_slice(&32u16.to_le_bytes()); // e_phentsize = 32
    elf.extend_from_slice(&1u16.to_le_bytes()); // e_phnum = 1
    elf.extend_from_slice(&0u16.to_le_bytes()); // e_shentsize = 0
    elf.extend_from_slice(&0u16.to_le_bytes()); // e_shnum = 0
    elf.extend_from_slice(&0u16.to_le_bytes()); // e_shstrndx = 0

    // Program header (32 bytes, starting at offset 52)
    // Correct order: p_type, p_offset, p_vaddr, p_paddr, p_filesz, p_memsz, p_flags, p_align
    elf.extend_from_slice(&1u32.to_le_bytes()); // p_type = PT_LOAD
    elf.extend_from_slice(&84u32.to_le_bytes()); // p_offset = 84
    elf.extend_from_slice(&0x8000_0000u32.to_le_bytes()); // p_vaddr = 0x80000000
    elf.extend_from_slice(&0x8000_0000u32.to_le_bytes()); // p_paddr = 0x80000000
    elf.extend_from_slice(&16u32.to_le_bytes()); // p_filesz = 16
    elf.extend_from_slice(&16u32.to_le_bytes()); // p_memsz = 16
    elf.extend_from_slice(&5u32.to_le_bytes()); // p_flags = PF_X | PF_R
    elf.extend_from_slice(&0x1000u32.to_le_bytes()); // p_align = 0x1000

    // Code section (16 bytes): addi x10,x0,42; ecall; addi x10,x10,1; jal x1,-12
    elf.extend_from_slice(&[0x13, 0x05, 0x2a, 0x00]); // addi x10, x0, 42
    elf.extend_from_slice(&[0x73, 0x00, 0x00, 0x00]); // ecall
    elf.extend_from_slice(&[0x13, 0x05, 0x01, 0x05]); // addi x10, x10, 1
    elf.extend_from_slice(&[0x6f, 0xf0, 0xff, 0xfe]); // jal x1, -12

    elf
}

/// Test GridRunner TileState readback with synthetic kernel
#[tokio::test]
#[ignore] // Requires GPU - run with: cargo test --features larger_grid -- --ignored
async fn test_tile_state_readback() {
    let mut loader = PayloadLoader::new(512, 256);

    let kernel_data = create_synthetic_kernel();

    let (kernel_image, _) = loader.parse_kernel_image(&kernel_data).expect("Failed");
    let region = loader.load_kernel(&kernel_data).expect("Failed");
    let cells = loader
        .emit_kernel_program(&kernel_image, &region)
        .expect("Failed");

    // Pack and load
    let bin_data = {
        let first_code = cells
            .iter()
            .find(|(_, y, cell)| *y == 0 && cell.opcode() != 0 && cell.opcode() != 1)
            .map(|(x, y, _)| (*x as u32, *y as u32))
            .unwrap_or((0, 0));
        let mut data = Vec::new();
        data.extend_from_slice(&512u32.to_le_bytes());
        data.extend_from_slice(&256u32.to_le_bytes());
        data.extend_from_slice(&(cells.len() as u32).to_le_bytes());
        data.extend_from_slice(&first_code.0.to_le_bytes());
        data.extend_from_slice(&first_code.1.to_le_bytes());
        for (x, y, cell) in cells {
            data.extend_from_slice(&(x as u32).to_le_bytes());
            data.extend_from_slice(&(y as u32).to_le_bytes());
            data.extend_from_slice(&cell.opcode_or_type.to_le_bytes());
            data.extend_from_slice(&cell.data_buffer.to_le_bytes());
        }
        data
    };

    let mut runner = GridRunner::new()
        .await
        .expect("Failed to create GridRunner");
    runner.load_binary(&bin_data).expect("Failed to load");

    // Read initial TileState
    let initial_state = runner
        .read_tile_state()
        .await
        .expect("Failed to read TileState");

    println!("Initial TileState:");
    println!("  PC: 0x{:08x}", initial_state.pc);
    println!("  Status: {}", initial_state.status);
    println!("  Instructions: {}", initial_state.instruction_count);
    println!("  x10: 0x{:08x}", initial_state.regs[10]);

    assert_eq!(
        initial_state.pc, 0x20000000,
        "Initial PC should be kernel entry (0x20000000)"
    );
    assert_eq!(initial_state.status, 0, "Initial status should be running");
    assert_eq!(
        initial_state.instruction_count, 0,
        "Initial instruction count should be 0"
    );
    assert_eq!(initial_state.regs[10], 0, "Initial x10 should be 0");

    println!("✅ Initial TileState readback successful");
}

/// Test that GPRs change after execution
#[tokio::test]
#[ignore] // Requires GPU - run with: cargo test --features larger_grid -- --ignored
async fn test_tile_state_gpr_change() {
    let mut loader = PayloadLoader::new(512, 256);

    let kernel_data = create_synthetic_kernel();

    let (kernel_image, _entry_point) = loader
        .parse_kernel_image(&kernel_data)
        .expect("Failed to parse kernel");

    let region = loader
        .load_kernel(&kernel_data)
        .expect("Failed to load kernel");

    let cells = loader
        .emit_kernel_program(&kernel_image, &region)
        .expect("Failed to emit program");

    // Pack into binary format
    let bin_data = {
        let first_code = cells
            .iter()
            .find(|(_, y, cell)| *y == 0 && cell.opcode() != 0 && cell.opcode() != 1)
            .map(|(x, y, _)| (*x as u32, *y as u32))
            .unwrap_or((0, 0));

        let mut data = Vec::new();
        data.extend_from_slice(&512u32.to_le_bytes());
        data.extend_from_slice(&256u32.to_le_bytes());
        data.extend_from_slice(&(cells.len() as u32).to_le_bytes());
        data.extend_from_slice(&first_code.0.to_le_bytes());
        data.extend_from_slice(&first_code.1.to_le_bytes());

        for (x, y, cell) in cells {
            data.extend_from_slice(&(x as u32).to_le_bytes());
            data.extend_from_slice(&(y as u32).to_le_bytes());
            data.extend_from_slice(&cell.opcode_or_type.to_le_bytes());
            data.extend_from_slice(&cell.data_buffer.to_le_bytes());
        }
        data
    };

    let mut runner = GridRunner::new()
        .await
        .expect("Failed to create GridRunner");

    runner
        .load_binary(&bin_data)
        .expect("Failed to load binary");

    // Read initial state
    let initial_state = runner
        .read_tile_state()
        .await
        .expect("Failed to read TileState");

    // Execute 100 ticks
    for _ in 0..100 {
        runner.tick().await.expect("Tick failed");
    }

    // Read TileState after execution
    let state = runner
        .read_tile_state()
        .await
        .expect("Failed to read TileState");

    println!("After 100 ticks:");
    println!("  PC: 0x{:08x}", state.pc);
    println!("  Instructions: {}", state.instruction_count);
    println!("  x10: 0x{:08x}", state.regs[10]);

    // Verify execution happened
    assert!(
        state.instruction_count > 0,
        "Should have executed instructions"
    );

    // PC should have moved from initial position
    assert!(
        state.pc != initial_state.pc,
        "PC should have advanced during execution"
    );

    // GPRs should have changed
    let gpr_changed = state
        .regs
        .iter()
        .zip(initial_state.regs.iter())
        .any(|(a, b)| a != b);
    assert!(gpr_changed, "At least one GPR should have changed");

    println!("✅ GPR change verified");
    println!("   - Instructions executed: {}", state.instruction_count);
    println!(
        "   - PC advanced: 0x{:08x} -> 0x{:08x}",
        initial_state.pc, state.pc
    );
}