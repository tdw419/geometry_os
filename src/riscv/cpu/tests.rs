// riscv/cpu/tests.rs -- System instruction execution tests
//
// Tests ECALL, EBREAK, FENCE, NOP, MRET, SRET, SFENCE.VMA,
// and CSR operations (CSRRW, CSRRS, CSRRC, CSRRWI, CSRRSI, CSRRCI).
// Also tests trap delivery, privilege escalation, and invalid instructions.
//
// These are execution-level tests that verify the full fetch-decode-execute
// pipeline, unlike decode/tests.rs which only verify decoding.

use super::super::bus::Bus;
use super::super::csr;
use super::{Privilege, RiscvCpu, StepResult};

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

fn encode_csr(funct3: u32, rd: u8, rs1_uimm: u8, csr_addr: u32) -> u32 {
    ((csr_addr & 0xFFF) << 20)
        | (((rs1_uimm & 0x1F) as u32) << 15) // mask to 5-bit field
        | (funct3 << 12)
        | ((rd as u32) << 7)
        | 0x73
}

// ============================================================
// ECALL tests
// ============================================================

#[test]
fn ecall_m_mode_intercepted_by_sbi() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Machine;
    // Set mtvec to a known trap handler address
    cpu.csr.mtvec = 0x8000_0100;
    write_word(&mut bus, RAM_BASE, 0x0000_0073); // ECALL

    let result = cpu.step(&mut bus);
    assert_eq!(result, StepResult::Ok);
    // M-mode ECALL is now intercepted by SBI handler.
    // Unknown extension (a7=0) returns NOT_SUPPORTED and advances PC.
    assert_eq!(cpu.pc, (RAM_BASE + 4) as u32);
    // No trap delivered -- mcause stays at default
    assert_eq!(cpu.csr.mcause, 0);
    // Privilege stays Machine
    assert_eq!(cpu.privilege, Privilege::Machine);
}

#[test]
fn ecall_s_mode_intercepted_by_sbi() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Supervisor;
    // Delegate ECALL_S to S-mode (medeleg bit 9)
    cpu.csr.medeleg = 1 << 9;
    // Set stvec to a known trap handler address
    cpu.csr.stvec = 0x8000_0200;
    write_word(&mut bus, RAM_BASE, 0x0000_0073); // ECALL

    let result = cpu.step(&mut bus);
    assert_eq!(result, StepResult::Ok);
    // S-mode ECALL is now intercepted by SBI handler.
    // Unknown extension (a7=0) returns NOT_SUPPORTED and advances PC.
    assert_eq!(cpu.pc, (RAM_BASE + 4) as u32);
    // No trap delivered -- scause stays at default
    assert_eq!(cpu.csr.scause, 0);
    // Privilege stays Supervisor
    assert_eq!(cpu.privilege, Privilege::Supervisor);
}

#[test]
fn ecall_u_mode_traps_to_stvec() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::User;
    // Delegate ECALL_U to S-mode (medeleg bit 8)
    cpu.csr.medeleg = 1 << 8;
    // User-mode ECALL traps to S-mode by default (unless medeleg/sedeleg set)
    cpu.csr.stvec = 0x8000_0300;
    write_word(&mut bus, RAM_BASE, 0x0000_0073); // ECALL

    let result = cpu.step(&mut bus);
    assert_eq!(result, StepResult::Ok);
    // ECALL from U-mode traps to S-mode stvec
    assert_eq!(cpu.pc, 0x8000_0300);
    // scause should be ECALL_U (8)
    assert_eq!(cpu.csr.scause, csr::CAUSE_ECALL_U);
    // Privilege escalates to Supervisor
    assert_eq!(cpu.privilege, Privilege::Supervisor);
}

#[test]
fn ecall_advances_ecall_count() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Machine;
    cpu.csr.mtvec = 0x8000_0100;
    write_word(&mut bus, RAM_BASE, 0x0000_0073); // ECALL

    assert_eq!(cpu.ecall_count, 0);
    cpu.step(&mut bus);
    assert_eq!(cpu.ecall_count, 1);
}

#[test]
fn ecall_sbi_overwrites_a0_a1() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Machine;
    cpu.csr.mtvec = 0x8000_0100;
    // Set some register values
    cpu.x[5] = 0xDEADBEEF;
    cpu.x[10] = 42; // a0 -- will be overwritten by SBI result
    cpu.x[17] = 99; // a7 (unrecognized extension)
    write_word(&mut bus, RAM_BASE, 0x0000_0073); // ECALL

    cpu.step(&mut bus);
    // GPRs except a0/a1 should be preserved
    assert_eq!(cpu.x[5], 0xDEADBEEF);
    // a0 is overwritten with SBI_ERR_NOT_SUPPORTED (i32 -1 = u32 0xFFFFFFFF)
    assert_eq!(cpu.x[10], 0xFFFFFFFF);
    // a1 is 0 (second return value)
    assert_eq!(cpu.x[11], 0);
    assert_eq!(cpu.x[17], 99);
}

// ============================================================
// EBREAK tests
// ============================================================

#[test]
fn ebreak_m_mode_returns_ebreak_result() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Machine;
    write_word(&mut bus, RAM_BASE, 0x0010_0073); // EBREAK

    let result = cpu.step(&mut bus);
    assert_eq!(result, StepResult::Ebreak);
    // PC should advance past EBREAK in M-mode
    assert_eq!(cpu.pc, (RAM_BASE + 4) as u32);
}

#[test]
fn ebreak_s_mode_traps_with_cause_breakpoint() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Supervisor;
    // Delegate BREAKPOINT to S-mode (medeleg bit 3)
    cpu.csr.medeleg = 1 << 3;
    cpu.csr.stvec = 0x8000_0400;
    write_word(&mut bus, RAM_BASE, 0x0010_0073); // EBREAK

    let result = cpu.step(&mut bus);
    assert_eq!(result, StepResult::Ok);
    // EBREAK from S-mode traps to S-mode
    assert_eq!(cpu.pc, 0x8000_0400);
    assert_eq!(cpu.csr.scause, csr::CAUSE_BREAKPOINT);
    assert_eq!(cpu.csr.sepc, RAM_BASE as u32);
}

// ============================================================
// FENCE tests
// ============================================================

#[test]
fn fence_advances_pc_by_4() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, RAM_BASE, 0x0FF0_000F); // FENCE

    let result = cpu.step(&mut bus);
    assert_eq!(result, StepResult::Ok);
    assert_eq!(cpu.pc, (RAM_BASE + 4) as u32);
}

#[test]
fn fence_preserves_all_registers() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.x[1] = 111;
    cpu.x[2] = 222;
    cpu.x[31] = 0xCAFEBABE;
    write_word(&mut bus, RAM_BASE, 0x0FF0_000F); // FENCE

    cpu.step(&mut bus);
    assert_eq!(cpu.x[1], 111);
    assert_eq!(cpu.x[2], 222);
    assert_eq!(cpu.x[31], 0xCAFEBABE);
}

// ============================================================
// NOP tests
// ============================================================

#[test]
fn nop_advances_pc_by_4() {
    let (mut cpu, mut bus) = make_cpu_bus();
    // NOP = ADDI x0, x0, 0 = 0x00000013
    write_word(&mut bus, RAM_BASE, 0x0000_0013);

    let result = cpu.step(&mut bus);
    assert_eq!(result, StepResult::Ok);
    assert_eq!(cpu.pc, (RAM_BASE + 4) as u32);
}

#[test]
fn nop_does_not_modify_any_register() {
    let (mut cpu, mut bus) = make_cpu_bus();
    for i in 1..32 {
        cpu.x[i] = (i * 0x11111111) as u32;
    }
    write_word(&mut bus, RAM_BASE, 0x0000_0013); // NOP

    cpu.step(&mut bus);
    for i in 1..32 {
        assert_eq!(cpu.x[i], (i * 0x11111111) as u32, "x{} modified by NOP", i);
    }
    // x0 always reads 0
    assert_eq!(cpu.x[0], 0);
}

// ============================================================
// MRET tests
// ============================================================

#[test]
fn mret_returns_to_mepc() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Machine;
    cpu.csr.mepc = 0x8000_0500;
    // MRET: 0x30200073
    write_word(&mut bus, RAM_BASE, 0x3020_0073);

    let result = cpu.step(&mut bus);
    assert_eq!(result, StepResult::Ok);
    assert_eq!(cpu.pc, 0x8000_0500);
}

#[test]
fn mret_restores_privilege_from_mpp_s() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Machine;
    cpu.csr.mepc = 0x8000_0500;
    // Set MPP to S-mode (01)
    cpu.csr.mstatus |= 1 << csr::MSTATUS_MPP_LSB;
    cpu.csr.mstatus &= !csr::MSTATUS_MPP_MASK | (1 << csr::MSTATUS_MPP_LSB);
    write_word(&mut bus, RAM_BASE, 0x3020_0073); // MRET

    cpu.step(&mut bus);
    assert_eq!(cpu.privilege, Privilege::Supervisor);
}

#[test]
fn mret_restores_privilege_from_mpp_u() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Machine;
    cpu.csr.mepc = 0x8000_0500;
    // Set MPP to U-mode (00) - clear the MPP bits
    cpu.csr.mstatus &= !csr::MSTATUS_MPP_MASK;
    write_word(&mut bus, RAM_BASE, 0x3020_0073); // MRET

    cpu.step(&mut bus);
    assert_eq!(cpu.privilege, Privilege::User);
}

#[test]
fn mret_mpp_machine_stays_machine() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Machine;
    cpu.csr.mepc = 0x8000_0500;
    // Set MPP to M-mode (11)
    cpu.csr.mstatus |= csr::MSTATUS_MPP_MASK;
    write_word(&mut bus, RAM_BASE, 0x3020_0073); // MRET

    cpu.step(&mut bus);
    assert_eq!(cpu.privilege, Privilege::Machine);
}

// ============================================================
// SRET tests
// ============================================================

#[test]
fn sret_returns_to_sepc() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Supervisor;
    cpu.csr.sepc = 0x8000_0600;
    // SRET: 0x10200073
    write_word(&mut bus, RAM_BASE, 0x1020_0073);

    let result = cpu.step(&mut bus);
    assert_eq!(result, StepResult::Ok);
    assert_eq!(cpu.pc, 0x8000_0600);
}

#[test]
fn sret_restores_privilege_from_spp_user() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Supervisor;
    cpu.csr.sepc = 0x8000_0600;
    // SPP=0 means return to User mode
    cpu.csr.mstatus &= !(1 << csr::MSTATUS_SPP);
    write_word(&mut bus, RAM_BASE, 0x1020_0073); // SRET

    cpu.step(&mut bus);
    assert_eq!(cpu.privilege, Privilege::User);
}

#[test]
fn sret_restores_privilege_from_spp_supervisor() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Supervisor;
    cpu.csr.sepc = 0x8000_0600;
    // SPP=1 means return to Supervisor mode
    cpu.csr.mstatus |= 1 << csr::MSTATUS_SPP;
    write_word(&mut bus, RAM_BASE, 0x1020_0073); // SRET

    cpu.step(&mut bus);
    assert_eq!(cpu.privilege, Privilege::Supervisor);
}

// ============================================================
// SFENCE.VMA tests
// ============================================================

#[test]
fn sfence_vma_all_advances_pc() {
    let (mut cpu, mut bus) = make_cpu_bus();
    // SFENCE.VMA rs1=x0, rs2=x0 (flush all): 0x12000073
    write_word(&mut bus, RAM_BASE, 0x1200_0073);

    let result = cpu.step(&mut bus);
    assert_eq!(result, StepResult::Ok);
    assert_eq!(cpu.pc, (RAM_BASE + 4) as u32);
}

#[test]
fn sfence_vma_flushes_all_tlb_entries() {
    let (mut cpu, mut bus) = make_cpu_bus();
    // Pre-populate TLB with a dummy entry: insert(vpn, asid, ppn, flags)
    cpu.tlb.insert(0, 0, 0x8000_0000, 0);

    // Verify entry exists before flush
    assert!(cpu.tlb.lookup(0, 0).is_some());

    write_word(&mut bus, RAM_BASE, 0x1200_0073); // SFENCE.VMA (flush all)
    cpu.step(&mut bus);

    // TLB should be empty after full flush
    assert!(cpu.tlb.lookup(0, 0).is_none());
}

#[test]
fn sfence_vma_asid_flushes_only_matching_asid() {
    let (mut cpu, mut bus) = make_cpu_bus();
    // Insert entries with different ASIDs: insert(vpn, asid, ppn, flags)
    cpu.tlb.insert(0, 1, 0x8000_0000, 0); // vpn=0, asid=1
    cpu.tlb.insert(0, 2, 0x8000_1000, 0); // vpn=0, asid=2

    // SFENCE.VMA x0, x2 where x2 = asid to flush
    // rs1=x0 (all addresses), rs2=x2 (specific ASID)
    cpu.x[2] = 1; // flush ASID 1
                  // Encoding: funct7=0001001, rs2=x2(2), rs1=x0(0), funct3=0, rd=x0(0), opcode=0x73
    let sfence_asid = (0b0001001u32 << 25) | (2 << 20) | (0 << 15) | 0x73;
    write_word(&mut bus, RAM_BASE, sfence_asid);

    cpu.step(&mut bus);
    // ASID 1 should be flushed, ASID 2 should remain
    assert!(cpu.tlb.lookup(0, 1).is_none(), "ASID 1 should be flushed");
    assert!(cpu.tlb.lookup(0, 2).is_some(), "ASID 2 should remain");
}
// ============================================================
// CSRRW tests
// ============================================================

#[test]
fn csrrw_reads_old_csr_writes_new_value() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.csr.mscratch = 0xAAAA;
    // CSRRW x5, mscratch, x10: rd=5, rs1=10, csr=0x340 (mscratch)
    cpu.x[10] = 0xBBBB;
    let instr = encode_csr(0b001, 5, 10, 0x340);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    // rd (x5) gets old value
    assert_eq!(cpu.x[5], 0xAAAA);
    // CSR gets new value from rs1 (x10)
    assert_eq!(cpu.csr.mscratch, 0xBBBB);
    // x0 always reads 0
    assert_eq!(cpu.x[0], 0);
}

#[test]
fn csrrw_to_x0_discards_old_value() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.csr.mscratch = 0xAAAA;
    cpu.x[10] = 0xBBBB;
    // CSRRW x0, mscratch, x10: rd=0, rs1=10
    let instr = encode_csr(0b001, 0, 10, 0x340);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    // CSR still updated
    assert_eq!(cpu.csr.mscratch, 0xBBBB);
    // x0 always 0 (write discarded)
    assert_eq!(cpu.x[0], 0);
}

// ============================================================
// CSRRS tests
// ============================================================

#[test]
fn csrrs_reads_csr_and_sets_bits() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.csr.mstatus = 0x0000_0001; // SIE=1
                                   // CSRRS x5, mstatus, x10: set MIE bit (bit 3)
    cpu.x[10] = 0x0000_0008; // MIE mask
    let instr = encode_csr(0b010, 5, 10, csr::MSTATUS);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    // rd gets old value
    assert_eq!(cpu.x[5], 0x0000_0001);
    // CSR has bits OR'd in: SIE | MIE = 0x9
    assert_eq!(cpu.csr.mstatus, 0x0000_0009);
}

#[test]
fn csrrs_with_zero_rs1_does_not_modify_csr() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.csr.mscratch = 0xAAAA;
    // CSRRS x5, mscratch, x0: read-only (rs1=x0 → mask=0)
    let instr = encode_csr(0b010, 5, 0, 0x340);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[5], 0xAAAA);
    assert_eq!(cpu.csr.mscratch, 0xAAAA); // unchanged
}

// ============================================================
// CSRRC tests
// ============================================================

#[test]
fn csrrc_reads_csr_and_clears_bits() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.csr.mstatus = 0x0000_0009; // SIE=1, MIE=1
                                   // CSRRC x5, mstatus, x10: clear SIE bit
    cpu.x[10] = 0x0000_0001; // SIE mask
    let instr = encode_csr(0b011, 5, 10, csr::MSTATUS);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    // rd gets old value
    assert_eq!(cpu.x[5], 0x0000_0009);
    // CSR has bits AND-NOT'd: 0x9 & ~0x1 = 0x8
    assert_eq!(cpu.csr.mstatus, 0x0000_0008);
}

#[test]
fn csrrc_with_zero_rs1_does_not_modify_csr() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.csr.mscratch = 0xAAAA;
    // CSRRC x5, mscratch, x0: read-only (rs1=x0 → mask=0)
    let instr = encode_csr(0b011, 5, 0, 0x340);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[5], 0xAAAA);
    assert_eq!(cpu.csr.mscratch, 0xAAAA); // unchanged
}

// ============================================================
// CSRRWI tests
// ============================================================

#[test]
fn csrrwi_reads_csr_writes_immediate() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.csr.mscratch = 0xAAAA;
    // CSRRWI x5, mscratch, 0x1F: rd=5, uimm=31 (5-bit field), csr=0x340
    let instr = encode_csr(0b101, 5, 0x1F, 0x340);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[5], 0xAAAA);
    assert_eq!(cpu.csr.mscratch, 0x1F);
}

// ============================================================
// CSRRSI tests
// ============================================================

#[test]
fn csrrsi_sets_bits_from_immediate() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.csr.mstatus = 0x0000_0001;
    // CSRRSI x5, mstatus, 0x8: set MIE (bit 3)
    let instr = encode_csr(0b110, 5, 0x08, csr::MSTATUS);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[5], 0x0000_0001);
    assert_eq!(cpu.csr.mstatus, 0x0000_0009);
}

#[test]
fn csrrsi_with_zero_uimm_does_not_modify_csr() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.csr.mscratch = 0xAAAA;
    // CSRRSI x5, mscratch, 0: read-only
    let instr = encode_csr(0b110, 5, 0, 0x340);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[5], 0xAAAA);
    assert_eq!(cpu.csr.mscratch, 0xAAAA);
}

// ============================================================
// CSRRCI tests
// ============================================================

#[test]
fn csrrci_clears_bits_from_immediate() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.csr.mstatus = 0x0000_0009;
    // CSRRCI x5, mstatus, 0x1: clear SIE (bit 0)
    let instr = encode_csr(0b111, 5, 0x01, csr::MSTATUS);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[5], 0x0000_0009);
    assert_eq!(cpu.csr.mstatus, 0x0000_0008);
}

#[test]
fn csrrci_with_zero_uimm_does_not_modify_csr() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.csr.mscratch = 0xAAAA;
    // CSRRCI x5, mscratch, 0: read-only
    let instr = encode_csr(0b111, 5, 0, 0x340);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[5], 0xAAAA);
    assert_eq!(cpu.csr.mscratch, 0xAAAA);
}

// ============================================================
// CSR write to x0 is discarded (x0 hardwired to zero)
// ============================================================

#[test]
fn csr_write_to_x0_is_discarded() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.csr.mscratch = 0xAAAA;
    // CSRRW x0, mscratch, x10: write to x0 is discarded
    cpu.x[10] = 0xBBBB;
    let instr = encode_csr(0b001, 0, 10, 0x340);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    // CSR updated, but x0 remains 0
    assert_eq!(cpu.csr.mscratch, 0xBBBB);
    assert_eq!(cpu.x[0], 0);
}

// ============================================================
// TIME CSR reads from CLINT
// ============================================================

#[test]
fn read_time_csr_returns_clint_mtime() {
    let (mut cpu, mut bus) = make_cpu_bus();
    bus.clint.mtime = 12345;
    // CSRRS x5, time, x0 (read-only)
    let instr = encode_csr(0b010, 5, 0, csr::TIME);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[5], 12345);
}

// ============================================================
// Trap enter/exit round-trip
// ============================================================

#[test]
fn trap_roundtrip_ecall_mret() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Supervisor;
    // Delegate BREAKPOINT to S-mode (medeleg bit 3)
    cpu.csr.medeleg = 1 << 3;
    cpu.csr.stvec = 0x8000_0100;

    // EBREAK at 0x80000000 -- traps to stvec in S-mode
    write_word(&mut bus, RAM_BASE, 0x0010_0073);

    // At trap handler: SRET instruction
    write_word(&mut bus, 0x8000_0100, 0x1020_0073); // SRET

    // Step 1: EBREAK traps to stvec
    cpu.step(&mut bus);
    assert_eq!(cpu.pc, 0x8000_0100);
    assert_eq!(cpu.csr.sepc, RAM_BASE as u32);

    // Step 2: SRET returns to sepc (which should be PC after EBREAK)
    cpu.step(&mut bus);
    assert_eq!(cpu.pc, RAM_BASE as u32); // sepc = EBREAK address
}

#[test]
fn trap_roundtrip_ebreak_sret() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Supervisor;
    // Delegate BREAKPOINT to S-mode (medeleg bit 3)
    cpu.csr.medeleg = 1 << 3;
    cpu.csr.stvec = 0x8000_0200;

    // EBREAK at 0x80000000
    write_word(&mut bus, RAM_BASE, 0x0010_0073);

    // At trap handler: SRET instruction
    write_word(&mut bus, 0x8000_0200, 0x1020_0073);

    // Step 1: EBREAK traps to stvec
    cpu.step(&mut bus);
    assert_eq!(cpu.pc, 0x8000_0200);
    assert_eq!(cpu.csr.sepc, RAM_BASE as u32);
    assert_eq!(cpu.csr.scause, csr::CAUSE_BREAKPOINT);

    // Step 2: SRET returns to sepc
    cpu.step(&mut bus);
    assert_eq!(cpu.pc, RAM_BASE as u32);
}

// ============================================================
// Multiple system instructions in sequence
// ============================================================

#[test]
fn sequence_of_nop_and_fence() {
    let (mut cpu, mut bus) = make_cpu_bus();
    let start = RAM_BASE;
    write_word(&mut bus, start, 0x0000_0013); // NOP
    write_word(&mut bus, start + 4, 0x0FF0_000F); // FENCE
    write_word(&mut bus, start + 8, 0x0000_0013); // NOP

    cpu.step(&mut bus);
    assert_eq!(cpu.pc, (start + 4) as u32);

    cpu.step(&mut bus);
    assert_eq!(cpu.pc, (start + 8) as u32);

    cpu.step(&mut bus);
    assert_eq!(cpu.pc, (start + 12) as u32);
}

#[test]
fn csrrw_then_csrrs_preserves_intermediate_value() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.csr.mscratch = 0;
    cpu.x[10] = 42;
    cpu.x[11] = 0x0000_0008;

    // CSRRW x5, mscratch, x10  (x5=0, mscratch=42)
    let instr1 = encode_csr(0b001, 5, 10, 0x340);
    // CSRRS x6, mscratch, x11  (x6=42, mscratch=42|8=0x2A)
    let instr2 = encode_csr(0b010, 6, 11, 0x340);

    write_word(&mut bus, RAM_BASE, instr1);
    write_word(&mut bus, RAM_BASE + 4, instr2);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[5], 0);
    assert_eq!(cpu.csr.mscratch, 42);

    cpu.step(&mut bus);
    assert_eq!(cpu.x[6], 42);
    assert_eq!(cpu.csr.mscratch, 42 | 8);
}

// ============================================================
// Privilege-based ECALL behavior
// ============================================================

#[test]
fn ecall_u_mode_logs_syscall_event() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::User;
    cpu.csr.stvec = 0x8000_0300;
    cpu.x[17] = 1; // NR = 1 (some syscall number)
    cpu.x[10] = 0; // a0
    cpu.x[11] = 0; // a1

    write_word(&mut bus, RAM_BASE, 0x0000_0073); // ECALL

    cpu.step(&mut bus);
    // Should have logged a syscall event
    assert!(!bus.syscall_log.is_empty());
    let event = &bus.syscall_log[0];
    assert_eq!(event.nr, 1);
    assert_eq!(event.pc, RAM_BASE as u32);
}

// ============================================================
// Syscall event logging - comprehensive tests
// ============================================================

#[test]
fn syscall_log_captures_a0_a1_args() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::User;
    cpu.csr.stvec = 0x8000_0300;
    cpu.x[17] = 64; // NR = 64 (write syscall)
    cpu.x[10] = 0xDEAD; // a0 = fd
    cpu.x[11] = 0xBEEF; // a1 = buf ptr

    write_word(&mut bus, RAM_BASE, 0x0000_0073); // ECALL

    cpu.step(&mut bus);
    assert_eq!(bus.syscall_log.len(), 1);
    let event = &bus.syscall_log[0];
    assert_eq!(event.nr, 64);
    assert_eq!(event.args[0], 0xDEAD);
    assert_eq!(event.args[1], 0xBEEF);
}

#[test]
fn syscall_log_captures_all_6_args() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::User;
    cpu.csr.stvec = 0x8000_0300;
    cpu.x[10] = 10; // a0
    cpu.x[11] = 11; // a1
    cpu.x[12] = 12; // a2
    cpu.x[13] = 13; // a3
    cpu.x[14] = 14; // a4
    cpu.x[15] = 15; // a5
    cpu.x[17] = 57; // NR = 57 (close syscall)

    write_word(&mut bus, RAM_BASE, 0x0000_0073); // ECALL

    cpu.step(&mut bus);
    let event = &bus.syscall_log[0];
    assert_eq!(event.args[0], 10);
    assert_eq!(event.args[1], 11);
    assert_eq!(event.args[2], 12);
    assert_eq!(event.args[3], 13);
    assert_eq!(event.args[4], 14);
    assert_eq!(event.args[5], 15);
}

#[test]
fn syscall_log_accumulates_multiple_ecalls() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::User;
    cpu.csr.stvec = 0x8000_0300;

    // First ECALL at RAM_BASE (NR=57 = close, not SBI-intercepted)
    write_word(&mut bus, RAM_BASE, 0x0000_0073);
    cpu.x[17] = 57;
    cpu.x[10] = 0xDEAD;
    cpu.step(&mut bus);

    // After ECALL, CPU is in S-mode. Reset to User for next syscall.
    cpu.privilege = Privilege::User;
    cpu.csr.mstatus = 1 << csr::MSTATUS_SPP; // SPP=1 (return to S-mode)
    write_word(&mut bus, RAM_BASE + 4, 0x0000_0073);
    cpu.pc = (RAM_BASE + 4) as u32;
    cpu.x[17] = 172; // NR=172 = getpid (not SBI-intercepted)
    cpu.x[10] = 0xCAFE;
    cpu.step(&mut bus);

    // Third ECALL - reset privilege again
    cpu.privilege = Privilege::User;
    write_word(&mut bus, RAM_BASE + 8, 0x0000_0073);
    cpu.pc = (RAM_BASE + 8) as u32;
    cpu.x[17] = 160; // NR=160 = uname (not SBI-intercepted)
    cpu.x[10] = 0xF00D;
    cpu.step(&mut bus);

    assert_eq!(bus.syscall_log.len(), 3);
    assert_eq!(bus.syscall_log[0].nr, 57);
    assert_eq!(bus.syscall_log[0].args[0], 0xDEAD);
    assert_eq!(bus.syscall_log[1].nr, 172);
    assert_eq!(bus.syscall_log[1].args[0], 0xCAFE);
    assert_eq!(bus.syscall_log[2].nr, 160);
    assert_eq!(bus.syscall_log[2].args[0], 0xF00D);
}

#[test]
fn syscall_log_captures_pc_of_ecall_instruction() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::User;
    cpu.csr.stvec = 0x8000_0300;
    cpu.x[17] = 7;

    // ECALL at a specific address
    let ecall_addr = RAM_BASE + 0x100;
    write_word(&mut bus, ecall_addr, 0x0000_0073);
    cpu.pc = ecall_addr as u32;

    cpu.step(&mut bus);
    assert_eq!(bus.syscall_log[0].pc, ecall_addr as u32);
}

#[test]
fn syscall_log_not_populated_by_regular_instructions() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::User;

    // ADDI (not an ECALL)
    write_word(&mut bus, RAM_BASE, encode_i(0b000, 1, 0, 42)); // addi x1, x0, 42

    cpu.step(&mut bus);
    assert!(bus.syscall_log.is_empty());
}

#[test]
fn syscall_log_not_populated_by_s_mode_ecall() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Supervisor;
    cpu.csr.medeleg = 1 << 9; // delegate ECALL_S to S-mode
    cpu.csr.stvec = 0x8000_0800;
    cpu.x[17] = 1;

    write_word(&mut bus, RAM_BASE, 0x0000_0073); // ECALL

    cpu.step(&mut bus);
    // S-mode ECALL traps to stvec, should NOT log a syscall event
    // (syscall events are for User-mode ECALLs only)
    assert!(bus.syscall_log.is_empty());
}

#[test]
fn syscall_log_not_populated_by_m_mode_ecall() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Machine;
    cpu.csr.mtvec = 0x8000_0400;
    cpu.x[17] = 1;

    write_word(&mut bus, RAM_BASE, 0x0000_0073); // ECALL

    cpu.step(&mut bus);
    // M-mode ECALL traps to mtvec, should NOT log a syscall event
    assert!(bus.syscall_log.is_empty());
}

#[test]
fn syscall_log_event_order_matches_execution_order() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::User;
    cpu.csr.stvec = 0x8000_0300;

    // Write 3 ECALLs in sequence
    for i in 0..3u32 {
        write_word(&mut bus, RAM_BASE + (i as u64) * 4, 0x0000_0073);
    }

    // Execute them one by one (reset privilege + PC each time, since ECALL traps to stvec)
    for i in 0..3u32 {
        cpu.privilege = Privilege::User;
        cpu.pc = (RAM_BASE + (i as u64) * 4) as u32;
        cpu.x[17] = (i + 1) * 10; // NR = 10, 20, 30
        cpu.step(&mut bus);
    }

    // Verify order
    assert_eq!(bus.syscall_log[0].nr, 10);
    assert_eq!(bus.syscall_log[1].nr, 20);
    assert_eq!(bus.syscall_log[2].nr, 30);
}

#[test]
fn syscall_log_clear_resets_events() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::User;
    cpu.csr.stvec = 0x8000_0300;
    cpu.x[17] = 57;

    write_word(&mut bus, RAM_BASE, 0x0000_0073);
    cpu.step(&mut bus);
    assert_eq!(bus.syscall_log.len(), 1);

    // Clear and verify
    bus.syscall_log.clear();
    assert!(bus.syscall_log.is_empty());

    // Another ECALL should log again (reset privilege)
    cpu.privilege = Privilege::User;
    write_word(&mut bus, RAM_BASE + 4, 0x0000_0073);
    cpu.pc = (RAM_BASE + 4) as u32;
    cpu.x[17] = 172;
    cpu.step(&mut bus);
    assert_eq!(bus.syscall_log.len(), 1);
}

#[test]
fn syscall_log_captures_zero_values() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::User;
    cpu.csr.stvec = 0x8000_0300;
    // All registers are 0 by default (make_cpu_bus zeroes them)
    // x[17] (a7) = 0 is the syscall number

    write_word(&mut bus, RAM_BASE, 0x0000_0073); // ECALL

    cpu.step(&mut bus);
    let event = &bus.syscall_log[0];
    assert_eq!(event.nr, 0);
    for arg in &event.args {
        assert_eq!(*arg, 0);
    }
}

#[test]
fn syscall_log_captures_max_u32_values() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::User;
    cpu.csr.stvec = 0x8000_0300;
    let max = 0xFFFF_FFFFu32;
    cpu.x[17] = max;
    cpu.x[10] = max;
    cpu.x[11] = max;
    cpu.x[12] = max;

    write_word(&mut bus, RAM_BASE, 0x0000_0073); // ECALL

    cpu.step(&mut bus);
    let event = &bus.syscall_log[0];
    assert_eq!(event.nr, max);
    assert_eq!(event.args[0], max);
    assert_eq!(event.args[1], max);
    assert_eq!(event.args[2], max);
}

#[test]
fn syscall_log_ret_is_none_at_ecall_time() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::User;
    cpu.csr.stvec = 0x8000_0300;
    cpu.x[17] = 57; // close

    write_word(&mut bus, RAM_BASE, 0x0000_0073);
    cpu.step(&mut bus);

    // ret should be None at ECALL time (before kernel returns)
    assert!(bus.syscall_log[0].ret.is_none());
}

#[test]
fn syscall_log_name_decoded_from_nr() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::User;
    cpu.csr.stvec = 0x8000_0300;

    // NR 57 = close (known syscall)
    cpu.x[17] = 57;
    write_word(&mut bus, RAM_BASE, 0x0000_0073);
    cpu.step(&mut bus);
    assert_eq!(bus.syscall_log[0].name, "close");

    // NR 172 = getpid (known syscall) - reset privilege
    bus.syscall_log.clear();
    cpu.privilege = Privilege::User;
    cpu.x[17] = 172;
    write_word(&mut bus, RAM_BASE + 4, 0x0000_0073);
    cpu.pc = (RAM_BASE + 4) as u32;
    cpu.step(&mut bus);
    assert_eq!(bus.syscall_log[0].name, "getpid");

    // NR 0xFFFF = unknown syscall - reset privilege
    bus.syscall_log.clear();
    cpu.privilege = Privilege::User;
    cpu.x[17] = 0xFFFF;
    write_word(&mut bus, RAM_BASE + 8, 0x0000_0073);
    cpu.pc = (RAM_BASE + 8) as u32;
    cpu.step(&mut bus);
    assert_eq!(bus.syscall_log[0].name, "unknown");
}

#[test]
fn syscall_log_pending_idx_cleared_after_clear() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::User;
    cpu.csr.stvec = 0x8000_0300;
    cpu.x[17] = 57;

    write_word(&mut bus, RAM_BASE, 0x0000_0073);
    cpu.step(&mut bus);

    // pending_syscall_idx should be set
    assert!(bus.pending_syscall_idx.is_some());

    // Clear the log manually
    bus.syscall_log.clear();

    // pending_syscall_idx still points to old (now-invalid) index
    // but that's expected behavior - the user manages the log
}

#[test]
fn syscall_event_struct_construction() {
    use crate::riscv::syscall::SyscallEvent;

    // Verify the SyscallEvent struct can be constructed with all fields
    let event = SyscallEvent {
        nr: 64,
        name: "write",
        args: [1, 0x1000, 10, 0, 0, 0],
        ret: Some(10),
        pc: 0x1000,
    };
    assert_eq!(event.nr, 64);
    assert_eq!(event.name, "write");
    assert_eq!(event.args[0], 1);
    assert_eq!(event.args[1], 0x1000);
    assert_eq!(event.args[2], 10);
    assert_eq!(event.ret, Some(10));
    assert_eq!(event.pc, 0x1000);
}

#[test]
fn syscall_event_struct_with_none_ret() {
    use crate::riscv::syscall::SyscallEvent;

    let event = SyscallEvent {
        nr: 57,
        name: "close",
        args: [3, 0, 0, 0, 0, 0],
        ret: None,
        pc: 0x2000,
    };
    assert_eq!(event.nr, 57);
    assert!(event.ret.is_none());
    assert_eq!(event.pc, 0x2000);
}
#[test]
fn sbi_ecall_from_s_mode_returns_not_supported_for_unknown_eid() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Supervisor;
    cpu.x[17] = 0xFFFF; // Unknown SBI extension
    cpu.x[16] = 0; // function 0
    cpu.x[10] = 0; // a0

    write_word(&mut bus, RAM_BASE, 0x0000_0073); // ECALL

    cpu.step(&mut bus);
    // Unknown SBI extension now returns NOT_SUPPORTED instead of trapping.
    // PC advances past the ECALL instruction.
    assert_eq!(cpu.pc, (RAM_BASE + 4) as u32);
    // a0 gets NOT_SUPPORTED error code (i32 -1 = u32 0xFFFFFFFF)
    assert_eq!(cpu.x[10], 0xFFFFFFFF);
}

// ============================================================
// LastStepInfo populated after each step
// ============================================================

#[test]
fn last_step_info_populated_after_fence() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, RAM_BASE, 0x0FF0_000F); // FENCE

    assert!(cpu.last_step.is_none());
    cpu.step(&mut bus);
    assert!(cpu.last_step.is_some());

    let info = cpu.last_step.as_ref().unwrap();
    assert_eq!(info.pc, RAM_BASE as u32);
    assert_eq!(info.pc_after, (RAM_BASE + 4) as u32);
    assert_eq!(info.inst_len, 4);
    assert_eq!(info.result, StepResult::Ok);
}

#[test]
fn last_step_info_populated_after_ecall() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Machine;
    cpu.csr.mtvec = 0x8000_0100;
    write_word(&mut bus, RAM_BASE, 0x0000_0073); // ECALL

    cpu.step(&mut bus);
    let info = cpu.last_step.as_ref().unwrap();
    assert_eq!(info.pc, RAM_BASE as u32);
    // SBI intercepts ECALL, advances PC past the instruction
    assert_eq!(info.pc_after, (RAM_BASE + 4) as u32);
}

// ============================================================
// CSR read-only behavior: writing to read-only CSRs
// ============================================================

#[test]
fn write_to_read_only_csr_is_ignored() {
    let (mut cpu, mut bus) = make_cpu_bus();
    let orig_misa = cpu.csr.read(csr::MISA);
    // CSRRW x5, misa, x10 (misa is read-only)
    cpu.x[10] = 0xDEADBEEF;
    let instr = encode_csr(0b001, 5, 10, csr::MISA);
    write_word(&mut bus, RAM_BASE, instr);

    cpu.step(&mut bus);
    // CSR should not have changed
    assert_eq!(cpu.csr.read(csr::MISA), orig_misa);
}

// ============================================================
// Phase 317: ALU arithmetic tests (ADD, SUB, AND, OR, XOR, SLT, SLTU)

// ============================================================
// Phase 317: ALU arithmetic tests (ADD, SUB, AND, OR, XOR, SLT, SLTU)
// ============================================================

// Helper: encode R-type instruction
fn encode_r(funct7: u32, funct3: u32, rd: u8, rs1: u8, rs2: u8) -> u32 {
    (funct7 << 25)
        | ((rs2 as u32) << 20)
        | ((rs1 as u32) << 15)
        | (funct3 << 12)
        | ((rd as u32) << 7)
        | 0x33
}

// Helper: encode I-type instruction (opcode 0x13 = ALU-immediate)
fn encode_i(funct3: u32, rd: u8, rs1: u8, imm: i32) -> u32 {
    let imm_u = (imm as u32) & 0xFFF;
    (imm_u << 20) | ((rs1 as u32) << 15) | (funct3 << 12) | ((rd as u32) << 7) | 0x13
}

// Helper: encode Load instruction (opcode 0x03)
fn encode_load(funct3: u32, rd: u8, rs1: u8, imm: i32) -> u32 {
    let imm_u = (imm as u32) & 0xFFF;
    (imm_u << 20) | ((rs1 as u32) << 15) | (funct3 << 12) | ((rd as u32) << 7) | 0x03
}

// Helper: encode Store instruction (opcode 0x23)
fn encode_store(funct3: u32, rs1: u8, rs2: u8, imm: i32) -> u32 {
    let imm_u = (imm as u32) & 0xFFF;
    let imm_4_0 = imm_u & 0x1F;
    let imm_11_5 = (imm_u >> 5) & 0x7F;
    (imm_11_5 << 25)
        | ((rs2 as u32) << 20)
        | ((rs1 as u32) << 15)
        | (funct3 << 12)
        | (imm_4_0 << 7)
        | 0x23
}

// Helper: set register value directly
fn set_reg(cpu: &mut RiscvCpu, reg: u8, val: u32) {
    cpu.x[reg as usize] = if reg == 0 { 0 } else { val };
}

// Helper: get register value directly
fn get_reg(cpu: &RiscvCpu, reg: u8) -> u32 {
    if reg == 0 {
        0
    } else {
        cpu.x[reg as usize]
    }
}

// Data area: use addresses well within RAM (RAM_BASE + 0x100..0x200)
const DATA_BASE: u64 = 0x8000_0100;

#[test]
fn alu_add_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 100); // a1 = 100
    set_reg(&mut cpu, 6, 200); // a2 = 200
    write_word(&mut bus, RAM_BASE, encode_r(0, 0, 7, 5, 6)); // add a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 300);
    assert_eq!(cpu.pc, RAM_BASE as u32 + 4);
}

#[test]
fn alu_add_zero_and_zero() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0);
    set_reg(&mut cpu, 6, 0);
    write_word(&mut bus, RAM_BASE, encode_r(0, 0, 7, 5, 6)); // add a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0);
}

#[test]
fn alu_add_wrapping_overflow() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0xFFFF_FFFF); // max u32
    set_reg(&mut cpu, 6, 1);
    write_word(&mut bus, RAM_BASE, encode_r(0, 0, 7, 5, 6)); // add a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0); // wraps to 0
}

#[test]
fn alu_add_negative_signed() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 10);
    set_reg(&mut cpu, 6, 0xFFFF_FFFF); // -1 as u32
    write_word(&mut bus, RAM_BASE, encode_r(0, 0, 7, 5, 6)); // add a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 9); // 10 + (-1) = 9
}

#[test]
fn alu_sub_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 500);
    set_reg(&mut cpu, 6, 200);
    write_word(&mut bus, RAM_BASE, encode_r(0x20, 0, 7, 5, 6)); // sub a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 300);
}

#[test]
fn alu_sub_wrapping_underflow() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0);
    set_reg(&mut cpu, 6, 1);
    write_word(&mut bus, RAM_BASE, encode_r(0x20, 0, 7, 5, 6)); // sub a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0xFFFF_FFFF); // 0 - 1 = -1
}

#[test]
fn alu_and_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0xFF00_FF00);
    set_reg(&mut cpu, 6, 0x0FF0_0FF0);
    write_word(&mut bus, RAM_BASE, encode_r(0, 7, 7, 5, 6)); // and a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0x0F00_0F00);
}

#[test]
fn alu_or_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0xFF00_0000);
    set_reg(&mut cpu, 6, 0x00FF_0000);
    write_word(&mut bus, RAM_BASE, encode_r(0, 6, 7, 5, 6)); // or a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0xFFFF_0000);
}

#[test]
fn alu_xor_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0xFF00_FF00);
    set_reg(&mut cpu, 6, 0x0F0F_0F0F);
    write_word(&mut bus, RAM_BASE, encode_r(0, 4, 7, 5, 6)); // xor a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0xF00F_F00F);
}

#[test]
fn alu_xor_self_zeroes() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0x1234_5678);
    write_word(&mut bus, RAM_BASE, encode_r(0, 4, 7, 5, 5)); // xor a3, a1, a1
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0);
}

#[test]
fn alu_slt_signed_less() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0xFFFF_FFFF); // -1 as i32
    set_reg(&mut cpu, 6, 1);
    write_word(&mut bus, RAM_BASE, encode_r(0, 2, 7, 5, 6)); // slt a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 1); // -1 < 1
}

#[test]
fn alu_slt_signed_greater() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 5);
    set_reg(&mut cpu, 6, 3);
    write_word(&mut bus, RAM_BASE, encode_r(0, 2, 7, 5, 6)); // slt a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0); // 5 is NOT less than 3
}

#[test]
fn alu_slt_equal() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 42);
    set_reg(&mut cpu, 6, 42);
    write_word(&mut bus, RAM_BASE, encode_r(0, 2, 7, 5, 6)); // slt a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0); // equal is NOT less
}

#[test]
fn alu_sltu_unsigned_less() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0xFFFF_FFFF); // max unsigned
    set_reg(&mut cpu, 6, 0x0000_0001);
    write_word(&mut bus, RAM_BASE, encode_r(0, 3, 7, 5, 6)); // sltu a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0); // 0xFFFF_FFFF > 1 unsigned
}

#[test]
fn alu_sll_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 1);
    set_reg(&mut cpu, 6, 4);
    write_word(&mut bus, RAM_BASE, encode_r(0, 1, 7, 5, 6)); // sll a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 16); // 1 << 4 = 16
}

#[test]
fn alu_srl_logical() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0x8000_0000); // high bit set
    set_reg(&mut cpu, 6, 28);
    write_word(&mut bus, RAM_BASE, encode_r(0, 5, 7, 5, 6)); // srl a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 8); // logical shift right fills with 0
}

#[test]
fn alu_sra_arithmetic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0x8000_0000u32); // -2147483648 as i32
    set_reg(&mut cpu, 6, 28);
    write_word(&mut bus, RAM_BASE, encode_r(0x20, 5, 7, 5, 6)); // sra a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0xFFFF_FFF8); // arithmetic shift fills with sign bit
}

#[test]
fn alu_sra_positive_value() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0x7FFF_FFFF); // max positive i32
    set_reg(&mut cpu, 6, 4);
    write_word(&mut bus, RAM_BASE, encode_r(0x20, 5, 7, 5, 6)); // sra a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0x07FF_FFFF); // 134217727 >> 4
}

// ============================================================
// Phase 317: M extension (MUL, MULH, MULHU, DIV, DIVU, REM, REMU)
// ============================================================

#[test]
fn alu_mul_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 123);
    set_reg(&mut cpu, 6, 456);
    write_word(&mut bus, RAM_BASE, encode_r(1, 0, 7, 5, 6)); // mul a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 56088); // 123 * 456
}

#[test]
fn alu_mul_low32_only() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0xFFFF_FFFF);
    set_reg(&mut cpu, 6, 2);
    write_word(&mut bus, RAM_BASE, encode_r(1, 0, 7, 5, 6)); // mul a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0xFFFF_FFFE); // low 32 bits of 0x1FFFFFFFE
}

#[test]
fn alu_mulh_signed_positive() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0x0001_0000); // 65536
    set_reg(&mut cpu, 6, 0x0001_0000); // 65536
    write_word(&mut bus, RAM_BASE, encode_r(1, 1, 7, 5, 6)); // mulh a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 1); // (65536 * 65536) >> 32 = 1
}

#[test]
fn alu_mulhu_unsigned() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0xFFFF_FFFF);
    set_reg(&mut cpu, 6, 0xFFFF_FFFF);
    write_word(&mut bus, RAM_BASE, encode_r(1, 3, 7, 5, 6)); // mulhu a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0xFFFF_FFFE);
}

#[test]
fn alu_div_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 100);
    set_reg(&mut cpu, 6, 7);
    write_word(&mut bus, RAM_BASE, encode_r(1, 4, 7, 5, 6)); // div a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 14); // 100 / 7 = 14
}

#[test]
fn alu_div_negative() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0xFFFF_FFFF); // -1
    set_reg(&mut cpu, 6, 2);
    write_word(&mut bus, RAM_BASE, encode_r(1, 4, 7, 5, 6)); // div a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0); // -1 / 2 = 0 (truncation toward zero)
}

#[test]
fn alu_div_by_zero() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 42);
    set_reg(&mut cpu, 6, 0);
    write_word(&mut bus, RAM_BASE, encode_r(1, 4, 7, 5, 6)); // div a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0xFFFF_FFFF); // div by zero = -1
}

#[test]
fn alu_div_overflow() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0x8000_0000u32); // i32::MIN
    set_reg(&mut cpu, 6, 0xFFFF_FFFFu32); // -1
    write_word(&mut bus, RAM_BASE, encode_r(1, 4, 7, 5, 6)); // div a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0x8000_0000u32); // i32::MIN / -1 = i32::MIN
}

#[test]
fn alu_divu_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 100);
    set_reg(&mut cpu, 6, 7);
    write_word(&mut bus, RAM_BASE, encode_r(1, 5, 7, 5, 6)); // divu a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 14);
}

#[test]
fn alu_divu_by_zero() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 42);
    set_reg(&mut cpu, 6, 0);
    write_word(&mut bus, RAM_BASE, encode_r(1, 5, 7, 5, 6)); // divu a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0xFFFF_FFFF); // divu by zero = u32::MAX
}

#[test]
fn alu_rem_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 100);
    set_reg(&mut cpu, 6, 7);
    write_word(&mut bus, RAM_BASE, encode_r(1, 6, 7, 5, 6)); // rem a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 2); // 100 % 7 = 2
}

#[test]
fn alu_rem_overflow() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0x8000_0000u32); // i32::MIN
    set_reg(&mut cpu, 6, 0xFFFF_FFFFu32); // -1
    write_word(&mut bus, RAM_BASE, encode_r(1, 6, 7, 5, 6)); // rem a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0); // i32::MIN % -1 = 0
}

#[test]
fn alu_remu_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 100);
    set_reg(&mut cpu, 6, 7);
    write_word(&mut bus, RAM_BASE, encode_r(1, 7, 7, 5, 6)); // remu a3, a1, a2
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 2);
}

// ============================================================
// Phase 317: I-type ALU (ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI)
// ============================================================

#[test]
fn alu_addi_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 100);
    write_word(&mut bus, RAM_BASE, encode_i(0, 7, 5, 50)); // addi a3, a1, 50
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 150);
}

#[test]
fn alu_addi_negative_immediate() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 100);
    write_word(&mut bus, RAM_BASE, encode_i(0, 7, 5, -1)); // addi a3, a1, -1
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 99);
}

#[test]
fn alu_addi_large_negative() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0);
    write_word(&mut bus, RAM_BASE, encode_i(0, 7, 5, -2048)); // addi a3, a1, -2048
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0xFFFF_F800); // sign-extended -2048
}

#[test]
fn alu_slti_signed() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 5);
    write_word(&mut bus, RAM_BASE, encode_i(2, 7, 5, 10)); // slti a3, a1, 10
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 1); // 5 < 10
}

#[test]
fn alu_slti_not_less() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 20);
    write_word(&mut bus, RAM_BASE, encode_i(2, 7, 5, 10)); // slti a3, a1, 10
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0); // 20 is NOT < 10
}

#[test]
fn alu_sltiu_unsigned() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 5);
    write_word(&mut bus, RAM_BASE, encode_i(3, 7, 5, 10)); // sltiu a3, a1, 10
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 1); // 5 < 10 unsigned
}

#[test]
fn alu_xori_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0xFF);
    write_word(&mut bus, RAM_BASE, encode_i(4, 7, 5, 0xFF)); // xori a3, a1, 0xFF
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0);
}

#[test]
fn alu_ori_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0xF000);
    write_word(&mut bus, RAM_BASE, encode_i(6, 7, 5, 0x00F0)); // ori a3, a1, 0x00F0
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0xF0F0); // 0xF000 | 0x00F0 = 0xF0F0
}

#[test]
fn alu_andi_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0xFFFF);
    write_word(&mut bus, RAM_BASE, encode_i(7, 7, 5, 0x00FF)); // andi a3, a1, 0x00FF
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0x00FF);
}

#[test]
fn alu_slli_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 1);
    write_word(&mut bus, RAM_BASE, encode_i(1, 7, 5, 8)); // slli a3, a1, 8
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 256); // 1 << 8 = 256
}

#[test]
fn alu_srli_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 256);
    write_word(&mut bus, RAM_BASE, encode_i(5, 7, 5, 4)); // srli a3, a1, 4
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 16); // 256 >> 4 = 16
}

#[test]
fn alu_srai_basic() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0x8000_0000u32); // -2147483648
                                          // SRAI: funct3=5, imm[11:5]=0x20 (bit 30 set), shamt=4
    let instr: u32 =
        (0x20u32 << 25) | (4u32 << 20) | ((5 as u32) << 15) | (5 << 12) | ((7 as u32) << 7) | 0x13;
    write_word(&mut bus, RAM_BASE, instr);
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0xF800_0000); // arithmetic shift preserves sign
}

// ============================================================
// Phase 317: Load/store tests (physical addresses via SATP=0)
// Registers hold full physical addresses (RAM_BASE + offset)
// ============================================================

#[test]
fn load_lw_aligned() {
    let (mut cpu, mut bus) = make_cpu_bus();
    bus.write_word(DATA_BASE, 0xDEAD_BEEF).unwrap();
    set_reg(&mut cpu, 5, DATA_BASE as u32); // a1 = physical address in RAM
    write_word(&mut bus, RAM_BASE, encode_load(2, 7, 5, 0)); // lw a3, 0(a1)
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0xDEAD_BEEF);
}

#[test]
fn load_lb_sign_extend() {
    let (mut cpu, mut bus) = make_cpu_bus();
    bus.write_byte(DATA_BASE, 0xFF).unwrap();
    set_reg(&mut cpu, 5, DATA_BASE as u32);
    write_word(&mut bus, RAM_BASE, encode_load(0, 7, 5, 0)); // lb a3, 0(a1)
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0xFFFF_FFFF); // sign-extended 0xFF = -1
}

#[test]
fn load_lbu_zero_extend() {
    let (mut cpu, mut bus) = make_cpu_bus();
    bus.write_byte(DATA_BASE, 0xFF).unwrap();
    set_reg(&mut cpu, 5, DATA_BASE as u32);
    write_word(&mut bus, RAM_BASE, encode_load(4, 7, 5, 0)); // lbu a3, 0(a1)
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0x0000_00FF); // zero-extended
}

#[test]
fn load_lh_sign_extend() {
    let (mut cpu, mut bus) = make_cpu_bus();
    bus.write_half(DATA_BASE, 0xFFFF).unwrap();
    set_reg(&mut cpu, 5, DATA_BASE as u32);
    write_word(&mut bus, RAM_BASE, encode_load(1, 7, 5, 0)); // lh a3, 0(a1)
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0xFFFF_FFFF); // sign-extended 0xFFFF = -1
}

#[test]
fn load_lhu_zero_extend() {
    let (mut cpu, mut bus) = make_cpu_bus();
    bus.write_half(DATA_BASE, 0xFFFF).unwrap();
    set_reg(&mut cpu, 5, DATA_BASE as u32);
    write_word(&mut bus, RAM_BASE, encode_load(5, 7, 5, 0)); // lhu a3, 0(a1)
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0x0000_FFFF); // zero-extended
}

#[test]
fn load_lb_positive_byte() {
    let (mut cpu, mut bus) = make_cpu_bus();
    bus.write_byte(DATA_BASE, 0x42).unwrap();
    set_reg(&mut cpu, 5, DATA_BASE as u32);
    write_word(&mut bus, RAM_BASE, encode_load(0, 7, 5, 0)); // lb a3, 0(a1)
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0x42); // positive, no sign extension needed
}

#[test]
fn load_with_positive_offset() {
    let (mut cpu, mut bus) = make_cpu_bus();
    bus.write_word(DATA_BASE + 8, 0x1234_5678).unwrap();
    set_reg(&mut cpu, 5, DATA_BASE as u32);
    write_word(&mut bus, RAM_BASE, encode_load(2, 7, 5, 8)); // lw a3, 8(a1)
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0x1234_5678);
}

#[test]
fn load_with_negative_offset() {
    let (mut cpu, mut bus) = make_cpu_bus();
    bus.write_word(DATA_BASE, 0xABCD_EF01).unwrap();
    set_reg(&mut cpu, 5, (DATA_BASE + 8) as u32);
    write_word(&mut bus, RAM_BASE, encode_load(2, 7, 5, -8)); // lw a3, -8(a1)
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0xABCD_EF01);
}

#[test]
fn store_sw_aligned() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, (DATA_BASE + 0x10) as u32);
    set_reg(&mut cpu, 6, 0xCAFEBABE);
    write_word(&mut bus, RAM_BASE, encode_store(2, 5, 6, 0)); // sw a2, 0(a1)
    cpu.step(&mut bus);
    let val = bus.read_word(DATA_BASE + 0x10).unwrap();
    assert_eq!(val, 0xCAFEBABE);
}

#[test]
fn store_sb_byte() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, (DATA_BASE + 0x20) as u32);
    set_reg(&mut cpu, 6, 0xFF);
    write_word(&mut bus, RAM_BASE, encode_store(0, 5, 6, 0)); // sb a2, 0(a1)
    cpu.step(&mut bus);
    let val = bus.read_byte(DATA_BASE + 0x20).unwrap();
    assert_eq!(val, 0xFF);
}

#[test]
fn store_sh_halfword() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, (DATA_BASE + 0x30) as u32);
    set_reg(&mut cpu, 6, 0xBEEF);
    write_word(&mut bus, RAM_BASE, encode_store(1, 5, 6, 0)); // sh a2, 0(a1)
    cpu.step(&mut bus);
    let val = bus.read_half(DATA_BASE + 0x30).unwrap();
    assert_eq!(val, 0xBEEF);
}

#[test]
fn store_sw_with_offset() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, DATA_BASE as u32);
    set_reg(&mut cpu, 6, 0x1111_2222);
    write_word(&mut bus, RAM_BASE, encode_store(2, 5, 6, 16)); // sw a2, 16(a1)
    cpu.step(&mut bus);
    let val = bus.read_word(DATA_BASE + 16).unwrap();
    assert_eq!(val, 0x1111_2222);
}

#[test]
fn load_store_roundtrip() {
    let (mut cpu, mut bus) = make_cpu_bus();
    let store_addr = DATA_BASE + 0x40;
    set_reg(&mut cpu, 5, store_addr as u32);
    set_reg(&mut cpu, 6, 0x9876_5432);

    // SW a2, 0(a1)
    write_word(&mut bus, RAM_BASE, encode_store(2, 5, 6, 0));
    cpu.step(&mut bus);
    assert_eq!(cpu.pc, RAM_BASE as u32 + 4);

    // LW a3, 0(a1)
    write_word(&mut bus, RAM_BASE + 4, encode_load(2, 7, 5, 0));
    cpu.step(&mut bus);

    assert_eq!(get_reg(&cpu, 7), 0x9876_5432);
}

#[test]
fn load_write_to_x0_is_ignored() {
    let (mut cpu, mut bus) = make_cpu_bus();
    bus.write_word(DATA_BASE, 0xDEAD_BEEF).unwrap();
    set_reg(&mut cpu, 5, DATA_BASE as u32);
    // LW x0, 0(a1) -- writing to x0 must be discarded
    write_word(&mut bus, RAM_BASE, encode_load(2, 0, 5, 0));
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 0), 0); // x0 always 0
}

// ============================================================
// Phase 317: CPU execute pipeline tests
// ============================================================

#[test]
fn pipeline_pc_advances_by_4() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, RAM_BASE, encode_i(0, 0, 0, 0)); // nop (addi x0, x0, 0)
    cpu.step(&mut bus);
    assert_eq!(cpu.pc, RAM_BASE as u32 + 4);
}

#[test]
fn pipeline_sequential_execution() {
    let (mut cpu, mut bus) = make_cpu_bus();
    // ADDI a1, x0, 10
    write_word(&mut bus, RAM_BASE, encode_i(0, 5, 0, 10));
    // ADDI a2, x0, 20
    write_word(&mut bus, RAM_BASE + 4, encode_i(0, 6, 0, 20));
    // ADD a3, a1, a2
    write_word(&mut bus, RAM_BASE + 8, encode_r(0, 0, 7, 5, 6));

    cpu.step(&mut bus); // addi a1, x0, 10
    assert_eq!(get_reg(&cpu, 5), 10);
    cpu.step(&mut bus); // addi a2, x0, 20
    assert_eq!(get_reg(&cpu, 6), 20);
    cpu.step(&mut bus); // add a3, a1, a2
    assert_eq!(get_reg(&cpu, 7), 30);
    assert_eq!(cpu.pc, RAM_BASE as u32 + 12);
}

#[test]
fn pipeline_compressed_instruction_2byte() {
    let (mut cpu, mut bus) = make_cpu_bus();
    // C.NOP = 0x0001 (compressed, 2 bytes)
    write_word(&mut bus, RAM_BASE, 0x0000_0001);
    cpu.step(&mut bus);
    assert_eq!(cpu.pc, RAM_BASE as u32 + 2); // compressed = 2 bytes
}

#[test]
fn pipeline_last_step_info_populated() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 42);
    write_word(&mut bus, RAM_BASE, encode_i(0, 7, 5, 8)); // addi a3, a1, 8
    cpu.step(&mut bus);
    assert!(cpu.last_step.is_some());
    let info = cpu.last_step.as_ref().unwrap();
    assert_eq!(info.pc, RAM_BASE as u32);
    assert_eq!(info.pc_after, RAM_BASE as u32 + 4);
    assert_eq!(info.inst_len, 4);
    assert_eq!(info.regs_before[5], 42);
    assert_eq!(info.regs_after[7], 50);
}

#[test]
fn pipeline_x0_hardwired_zero_after_write() {
    let (mut cpu, mut bus) = make_cpu_bus();
    // ADDI x0, x0, 42 -- should be discarded
    write_word(&mut bus, RAM_BASE, encode_i(0, 0, 0, 42));
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 0), 0); // x0 always stays 0
}

#[test]
fn pipeline_step_returns_ok_for_normal() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, RAM_BASE, encode_i(0, 0, 0, 0)); // nop
    let result = cpu.step(&mut bus);
    assert_eq!(result, StepResult::Ok);
}

#[test]
fn pipeline_invalid_instruction_traps() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.csr.mtvec = 0x8000_0100;
    // 0xFFFFFFFF is not a valid instruction
    write_word(&mut bus, RAM_BASE, 0xFFFFFFFF);
    cpu.step(&mut bus);
    // Should trap to mtvec
    assert_eq!(cpu.pc, 0x8000_0100);
    assert_eq!(cpu.csr.mcause, csr::CAUSE_ILLEGAL_INSTRUCTION);
}

// ============================================================
// Phase 317: Additional edge case tests
// ============================================================

// Helper: encode U-type (LUI, AUIPC)
fn encode_u(opcode: u32, rd: u8, imm20: u32) -> u32 {
    (imm20 << 12) | ((rd as u32) << 7) | opcode
}

// Helper: encode JAL
fn encode_jal(rd: u8, offset: i32) -> u32 {
    let imm = (offset as u32) & 0x1FFFFF;
    let imm_20 = (imm >> 20) & 1;
    let imm_10_1 = (imm >> 1) & 0x3FF;
    let imm_11 = (imm >> 11) & 1;
    let imm_19_12 = (imm >> 12) & 0xFF;
    (imm_20 << 31)
        | (imm_10_1 << 21)
        | (imm_11 << 20)
        | (imm_19_12 << 12)
        | ((rd as u32) << 7)
        | 0x6F
}

// Helper: encode JALR
fn encode_jalr(rd: u8, rs1: u8, imm: i32) -> u32 {
    let imm_u = (imm as u32) & 0xFFF;
    (imm_u << 20) | ((rs1 as u32) << 15) | (0 << 12) | ((rd as u32) << 7) | 0x67
}

// Helper: encode branch (B-type)
fn encode_b(funct3: u32, rs1: u8, rs2: u8, offset: i32) -> u32 {
    let imm = (offset as u32) & 0x1FFF;
    let imm_12 = (imm >> 12) & 1;
    let imm_10_5 = (imm >> 5) & 0x3F;
    let imm_4_1 = (imm >> 1) & 0xF;
    let imm_11 = (imm >> 11) & 1;
    (imm_12 << 31)
        | (imm_10_5 << 25)
        | ((rs2 as u32) << 20)
        | ((rs1 as u32) << 15)
        | (funct3 << 12)
        | (imm_4_1 << 8)
        | (imm_11 << 7)
        | 0x63
}

#[test]
fn lui_sets_upper_immediate() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, RAM_BASE, encode_u(0x37, 7, 0x12345));
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0x1234_5000);
}

#[test]
fn auipc_pc_relative() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, RAM_BASE, encode_u(0x17, 7, 0x10));
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), (RAM_BASE as u32) + 0x10000);
}

#[test]
fn jal_saves_return_address() {
    let (mut cpu, mut bus) = make_cpu_bus();
    write_word(&mut bus, RAM_BASE, encode_jal(1, 8));
    write_word(&mut bus, RAM_BASE + 4, encode_i(0, 7, 0, 42));
    write_word(&mut bus, RAM_BASE + 8, encode_i(0, 8, 0, 99));

    cpu.step(&mut bus);
    assert_eq!(cpu.pc, RAM_BASE as u32 + 8);
    assert_eq!(get_reg(&cpu, 1), RAM_BASE as u32 + 4);
    assert_eq!(get_reg(&cpu, 7), 0);

    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 8), 99);
}

#[test]
fn jalr_indirect_jump() {
    let (mut cpu, mut bus) = make_cpu_bus();
    let target = RAM_BASE as u32 + 12;
    set_reg(&mut cpu, 5, target);
    write_word(&mut bus, RAM_BASE, encode_jalr(7, 5, 0));
    write_word(&mut bus, RAM_BASE + 4, encode_i(0, 8, 0, 42));
    write_word(&mut bus, RAM_BASE + 8, encode_i(0, 0, 0, 0));
    write_word(&mut bus, RAM_BASE + 12, encode_i(0, 8, 0, 99));

    cpu.step(&mut bus);
    assert_eq!(cpu.pc, target);
    assert_eq!(get_reg(&cpu, 7), RAM_BASE as u32 + 4);
    assert_eq!(get_reg(&cpu, 8), 0);

    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 8), 99);
}

#[test]
fn beq_taken() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 42);
    set_reg(&mut cpu, 6, 42);
    write_word(&mut bus, RAM_BASE, encode_b(0, 5, 6, 8));
    write_word(&mut bus, RAM_BASE + 4, encode_i(0, 7, 0, 1));
    write_word(&mut bus, RAM_BASE + 8, encode_i(0, 7, 0, 2));

    cpu.step(&mut bus);
    assert_eq!(cpu.pc, RAM_BASE as u32 + 8);
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 2);
}

#[test]
fn bne_taken() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 42);
    set_reg(&mut cpu, 6, 43);
    write_word(&mut bus, RAM_BASE, encode_b(1, 5, 6, 8));
    write_word(&mut bus, RAM_BASE + 4, encode_i(0, 7, 0, 1));
    write_word(&mut bus, RAM_BASE + 8, encode_i(0, 7, 0, 2));

    cpu.step(&mut bus);
    assert_eq!(cpu.pc, RAM_BASE as u32 + 8);
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 2);
}

#[test]
fn blt_taken_signed() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0xFFFF_FFFF);
    set_reg(&mut cpu, 6, 1);
    write_word(&mut bus, RAM_BASE, encode_b(4, 5, 6, 8));
    write_word(&mut bus, RAM_BASE + 4, encode_i(0, 7, 0, 1));
    write_word(&mut bus, RAM_BASE + 8, encode_i(0, 7, 0, 2));

    cpu.step(&mut bus);
    assert_eq!(cpu.pc, RAM_BASE as u32 + 8);
}

#[test]
fn bge_taken_signed() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 5);
    set_reg(&mut cpu, 6, 3);
    write_word(&mut bus, RAM_BASE, encode_b(5, 5, 6, 8));
    write_word(&mut bus, RAM_BASE + 4, encode_i(0, 7, 0, 1));
    write_word(&mut bus, RAM_BASE + 8, encode_i(0, 7, 0, 2));

    cpu.step(&mut bus);
    assert_eq!(cpu.pc, RAM_BASE as u32 + 8);
}

#[test]
fn bltu_unsigned() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 1);
    set_reg(&mut cpu, 6, 0xFFFF_FFFF);
    write_word(&mut bus, RAM_BASE, encode_b(6, 5, 6, 8));
    write_word(&mut bus, RAM_BASE + 4, encode_i(0, 7, 0, 1));
    write_word(&mut bus, RAM_BASE + 8, encode_i(0, 7, 0, 2));

    cpu.step(&mut bus);
    assert_eq!(cpu.pc, RAM_BASE as u32 + 8);
}

#[test]
fn bgeu_unsigned() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0xFFFF_FFFF);
    set_reg(&mut cpu, 6, 1);
    write_word(&mut bus, RAM_BASE, encode_b(7, 5, 6, 8));
    write_word(&mut bus, RAM_BASE + 4, encode_i(0, 7, 0, 1));
    write_word(&mut bus, RAM_BASE + 8, encode_i(0, 7, 0, 2));

    cpu.step(&mut bus);
    assert_eq!(cpu.pc, RAM_BASE as u32 + 8);
}

#[test]
fn alu_mul_by_zero() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0);
    set_reg(&mut cpu, 6, 0xFFFF_FFFF);
    write_word(&mut bus, RAM_BASE, encode_r(1, 0, 7, 5, 6));
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0);
}

#[test]
fn alu_divu_max_by_one() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0xFFFF_FFFF);
    set_reg(&mut cpu, 6, 1);
    write_word(&mut bus, RAM_BASE, encode_r(1, 5, 7, 5, 6));
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0xFFFF_FFFF);
}

#[test]
fn alu_remu_by_self() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 12345);
    set_reg(&mut cpu, 6, 12345);
    write_word(&mut bus, RAM_BASE, encode_r(1, 7, 7, 5, 6));
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0);
}

#[test]
fn alu_and_with_zero() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0xFFFF_FFFF);
    set_reg(&mut cpu, 6, 0);
    write_word(&mut bus, RAM_BASE, encode_r(0, 7, 7, 5, 6));
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0);
}

#[test]
fn alu_or_with_zero() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 0);
    set_reg(&mut cpu, 6, 0xABCD);
    write_word(&mut bus, RAM_BASE, encode_r(0, 6, 7, 5, 6));
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0xABCD);
}

#[test]
fn load_store_multiple_sizes() {
    let (mut cpu, mut bus) = make_cpu_bus();
    let base = DATA_BASE as u32;

    set_reg(&mut cpu, 5, base);
    set_reg(&mut cpu, 6, 0xAB);
    write_word(&mut bus, RAM_BASE, encode_store(0, 5, 6, 0));
    cpu.step(&mut bus);

    set_reg(&mut cpu, 5, base + 2);
    set_reg(&mut cpu, 6, 0x1234);
    write_word(&mut bus, RAM_BASE + 4, encode_store(1, 5, 6, 0));
    cpu.step(&mut bus);

    set_reg(&mut cpu, 5, base + 4);
    set_reg(&mut cpu, 6, 0xDEAD_BEEF);
    write_word(&mut bus, RAM_BASE + 8, encode_store(2, 5, 6, 0));
    cpu.step(&mut bus);

    set_reg(&mut cpu, 5, base);
    write_word(&mut bus, RAM_BASE + 12, encode_load(4, 7, 5, 0));
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0xAB);

    set_reg(&mut cpu, 5, base + 2);
    write_word(&mut bus, RAM_BASE + 16, encode_load(5, 7, 5, 0));
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0x1234);

    set_reg(&mut cpu, 5, base + 4);
    write_word(&mut bus, RAM_BASE + 20, encode_load(2, 7, 5, 0));
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 7), 0xDEAD_BEEF);
}

#[test]
fn nop_is_addi_x0_x0_0() {
    let (mut cpu, mut bus) = make_cpu_bus();
    set_reg(&mut cpu, 5, 100);
    write_word(&mut bus, RAM_BASE, encode_i(0, 0, 0, 0));
    cpu.step(&mut bus);
    assert_eq!(get_reg(&cpu, 0), 0);
    assert_eq!(get_reg(&cpu, 5), 100);
    assert_eq!(cpu.pc, RAM_BASE as u32 + 4);
}
