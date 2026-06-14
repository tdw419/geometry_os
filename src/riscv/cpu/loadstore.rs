// riscv/cpu/loadstore.rs -- Load/Store instruction execution
//
// Handles all memory access operations: LB, LH, LW, LBU, LHU, SB, SH, SW.
// Each load translates VA→PA, reads from bus, and sign/zero-extends as needed.
// Each store translates VA→PA and writes to bus.

use super::super::bus::Bus;
use super::super::csr;
use super::super::decode::Operation;
use super::super::mmu::AccessType;
use super::{sign_extend_byte, sign_extend_half, RiscvCpu, StepResult};

impl RiscvCpu {
    /// Execute a load instruction (LB, LH, LW, LBU, LHU, FLD).
    pub(super) fn execute_load(
        &mut self,
        op: Operation,
        bus: &mut Bus,
        next_pc: u32,
    ) -> StepResult {
        match op {
            Operation::Lb { rd, rs1, imm } => {
                let va = self.ea(rs1, imm) as u32;
                let pa = match self.translate_va(va, AccessType::Load, bus) {
                    Ok(p) => p,
                    Err(e) => return e,
                };
                match bus.read_byte(pa) {
                    Ok(b) => {
                        self.set_reg(rd, sign_extend_byte(b) as u32);
                        self.pc = next_pc;
                        StepResult::Ok
                    },
                    Err(_) => {
                        self.deliver_trap(csr::CAUSE_LOAD_ACCESS, va);
                        StepResult::Ok
                    },
                }
            },
            Operation::Lh { rd, rs1, imm } => {
                let va = self.ea(rs1, imm) as u32;
                let pa = match self.translate_va(va, AccessType::Load, bus) {
                    Ok(p) => p,
                    Err(e) => return e,
                };
                match bus.read_half(pa) {
                    Ok(h) => {
                        self.set_reg(rd, sign_extend_half(h) as u32);
                        self.pc = next_pc;
                        StepResult::Ok
                    },
                    Err(_) => {
                        self.deliver_trap(csr::CAUSE_LOAD_ACCESS, va);
                        StepResult::Ok
                    },
                }
            },
            Operation::Lw { rd, rs1, imm } => {
                let va = self.ea(rs1, imm) as u32;
                let pa = match self.translate_va(va, AccessType::Load, bus) {
                    Ok(p) => p,
                    Err(e) => return e,
                };
                match bus.read_word(pa) {
                    Ok(w) => {
                        self.set_reg(rd, w);
                        self.pc = next_pc;
                        StepResult::Ok
                    },
                    Err(_) => {
                        eprintln!(
                            "[load-fail] lw va=0x{:08X} pa=0x{:08X} pc=0x{:08X} rd={:?} rs1={:?} imm={} priv={:?} satp=0x{:08X}",
                            va, pa, self.pc, rd, rs1, imm, self.privilege, self.csr.satp
                        );
                        self.deliver_trap(csr::CAUSE_LOAD_ACCESS, va);
                        StepResult::Ok
                    },
                }
            },
            Operation::Lbu { rd, rs1, imm } => {
                let va = self.ea(rs1, imm) as u32;
                let pa = match self.translate_va(va, AccessType::Load, bus) {
                    Ok(p) => p,
                    Err(e) => return e,
                };
                match bus.read_byte(pa) {
                    Ok(b) => {
                        self.set_reg(rd, b as u32);
                        self.pc = next_pc;
                        StepResult::Ok
                    },
                    Err(_) => {
                        self.deliver_trap(csr::CAUSE_LOAD_ACCESS, va);
                        StepResult::Ok
                    },
                }
            },
            Operation::Lhu { rd, rs1, imm } => {
                let va = self.ea(rs1, imm) as u32;
                let pa = match self.translate_va(va, AccessType::Load, bus) {
                    Ok(p) => p,
                    Err(e) => return e,
                };
                match bus.read_half(pa) {
                    Ok(h) => {
                        self.set_reg(rd, h as u32);
                        self.pc = next_pc;
                        StepResult::Ok
                    },
                    Err(_) => {
                        self.deliver_trap(csr::CAUSE_LOAD_ACCESS, va);
                        StepResult::Ok
                    },
                }
            },
            Operation::Fld { rd, rs1, imm } => {
                // FLD: load 64-bit double from memory into f register
                let va = self.ea(rs1, imm) as u32;
                let pa = match self.translate_va(va, AccessType::Load, bus) {
                    Ok(p) => p,
                    Err(e) => return e,
                };
                // Read low 32 bits
                let lo = match bus.read_word(pa) {
                    Ok(w) => w,
                    Err(_) => {
                        self.deliver_trap(csr::CAUSE_LOAD_ACCESS, va);
                        return StepResult::Ok;
                    },
                };
                // Read high 32 bits (next word, 8-byte aligned for double)
                let hi = match bus.read_word(pa.wrapping_add(4)) {
                    Ok(w) => w,
                    Err(_) => {
                        self.deliver_trap(csr::CAUSE_LOAD_ACCESS, va);
                        return StepResult::Ok;
                    },
                };
                self.f[rd as usize] = (hi as u64) << 32 | lo as u64;
                self.pc = next_pc;
                StepResult::Ok
            },
            _ => unreachable!("execute_load called with non-load op"),
        }
    }

    /// Execute a store instruction (SB, SH, SW, FSD).
    pub(super) fn execute_store(
        &mut self,
        op: Operation,
        bus: &mut Bus,
        next_pc: u32,
    ) -> StepResult {
        match op {
            Operation::Sb { rs1, rs2, imm } => {
                let va = self.ea(rs1, imm) as u32;
                let pa = match self.translate_va(va, AccessType::Store, bus) {
                    Ok(p) => p,
                    Err(e) => return e,
                };
                let val = self.get_reg(rs2);
                match bus.write_byte(pa, val as u8) {
                    Ok(()) => {
                        self.pc = next_pc;
                        StepResult::Ok
                    },
                    Err(_) => {
                        self.deliver_trap(csr::CAUSE_STORE_ACCESS, va);
                        StepResult::Ok
                    },
                }
            },
            Operation::Sh { rs1, rs2, imm } => {
                let va = self.ea(rs1, imm) as u32;
                let pa = match self.translate_va(va, AccessType::Store, bus) {
                    Ok(p) => p,
                    Err(e) => return e,
                };
                let val = self.get_reg(rs2);
                match bus.write_half(pa, val as u16) {
                    Ok(()) => {
                        self.pc = next_pc;
                        StepResult::Ok
                    },
                    Err(_) => {
                        self.deliver_trap(csr::CAUSE_STORE_ACCESS, va);
                        StepResult::Ok
                    },
                }
            },
            Operation::Sw { rs1, rs2, imm } => {
                let va = self.ea(rs1, imm) as u32;
                let pa = match self.translate_va(va, AccessType::Store, bus) {
                    Ok(p) => p,
                    Err(e) => return e,
                };
                let val = self.get_reg(rs2);
                match bus.write_word(pa, val) {
                    Ok(()) => {
                        self.pc = next_pc;
                        StepResult::Ok
                    },
                    Err(_) => {
                        eprintln!("[store-fail] sw va=0x{:08X} pa=0x{:08X} val=0x{:08X} pc=0x{:08X} ram_size=0x{:X}",
                            va, pa, val, self.pc, bus.mem.size());
                        self.deliver_trap(csr::CAUSE_STORE_ACCESS, va);
                        StepResult::Ok
                    },
                }
            },
            Operation::Fsd { rs1, rs2, imm } => {
                // FSD: store 64-bit double from f register to memory
                let va = self.ea(rs1, imm) as u32;
                let pa = match self.translate_va(va, AccessType::Store, bus) {
                    Ok(p) => p,
                    Err(e) => return e,
                };
                let val = self.f[rs2 as usize];
                // Write low 32 bits, then high 32 bits
                let lo = val as u32;
                let hi = (val >> 32) as u32;
                match bus.write_word(pa, lo) {
                    Ok(()) => {},
                    Err(_) => {
                        self.deliver_trap(csr::CAUSE_STORE_ACCESS, va);
                        return StepResult::Ok;
                    },
                };
                match bus.write_word(pa.wrapping_add(4), hi) {
                    Ok(()) => {
                        self.pc = next_pc;
                        StepResult::Ok
                    },
                    Err(_) => {
                        self.deliver_trap(csr::CAUSE_STORE_ACCESS, va);
                        StepResult::Ok
                    },
                }
            },
            _ => unreachable!("execute_store called with non-store op"),
        }
    }
}
