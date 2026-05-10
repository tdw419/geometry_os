// riscv/cpu/alu_tests.rs -- ALU instruction execution tests (Phase 346)
//
// Tests R-type ALU (ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND),
// I-type ALU (ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI),
// and M extension (MUL, MULH, MULHU, MULHSU, DIV, DIVU, REM, REMU).
//
// Tests go through the full fetch-decode-execute pipeline by encoding
// instructions as binary and writing them to bus memory.

use super::super::bus::Bus;
use super::{Privilege, RiscvCpu, StepResult};

const RAM_BASE: u64 = 0x8000_0000;
const RAM_SIZE: usize = 1024 * 1024;

fn make_cpu_bus() -> (RiscvCpu, Bus) {
    let cpu = RiscvCpu::new();
    let bus = Bus::new(RAM_BASE, RAM_SIZE);
    (cpu, bus)
}

fn write_word(bus: &mut Bus, addr: u64, word: u32) {
    bus.write_word(addr, word)
        .unwrap_or_else(|_| panic!("write_word failed at 0x{:08X}", addr));
}

// ============================================================
// Encoding helpers
// ============================================================

/// Encode an R-type instruction.
/// Layout: [funct7(7)][rs2(5)][rs1(5)][funct3(3)][rd(5)][opcode(7)]
fn encode_r(opcode: u32, funct3: u32, rd: u8, rs1: u8, rs2: u8, funct7: u32) -> u32 {
    (funct7 << 25)
        | ((rs2 as u32) << 20)
        | ((rs1 as u32) << 15)
        | (funct3 << 12)
        | ((rd as u32) << 7)
        | opcode
}

/// Encode an I-type ALU instruction (opcode 0x13).
/// Immediate is sign-extended from 12 bits by the decoder.
/// Only the low 12 bits of `imm` are encoded.
/// Layout: [imm(12)][rs1(5)][funct3(3)][rd(5)][opcode(7)]
fn encode_i_alu(funct3: u32, rd: u8, rs1: u8, imm: i32) -> u32 {
    let imm12 = (imm as u32) & 0xFFF;
    (imm12 << 20) | ((rs1 as u32) << 15) | (funct3 << 12) | ((rd as u32) << 7) | 0x13
}

/// Encode a shift immediate I-type instruction (opcode 0x13).
/// For SLLI: funct7=0, funct3=0b001
/// For SRLI: funct7=0, funct3=0b101
/// For SRAI: funct7=0x20, funct3=0b101
/// Layout: [funct7(7)][shamt(5)][rs1(5)][funct3(3)][rd(5)][opcode(7)]
fn encode_i_shift(funct7: u32, funct3: u32, rd: u8, rs1: u8, shamt: u8) -> u32 {
    (funct7 << 25)
        | ((shamt as u32) << 20)
        | ((rs1 as u32) << 15)
        | (funct3 << 12)
        | ((rd as u32) << 7)
        | 0x13
}

/// Step one instruction at RAM_BASE.
fn step_one(cpu: &mut RiscvCpu, bus: &mut Bus) -> (StepResult, u32, [u32; 32]) {
    let result = cpu.step(bus);
    let pc = cpu.pc;
    let regs = cpu.x;
    (result, pc, regs)
}

// ============================================================
// ADD tests
// ============================================================

#[test]
fn add_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 100;
    cpu.x[6] = 200;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 0, 10, 5, 6, 0));
    let (result, pc, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(result, StepResult::Ok);
    assert_eq!(pc, RAM_BASE as u32 + 4);
    assert_eq!(regs[10], 300);
}

#[test]
fn add_wrapping() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xFFFF_FFFF;
    cpu.x[6] = 1;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 0, 10, 5, 6, 0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0);
}

#[test]
fn add_x0_is_zero() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 42;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 0, 0, 5, 0, 0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[0], 0);
}

// ============================================================
// SUB tests
// ============================================================

#[test]
fn sub_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 300;
    cpu.x[6] = 100;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 0, 10, 5, 6, 0x20));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 200);
}

#[test]
fn sub_wrapping_underflow() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0;
    cpu.x[6] = 1;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 0, 10, 5, 6, 0x20));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xFFFF_FFFF);
}

#[test]
fn sub_self_zero() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 12345;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 0, 10, 5, 5, 0x20));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0);
}

// ============================================================
// SLL (shift left logical) tests
// ============================================================

#[test]
fn sll_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 1;
    cpu.x[6] = 8;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 1, 10, 5, 6, 0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 256);
}

#[test]
fn sll_shift_amount_masked() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 1;
    cpu.x[6] = 40; // 40 & 0x1F = 8
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 1, 10, 5, 6, 0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 256);
}

#[test]
fn sll_zero_shift() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xDEAD_BEEF;
    cpu.x[6] = 0;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 1, 10, 5, 6, 0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xDEAD_BEEF);
}

// ============================================================
// SLT (set less than, signed) tests
// ============================================================

#[test]
fn slt_less() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = (-5i32) as u32;
    cpu.x[6] = 10;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 2, 10, 5, 6, 0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 1);
}

#[test]
fn slt_greater() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 10;
    cpu.x[6] = (-5i32) as u32;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 2, 10, 5, 6, 0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0);
}

#[test]
fn slt_equal() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 42;
    cpu.x[6] = 42;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 2, 10, 5, 6, 0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0);
}

#[test]
fn slt_negative_vs_positive() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = (-1i32) as u32;
    cpu.x[6] = 1;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 2, 10, 5, 6, 0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 1);
}

// ============================================================
// SLTU (set less than, unsigned) tests
// ============================================================

#[test]
fn sltu_less() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 5;
    cpu.x[6] = 10;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 3, 10, 5, 6, 0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 1);
}

#[test]
fn sltu_negative_not_less() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xFFFF_FFFF;
    cpu.x[6] = 1;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 3, 10, 5, 6, 0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0);
}

// ============================================================
// XOR tests
// ============================================================

#[test]
fn xor_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xFF00_FF00;
    cpu.x[6] = 0x0F0F_0F0F;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 4, 10, 5, 6, 0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xF00F_F00F);
}

#[test]
fn xor_self_zero() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xAAAA_BBBB;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 4, 10, 5, 5, 0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0);
}

// ============================================================
// SRL (shift right logical) tests
// ============================================================

#[test]
fn srl_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 256;
    cpu.x[6] = 4;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 5, 10, 5, 6, 0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 16);
}

#[test]
fn srl_negative_fills_with_zeros() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0x8000_0000u32;
    cpu.x[6] = 16;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 5, 10, 5, 6, 0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0x0000_8000);
}

// ============================================================
// SRA (shift right arithmetic) tests
// ============================================================

#[test]
fn sra_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 256;
    cpu.x[6] = 4;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 5, 10, 5, 6, 0x20));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 16);
}

#[test]
fn sra_negative_sign_extends() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0x8000_0000u32;
    cpu.x[6] = 16;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 5, 10, 5, 6, 0x20));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xFFFF_8000u32);
}

#[test]
fn sra_negative_by_one() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xFFFF_FFFFu32;
    cpu.x[6] = 1;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 5, 10, 5, 6, 0x20));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xFFFF_FFFF);
}

// ============================================================
// OR tests
// ============================================================

#[test]
fn or_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xFF00_0000;
    cpu.x[6] = 0x00FF_0000;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 6, 10, 5, 6, 0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xFFFF_0000);
}

#[test]
fn or_with_zero() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xABCD_EF01;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 6, 10, 5, 0, 0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xABCD_EF01);
}

// ============================================================
// AND tests
// ============================================================

#[test]
fn and_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xFF00_FF00;
    cpu.x[6] = 0x0F0F_0F0F;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 7, 10, 5, 6, 0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0x0F00_0F00);
}

#[test]
fn and_with_zero() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xFFFF_FFFF;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 7, 10, 5, 0, 0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0);
}

// ============================================================
// I-type ALU tests (ADDI, SLTI, SLTIU, XORI, ORI, ANDI)
// ============================================================

#[test]
fn addi_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 100;
    write_word(&mut bus, RAM_BASE, encode_i_alu(0, 10, 5, 50));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 150);
}

#[test]
fn addi_negative() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 100;
    write_word(&mut bus, RAM_BASE, encode_i_alu(0, 10, 5, -200));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], (100i32 - 200i32) as u32);
}

#[test]
fn addi_zero_imm() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 42;
    write_word(&mut bus, RAM_BASE, encode_i_alu(0, 10, 5, 0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 42);
}

#[test]
fn addi_max_positive() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0;
    write_word(&mut bus, RAM_BASE, encode_i_alu(0, 10, 0, 2047));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 2047);
}

#[test]
fn addi_max_negative() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0;
    write_word(&mut bus, RAM_BASE, encode_i_alu(0, 10, 0, -2048));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xFFFF_F800);
}

#[test]
fn slti_less() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 5;
    write_word(&mut bus, RAM_BASE, encode_i_alu(2, 10, 5, 10));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 1);
}

#[test]
fn slti_greater() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 20;
    write_word(&mut bus, RAM_BASE, encode_i_alu(2, 10, 5, 10));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0);
}

#[test]
fn sltiu_less() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 5;
    write_word(&mut bus, RAM_BASE, encode_i_alu(3, 10, 5, 10));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 1);
}

#[test]
fn sltiu_large_unsigned() {
    // SLTIU with negative imm: imm is sign-extended then treated as unsigned
    // SLTIU a0, a1, -1 -> imm sign-extends to 0xFFFFFFFF -> unsigned compare
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 5;
    // 5 < 0xFFFFFFFF (unsigned) -> 1
    write_word(&mut bus, RAM_BASE, encode_i_alu(3, 10, 5, -1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 1);
}

#[test]
fn xori_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xFF0;
    // XORI with 12-bit immediate: 0xFF0 ^ 0x0F0 = 0xF00
    write_word(&mut bus, RAM_BASE, encode_i_alu(4, 10, 5, 0x0F0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xF00);
}

#[test]
fn ori_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xF000;
    // ORI with 12-bit immediate 0x700 (< 0x800, no sign extension): 0xF000 | 0x700 = 0xF700
    write_word(&mut bus, RAM_BASE, encode_i_alu(6, 10, 5, 0x700));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xF700);
}

#[test]
fn ori_sign_extended() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xF000;
    // ORI with 0xF00 (bit 11 set): sign-extends to 0xFFFF_FF00
    // 0xF000 | 0xFFFF_FF00 = 0xFFFF_FF00
    write_word(&mut bus, RAM_BASE, encode_i_alu(6, 10, 5, 0xF00));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xFFFF_FF00);
}

#[test]
fn andi_mask() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xDEAD_BEEF;
    // ANDI with 0xFF: extract low byte 0xEF
    write_word(&mut bus, RAM_BASE, encode_i_alu(7, 10, 5, 0xFF));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xEF);
}

#[test]
fn andi_zero() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xFFFF_FFFF;
    // ANDI with 0x000: zero
    write_word(&mut bus, RAM_BASE, encode_i_alu(7, 10, 5, 0x000));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0);
}

#[test]
fn andi_negative_imm() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xFFFF_FFFF;
    // ANDI with -1 (sign-extended to 0xFFFFFFFF): 0xFFFFFFFF & 0xFFFFFFFF = 0xFFFFFFFF
    write_word(&mut bus, RAM_BASE, encode_i_alu(7, 10, 5, -1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xFFFF_FFFF);
}

// ============================================================
// Shift immediate tests (SLLI, SRLI, SRAI)
// ============================================================

#[test]
fn slli_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 1;
    // SLLI a0, a1, 5 (funct3=0b001)
    write_word(&mut bus, RAM_BASE, encode_i_shift(0, 0b001, 10, 5, 5));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 32);
}

#[test]
fn slli_max_shift() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 1;
    write_word(&mut bus, RAM_BASE, encode_i_shift(0, 0b001, 10, 5, 31));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0x8000_0000);
}

#[test]
fn slli_zero_shift() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0x1234_5678;
    write_word(&mut bus, RAM_BASE, encode_i_shift(0, 0b001, 10, 5, 0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0x1234_5678);
}

#[test]
fn srli_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 256;
    // SRLI a0, a1, 4 (funct3=0b101, funct7=0)
    write_word(&mut bus, RAM_BASE, encode_i_shift(0, 0b101, 10, 5, 4));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 16);
}

#[test]
fn srli_high_bit() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0x8000_0000u32;
    // SRLI a0, a1, 31 -> logical shift, fills with 0
    write_word(&mut bus, RAM_BASE, encode_i_shift(0, 0b101, 10, 5, 31));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 1);
}

#[test]
fn srai_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xFFFF_F000u32; // -4096 as i32
                               // SRAI a0, a1, 4 (funct3=0b101, funct7=0x20)
    write_word(&mut bus, RAM_BASE, encode_i_shift(0x20, 0b101, 10, 5, 4));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xFFFF_FF00u32);
}

#[test]
fn srai_negative_by_one() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xFFFF_FFFFu32; // -1 as i32
                               // SRAI a0, a1, 1 -> -1 >> 1 = -1
    write_word(&mut bus, RAM_BASE, encode_i_shift(0x20, 0b101, 10, 5, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xFFFF_FFFF);
}

#[test]
fn srai_max_shift() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0x8000_0000u32; // -2147483648 as i32
                               // SRAI a0, a1, 31 -> -2147483648 >> 31 = -1
    write_word(&mut bus, RAM_BASE, encode_i_shift(0x20, 0b101, 10, 5, 31));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xFFFF_FFFF);
}

// ============================================================
// M extension: MUL tests
// ============================================================

#[test]
fn mul_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 6;
    cpu.x[6] = 7;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 0, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 42);
}

#[test]
fn mul_overflow() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xFFFF_FFFF;
    cpu.x[6] = 2;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 0, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xFFFF_FFFE);
}

#[test]
fn mul_zero() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 12345;
    cpu.x[6] = 0;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 0, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0);
}

#[test]
fn mul_signed() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = (-3i32) as u32;
    cpu.x[6] = 7;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 0, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], (-21i32) as u32);
}

#[test]
fn mul_large_values() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 100000;
    cpu.x[6] = 100000;
    // 100000 * 100000 = 10^10, low 32 = 10000000000 % 2^32 = 1410065408
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 0, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 1_410_065_408);
}

// ============================================================
// M extension: MULH tests
// ============================================================

#[test]
fn mulh_signed_overflow() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xFFFF_FFFF;
    cpu.x[6] = 2;
    // MULH: signed(-1) * signed(2) = -2, high 32 bits = 0xFFFFFFFF
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 1, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xFFFF_FFFF);
}

#[test]
fn mulh_small_values() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 100;
    cpu.x[6] = 200;
    // MULH: 100 * 200 = 20000, fits in 32 bits, high = 0
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 1, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0);
}

#[test]
fn mulh_large_signed() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0x7FFF_FFFF; // INT_MAX
    cpu.x[6] = 2;
    // MULH: 2147483647 * 2 = 4294967294 = 0x00000000FFFFFFFE, high 32 = 0
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 1, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0);
}

// ============================================================
// M extension: MULHU tests
// ============================================================

#[test]
fn mulhu_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xFFFF_FFFF;
    cpu.x[6] = 2;
    // MULHU: unsigned 0xFFFFFFFF * 2 = 0x1FFFFFFFE, high = 1
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 3, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 1);
}

#[test]
fn mulhu_small_values() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 100;
    cpu.x[6] = 200;
    // MULHU: 100 * 200 = 20000, high = 0
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 3, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0);
}

// ============================================================
// M extension: MULHSU tests
// ============================================================

#[test]
fn mulhsu_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = (-1i32) as u32;
    cpu.x[6] = 1;
    // MULHSU: signed(-1) * unsigned(1) = -1, high = 0xFFFFFFFF
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 2, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xFFFF_FFFF);
}

#[test]
fn mulhsu_positive() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 100;
    cpu.x[6] = 200;
    // MULHSU: signed(100) * unsigned(200) = 20000, high = 0
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 2, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0);
}

// ============================================================
// M extension: DIV tests
// ============================================================

#[test]
fn div_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 100;
    cpu.x[6] = 7;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 4, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 14);
}

#[test]
fn div_negative() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = (-100i32) as u32;
    cpu.x[6] = 7;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 4, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], (-14i32) as u32);
}

#[test]
fn div_by_zero() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 42;
    cpu.x[6] = 0;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 4, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xFFFF_FFFF);
}

#[test]
fn div_overflow() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = i32::MIN as u32;
    cpu.x[6] = (-1i32) as u32;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 4, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], i32::MIN as u32);
}

#[test]
fn div_truncates_toward_zero() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 7;
    cpu.x[6] = (-2i32) as u32;
    // 7 / -2 = -3 (truncated toward zero, not -4)
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 4, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], (-3i32) as u32);
}

// ============================================================
// M extension: DIVU tests
// ============================================================

#[test]
fn divu_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 100;
    cpu.x[6] = 7;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 5, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 14);
}

#[test]
fn divu_by_zero() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 42;
    cpu.x[6] = 0;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 5, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xFFFF_FFFF);
}

#[test]
fn divu_max_by_max() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xFFFF_FFFF;
    cpu.x[6] = 0xFFFF_FFFF;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 5, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 1);
}

// ============================================================
// M extension: REM tests
// ============================================================

#[test]
fn rem_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 100;
    cpu.x[6] = 7;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 6, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 2);
}

#[test]
fn rem_negative_dividend() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = (-100i32) as u32;
    cpu.x[6] = 7;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 6, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], (-2i32) as u32);
}

#[test]
fn rem_by_zero() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 42;
    cpu.x[6] = 0;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 6, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 42);
}

#[test]
fn rem_overflow() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = i32::MIN as u32;
    cpu.x[6] = (-1i32) as u32;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 6, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0);
}

// ============================================================
// M extension: REMU tests
// ============================================================

#[test]
fn remu_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 100;
    cpu.x[6] = 7;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 7, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 2);
}

#[test]
fn remu_by_zero() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 42;
    cpu.x[6] = 0;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 7, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 42);
}

#[test]
fn remu_max() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xFFFF_FFFF;
    cpu.x[6] = 0xFFFF_FFFF;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 7, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0);
}

#[test]
fn remu_large() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xFFFF_FFFF; // 4294967295
    cpu.x[6] = 1000;
    // 4294967295 % 1000 = 295
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 7, 10, 5, 6, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 295);
}

// ============================================================
// Edge cases and combined patterns
// ============================================================

#[test]
fn alu_chained_operations() {
    // ADD -> SUB -> SLLI -> ANDI
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 10;
    cpu.x[6] = 20;
    // ADD a0, a1, a2 (addr 0)
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 0, 10, 5, 6, 0));
    // SUB a0, a0, a1 (addr 4) -> 30 - 10 = 20
    write_word(&mut bus, RAM_BASE + 4, encode_r(0x33, 0, 10, 10, 5, 0x20));
    // SLLI a0, a0, 2 (addr 8) -> 20 << 2 = 80
    write_word(&mut bus, RAM_BASE + 8, encode_i_shift(0, 0b001, 10, 10, 2));
    // ANDI a0, a0, 0xFF (addr 12) -> 80 & 0xFF = 80
    write_word(&mut bus, RAM_BASE + 12, encode_i_alu(7, 10, 10, 0xFF));
    // EBREAK (addr 16)
    write_word(&mut bus, RAM_BASE + 16, 0x0010_0073);

    cpu.step(&mut bus); // ADD
    assert_eq!(cpu.x[10], 30);
    cpu.step(&mut bus); // SUB
    assert_eq!(cpu.x[10], 20);
    cpu.step(&mut bus); // SLLI
    assert_eq!(cpu.x[10], 80);
    cpu.step(&mut bus); // ANDI
    assert_eq!(cpu.x[10], 80);
}

#[test]
fn alu_commutative_add() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 123;
    cpu.x[6] = 456;
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 0, 10, 5, 6, 0));
    let (_, _, regs1) = step_one(&mut cpu, &mut bus);

    let (mut cpu2, mut bus2) = make_cpu_bus();
    cpu2.x[5] = 123;
    cpu2.x[6] = 456;
    write_word(&mut bus2, RAM_BASE, encode_r(0x33, 0, 10, 6, 5, 0));
    let (_, _, regs2) = step_one(&mut cpu2, &mut bus2);

    assert_eq!(regs1[10], regs2[10]);
}

#[test]
fn mul_div_inverse() {
    // MUL then DIV recovers the original (when exact)
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 42;
    cpu.x[6] = 7;
    // MUL a0, a1, a2 -> 42 * 7 = 294 (at RAM_BASE, PC advances to RAM_BASE+4)
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 0, 10, 5, 6, 1));
    cpu.step(&mut bus);
    assert_eq!(cpu.x[10], 294);
    // DIV a0, a0, a2 -> 294 / 7 = 42 (at RAM_BASE+4, where PC now points)
    write_word(&mut bus, RAM_BASE + 4, encode_r(0x33, 4, 10, 10, 6, 1));
    cpu.step(&mut bus);
    assert_eq!(cpu.x[10], 42);
}

#[test]
fn srl_vs_sra_difference() {
    // SRL and SRA differ only for negative values (high bit set)
    let val = 0x8000_0000u32; // high bit set

    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = val;
    cpu.x[6] = 8;
    // SRL
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 5, 10, 5, 6, 0));
    let (_, _, srl_regs) = step_one(&mut cpu, &mut bus);

    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = val;
    cpu.x[6] = 8;
    // SRA
    write_word(&mut bus, RAM_BASE, encode_r(0x33, 5, 10, 5, 6, 0x20));
    let (_, _, sra_regs) = step_one(&mut cpu, &mut bus);

    // SRL: 0x80000000 >> 8 = 0x00800000
    assert_eq!(srl_regs[10], 0x0080_0000);
    // SRA: -2^31 >> 8 = 0xFF800000
    assert_eq!(sra_regs[10], 0xFF80_0000);
    // They must differ
    assert_ne!(srl_regs[10], sra_regs[10]);
}

#[test]
fn not_via_xori() {
    // NOT pseudo-instruction: XORI rd, rs, -1
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0x0F0F_0F0F;
    write_word(&mut bus, RAM_BASE, encode_i_alu(4, 10, 5, -1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xF0F0_F0F0);
}

#[test]
fn mv_via_addi() {
    // MV pseudo-instruction: ADDI rd, rs, 0
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0xDEAD_BEEF;
    write_word(&mut bus, RAM_BASE, encode_i_alu(0, 10, 5, 0));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0xDEAD_BEEF);
}

#[test]
fn seqz_via_sltiu() {
    // SEQZ pseudo-instruction: SLTIU rd, rs, 1 (set if zero)
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 0;
    write_word(&mut bus, RAM_BASE, encode_i_alu(3, 10, 5, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 1); // 0 < 1 unsigned = true

    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[5] = 42;
    write_word(&mut bus, RAM_BASE, encode_i_alu(3, 10, 5, 1));
    let (_, _, regs) = step_one(&mut cpu, &mut bus);
    assert_eq!(regs[10], 0); // 42 < 1 unsigned = false
}
