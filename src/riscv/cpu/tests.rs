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
fn ecall_m_mode_traps_to_mvec() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Machine;
    // Set mtvec to a known trap handler address
    cpu.csr.mtvec = 0x8000_0100;
    write_word(&mut bus, RAM_BASE, 0x0000_0073); // ECALL

    let result = cpu.step(&mut bus);
    assert_eq!(result, StepResult::Ok);
    // ECALL should trap to mtvec
    assert_eq!(cpu.pc, 0x8000_0100);
    // mepc should be set to the ECALL address
    assert_eq!(cpu.csr.mepc, RAM_BASE as u32);
    // mcause should be ECALL_M (11)
    assert_eq!(cpu.csr.mcause, csr::CAUSE_ECALL_M);
    // Privilege stays Machine (M-mode ECALL traps to M-mode)
    assert_eq!(cpu.privilege, Privilege::Machine);
}

#[test]
fn ecall_s_mode_traps_to_stvec() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Supervisor;
    // Delegate ECALL_S to S-mode (medeleg bit 9)
    cpu.csr.medeleg = 1 << 9;
    // Set stvec to a known trap handler address
    cpu.csr.stvec = 0x8000_0200;
    write_word(&mut bus, RAM_BASE, 0x0000_0073); // ECALL

    let result = cpu.step(&mut bus);
    assert_eq!(result, StepResult::Ok);
    // ECALL should trap to stvec
    assert_eq!(cpu.pc, 0x8000_0200);
    // sepc should be set to the ECALL address
    assert_eq!(cpu.csr.sepc, RAM_BASE as u32);
    // scause should be ECALL_S (9)
    assert_eq!(cpu.csr.scause, csr::CAUSE_ECALL_S);
    // Privilege stays Supervisor (S-mode ECALL traps to S-mode)
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
fn ecall_preserves_registers_except_csrs() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Machine;
    cpu.csr.mtvec = 0x8000_0100;
    // Set some register values
    cpu.x[5] = 0xDEADBEEF;
    cpu.x[10] = 42;
    cpu.x[17] = 99; // a7 (syscall number)
    write_word(&mut bus, RAM_BASE, 0x0000_0073); // ECALL

    cpu.step(&mut bus);
    // GPRs should be preserved (ECALL doesn't modify them)
    assert_eq!(cpu.x[5], 0xDEADBEEF);
    assert_eq!(cpu.x[10], 42);
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
    cpu.privilege = Privilege::Machine;
    // ECALL at 0x80000000, trap handler at 0x80000100, return target at 0x80000004
    cpu.csr.mtvec = 0x8000_0100;

    // ECALL instruction
    write_word(&mut bus, RAM_BASE, 0x0000_0073);

    // At trap handler: MRET instruction
    write_word(&mut bus, 0x8000_0100, 0x3020_0073);

    // Step 1: ECALL traps to mtvec
    cpu.step(&mut bus);
    assert_eq!(cpu.pc, 0x8000_0100);
    assert_eq!(cpu.csr.mepc, RAM_BASE as u32);
    assert_eq!(cpu.csr.mcause, csr::CAUSE_ECALL_M);

    // Step 2: MRET returns to mepc (which should be PC after ECALL)
    // mepc was set to the ECALL address by trap_enter.
    // After MRET, pc = mepc.
    cpu.step(&mut bus);
    assert_eq!(cpu.pc, RAM_BASE as u32); // mepc = ECALL address
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
// SBI interception during ECALL
// ============================================================

#[test]
fn sbi_ecall_from_s_mode_returns_not_handled_for_unknown_eid() {
    let (mut cpu, mut bus) = make_cpu_bus();
    cpu.privilege = Privilege::Supervisor;
    // Delegate ECALL_S to S-mode (medeleg bit 9)
    cpu.csr.medeleg = 1 << 9;
    cpu.csr.stvec = 0x8000_0800;
    cpu.x[17] = 0xFFFF; // Unknown SBI extension
    cpu.x[16] = 0; // function 0
    cpu.x[10] = 0; // a0

    write_word(&mut bus, RAM_BASE, 0x0000_0073); // ECALL

    cpu.step(&mut bus);
    // Unknown SBI extension should trap to stvec
    assert_eq!(cpu.pc, 0x8000_0800);
    assert_eq!(cpu.csr.scause, csr::CAUSE_ECALL_S);
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
    assert_eq!(info.pc_after, 0x8000_0100);
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
