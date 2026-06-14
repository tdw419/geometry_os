//! RV64I CPU Executor
//!
//! Software executor implementing RV64IMAC + privileged mode (M/S/U)
//! for compliance testing and minimal Linux boot.

use std::collections::HashMap;
use crate::rv64::decode::{decode_rv64, Rv64Instruction};

const PAGE_SIZE: usize = 4096;
const PAGE_MASK: u64 = !(PAGE_SIZE as u64 - 1);

/// Sparse page-based memory. Only allocates 4KB pages on first write.
#[derive(Clone)]
pub struct SparseMemory {
    pages: HashMap<u64, Vec<u8>>,
}

impl SparseMemory {
    pub fn new() -> Self {
        Self { pages: HashMap::new() }
    }

    fn page(&mut self, addr: u64) -> &mut [u8] {
        let page_key = addr & PAGE_MASK;
        self.pages.entry(page_key).or_insert_with(|| vec![0u8; PAGE_SIZE])
    }

    fn page_ref(&self, addr: u64) -> Option<&[u8]> {
        let page_key = addr & PAGE_MASK;
        self.pages.get(&page_key).map(|p| p.as_slice())
    }

    pub fn read_byte(&self, addr: u64) -> u8 {
        let offset = (addr & 0xFFF) as usize;
        self.page_ref(addr).map_or(0, |p| p[offset])
    }

    pub fn write_byte(&mut self, addr: u64, val: u8) {
        let offset = (addr & 0xFFF) as usize;
        self.page(addr)[offset] = val;
    }

    pub fn read_bytes(&self, addr: u64, buf: &mut [u8]) {
        for (i, b) in buf.iter_mut().enumerate() {
            *b = self.read_byte(addr + i as u64);
        }
    }

    pub fn write_bytes(&mut self, addr: u64, data: &[u8]) {
        for (i, &b) in data.iter().enumerate() {
            self.write_byte(addr + i as u64, b);
        }
    }
}

/// RV64 CPU state
pub struct Rv64Cpu {
    /// General purpose registers x0-x31
    pub x: [u64; 32],
    /// Program counter
    pub pc: u64,
    /// Sparse memory (page-based, supports full 64-bit address space)
    pub mem: SparseMemory,
    /// Privilege level: 0=User, 1=Supervisor, 3=Machine
    pub priv_level: u8,
    /// Halted flag
    pub halted: bool,
    /// Instructions retired
    pub instret: u64,
    /// Cycle counter
    pub cycles: u64,

    // CSRs
    pub mstatus: u64,
    pub mtvec: u64,
    pub mepc: u64,
    pub mcause: u64,
    pub mtval: u64,
    pub mie: u64,
    pub mip: u64,
    pub sstatus: u64,
    pub stvec: u64,
    pub sepc: u64,
    pub scause: u64,
    pub stval: u64,
    pub satp: u64,
    pub sscratch: u64,
    pub mscratch: u64,

    // UART console output
    pub console: Vec<u8>,
}

// Keep `ram` as an alias for backward compatibility with tests that access cpu.ram
impl Rv64Cpu {
    pub fn new() -> Self {
        let mut cpu = Self {
            x: [0u64; 32],
            pc: 0,
            mem: SparseMemory::new(),
            priv_level: 3, // M-mode
            halted: false,
            instret: 0,
            cycles: 0,
            mstatus: 0,
            mtvec: 0,
            mepc: 0,
            mcause: 0,
            mtval: 0,
            mie: 0,
            mip: 0,
            sstatus: 0,
            stvec: 0,
            sepc: 0,
            scause: 0,
            stval: 0,
            satp: 0,
            sscratch: 0,
            mscratch: 0,
            console: Vec::new(),
        };
        // a0 = hartid (0), a1 = DTB address (0x02000000)
        cpu.x[10] = 0;
        cpu.x[11] = 0x0200_0000;
        cpu
    }

    /// Load a binary into memory at the given address
    pub fn load_binary(&mut self, offset: u64, data: &[u8]) {
        self.mem.write_bytes(offset, data);
    }

    /// Load a single 32-bit instruction word at virtual address
    pub fn load_word(&self, addr: u64) -> u32 {
        let pa = self.translate_addr(addr).unwrap_or(addr);
        let mut buf = [0u8; 4];
        self.mem.read_bytes(pa, &mut buf);
        u32::from_le_bytes(buf)
    }

    /// Store a 32-bit word at virtual address
    pub fn store_word(&mut self, addr: u64, val: u32) {
        let pa = self.translate_addr(addr).unwrap_or(addr);
        self.mem.write_bytes(pa, &val.to_le_bytes());
    }

    /// Load 64-bit from virtual address
    pub fn load_dword(&self, addr: u64) -> u64 {
        let pa = self.translate_addr(addr).unwrap_or(addr);
        let mut buf = [0u8; 8];
        self.mem.read_bytes(pa, &mut buf);
        u64::from_le_bytes(buf)
    }

    /// Store 64-bit to virtual address
    pub fn store_dword(&mut self, addr: u64, val: u64) {
        let pa = self.translate_addr(addr).unwrap_or(addr);
        self.mem.write_bytes(pa, &val.to_le_bytes());
    }

    /// Read register (x0 is always 0)
    #[inline]
    pub fn read_reg(&self, idx: u32) -> u64 {
        if idx == 0 { 0 } else { self.x[idx as usize] }
    }

    /// Write register (writes to x0 are discarded)
    #[inline]
    pub fn write_reg(&mut self, idx: u32, val: u64) {
        if idx != 0 {
            self.x[idx as usize] = val;
        }
    }

    /// Execute one instruction. Returns false if halted.
    pub fn step(&mut self) -> bool {
        if self.halted {
            return false;
        }

        // Fetch 32-bit word (may contain a 16-bit compressed instruction)
        let inst_word = self.load_word(self.pc);
        let inst = decode_rv64(inst_word);

        // Determine instruction length
        let inst_len = if inst.compressed { 2u64 } else { 4u64 };

        // Check for SYSTEM instructions (ECALL/EBREAK/MRET/SRET/WFI/CSR*)
        if inst.opcode == 0x73 {
            let funct12 = (inst.raw >> 20) & 0xFFF;
            // For compressed instructions, funct12 from raw won't be valid
            // but compressed instructions shouldn't decode to opcode 0x73
            if funct12 == 0x000 {
                // ECALL - handle based on privilege
                return self.handle_ecall();
            } else if funct12 == 0x001 {
                // EBREAK
                self.halted = true;
                return false;
            } else if funct12 == 0x302 {
                // MRET: return from M-mode trap
                return self.handle_mret();
            } else if funct12 == 0x102 {
                // SRET: return from S-mode trap
                return self.handle_sret();
            } else if funct12 == 0x105 {
                // WFI: wait for interrupt (nop for now)
                self.pc += inst_len;
                self.instret += 1;
                self.cycles += 1;
                return true;
            } else {
                // CSR instruction
                return self.execute_csr(&inst);
            }
        }

        self.execute_instruction_with_len(&inst, inst_len)
    }

    fn execute_instruction_with_len(&mut self, inst: &Rv64Instruction, inst_len: u64) -> bool {
        let next_pc = self.pc + inst_len;

        match inst.opcode {
            // LUI
            0x37 => {
                self.write_reg(inst.rd, inst.imm as u64);
                self.pc = next_pc;
            }
            // AUIPC
            0x17 => {
                self.write_reg(inst.rd, self.pc.wrapping_add(inst.imm as u64));
                self.pc = next_pc;
            }
            // JAL
            0x6F => {
                self.write_reg(inst.rd, next_pc);
                self.pc = (self.pc as i64).wrapping_add(inst.imm) as u64;
            }
            // JALR
            0x67 => {
                let target = (self.read_reg(inst.rs1) as i64).wrapping_add(inst.imm) & !1;
                self.write_reg(inst.rd, next_pc);
                self.pc = target as u64;
            }
            // Branch
            0x63 => {
                let taken = match inst.funct3 {
                    0x0 => self.read_reg(inst.rs1) == self.read_reg(inst.rs2),   // BEQ
                    0x1 => self.read_reg(inst.rs1) != self.read_reg(inst.rs2),   // BNE
                    0x4 => (self.read_reg(inst.rs1) as i64) < (self.read_reg(inst.rs2) as i64),  // BLT
                    0x5 => (self.read_reg(inst.rs1) as i64) >= (self.read_reg(inst.rs2) as i64), // BGE
                    0x6 => self.read_reg(inst.rs1) < self.read_reg(inst.rs2),    // BLTU
                    0x7 => self.read_reg(inst.rs1) >= self.read_reg(inst.rs2),   // BGEU
                    _ => false,
                };
                if taken {
                    self.pc = (self.pc as i64).wrapping_add(inst.imm) as u64;
                } else {
                    self.pc = next_pc;
                }
            }
            // LOAD
            0x03 => {
                let addr = self.read_reg(inst.rs1).wrapping_add(inst.imm as u64);
                let val = match inst.funct3 {
                    0x0 => self.load_byte(addr) as u64,                            // LB (sign-ext)
                    0x1 => sign_ext_16(self.load_hword(addr)) as u64,             // LH
                    0x2 => (self.load_word(addr) as i32) as i64 as u64,             // LW (sign-ext to 64)
                    0x3 => self.load_dword(addr),                                  // LD
                    0x4 => (self.load_byte(addr) as u8) as u64,                   // LBU
                    0x5 => self.load_hword(addr) as u64,                          // LHU
                    0x6 => { let w = self.load_word(addr); w as u64 },            // LWU
                    _ => 0,
                };
                self.write_reg(inst.rd, val);
                self.pc = next_pc;
            }
            // STORE
            0x23 => {
                let addr = self.read_reg(inst.rs1).wrapping_add(inst.imm as u64);
                let val = self.read_reg(inst.rs2);
                match inst.funct3 {
                    0x0 => self.store_byte(addr, val as u8),       // SB
                    0x1 => self.store_hword(addr, val as u16),     // SH
                    0x2 => self.store_word(addr, val as u32),      // SW
                    0x3 => self.store_dword(addr, val),            // SD
                    _ => {}
                }
                self.pc = next_pc;
            }
            // OP-IMM
            0x13 => {
                let src = self.read_reg(inst.rs1);
                let shamt = (inst.imm & 0x3F) as u32; // RV64 uses 6-bit shamt
                let result = match inst.funct3 {
                    0x0 => src.wrapping_add(inst.imm as u64),     // ADDI
                    0x1 => src << shamt,                           // SLLI
                    0x2 => { // SLTI
                        if (src as i64) < inst.imm { 1 } else { 0 }
                    },
                    0x3 => { // SLTIU
                        if src < (inst.imm as u64) { 1 } else { 0 }
                    },
                    0x4 => src ^ (inst.imm as u64),               // XORI
                    0x5 => { // SRLI / SRAI
                        if inst.funct7 & 0x20 != 0 {
                            // SRAI
                            ((src as i64) >> shamt) as u64
                        } else {
                            // SRLI
                            src >> shamt
                        }
                    },
                    0x6 => src | (inst.imm as u64),               // ORI
                    0x7 => src & (inst.imm as u64),               // ANDI
                    _ => 0,
                };
                self.write_reg(inst.rd, result);
                self.pc = next_pc;
            }
            // OP
            0x33 => {
                let a = self.read_reg(inst.rs1);
                let b = self.read_reg(inst.rs2);
                let result = match inst.funct3 {
                    0x0 => {
                        if inst.funct7 & 0x20 != 0 { a.wrapping_sub(b) } // SUB
                        else { a.wrapping_add(b) }                        // ADD
                    },
                    0x1 => a << (b & 0x3F),                        // SLL
                    0x2 => { if (a as i64) < (b as i64) { 1u64 } else { 0u64 } }, // SLT
                    0x3 => { if a < b { 1u64 } else { 0u64 } },   // SLTU
                    0x4 => a ^ b,                                    // XOR
                    0x5 => {
                        if inst.funct7 & 0x20 != 0 { ((a as i64) >> (b & 0x3F)) as u64 } // SRA
                        else { a >> (b & 0x3F) }                                           // SRL
                    },
                    0x6 => a | b,                                    // OR
                    0x7 => a & b,                                    // AND
                    _ => 0,
                };
                // M extension
                if inst.funct7 == 0x01 {
                    let result = match inst.funct3 {
                        0x0 => a.wrapping_mul(b),                   // MUL
                        0x1 => ((a as i128) * (b as i128)) as u64,  // MULH (signed * signed)
                        0x2 => ((a as i128) * (b as u128) as i128) as u64, // MULHSU
                        0x3 => (a as u128 * b as u128) as u64,     // MULHU
                        0x4 => { if b != 0 { (a as i64).wrapping_div(b as i64) as u64 } else { u64::MAX } }, // DIV
                        0x5 => { if b != 0 { a / b } else { u64::MAX } }, // DIVU
                        0x6 => { if b != 0 { (a as i64).wrapping_rem(b as i64) as u64 } else { a } }, // REM
                        0x7 => { if b != 0 { a % b } else { a } }, // REMU
                        _ => 0,
                    };
                    self.write_reg(inst.rd, result);
                } else {
                    self.write_reg(inst.rd, result);
                }
                self.pc = next_pc;
            }
            // OP-IMM-32 (W suffix)
            0x1B => {
                let src = (self.read_reg(inst.rs1) as u32) as u64; // truncate to 32 bits
                let shamt = (inst.imm & 0x1F) as u32;
                let result = match inst.funct3 {
                    0x0 => (src.wrapping_add(inst.imm as u64) as u32 as i32 as i64 as u64), // ADDIW (sign-ext)
                    0x1 => ((src as u32) << shamt) as i64 as u64,                     // SLLIW
                    0x5 => {
                        if inst.funct7 & 0x20 != 0 {
                            ((src as i32) >> shamt) as i64 as u64   // SRAIW
                        } else {
                            ((src as u32) >> shamt) as i64 as u64   // SRLIW
                        }
                    },
                    _ => 0,
                };
                self.write_reg(inst.rd, result);
                self.pc = next_pc;
            }
            // OP-32 (W suffix)
            0x3B => {
                let a = (self.read_reg(inst.rs1) as u32) as u64;
                let b = (self.read_reg(inst.rs2) as u32) as u64;
                let result = if inst.funct7 == 0x01 {
                    // MULW, DIVW, REMW
                    match inst.funct3 {
                        0x0 => ((a as u32).wrapping_mul(b as u32)) as i64 as u64, // MULW
                        0x4 => { if b != 0 { ((a as i32).wrapping_div(b as i32)) as i64 as u64 } else { u64::MAX } }, // DIVW
                        0x5 => { if b != 0 { ((a as u32) / (b as u32)) as u64 } else { u64::MAX } }, // DIVUW
                        0x6 => { if b != 0 { ((a as i32).wrapping_rem(b as i32)) as i64 as u64 } else { a } }, // REMW
                        0x7 => { if b != 0 { ((a as u32) % (b as u32)) as u64 } else { a } }, // REMUW
                        _ => 0,
                    }
                } else {
                    match inst.funct3 {
                        0x0 => {
                            if inst.funct7 & 0x20 != 0 {
                                (a.wrapping_sub(b) as u32) as i64 as u64  // SUBW
                            } else {
                                (a.wrapping_add(b) as u32) as i64 as u64  // ADDW
                            }
                        },
                        0x1 => ((a as u32) << (b & 0x1F)) as i64 as u64,  // SLLW
                        0x5 => {
                            if inst.funct7 & 0x20 != 0 {
                                ((a as i32) >> (b & 0x1F)) as i64 as u64  // SRAW
                            } else {
                                ((a as u32) >> (b & 0x1F)) as i64 as u64  // SRLW
                            }
                        },
                        _ => 0,
                    }
                };
                self.write_reg(inst.rd, result);
                self.pc = next_pc;
            }
            // MISC-MEM (FENCE)
            0x0F => {
                self.pc = next_pc;
            }
            // AMO
            0x2F => {
                self.pc = next_pc;
            }
            _ => {
                // Unknown opcode - halt
                self.halted = true;
                return false;
            }
        }

        self.instret += 1;
        self.cycles += 1;
        // x0 is hardwired to 0
        self.x[0] = 0;
        !self.halted
    }

    fn execute_csr(&mut self, inst: &Rv64Instruction) -> bool {
        let inst_len = if inst.compressed { 2u64 } else { 4u64 };
        let next_pc = self.pc + inst_len;
        let csr_addr = inst.imm as u16 as u32; // CSR is in the imm field (bits 31-20)
        // Re-extract CSR from raw instruction
        let csr = (inst.raw >> 20) & 0xFFF;

        let rs_val = self.read_reg(inst.rs1);
        let imm_val = (inst.rs1 as u64); // uimm for CSR*I
        let is_imm = inst.funct3 >= 4;

        let val = if is_imm { imm_val } else { rs_val };

        match inst.funct3 & 0x3 {
            // CSRRW
            0x1 => {
                let old = self.read_csr(csr);
                self.write_csr(csr, val);
                self.write_reg(inst.rd, old);
            }
            // CSRRS
            0x2 => {
                let old = self.read_csr(csr);
                if val != 0 || is_imm {
                    self.write_csr(csr, old | val);
                }
                self.write_reg(inst.rd, old);
            }
            // CSRRC
            0x3 => {
                let old = self.read_csr(csr);
                if val != 0 || is_imm {
                    self.write_csr(csr, old & !val);
                }
                self.write_reg(inst.rd, old);
            }
            _ => {}
        }

        self.pc = next_pc;
        self.instret += 1;
        self.cycles += 1;
        true
    }

    fn read_csr(&self, addr: u32) -> u64 {
        match addr {
            0x300 => self.mstatus,
            0x305 => self.mtvec,
            0x341 => self.mepc,
            0x342 => self.mcause,
            0x343 => self.mtval,
            0x304 => self.mie,
            0x344 => self.mip,
            0x100 => self.sstatus,
            0x105 => self.stvec,
            0x141 => self.sepc,
            0x142 => self.scause,
            0x143 => self.stval,
            0x180 => self.satp,
            0x140 => self.sscratch,
            0x340 => self.mscratch,
            0xC00 => self.cycles, // mcycle
            0xC02 => self.instret, // minstret
            0xF14 => 0, // mhartid
            _ => 0,
        }
    }

    fn write_csr(&mut self, addr: u32, val: u64) {
        match addr {
            0x300 => self.mstatus = val,
            0x305 => self.mtvec = val,
            0x341 => self.mepc = val,
            0x342 => self.mcause = val,
            0x343 => self.mtval = val,
            0x304 => self.mie = val,
            0x100 => self.sstatus = val,
            0x105 => self.stvec = val,
            0x141 => self.sepc = val,
            0x142 => self.scause = val,
            0x143 => self.stval = val,
            0x180 => self.satp = val,
            0x140 => self.sscratch = val,
            0x340 => self.mscratch = val,
            _ => {}
        }
    }

    fn handle_ecall(&mut self) -> bool {
        // SBI/ecall handling
        let syscall_num = self.x[17]; // a7
        match self.priv_level {
            3 => {
                // M-mode ecall: SBI proxy
                let result = self.handle_sbi(syscall_num);
                self.x[10] = result;
                self.pc += 4;
            }
            1 => {
                // S-mode ecall: handle as SBI call directly (OpenSBI model)
                // In a real system, this would trap to M-mode which handles SBI.
                // We model this by dispatching SBI directly from S-mode ecall.
                let result = self.handle_sbi(syscall_num);
                self.x[10] = result;
                self.pc += 4;
            }
            _ => {
                // Trap to higher privilege
                self.mepc = self.pc;
                self.mcause = 8; // ECALL from U-mode
                self.pc = self.mtvec;
                self.priv_level = 3;
            }
        }
        self.instret += 1;
        self.cycles += 1;
        true
    }

    fn handle_sbi(&mut self, num: u64) -> u64 {
        match num {
            0x01 => {
                // SBI console putchar (a0 = char)
                let ch = self.x[10] as u8;
                self.console.push(ch);
                0 // success
            }
            0x08 => {
                // SBI system reset (shutdown)
                self.halted = true;
                0
            }
            0x10 => {
                // SBI getchar
                0xFFFFFFFFFFFFFFFF // -1 = no char
            }
            _ => 0,
        }
    }

    fn handle_mret(&mut self) -> bool {
        // MRET: return from M-mode trap
        // Restore PC from mepc
        self.pc = self.mepc;
        // Update privilege level based on MPP bits in mstatus
        let mpp = (self.mstatus >> 11) & 0x3;
        self.priv_level = mpp as u8;
        // Clear MPP to U-mode
        self.mstatus &= !(0x3 << 11);
        self.mstatus |= 0x0 << 11; // MPP = U
        // Set MPIE = MIE
        let mie = (self.mstatus >> 3) & 1;
        self.mstatus = (self.mstatus & !(1 << 7)) | (mie << 7);
        // Set MIE = MPIE
        self.mstatus = (self.mstatus & !(1 << 3)) | (mie << 3);
        self.instret += 1;
        self.cycles += 1;
        true
    }

    fn handle_sret(&mut self) -> bool {
        // SRET: return from S-mode trap
        // Restore PC from sepc
        self.pc = self.sepc;
        // Update privilege level based on SPP bit in sstatus
        let spp = (self.sstatus >> 8) & 0x1;
        self.priv_level = spp as u8;
        // Clear SPP to U-mode
        self.sstatus &= !(1 << 8);
        // Set SPIE = SIE
        let sie = (self.sstatus >> 1) & 1;
        self.sstatus = (self.sstatus & !(1 << 5)) | (sie << 5);
        // Set SIE = SPIE
        self.sstatus = (self.sstatus & !(1 << 1)) | (sie << 1);
        self.instret += 1;
        self.cycles += 1;
        true
    }

    // ── Sv39 Virtual Memory ──────────────────────────────────────────
    // M-mode: bare (physical), no translation.
    // S/U-mode with satp.MODE=0: bare.
    // S/U-mode with satp.MODE=8: Sv39 3-level page table walk.

    /// Read 64-bit from physical memory (bypasses translation).
    /// Used by the page table walker itself.
    fn phys_read_u64(&self, pa: u64) -> u64 {
        let mut buf = [0u8; 8];
        self.mem.read_bytes(pa, &mut buf);
        u64::from_le_bytes(buf)
    }

    /// Translate virtual address to physical address.
    /// Returns None on page fault.
    fn translate_addr(&self, va: u64) -> Option<u64> {
        if self.priv_level == 3 {
            return Some(va); // M-mode: always bare
        }
        let mode = (self.satp >> 60) & 0xF;
        if mode == 0 {
            return Some(va); // bare mode
        }
        if mode == 8 {
            return self.sv39_translate(va);
        }
        Some(va) // unknown mode: passthrough
    }

    /// Sv39 3-level page table walk.
    /// VPN[2]=va[38:30], VPN[1]=va[29:21], VPN[0]=va[20:12], offset=va[11:0]
    /// PTE[53:10]=PPN(44 bits), PTE[0]=V, PTE[1]=R, PTE[2]=W, PTE[3]=X
    fn sv39_translate(&self, va: u64) -> Option<u64> {
        let vpn = [
            (va >> 12) & 0x1FF,
            (va >> 21) & 0x1FF,
            (va >> 30) & 0x1FF,
        ];
        let offset = va & 0xFFF;

        let root_ppn = self.satp & 0xFFF_FFFF_FFFF;
        let mut table_base = root_ppn << 12;

        // Walk levels 2, 1, 0
        for level in (0..3usize).rev() {
            let pte_addr = table_base + vpn[level] * 8;
            let pte = self.phys_read_u64(pte_addr);

            // Check valid
            if pte & 1 == 0 {
                return None;
            }

            let r = (pte >> 1) & 1;
            let x = (pte >> 3) & 1;

            if r == 0 && x == 0 {
                // Non-leaf: follow pointer to next level
                let ppn = (pte >> 10) & 0xFFF_FFFF_FFFF;
                table_base = ppn << 12;
                continue;
            }

            // Leaf PTE at this level
            let ppn = (pte >> 10) & 0xFFF_FFFF_FFFF;

            // Misaligned superpage: low PPN bits below this level must be 0
            let low_mask = (1u64 << (level * 9)) - 1;
            if ppn & low_mask != 0 {
                return None;
            }

            // Construct physical address.
            // Level 0 (4KB):    PA = PPN << 12 | offset
            // Level 1 (2MB):    PA = PPN << 12 | VPN[0] << 12 | offset
            // Level 2 (1GB):    PA = PPN << 12 | VPN[1] << 21 | VPN[0] << 12 | offset
            let pa = (ppn << 12)
                | if level >= 1 { vpn[0] << 12 } else { 0 }
                | if level >= 2 { vpn[1] << 21 } else { 0 }
                | offset;
            return Some(pa);
        }

        None
    }

    /// Load byte (sign-extended) from virtual address
    pub fn load_byte(&self, addr: u64) -> u64 {
        let pa = self.translate_addr(addr).unwrap_or(addr);
        self.mem.read_byte(pa) as u64
    }

    pub fn store_byte(&mut self, addr: u64, val: u8) {
        let pa = self.translate_addr(addr).unwrap_or(addr);
        self.mem.write_byte(pa, val);
        // UART at 0x10000000
        if pa == 0x1000_0000 {
            self.console.push(val);
        }
    }

    pub fn load_hword(&self, addr: u64) -> u64 {
        let pa = self.translate_addr(addr).unwrap_or(addr);
        let mut buf = [0u8; 2];
        self.mem.read_bytes(pa, &mut buf);
        u16::from_le_bytes(buf) as u64
    }

    pub fn store_hword(&mut self, addr: u64, val: u16) {
        let pa = self.translate_addr(addr).unwrap_or(addr);
        self.mem.write_bytes(pa, &val.to_le_bytes());
    }

    /// Run for N instructions or until halt
    pub fn run(&mut self, max_instructions: u64) -> u64 {
        let mut count = 0u64;
        while count < max_instructions && self.step() {
            count += 1;
        }
        count
    }

    /// Run until halt or max_instructions
    pub fn run_until_halt(&mut self, max_instructions: u64) -> bool {
        let count = self.run(max_instructions);
        self.halted && count < max_instructions
    }
}

fn sign_ext_16(val: u64) -> u64 {
    if val & 0x8000 != 0 {
        val | 0xFFFF_0000_0000_0000
    } else {
        val
    }
}
