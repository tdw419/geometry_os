/// Helper to create a small synthetic ELF kernel for testing GPU execution
use infinite_map_rs::geoasm_materializer::CellState;

/// Build a minimal test ELF32 RISC-V binary
pub fn build_test_elf(entry_point: u32, segment_data: &[u8]) -> Vec<u8> {
    let mut elf = Vec::new();

    // ELF header (52 bytes)
    elf.extend_from_slice(b"\x7fELF"); // e_ident[0..3] = magic
    elf.push(1); // e_ident[4] = ELFCLASS32
    elf.extend_from_slice(&[0u8; 11]); // e_ident[5..15] = padding

    elf.extend_from_slice(&2u16.to_le_bytes()); // e_type = ET_EXEC
    elf.extend_from_slice(&0xF3u16.to_le_bytes()); // e_machine = EM_RISCV
    elf.extend_from_slice(&1u32.to_le_bytes()); // e_version = 1
    elf.extend_from_slice(&entry_point.to_le_bytes()); // e_entry

    let ph_offset = 52u32;
    elf.extend_from_slice(&ph_offset.to_le_bytes()); // e_phoff
    elf.extend_from_slice(&0u32.to_le_bytes()); // e_shoff = 0
    elf.extend_from_slice(&0u32.to_le_bytes()); // e_flags = 0

    elf.extend_from_slice(&52u16.to_le_bytes()); // e_ehsize
    elf.extend_from_slice(&32u16.to_le_bytes()); // e_phentsize
    elf.extend_from_slice(&1u16.to_le_bytes()); // e_phnum = 1
    elf.extend_from_slice(&0u16.to_le_bytes()); // e_shentsize
    elf.extend_from_slice(&0u16.to_le_bytes()); // e_shnum
    elf.extend_from_slice(&0u16.to_le_bytes()); // e_shstrndx

    // Program header (32 bytes)
    elf.extend_from_slice(&1u32.to_le_bytes()); // p_type = PT_LOAD
    elf.extend_from_slice(&84u32.to_le_bytes()); // p_offset = after ELF header + program header (52 + 32)
    elf.extend_from_slice(&0x8000_0000u32.to_le_bytes()); // p_vaddr
    elf.extend_from_slice(&0x8000_0000u32.to_le_bytes()); // p_paddr
    elf.extend_from_slice(&(segment_data.len() as u32).to_le_bytes()); // p_filesz
    elf.extend_from_slice(&(segment_data.len() as u32).to_le_bytes()); // p_memsz
    elf.extend_from_slice(&5u32.to_le_bytes()); // p_flags = PF_R | PF_X
    elf.extend_from_slice(&0x1000u32.to_le_bytes()); // p_align

    // Segment data
    elf.extend_from_slice(segment_data);

    elf
}

/// Create a minimal synthetic kernel that fits in the grid
/// Uses simple RISC-V instructions that demonstrate basic execution
pub fn create_synthetic_kernel_small() -> Vec<u8> {
    // Simple program that sets x10 = 42, then halts
    // Instructions (RV32I):
    //   addi x10, x0, 42  (0x13 0x05 0x2a 0x00)
    //   ecall              (0x73 0x00 0x00 0x00)
    //   addi x10, x10, 1  (0x13 0x05 0x01 0x05) - increment
    //   jal x1, -12       (0x6f 0xf0 0xff 0xfe) - loop
    let instructions = [
        0x13, 0x05, 0x2a, 0x00, // addi x10, x0, 42
        0x73, 0x00, 0x00, 0x00, // ecall
        0x13, 0x05, 0x01, 0x05, // addi x10, x10, 1
        0x6f, 0xf0, 0xff, 0xfe, // jal x1, -12 (loop)
    ];

    build_test_elf(0x8000_0000, &instructions)
}

/// Create a medium synthetic kernel (~100 words, ~400 bytes)
/// Still fits in 128x64 grid with room for bootloader
pub fn create_synthetic_kernel_medium() -> Vec<u8> {
    let mut instructions = Vec::new();

    // Initialize multiple registers
    instructions.extend_from_slice(&[0x13, 0x05, 0x2a, 0x00]); // addi x10, x0, 42
    instructions.extend_from_slice(&[0x13, 0x0a, 0x10, 0x00]); // addi x20, x0, 16
    instructions.extend_from_slice(&[0x13, 0x0b, 0x05, 0x00]); // addi x21, x0, 5

    // Some arithmetic
    instructions.extend_from_slice(&[0x33, 0x55, 0x0a, 0x00]); // add x10, x10, x20

    // A small loop
    for _ in 0..20 {
        instructions.extend_from_slice(&[0x13, 0x05, 0x01, 0x05]); // addi x10, x10, 1
    }

    // Store result (simulated - no actual memory yet)
    instructions.extend_from_slice(&[0x23, 0x05, 0x10, 0x20]); // sw x10, 16(x1) - placeholder

    // Loop back
    instructions.extend_from_slice(&[0x6f, 0x00, 0xc0, 0xff]); // jal x0, -64

    // Fill to ~100 words (400 bytes)
    while instructions.len() < 400 {
        instructions.push(0); // nop
    }

    build_test_elf(0x8000_0000, &instructions)
}

/// Verify kernel fits in 128x64 grid with bootloader
pub fn verify_kernel_fits(kernel_words: usize) -> bool {
    // Grid: 128x64 = 8192 cells
    // Bootloader: ~33 cells
    // WALL boundary: ~2*(128+64) = 384 cells
    // Available for kernel: 8192 - 33 - 384 = 7775 cells
    kernel_words <= 7775
}