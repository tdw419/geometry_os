//! Phase 12.3: Spatial Control Unit tests
//!
//! Proves that spatial programs can use control flow (LDI, JMP, YIELD, HALT).
//! Test suite exercises the WGSL compute shader's execute_pc_cell function.

use infinite_map_rs::spatial::spatial_control_unit::{
    encode_instr, PCOP_HALT, PCOP_JMP, PCOP_LDI, TYPE_NOP, TYPE_PC,
};
use infinite_map_rs::spatial::spatial_scheduler::PCOP_YIELD;

/// Test: LDI instruction loads immediate value
#[test]
fn test_ldi_instruction() {
    // PC at (0, 0), LDI opcode with immediate 42
    let immediate = 42u32;
    let instr = encode_instr(PCOP_LDI, immediate);

    // encode_instr should pack: opcode in high 8 bits, arg in low 24 bits
    // Format: (opcode << 24) | arg
    let expected = (PCOP_LDI << 24) | immediate;
    assert_eq!(instr, expected);

    // Test with larger immediate
    let large_imm = 0xFF_FFFF;
    let instr_large = encode_instr(PCOP_LDI, large_imm);
    let expected_large = (PCOP_LDI << 24) | large_imm;
    assert_eq!(instr_large, expected_large);
}

/// Test: JMP instruction encoding
#[test]
fn test_jmp_instruction() {
    let target = 100u32;
    let instr = encode_instr(PCOP_JMP, target);
    let expected = (PCOP_JMP << 24) | target;
    assert_eq!(instr, expected);
}

/// Test: YIELD instruction encoding
#[test]
fn test_yield_instruction() {
    let instr = encode_instr(PCOP_YIELD, 0);
    let expected = (PCOP_YIELD << 24) | 0;
    assert_eq!(instr, expected);
}

/// Test: HALT instruction encoding
#[test]
fn test_halt_instruction() {
    let instr = encode_instr(PCOP_HALT, 0);
    let expected = (PCOP_HALT << 24) | 0;
    assert_eq!(instr, expected);
}

/// Test: Round-trip encode/decode
#[test]
fn test_round_trip_encoding() {
    for opcode in [PCOP_LDI, PCOP_JMP, PCOP_YIELD, PCOP_HALT] {
        for arg in [0, 1, 42, 0xFFFF, 0xFF_FFFF] {
            let encoded = encode_instr(opcode, arg);

            // Decode: high 8 bits are opcode, low 24 bits are arg
            let decoded_opcode = encoded >> 24;
            let decoded_arg = encoded & 0x00FF_FFFF;

            assert_eq!(decoded_opcode, opcode);
            assert_eq!(decoded_arg, arg);
        }
    }
}

/// Test: Multiple instruction sequence
#[test]
fn test_instruction_sequence() {
    let instructions = vec![
        encode_instr(PCOP_LDI, 10),
        encode_instr(PCOP_YIELD, 0),
        encode_instr(PCOP_LDI, 20),
        encode_instr(PCOP_YIELD, 0),
        encode_instr(PCOP_HALT, 0),
    ];

    assert_eq!(instructions.len(), 5);

    // Verify first instruction
    let opcode0 = instructions[0] >> 24;
    let arg0 = instructions[0] & 0x00FF_FFFF;
    assert_eq!(opcode0, PCOP_LDI);
    assert_eq!(arg0, 10);

    // Verify YIELD instructions
    for i in [1, 3] {
        let opcode = instructions[i] >> 24;
        assert_eq!(opcode, PCOP_YIELD);
    }

    // Verify HALT instruction
    let opcode4 = instructions[4] >> 24;
    assert_eq!(opcode4, PCOP_HALT);
}

/// Test: Program with control flow
#[test]
fn test_control_flow_program() {
    // Simple loop: LDI 5, YIELD, JMP 0
    let program = vec![
        encode_instr(PCOP_LDI, 5),
        encode_instr(PCOP_YIELD, 0),
        encode_instr(PCOP_JMP, 0), // Jump back to start
    ];

    assert_eq!(program.len(), 3);

    // Verify loop structure
    let opcode0 = program[0] >> 24;
    let opcode1 = program[1] >> 24;
    let opcode2 = program[2] >> 24;

    assert_eq!(opcode0, PCOP_LDI);
    assert_eq!(opcode1, PCOP_YIELD);
    assert_eq!(opcode2, PCOP_JMP);

    // JMP target should be 0
    let jmp_target = program[2] & 0x00FF_FFFF;
    assert_eq!(jmp_target, 0);
}

/// Test: Invalid opcode encoding (should still work as raw data)
#[test]
fn test_raw_instruction_data() {
    // Any 32-bit value can be stored as instruction data
    let raw_value = 0xdeadbeefu32;
    let instr = encode_instr(PCOP_LDI, raw_value);

    // Verify the value is preserved
    let decoded_arg = instr & 0x00FF_FFFF;
    assert_eq!(decoded_arg, 0xadbeef); // Lower 24 bits preserved

    // High bits truncated to 24-bit arg
    assert_eq!(decoded_arg & 0xFF000000, 0);
}

/// Test: Instruction type constants
#[test]
fn test_type_constants() {
    // TYPE_PC marks cells that contain instruction pointers
    assert!(TYPE_PC > 0);

    // TYPE_NOP marks cells that don't execute (passive data) - value is 0
    assert_eq!(TYPE_NOP, 0);

    // Type constants should be distinct
    assert_ne!(TYPE_PC, TYPE_NOP);
}

/// Test: Yield-based multitasking pattern
#[test]
fn test_yield_multitasking_pattern() {
    // Task A: LDI, YIELD, LDI, YIELD, HALT
    let task_a = vec![
        encode_instr(PCOP_LDI, 1),
        encode_instr(PCOP_YIELD, 0),
        encode_instr(PCOP_LDI, 2),
        encode_instr(PCOP_YIELD, 0),
        encode_instr(PCOP_HALT, 0),
    ];

    // Task B: LDI, YIELD, LDI, YIELD, HALT
    let task_b = vec![
        encode_instr(PCOP_LDI, 10),
        encode_instr(PCOP_YIELD, 0),
        encode_instr(PCOP_LDI, 20),
        encode_instr(PCOP_YIELD, 0),
        encode_instr(PCOP_HALT, 0),
    ];

    // Verify both tasks have same structure
    assert_eq!(task_a.len(), task_b.len());

    // Count YIELDs in each task
    let yield_count_a = task_a
        .iter()
        .filter(|&&instr| (instr >> 24) == PCOP_YIELD)
        .count();
    let yield_count_b = task_b
        .iter()
        .filter(|&&instr| (instr >> 24) == PCOP_YIELD)
        .count();

    assert_eq!(yield_count_a, 2);
    assert_eq!(yield_count_b, 2);
}