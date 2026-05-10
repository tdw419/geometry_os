// riscv/cpu/atomic_tests.rs -- Atomic (A extension) instruction execution tests
//
// Tests LR.W, SC.W, AMOSWAP.W, AMOADD.W, AMOXOR.W, AMOAND.W,
// AMOOR.W, AMOMIN.W, AMOMAX.W, AMOMINU.W, AMOMAXU.W.
//
// Tests cover: basic read-modify-write semantics, reservation set/clear,
// SC success/failure, aq/rl flag handling, rd=x0 discard, and edge cases.

use super::super::bus::Bus;
use super::{RiscvCpu, StepResult};

const RAM_BASE: u64 = 0x8000_0000;
const RAM_SIZE: usize = 1024 * 1024; // 1 MB

fn make_cpu_bus() -> (RiscvCpu, Bus) {
    let cpu = RiscvCpu::new();
    let bus = Bus::new(RAM_BASE, RAM_SIZE);
    (cpu, bus)
}

fn write_word(bus: &mut Bus, addr: u64, word: u32) {
    bus.write_word(addr, word)
        .unwrap_or_else(|_| panic!("write_word failed at 0x{:08X}", addr));
}

/// Encode an A-extension instruction.
/// Format: funct5[31:27] | aq[26] | rl[25] | rs2[24:20] | rs1[19:15] | funct3[14:12]=010 | rd[11:7] | opcode[6:0]=0x2F
fn encode_amo(funct5: u32, aq: bool, rl: bool, rd: u8, rs1: u8, rs2: u8) -> u32 {
    let aq_bit = if aq { 1 } else { 0 };
    let rl_bit = if rl { 1 } else { 0 };
    ((funct5 & 0x1F) << 27)
        | ((aq_bit as u32) << 26)
        | ((rl_bit as u32) << 25)
        | (((rs2 & 0x1F) as u32) << 20)
        | (((rs1 & 0x1F) as u32) << 15)
        | (0b010 << 12)
        | (((rd & 0x1F) as u32) << 7)
        | 0x2F
}

// LR.W funct5 = 0b00010
const LR_FUNCT5: u32 = 0b00010;
// SC.W funct5 = 0b00011
const SC_FUNCT5: u32 = 0b00011;
// AMOSWAP.W funct5 = 0b00001
const AMOSWAP_FUNCT5: u32 = 0b00001;
// AMOADD.W funct5 = 0b00000
const AMOADD_FUNCT5: u32 = 0b00000;
// AMOXOR.W funct5 = 0b00100
const AMOXOR_FUNCT5: u32 = 0b00100;
// AMOAND.W funct5 = 0b01100
const AMOAND_FUNCT5: u32 = 0b01100;
// AMOOR.W funct5 = 0b01000
const AMOOR_FUNCT5: u32 = 0b01000;
// AMOMIN.W funct5 = 0b10000
const AMOMIN_FUNCT5: u32 = 0b10000;
// AMOMAX.W funct5 = 0b10100
const AMOMAX_FUNCT5: u32 = 0b10100;
// AMOMINU.W funct5 = 0b11000
const AMOMINU_FUNCT5: u32 = 0b11000;
// AMOMAXU.W funct5 = 0b11100
const AMOMAXU_FUNCT5: u32 = 0b11100;

// Address in RAM where atomic operations target
const ATOM_ADDR: u64 = RAM_BASE + 0x100;

// ============================================================
// LR.W tests
// ============================================================

#[test]
fn lr_w_loads_value_and_sets_reservation() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0xDEADBEEF);
    cpu.x[5] = ATOM_ADDR as u32; // rs1 = address
                                 // LR.W x10, (x5)
    let instr = encode_amo(LR_FUNCT5, false, false, 10, 5, 0);
    write_word(&mut bus, RAM_BASE, instr);

    let result = cpu.step(&mut bus);
    assert_eq!(result, StepResult::Ok);
    assert_eq!(
        cpu.x[10], 0xDEADBEEF,
        "LR.W should load the memory value into rd"
    );
    assert_eq!(
        cpu.reservation,
        Some(ATOM_ADDR),
        "LR.W should set reservation to the accessed PA"
    );
    assert_eq!(cpu.pc, (RAM_BASE + 4) as u32);
}

#[test]
fn lr_w_from_zero_address_loads_zero() {
    let (mut cpu, mut bus) = make_cpu_bus();
    // Write 0 to ATOM_ADDR
    write_word(&mut bus, ATOM_ADDR, 0);
    cpu.x[5] = ATOM_ADDR as u32;
    let instr = encode_amo(LR_FUNCT5, false, false, 10, 5, 0);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[10], 0);
    assert_eq!(cpu.reservation, Some(ATOM_ADDR));
}

#[test]
fn lr_w_with_rd_zero_discards_value() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0xCAFEBABE);
    cpu.x[5] = ATOM_ADDR as u32;
    // LR.W x0, (x5) -- rd=x0, value should be discarded
    let instr = encode_amo(LR_FUNCT5, false, false, 0, 5, 0);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[0], 0, "x0 is always zero");
    // Reservation should still be set
    assert_eq!(cpu.reservation, Some(ATOM_ADDR));
}

#[test]
fn lr_w_overwrites_previous_reservation() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0x11111111);
    write_word(&mut bus, ATOM_ADDR + 4, 0x22222222);
    cpu.x[5] = ATOM_ADDR as u32;
    // First LR.W
    let instr = encode_amo(LR_FUNCT5, false, false, 10, 5, 0);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.reservation, Some(ATOM_ADDR));

    // Second LR.W at different address
    cpu.x[5] = (ATOM_ADDR + 4) as u32;
    cpu.pc = RAM_BASE as u32;
    cpu.step(&mut bus);
    assert_eq!(
        cpu.reservation,
        Some(ATOM_ADDR + 4),
        "Second LR.W should overwrite reservation"
    );
}

// ============================================================
// SC.W tests
// ============================================================

#[test]
fn sc_w_success_after_lr_w() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0x00000000);

    // First: LR.W x10, (x5) to set reservation
    cpu.x[5] = ATOM_ADDR as u32;
    let lr_instr = encode_amo(LR_FUNCT5, false, false, 10, 5, 0);
    write_word(&mut bus, RAM_BASE, lr_instr);
    cpu.step(&mut bus);
    assert_eq!(cpu.reservation, Some(ATOM_ADDR));

    // Then: SC.W x11, x6, (x5) -- store 0x12345678
    cpu.x[6] = 0x12345678;
    let sc_instr = encode_amo(SC_FUNCT5, false, false, 11, 5, 6);
    write_word(&mut bus, RAM_BASE + 4, sc_instr);
    cpu.step(&mut bus);

    assert_eq!(cpu.x[11], 0, "SC.W should write 0 to rd on success");
    assert_eq!(cpu.reservation, None, "SC.W should clear reservation");
    // Verify memory was updated
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(
        val, 0x12345678,
        "SC.W should write rs2 to memory on success"
    );
}

#[test]
fn sc_w_fails_without_reservation() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0xAAAA);

    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0x12345678;
    // SC.W without preceding LR.W -- reservation is None
    let sc_instr = encode_amo(SC_FUNCT5, false, false, 11, 5, 6);
    write_word(&mut bus, RAM_BASE, sc_instr);
    cpu.step(&mut bus);

    assert_eq!(cpu.x[11], 1, "SC.W should write 1 to rd on failure");
    assert_eq!(cpu.reservation, None);
    // Memory should NOT be updated
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0xAAAA, "SC.W should not modify memory on failure");
}

#[test]
fn sc_w_fails_on_different_address() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0x11111111);
    write_word(&mut bus, ATOM_ADDR + 4, 0x22222222);

    // LR.W at ATOM_ADDR
    cpu.x[5] = ATOM_ADDR as u32;
    let lr_instr = encode_amo(LR_FUNCT5, false, false, 10, 5, 0);
    write_word(&mut bus, RAM_BASE, lr_instr);
    cpu.step(&mut bus);
    assert_eq!(cpu.reservation, Some(ATOM_ADDR));

    // SC.W at ATOM_ADDR+4 (different address)
    cpu.x[5] = (ATOM_ADDR + 4) as u32;
    cpu.x[6] = 0x12345678;
    let sc_instr = encode_amo(SC_FUNCT5, false, false, 11, 5, 6);
    write_word(&mut bus, RAM_BASE + 4, sc_instr);
    cpu.step(&mut bus);

    assert_eq!(cpu.x[11], 1, "SC.W at wrong address should fail");
    // ATOM_ADDR+4 should NOT be modified
    let val = bus.read_word(ATOM_ADDR + 4).unwrap();
    assert_eq!(val, 0x22222222);
}

#[test]
fn sc_w_with_rd_zero_discards_status() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0x00000000);

    // LR.W to set reservation
    cpu.x[5] = ATOM_ADDR as u32;
    let lr_instr = encode_amo(LR_FUNCT5, false, false, 10, 5, 0);
    write_word(&mut bus, RAM_BASE, lr_instr);
    cpu.step(&mut bus);

    // SC.W x0, x6, (x5) -- discard result but still write
    cpu.x[6] = 0xAAAAAAAA;
    let sc_instr = encode_amo(SC_FUNCT5, false, false, 0, 5, 6);
    write_word(&mut bus, RAM_BASE + 4, sc_instr);
    cpu.step(&mut bus);

    assert_eq!(cpu.x[0], 0, "x0 is always zero");
    // Memory should still be written
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0xAAAAAAAA);
}

// ============================================================
// AMOSWAP.W tests
// ============================================================

#[test]
fn amoswap_w_exchanges_values() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0x11111111);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0x22222222;
    // AMOSWAP.W x10, x6, (x5)
    let instr = encode_amo(AMOSWAP_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[10], 0x11111111, "rd should get old memory value");
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0x22222222, "memory should get rs2 value");
    assert_eq!(cpu.pc, (RAM_BASE + 4) as u32);
}

#[test]
fn amoswap_w_with_zero_rs2() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0xFFFFFFFF);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0; // rs2 = 0
    let instr = encode_amo(AMOSWAP_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[10], 0xFFFFFFFF);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0);
}

#[test]
fn amoswap_w_with_rd_zero_discards_old_value() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0x12345678);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0xAAAAAAAA;
    let instr = encode_amo(AMOSWAP_FUNCT5, false, false, 0, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[0], 0);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(
        val, 0xAAAAAAAA,
        "memory should still be written even if rd=x0"
    );
}

// ============================================================
// AMOADD.W tests
// ============================================================

#[test]
fn amoadd_w_adds_to_memory() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 100);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 50;
    let instr = encode_amo(AMOADD_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[10], 100, "rd should get old memory value");
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 150, "memory should be old + rs2");
}

#[test]
fn amoadd_w_wraps_on_overflow() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0xFFFFFFFF);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 1;
    let instr = encode_amo(AMOADD_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[10], 0xFFFFFFFF);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0, "0xFFFFFFFF + 1 should wrap to 0");
}

#[test]
fn amoadd_w_with_zero_addend() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 42);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0;
    let instr = encode_amo(AMOADD_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[10], 42);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 42, "adding 0 should not change memory");
}

// ============================================================
// AMOXOR.W tests
// ============================================================

#[test]
fn amoxor_w_xors_with_memory() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0xFF00FF00);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0x0F0F0F0F;
    let instr = encode_amo(AMOXOR_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[10], 0xFF00FF00);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0xF00FF00F, "0xFF00FF00 ^ 0x0F0F0F0F = 0xF00FF00F");
}

#[test]
fn amoxor_w_with_self_clears_memory() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0x12345678);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0x12345678;
    let instr = encode_amo(AMOXOR_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0, "XOR with self should produce 0");
}

#[test]
fn amoxor_w_with_zero_is_nop() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0xABCDEF01);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0;
    let instr = encode_amo(AMOXOR_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0xABCDEF01, "XOR with 0 should not change memory");
}

// ============================================================
// AMOAND.W tests
// ============================================================

#[test]
fn amoand_w_ands_with_memory() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0xFF00FF00);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0x0F0F0F0F;
    let instr = encode_amo(AMOAND_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[10], 0xFF00FF00);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0x0F000F00, "0xFF00FF00 & 0x0F0F0F0F = 0x0F000F00");
}

#[test]
fn amoand_w_with_all_ones_is_nop() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0x12345678);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0xFFFFFFFF;
    let instr = encode_amo(AMOAND_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(
        val, 0x12345678,
        "AND with all-ones should not change memory"
    );
}

#[test]
fn amoand_w_with_zero_clears_memory() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0xFFFFFFFF);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0;
    let instr = encode_amo(AMOAND_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0);
}

// ============================================================
// AMOOR.W tests
// ============================================================

#[test]
fn amoor_w_ors_with_memory() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0xF000F000);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0x0F000F00;
    let instr = encode_amo(AMOOR_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[10], 0xF000F000);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0xFF00FF00, "0xF000F000 | 0x0F000F00 = 0xFF00FF00");
}

#[test]
fn amoor_w_with_zero_is_nop() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0xABCDEF01);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0;
    let instr = encode_amo(AMOOR_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0xABCDEF01, "OR with 0 should not change memory");
}

#[test]
fn amoor_w_with_all_ones_sets_all_bits() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0x12345678);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0xFFFFFFFF;
    let instr = encode_amo(AMOOR_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0xFFFFFFFF);
}

// ============================================================
// AMOMIN.W tests (signed minimum)
// ============================================================

#[test]
fn amomin_w_selects_signed_minimum() {
    let (mut cpu, mut bus) = make_cpu_bus();
    // mem = 100 (positive), rs2 = -5 (0xFFFFFFFB, negative, smaller)
    write_word(&mut bus, ATOM_ADDR, 100);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0xFFFFFFFBu32; // -5 as i32
    let instr = encode_amo(AMOMIN_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[10], 100, "rd should get old memory value");
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0xFFFFFFFB, "memory should get -5 (signed min)");
}

#[test]
fn amomin_w_keeps_memory_when_rs2_larger() {
    let (mut cpu, mut bus) = make_cpu_bus();
    // mem = -10 (0xFFFFFFF6), rs2 = 50 (larger signed)
    write_word(&mut bus, ATOM_ADDR, 0xFFFFFFF6u32); // -10
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 50;
    let instr = encode_amo(AMOMIN_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0xFFFFFFF6, "memory should keep -10 (smaller signed)");
}

#[test]
fn amomin_w_equal_values() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 42);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 42;
    let instr = encode_amo(AMOMIN_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 42, "equal values: mem stays the same (old returned)");
}

// ============================================================
// AMOMAX.W tests (signed maximum)
// ============================================================

#[test]
fn amomax_w_selects_signed_maximum() {
    let (mut cpu, mut bus) = make_cpu_bus();
    // mem = -10 (0xFFFFFFF6), rs2 = 50 (larger signed)
    write_word(&mut bus, ATOM_ADDR, 0xFFFFFFF6u32); // -10
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 50;
    let instr = encode_amo(AMOMAX_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[10], 0xFFFFFFF6, "rd should get old memory value");
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 50, "memory should get 50 (signed max)");
}

#[test]
fn amomax_w_keeps_memory_when_rs2_smaller_signed() {
    let (mut cpu, mut bus) = make_cpu_bus();
    // mem = 100, rs2 = -5 (smaller signed despite larger unsigned)
    write_word(&mut bus, ATOM_ADDR, 100);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0xFFFFFFFBu32; // -5
    let instr = encode_amo(AMOMAX_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 100, "memory should keep 100 (larger signed)");
}

#[test]
fn amomax_w_negative_vs_negative() {
    let (mut cpu, mut bus) = make_cpu_bus();
    // mem = -100 (0xFFFFFF9C), rs2 = -5 (0xFFFFFFFB), max signed = -5
    write_word(&mut bus, ATOM_ADDR, 0xFFFFFF9Cu32); // -100
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0xFFFFFFFBu32; // -5
    let instr = encode_amo(AMOMAX_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0xFFFFFFFB, "max(-100, -5) = -5");
}

// ============================================================
// AMOMINU.W tests (unsigned minimum)
// ============================================================

#[test]
fn amominu_w_selects_unsigned_minimum() {
    let (mut cpu, mut bus) = make_cpu_bus();
    // mem = 0xFFFFFFFB (large unsigned), rs2 = 50 (small unsigned)
    write_word(&mut bus, ATOM_ADDR, 0xFFFFFFFB);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 50;
    let instr = encode_amo(AMOMINU_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[10], 0xFFFFFFFB);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 50, "unsigned min(0xFFFFFFFB, 50) = 50");
}

#[test]
fn amominu_w_zero_is_minimum() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0x7FFFFFFF); // INT_MAX
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0;
    let instr = encode_amo(AMOMINU_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0, "unsigned min(anything, 0) = 0");
}

#[test]
fn amominu_w_large_vs_small_unsigned() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 10);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0xFFFFFFF0; // large unsigned
    let instr = encode_amo(AMOMINU_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 10, "unsigned min(10, 0xFFFFFFF0) = 10");
}

// ============================================================
// AMOMAXU.W tests (unsigned maximum)
// ============================================================

#[test]
fn amomaxu_w_selects_unsigned_maximum() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 50);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0xFFFFFFFB; // large unsigned
    let instr = encode_amo(AMOMAXU_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[10], 50);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0xFFFFFFFB, "unsigned max(50, 0xFFFFFFFB) = 0xFFFFFFFB");
}

#[test]
fn amomaxu_w_zero_vs_max() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0xFFFFFFFF;
    let instr = encode_amo(AMOMAXU_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0xFFFFFFFF, "unsigned max(0, 0xFFFFFFFF) = 0xFFFFFFFF");
}

#[test]
fn amomaxu_w_negative_interpreted_as_large_unsigned() {
    // In unsigned comparison, -1 (0xFFFFFFFF) > 1
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 1);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0xFFFFFFFF; // -1 signed, but large unsigned
    let instr = encode_amo(AMOMAXU_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0xFFFFFFFF, "unsigned: 0xFFFFFFFF > 1");
}

// ============================================================
// aq/rl flag tests (flags are ignored in single-hart emulator)
// ============================================================

#[test]
fn lr_w_with_aq_flag_works() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0x12345678);
    cpu.x[5] = ATOM_ADDR as u32;
    let instr = encode_amo(LR_FUNCT5, true, false, 10, 5, 0);
    write_word(&mut bus, RAM_BASE, instr);

    let result = cpu.step(&mut bus);
    assert_eq!(result, StepResult::Ok);
    assert_eq!(cpu.x[10], 0x12345678);
    assert_eq!(cpu.reservation, Some(ATOM_ADDR));
}

#[test]
fn lr_w_with_rl_flag_works() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0x12345678);
    cpu.x[5] = ATOM_ADDR as u32;
    let instr = encode_amo(LR_FUNCT5, false, true, 10, 5, 0);
    write_word(&mut bus, RAM_BASE, instr);

    let result = cpu.step(&mut bus);
    assert_eq!(result, StepResult::Ok);
    assert_eq!(cpu.x[10], 0x12345678);
}

#[test]
fn sc_w_with_aq_rl_flags_works() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0);

    // LR.W to set reservation
    cpu.x[5] = ATOM_ADDR as u32;
    let lr_instr = encode_amo(LR_FUNCT5, true, true, 10, 5, 0);
    write_word(&mut bus, RAM_BASE, lr_instr);
    cpu.step(&mut bus);

    // SC.W with aq+rl
    cpu.x[6] = 0xAAAAAAAA;
    let sc_instr = encode_amo(SC_FUNCT5, true, true, 11, 5, 6);
    write_word(&mut bus, RAM_BASE + 4, sc_instr);
    cpu.step(&mut bus);

    assert_eq!(cpu.x[11], 0, "SC.W should succeed");
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0xAAAAAAAA);
}

#[test]
fn amoswap_w_with_aq_rl_flags_works() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0x11111111);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0x22222222;
    let instr = encode_amo(AMOSWAP_FUNCT5, true, true, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[10], 0x11111111);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0x22222222);
}

// ============================================================
// LR/SC sequence: atomic read-modify-write pattern
// ============================================================

#[test]
fn lr_sc_atomic_read_modify_write() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0x00000100);

    // LR.W x10, (x5) -- load old value
    cpu.x[5] = ATOM_ADDR as u32;
    let lr_instr = encode_amo(LR_FUNCT5, false, false, 10, 5, 0);
    write_word(&mut bus, RAM_BASE, lr_instr);
    cpu.step(&mut bus);

    assert_eq!(cpu.x[10], 0x00000100);

    // Compute new value: x6 = x10 + 1 = 0x00000101 (using ADDI)
    // ADDI x6, x10, 1: imm=1, rs1=10, rd=6
    let addi = (1u32 << 20) | (10 << 15) | (6 << 7) | 0x13;
    write_word(&mut bus, RAM_BASE + 4, addi);
    cpu.step(&mut bus);
    assert_eq!(cpu.x[6], 0x00000101);

    // SC.W x11, x6, (x5) -- try to store
    let sc_instr = encode_amo(SC_FUNCT5, false, false, 11, 5, 6);
    write_word(&mut bus, RAM_BASE + 8, sc_instr);
    cpu.step(&mut bus);

    assert_eq!(cpu.x[11], 0, "SC.W should succeed (reservation matches)");
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0x00000101, "memory should have the incremented value");
}

#[test]
fn lr_sc_contention_simulation() {
    // Simulate contention: LR.W, then another LR.W clears first reservation,
    // then SC.W fails
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0x1000);

    // First LR.W at ATOM_ADDR
    cpu.x[5] = ATOM_ADDR as u32;
    let lr_instr = encode_amo(LR_FUNCT5, false, false, 10, 5, 0);
    write_word(&mut bus, RAM_BASE, lr_instr);
    cpu.step(&mut bus);
    assert_eq!(cpu.reservation, Some(ATOM_ADDR));

    // "Another hart" does LR.W at ATOM_ADDR (simulated by another LR.W)
    cpu.pc = RAM_BASE as u32;
    cpu.step(&mut bus);
    assert_eq!(
        cpu.reservation,
        Some(ATOM_ADDR),
        "second LR.W updates reservation to same addr"
    );

    // Now SC.W -- reservation still matches (same address), so it succeeds
    // In a real multi-hart system this would fail, but single-hart always matches
    cpu.x[6] = 0x2000;
    let sc_instr = encode_amo(SC_FUNCT5, false, false, 11, 5, 6);
    write_word(&mut bus, RAM_BASE + 4, sc_instr);
    cpu.step(&mut bus);

    assert_eq!(cpu.x[11], 0, "SC.W succeeds in single-hart (same address)");
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0x2000);
}

// ============================================================
// PC advancement and register preservation tests
// ============================================================

#[test]
fn amo_instructions_advance_pc_by_4() {
    let ops_under_test: &[(u32, &str)] = &[
        (LR_FUNCT5, "LR.W"),
        (SC_FUNCT5, "SC.W"),
        (AMOSWAP_FUNCT5, "AMOSWAP.W"),
        (AMOADD_FUNCT5, "AMOADD.W"),
        (AMOXOR_FUNCT5, "AMOXOR.W"),
        (AMOAND_FUNCT5, "AMOAND.W"),
        (AMOOR_FUNCT5, "AMOOR.W"),
        (AMOMIN_FUNCT5, "AMOMIN.W"),
        (AMOMAX_FUNCT5, "AMOMAX.W"),
        (AMOMINU_FUNCT5, "AMOMINU.W"),
        (AMOMAXU_FUNCT5, "AMOMAXU.W"),
    ];

    for &(funct5, name) in ops_under_test {
        let (mut cpu, mut bus) = make_cpu_bus();
        write_word(&mut bus, ATOM_ADDR, 0);
        cpu.x[5] = ATOM_ADDR as u32;
        cpu.x[6] = 1;
        let instr = encode_amo(funct5, false, false, 10, 5, 6);
        write_word(&mut bus, RAM_BASE, instr);

        let result = cpu.step(&mut bus);
        assert_eq!(result, StepResult::Ok, "{} should return Ok", name);
        assert_eq!(
            cpu.pc,
            (RAM_BASE + 4) as u32,
            "{} should advance PC by 4",
            name
        );
    }
}

#[test]
fn amo_instructions_preserve_x0() {
    let ops_under_test: &[u32] = &[
        LR_FUNCT5,
        SC_FUNCT5,
        AMOSWAP_FUNCT5,
        AMOADD_FUNCT5,
        AMOXOR_FUNCT5,
        AMOAND_FUNCT5,
        AMOOR_FUNCT5,
        AMOMIN_FUNCT5,
        AMOMAX_FUNCT5,
        AMOMINU_FUNCT5,
        AMOMAXU_FUNCT5,
    ];

    for &funct5 in ops_under_test {
        let (mut cpu, mut bus) = make_cpu_bus();
        write_word(&mut bus, ATOM_ADDR, 0);
        cpu.x[5] = ATOM_ADDR as u32;
        cpu.x[6] = 1;
        // rd=x0 (should not actually write)
        let instr = encode_amo(funct5, false, false, 0, 5, 6);
        write_word(&mut bus, RAM_BASE, instr);

        cpu.step(&mut bus);
        assert_eq!(
            cpu.x[0], 0,
            "x0 must remain zero for funct5=0b{:05b}",
            funct5
        );
    }
}

#[test]
fn amo_instructions_do_not_clobber_unrelated_registers() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 42);

    // Set up registers that AMO should NOT touch
    cpu.x[1] = 0xAAAA_AAAA;
    cpu.x[2] = 0xBBBB_BBBB;
    cpu.x[3] = 0xCCCC_CCCC;
    cpu.x[4] = 0xDDDD_DDDD;
    cpu.x[7] = 0xEEEE_EEEE;
    cpu.x[8] = 0x1111_1111;
    cpu.x[9] = 0x2222_2222;

    // AMOADD.W x10, x6, (x5) -- only touches x10 and memory
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 10;
    let instr = encode_amo(AMOADD_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);

    assert_eq!(cpu.x[1], 0xAAAA_AAAA);
    assert_eq!(cpu.x[2], 0xBBBB_BBBB);
    assert_eq!(cpu.x[3], 0xCCCC_CCCC);
    assert_eq!(cpu.x[4], 0xDDDD_DDDD);
    assert_eq!(cpu.x[7], 0xEEEE_EEEE);
    assert_eq!(cpu.x[8], 0x1111_1111);
    assert_eq!(cpu.x[9], 0x2222_2222);
}

// ============================================================
// Edge case: memory at boundary values
// ============================================================

#[test]
fn amoadd_w_max_value_plus_one_wraps() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0xFFFFFFFF);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0xFFFFFFFF;
    let instr = encode_amo(AMOADD_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[10], 0xFFFFFFFF, "rd gets old value");
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(val, 0xFFFFFFFE, "0xFFFFFFFF + 0xFFFFFFFF wraps");
}

#[test]
fn amomaxu_w_all_ones_is_max() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, ATOM_ADDR, 0xFFFFFFFF);
    cpu.x[5] = ATOM_ADDR as u32;
    cpu.x[6] = 0x80000000;
    let instr = encode_amo(AMOMAXU_FUNCT5, false, false, 10, 5, 6);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    let val = bus.read_word(ATOM_ADDR).unwrap();
    assert_eq!(
        val, 0xFFFFFFFF,
        "max(0xFFFFFFFF, 0x80000000) unsigned = 0xFFFFFFFF"
    );
}
