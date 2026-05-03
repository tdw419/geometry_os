// riscv_fuzzer.rs -- Oracle-based fuzzer for the RISC-V interpreter
//
// Generates random RV32IM + C-extension programs, runs them through
// RiscvVm, and compares results against a pure-Rust reference oracle.
// Any divergence is printed and the process exits non-zero.
//
// Phase 203: Extended coverage for compressed instructions and CSR ops.
//
// Memory layout (all within 64K RAM at RAM_BASE = 0x8000_0000):
//   0x0000..0x7FFF  CODE region  (max 8192 instructions)
//   0x8000..0xFFFF  DATA region  (x9 = RAM_BASE + 0x8000, shadow oracle)

use std::collections::HashMap;
use geometry_os::riscv::{self, cpu};

const RAM_BASE: u64 = 0x8000_0000;
const RAM_SIZE: usize = 65536;
const DATA_OFF: u64 = 0x8000; // data region starts here (relative to RAM_BASE)
const DATA_SIZE: usize = 0x8000; // 32K data region
                                 // x9 is the dedicated data-base register (never overwritten by random ops)
const BASE_REG: u8 = 9;
// Data region slot counts
const WORD_SLOTS: u32 = 64; // word-aligned slots  (offsets 0,4,8,...,252)
const HALF_SLOTS: u32 = 128; // half-aligned slots  (offsets 0,2,4,...,254)
// Byte slots for halfword/byte loads/stores
const BYTE_SLOTS: u32 = 256; // byte slots          (offsets 0..255)
// SP-relative slots (top of data region, avoid overlap with x9-based slots)
const SP_SLOTS: u32 = 16; // word slots at end of data region (offsets 0..60)

// CSR addresses safe for fuzzing (pure read/write, no side effects or traps)
// Excludes: SATP (MMU flush), MTVEC/STVEC (trap vector changes), MISA (read-only),
//           SIE/SIP (masked views of MIE/MIP -- redundant), TIME/TIMEH (read-only)
const FUZZ_CSRS: &[u16] = &[
    0x300, // MSTATUS  - machine status register
    0x340, // MSCRATCH - machine scratch register
    0x341, // MEPC     - machine exception program counter
    0x342, // MCAUSE   - machine trap cause
    0x343, // MTVAL    - machine trap value
    0x302, // MEDELEG  - machine exception delegation
    0x303, // MIDELEG  - machine interrupt delegation
    0x304, // MIE      - machine interrupt enable
    0x344, // MIP      - machine interrupt pending
    0x100, // SSTATUS  - supervisor status (masked view of MSTATUS)
    0x140, // SSCRATCH - supervisor scratch register
    0x141, // SEPC     - supervisor exception program counter
    0x142, // SCAUSE   - supervisor trap cause
    0x143, // STVAL    - supervisor trap value
];

// ─── LCG RNG ───────────────────────────────────────────────────────────────

struct Rng(u64);

impl Rng {
    fn new(seed: u64) -> Self {
        Self(seed ^ 0xDEAD_BEEF_CAFE_1234)
    }
    fn next(&mut self) -> u64 {
        self.0 = self
            .0
            .wrapping_mul(6364136223846793005)
            .wrapping_add(1442695040888963407);
        self.0
    }
    fn u32(&mut self) -> u32 {
        self.next() as u32
    }
    fn range(&mut self, n: u64) -> u64 {
        self.next() % n
    }
}

// ─── Instruction encoders (32-bit) ────────────────────────────────────────

fn enc_r(funct7: u32, rs2: u8, rs1: u8, funct3: u32, rd: u8, opcode: u32) -> u32 {
    (funct7 << 25)
        | ((rs2 as u32) << 20)
        | ((rs1 as u32) << 15)
        | (funct3 << 12)
        | ((rd as u32) << 7)
        | opcode
}

fn enc_i(imm12: i32, rs1: u8, funct3: u32, rd: u8, opcode: u32) -> u32 {
    let imm = (imm12 as u32) & 0xFFF;
    (imm << 20) | ((rs1 as u32) << 15) | (funct3 << 12) | ((rd as u32) << 7) | opcode
}

// S-type: SW, SH, SB
fn enc_s(imm12: i32, rs2: u8, rs1: u8, funct3: u32) -> u32 {
    let imm = (imm12 as u32) & 0xFFF;
    let imm_11_5 = imm >> 5;
    let imm_4_0 = imm & 0x1F;
    (imm_11_5 << 25)
        | ((rs2 as u32) << 20)
        | ((rs1 as u32) << 15)
        | (funct3 << 12)
        | (imm_4_0 << 7)
        | 0x23
}

fn enc_lui(rd: u8, imm: u32) -> u32 {
    (imm & 0xFFFF_F000) | ((rd as u32) << 7) | 0x37
}

fn enc_addi(rd: u8, rs1: u8, imm: i32) -> u32 {
    enc_i(imm, rs1, 0x0, rd, 0x13)
}

fn enc_ebreak() -> u32 {
    0x00100073
}

// CSR encoders (SYSTEM opcode 0x73)
fn enc_csrrw(rd: u8, rs1: u8, csr: u16) -> u32 {
    ((csr as u32) << 20) | ((rs1 as u32) << 15) | (0b001 << 12) | ((rd as u32) << 7) | 0x73
}
fn enc_csrrs(rd: u8, rs1: u8, csr: u16) -> u32 {
    ((csr as u32) << 20) | ((rs1 as u32) << 15) | (0b010 << 12) | ((rd as u32) << 7) | 0x73
}
fn enc_csrrc(rd: u8, rs1: u8, csr: u16) -> u32 {
    ((csr as u32) << 20) | ((rs1 as u32) << 15) | (0b011 << 12) | ((rd as u32) << 7) | 0x73
}
fn enc_csrrci(rd: u8, uimm: u8, csr: u16) -> u32 {
    ((csr as u32) << 20) | ((uimm as u32) << 15) | (0b111 << 12) | ((rd as u32) << 7) | 0x73
}
fn enc_csrrsi(rd: u8, uimm: u8, csr: u16) -> u32 {
    ((csr as u32) << 20) | ((uimm as u32) << 15) | (0b110 << 12) | ((rd as u32) << 7) | 0x73
}

// ─── Compressed instruction encoders (16-bit) ─────────────────────────────
// All produce u16 halfwords. On little-endian, stored as low 16 bits of a u32 word.
// Compressed instructions have bits[1:0] != 0b11.

/// C.ADDI: rd = rd + imm (also C.NOP when rd=0, imm=0)
fn enc_c_addi(rd: u8, imm: i32) -> u16 {
    // bits[1:0]=01, funct3=000, rd=bits[11:7], imm=bits[12|5:2] sign-extended 6-bit
    let imm6 = (imm as u16) & 0x3F; // low 6 bits
    (0b000 << 13) | (((imm6 >> 5) & 1) << 12) | ((rd as u16) << 7) | ((imm6 & 0x1F) << 2) | 0b01
}

/// C.LI: rd = imm (rd can be any register)
fn enc_c_li(rd: u8, imm: i32) -> u16 {
    // bits[1:0]=01, funct3=010, rd=bits[11:7], imm=bits[12|5:2] sign-extended 6-bit
    let imm6 = (imm as u16) & 0x3F;
    (0b010 << 13) | (((imm6 >> 5) & 1) << 12) | ((rd as u16) << 7) | ((imm6 & 0x1F) << 2) | 0b01
}

/// C.LUI: rd = nzimm (nzimm must be non-zero, sign-extended from bit 17)
fn enc_c_lui(rd: u8, nzimm: u32) -> u16 {
    // bits[1:0]=01, funct3=011, rd=bits[11:7], nzimm=bits[17|16:12]
    let lo5 = ((nzimm >> 12) & 0x1F) as u16;
    let hi1 = ((nzimm >> 17) & 1) as u16;
    (0b011 << 13) | (hi1 << 12) | ((rd as u16) << 7) | (lo5 << 2) | 0b01
}

/// C.MV: rd = rs2 (bits01=10, funct3=100, bit12=0, rs2!=0)
fn enc_c_mv(rd: u8, rs2: u8) -> u16 {
    (0b100 << 13) | (0 << 12) | ((rd as u16) << 7) | ((rs2 as u16) << 2) | 0b10
}

/// C.ADD: rd = rd + rs2 (bits01=10, funct3=100, bit12=1, rd!=0, rs2!=0)
fn enc_c_add(rd: u8, rs2: u8) -> u16 {
    (0b100 << 13) | (1 << 12) | ((rd as u16) << 7) | ((rs2 as u16) << 2) | 0b10
}

/// C.SRLI: rd' = rd' >> shamt (bits01=01, funct3=100, func=00, rd' = bits[9:7])
fn enc_c_srli(rd_p: u8, shamt: u32) -> u16 {
    ((0b100u16) << 13) | (((shamt as u16 >> 5) & 1) << 12) | (((shamt as u16) & 0x1F) << 2) | ((rd_p as u16) << 7) | 0b01
}

/// C.SRAI: rd' = rd' >> shamt (arithmetic, bits01=01, funct3=100, func=01)
fn enc_c_srai(rd_p: u8, shamt: u32) -> u16 {
    ((0b100u16) << 13) | (((shamt as u16 >> 5) & 1) << 12) | (((shamt as u16) & 0x1F) << 2) | ((rd_p as u16) << 7) | 0b01
}

/// C.ANDI: rd' = rd' & imm (bits01=01, funct3=100, func=10)
fn enc_c_andi(rd_p: u8, imm: i32) -> u16 {
    let imm6 = (imm as u16) & 0x3F;
    (0b100 << 13) | (((imm6 >> 5) & 1) << 12) | ((imm6 & 0x1F) << 2) | ((rd_p as u16) << 7) | 0b01
}

/// C.SUB: rd' = rd' - rs2' (bits01=01, funct3=100, func=11, bit12=0, sub_op=00)
fn enc_c_sub(rd_p: u8, rs2_p: u8) -> u16 {
    (0b100 << 13) | (0 << 12) | (0b00 << 5) | ((rs2_p as u16) << 2) | ((rd_p as u16) << 7) | 0b01
}

/// C.XOR: rd' = rd' ^ rs2' (func=11, bit12=0, sub_op=01)
fn enc_c_xor(rd_p: u8, rs2_p: u8) -> u16 {
    (0b01 << 14) | (0b100 << 10) | (0b11 << 10) | (0 << 12) | (0b01 << 5) | ((rs2_p as u16) << 2) | ((rd_p as u16) << 7) | 0b01
}

/// C.OR: rd' = rd' | rs2' (func=11, bit12=0, sub_op=10)
fn enc_c_or(rd_p: u8, rs2_p: u8) -> u16 {
    (0b01 << 14) | (0b100 << 10) | (0b11 << 10) | (0 << 12) | (0b10 << 5) | ((rs2_p as u16) << 2) | ((rd_p as u16) << 7) | 0b01
}

/// C.AND: rd' = rd' & rs2' (func=11, bit12=0, sub_op=11)
fn enc_c_and(rd_p: u8, rs2_p: u8) -> u16 {
    (0b01 << 14) | (0b100 << 10) | (0b11 << 10) | (0 << 12) | (0b11 << 5) | ((rs2_p as u16) << 2) | ((rd_p as u16) << 7) | 0b01
}

/// C.SLLI: rd = rd << shamt (bits01=10, funct3=000)
fn enc_c_slli(rd: u8, shamt: u32) -> u16 {
    ((0b000u16) << 13) | (((shamt as u16 >> 5) & 1) << 12) | (((shamt as u16) & 0x1F) << 2) | ((rd as u16) << 7) | 0b10
}

/// C.LW: load word from rs1' + offset (bits01=00, funct3=010)
fn enc_c_lw(rd_p: u8, rs1_p: u8, offset: u32) -> u16 {
    // offset must be word-aligned (multiple of 4), range 0-124
    // bits[5]=off[6], bits[12]=off[5], bits[11:10]=off[4:3], bits[6]=off[2]
    ((0b00u16) << 14) | ((0b010u16) << 13) | (((offset as u16 >> 5) & 1) << 12) | (((offset as u16 >> 3) & 0x3) << 10) | ((rs1_p as u16) << 7) | (((offset as u16 >> 6) & 1) << 5) | (((offset as u16 >> 2) & 1) << 6) | ((rd_p as u16) << 2) | 0b00
}

/// C.SW: store word to rs1' + offset (bits01=00, funct3=110)
fn enc_c_sw(rs2_p: u8, rs1_p: u8, offset: u32) -> u16 {
    // Same offset encoding as C.LW
    ((0b00u16) << 14) | ((0b110u16) << 13) | (((offset as u16 >> 5) & 1) << 12) | (((offset as u16 >> 3) & 0x3) << 10) | ((rs1_p as u16) << 7) | (((offset as u16 >> 6) & 1) << 5) | (((offset as u16 >> 2) & 1) << 6) | ((rs2_p as u16) << 2) | 0b00
}

/// C.LWSP: load word from SP + offset (bits01=10, funct3=010)
fn enc_c_lwsp(rd: u8, offset: u32) -> u16 {
    // offset word-aligned, range 0-252
    // bits[3]=off[7], bits[2]=off[6], bits[12]=off[5], bits[6:4]=off[4:2]
    ((0b010u16) << 13) | (((offset as u16 >> 5) & 1) << 12) | ((rd as u16) << 7) | (((offset as u16 >> 4) & 0x7) << 4) | (((offset as u16 >> 6) & 1) << 2) | (((offset as u16 >> 7) & 1) << 6) | 0b10
}

/// C.SWSP: store word to SP + offset (bits01=10, funct3=110)
fn enc_c_swsp(rs2: u8, offset: u32) -> u16 {
    // bits[8:7]=off[7:6], bits[12]=off[5], bits[11:9]=off[4:2]
    ((0b110u16) << 13) | (((offset as u16 >> 5) & 1) << 12) | (((offset as u16 >> 2) & 0x7) << 9) | (((offset as u16 >> 6) & 0x3) << 7) | ((rs2 as u16) << 2) | 0b10
}

// Load 32-bit constant into rd using LUI + ADDI, handling sign-extension.
fn load_const(rd: u8, value: u32, out: &mut Vec<u16>) {
    let lo12 = ((value as i32) << 20) >> 20; // sign-extend lower 12 bits
    let hi20 = value.wrapping_sub(lo12 as u32) & 0xFFFF_F000;
    if hi20 != 0 {
        let w = enc_lui(rd, hi20);
        // Push as two halfwords (little-endian)
        out.push((w & 0xFFFF) as u16);
        out.push(((w >> 16) & 0xFFFF) as u16);
        if lo12 != 0 {
            let w = enc_addi(rd, rd, lo12);
            out.push((w & 0xFFFF) as u16);
            out.push(((w >> 16) & 0xFFFF) as u16);
        }
    } else {
        let w = enc_addi(rd, 0, lo12);
        out.push((w & 0xFFFF) as u16);
        out.push(((w >> 16) & 0xFFFF) as u16);
    }
}

/// Push a 32-bit instruction as two halfwords (little-endian)
fn push32(out: &mut Vec<u16>, word: u32) {
    out.push((word & 0xFFFF) as u16);
    out.push(((word >> 16) & 0xFFFF) as u16);
}

/// Push a 16-bit compressed instruction as one halfword
fn push16(out: &mut Vec<u16>, half: u16) {
    out.push(half);
}

// ─── Oracle ────────────────────────────────────────────────────────────────

struct Oracle {
    x: [u32; 32],
    mem: [u8; DATA_SIZE], // shadow of data region
    csrs: HashMap<u32, u32>, // shadow of scratch CSR values
}

impl Oracle {
    fn new() -> Self {
        Self {
            x: [0u32; 32],
            mem: [0u8; DATA_SIZE],
            csrs: HashMap::new(),
        }
    }

    fn set(&mut self, rd: u8, val: u32) {
        if rd != 0 {
            self.x[rd as usize] = val;
        }
    }

    fn r(&self, rs: u8) -> u32 {
        self.x[rs as usize]
    }

    // Data-region memory access helpers
    fn mem_write_word(&mut self, off: usize, val: u32) {
        let b = val.to_le_bytes();
        self.mem[off..off + 4].copy_from_slice(&b);
    }
    fn mem_read_word(&self, off: usize) -> u32 {
        let bytes: [u8; 4] = self.mem[off..off + 4].try_into().unwrap_or([0; 4]);
        u32::from_le_bytes(bytes)
    }
    fn mem_write_half(&mut self, off: usize, val: u16) {
        let b = val.to_le_bytes();
        self.mem[off..off + 2].copy_from_slice(&b);
    }
    fn mem_read_half(&self, off: usize) -> u16 {
        let bytes: [u8; 2] = self.mem[off..off + 2].try_into().unwrap_or([0; 2]);
        u16::from_le_bytes(bytes)
    }
    fn mem_write_byte(&mut self, off: usize, val: u8) {
        self.mem[off] = val;
    }
    fn mem_read_byte(&self, off: usize) -> u8 {
        self.mem[off]
    }

    // SSTATUS visible bits (must match cpu/csr/constants.rs SSTATUS_MASK)
    const SSTATUS_MASK: u32 = (1 << 1) | (1 << 5) | (1 << 8) | (1 << 18) | (1 << 19);
    const MSTATUS_ADDR: u32 = 0x300;
    const SSTATUS_ADDR: u32 = 0x100;

    // CSR helpers -- mirror the CPU's read/write masking behavior
    fn csr_read(&self, addr: u32) -> u32 {
        match addr {
            Self::SSTATUS_ADDR => {
                // SSTATUS is a masked view of MSTATUS
                self.csrs.get(&Self::MSTATUS_ADDR).unwrap_or(&0) & Self::SSTATUS_MASK
            }
            0x301 => {
                // MISA: read-only, returns RV32I value
                0x4000_0100
            }
            _ => *self.csrs.get(&addr).unwrap_or(&0),
        }
    }
    fn csr_write(&mut self, addr: u32, val: u32) {
        match addr {
            Self::MSTATUS_ADDR => {
                // MSTATUS write: store full value (may affect SSTATUS view)
                self.csrs.insert(addr, val);
            }
            Self::SSTATUS_ADDR => {
                // SSTATUS write: only modify SSTATUS_MASK bits in MSTATUS
                let old = self.csrs.get(&Self::MSTATUS_ADDR).unwrap_or(&0);
                let new = (*old & !Self::SSTATUS_MASK) | (val & Self::SSTATUS_MASK);
                self.csrs.insert(Self::MSTATUS_ADDR, new);
            }
            0x341 | 0x141 => {
                // MEPC/SEPC: clear low bit (instruction alignment)
                self.csrs.insert(addr, val & !1);
            }
            0x301 => {
                // MISA: read-only, ignore writes
            }
            _ => {
                self.csrs.insert(addr, val);
            }
        }
    }

    fn apply(&mut self, op: &OracleOp) {
        match *op {
            // ── ALU R-type ──
            OracleOp::Add { rd, rs1, rs2 } => {
                let v = self.r(rs1).wrapping_add(self.r(rs2));
                self.set(rd, v);
            }
            OracleOp::Sub { rd, rs1, rs2 } => {
                let v = self.r(rs1).wrapping_sub(self.r(rs2));
                self.set(rd, v);
            }
            OracleOp::And { rd, rs1, rs2 } => {
                let v = self.r(rs1) & self.r(rs2);
                self.set(rd, v);
            }
            OracleOp::Or { rd, rs1, rs2 } => {
                let v = self.r(rs1) | self.r(rs2);
                self.set(rd, v);
            }
            OracleOp::Xor { rd, rs1, rs2 } => {
                let v = self.r(rs1) ^ self.r(rs2);
                self.set(rd, v);
            }
            OracleOp::Sll { rd, rs1, rs2 } => {
                let v = self.r(rs1) << (self.r(rs2) & 0x1F);
                self.set(rd, v);
            }
            OracleOp::Srl { rd, rs1, rs2 } => {
                let v = self.r(rs1) >> (self.r(rs2) & 0x1F);
                self.set(rd, v);
            }
            OracleOp::Sra { rd, rs1, rs2 } => {
                let v = ((self.r(rs1) as i32) >> (self.r(rs2) & 0x1F)) as u32;
                self.set(rd, v);
            }
            OracleOp::Slt { rd, rs1, rs2 } => {
                let v = ((self.r(rs1) as i32) < (self.r(rs2) as i32)) as u32;
                self.set(rd, v);
            }
            OracleOp::Sltu { rd, rs1, rs2 } => {
                let v = (self.r(rs1) < self.r(rs2)) as u32;
                self.set(rd, v);
            }
            // ── M extension ──
            OracleOp::Mul { rd, rs1, rs2 } => {
                let v = self.r(rs1).wrapping_mul(self.r(rs2));
                self.set(rd, v);
            }
            OracleOp::Mulh { rd, rs1, rs2 } => {
                let v = (((self.r(rs1) as i32 as i64) * (self.r(rs2) as i32 as i64)) >> 32) as u32;
                self.set(rd, v);
            }
            OracleOp::Mulhu { rd, rs1, rs2 } => {
                let v = (((self.r(rs1) as u64) * (self.r(rs2) as u64)) >> 32) as u32;
                self.set(rd, v);
            }
            OracleOp::Mulhsu { rd, rs1, rs2 } => {
                let a = self.r(rs1) as i32 as i64 as u64;
                let b = self.r(rs2) as u64;
                let v = ((a.wrapping_mul(b)) >> 32) as u32;
                self.set(rd, v);
            }
            OracleOp::Div { rd, rs1, rs2 } => {
                let (a, b) = (self.r(rs1) as i32, self.r(rs2) as i32);
                let v = if b == 0 {
                    u32::MAX
                } else if a == i32::MIN && b == -1 {
                    i32::MIN as u32
                } else {
                    a.wrapping_div(b) as u32
                };
                self.set(rd, v);
            }
            OracleOp::Divu { rd, rs1, rs2 } => {
                let b = self.r(rs2);
                let v = if b == 0 { u32::MAX } else { self.r(rs1) / b };
                self.set(rd, v);
            }
            OracleOp::Rem { rd, rs1, rs2 } => {
                let (a, b) = (self.r(rs1) as i32, self.r(rs2) as i32);
                let v = if b == 0 {
                    a as u32
                } else if a == i32::MIN && b == -1 {
                    0
                } else {
                    a.wrapping_rem(b) as u32
                };
                self.set(rd, v);
            }
            OracleOp::Remu { rd, rs1, rs2 } => {
                let b = self.r(rs2);
                let v = if b == 0 { self.r(rs1) } else { self.r(rs1) % b };
                self.set(rd, v);
            }
            // ── Load/store (offsets relative to data base) ──
            OracleOp::Sw { rs2, off } => {
                let v = self.r(rs2);
                self.mem_write_word(off, v);
            }
            OracleOp::Sh { rs2, off } => {
                let v = self.r(rs2) as u16;
                self.mem_write_half(off, v);
            }
            OracleOp::Sb { rs2, off } => {
                let v = self.r(rs2) as u8;
                self.mem_write_byte(off, v);
            }
            OracleOp::Lw { rd, off } => {
                let v = self.mem_read_word(off);
                self.set(rd, v);
            }
            OracleOp::Lh { rd, off } => {
                let v = self.mem_read_half(off) as i16 as u32;
                self.set(rd, v);
            }
            OracleOp::Lhu { rd, off } => {
                let v = self.mem_read_half(off) as u32;
                self.set(rd, v);
            }
            OracleOp::Lb { rd, off } => {
                let v = self.mem_read_byte(off) as i8 as u32;
                self.set(rd, v);
            }
            OracleOp::Lbu { rd, off } => {
                let v = self.mem_read_byte(off) as u32;
                self.set(rd, v);
            }
            // ── I-type immediate ALU ──
            OracleOp::Addi { rd, rs1, imm } => {
                let v = self.r(rs1).wrapping_add(imm as u32);
                self.set(rd, v);
            }
            OracleOp::Slti { rd, rs1, imm } => {
                let v = ((self.r(rs1) as i32) < imm) as u32;
                self.set(rd, v);
            }
            OracleOp::Sltiu { rd, rs1, imm } => {
                let v = (self.r(rs1) < imm as u32) as u32;
                self.set(rd, v);
            }
            OracleOp::Xori { rd, rs1, imm } => {
                let v = self.r(rs1) ^ (imm as u32);
                self.set(rd, v);
            }
            OracleOp::Ori { rd, rs1, imm } => {
                let v = self.r(rs1) | (imm as u32);
                self.set(rd, v);
            }
            OracleOp::Andi { rd, rs1, imm } => {
                let v = self.r(rs1) & (imm as u32);
                self.set(rd, v);
            }
            OracleOp::Slli { rd, rs1, shamt } => {
                let v = self.r(rs1) << shamt;
                self.set(rd, v);
            }
            OracleOp::Srli { rd, rs1, shamt } => {
                let v = self.r(rs1) >> shamt;
                self.set(rd, v);
            }
            OracleOp::Srai { rd, rs1, shamt } => {
                let v = ((self.r(rs1) as i32) >> shamt) as u32;
                self.set(rd, v);
            }
            // ── Upper-immediate PC-relative ──
            OracleOp::Auipc { rd, pc, imm } => {
                let v = pc.wrapping_add(imm);
                self.set(rd, v);
            }
            // ── Init ──
            OracleOp::LoadConst { rd, value } => {
                self.set(rd, value);
            }
            // ── CSR operations ──
            OracleOp::Csrrw { rd, rs1, csr } => {
                let old = self.csr_read(csr);
                let new_val = self.r(rs1);
                self.csr_write(csr, new_val);
                self.set(rd, old);
            }
            OracleOp::Csrrs { rd, rs1, csr } => {
                let old = self.csr_read(csr);
                let mask = self.r(rs1);
                if mask != 0 {
                    self.csr_write(csr, old | mask);
                }
                self.set(rd, old);
            }
            OracleOp::Csrrc { rd, rs1, csr } => {
                let old = self.csr_read(csr);
                let mask = self.r(rs1);
                if mask != 0 {
                    self.csr_write(csr, old & !mask);
                }
                self.set(rd, old);
            }
            OracleOp::Csrrci { rd, uimm, csr } => {
                let old = self.csr_read(csr);
                let mask = uimm as u32;
                if mask != 0 {
                    self.csr_write(csr, old & !mask);
                }
                self.set(rd, old);
            }
            OracleOp::Csrrsi { rd, uimm, csr } => {
                let old = self.csr_read(csr);
                let mask = uimm as u32;
                if mask != 0 {
                    self.csr_write(csr, old | mask);
                }
                self.set(rd, old);
            }
        }
    }
}

#[derive(Clone, Debug)]
enum OracleOp {
    Add { rd: u8, rs1: u8, rs2: u8 },
    Sub { rd: u8, rs1: u8, rs2: u8 },
    And { rd: u8, rs1: u8, rs2: u8 },
    Or { rd: u8, rs1: u8, rs2: u8 },
    Xor { rd: u8, rs1: u8, rs2: u8 },
    Sll { rd: u8, rs1: u8, rs2: u8 },
    Srl { rd: u8, rs1: u8, rs2: u8 },
    Sra { rd: u8, rs1: u8, rs2: u8 },
    Slt { rd: u8, rs1: u8, rs2: u8 },
    Sltu { rd: u8, rs1: u8, rs2: u8 },
    Mul { rd: u8, rs1: u8, rs2: u8 },
    Mulh { rd: u8, rs1: u8, rs2: u8 },
    Mulhu { rd: u8, rs1: u8, rs2: u8 },
    Mulhsu { rd: u8, rs1: u8, rs2: u8 },
    Div { rd: u8, rs1: u8, rs2: u8 },
    Divu { rd: u8, rs1: u8, rs2: u8 },
    Rem { rd: u8, rs1: u8, rs2: u8 },
    Remu { rd: u8, rs1: u8, rs2: u8 },
    // I-type immediate ALU
    Addi { rd: u8, rs1: u8, imm: i32 },
    Slti { rd: u8, rs1: u8, imm: i32 },
    Sltiu { rd: u8, rs1: u8, imm: i32 },
    Xori { rd: u8, rs1: u8, imm: i32 },
    Ori { rd: u8, rs1: u8, imm: i32 },
    Andi { rd: u8, rs1: u8, imm: i32 },
    Slli { rd: u8, rs1: u8, shamt: u32 },
    Srli { rd: u8, rs1: u8, shamt: u32 },
    Srai { rd: u8, rs1: u8, shamt: u32 },
    // PC-relative
    Auipc { rd: u8, pc: u32, imm: u32 },
    // Memory — off is byte offset into data region
    Sw { rs2: u8, off: usize },
    Sh { rs2: u8, off: usize },
    Sb { rs2: u8, off: usize },
    Lw { rd: u8, off: usize },
    Lh { rd: u8, off: usize },
    Lhu { rd: u8, off: usize },
    Lb { rd: u8, off: usize },
    Lbu { rd: u8, off: usize },
    // Init
    LoadConst { rd: u8, value: u32 },
    // CSR
    Csrrw { rd: u8, rs1: u8, csr: u32 },
    Csrrs { rd: u8, rs1: u8, csr: u32 },
    Csrrc { rd: u8, rs1: u8, csr: u32 },
    Csrrci { rd: u8, uimm: u8, csr: u32 },
    Csrrsi { rd: u8, uimm: u8, csr: u32 },
}

// ─── Program generator ────────────────────────────────────────────────────

struct Program {
    words: Vec<u32>,
    ops: Vec<OracleOp>,
    tracked_csrs: Vec<u32>, // which CSRs this program uses
}

fn gen_program(rng: &mut Rng, n_ops: usize) -> Program {
    let mut halfwords: Vec<u16> = Vec::new();
    let mut ops: Vec<OracleOp> = Vec::new();
    let mut tracked_csrs: Vec<u32> = Vec::new();

    // x1-x8: random data registers (use 32-bit LUI+ADDI)
    for rd in 1u8..=8 {
        let value = rng.u32();
        load_const(rd, value, &mut halfwords);
        ops.push(OracleOp::LoadConst { rd, value });
    }

    // x9: data base pointer = RAM_BASE + DATA_OFF (constant throughout program)
    let data_base = (RAM_BASE + DATA_OFF) as u32;
    load_const(BASE_REG, data_base, &mut halfwords);
    ops.push(OracleOp::LoadConst {
        rd: BASE_REG,
        value: data_base,
    });

    // x2=SP: points to end of data region for SP-relative loads/stores (C.LWSP/C.SWSP)
    // SP = RAM_BASE + DATA_OFF + DATA_SIZE - SP_SLOTS*4 (top of data region)
    let sp_base = (RAM_BASE + DATA_OFF + DATA_SIZE as u64 - (SP_SLOTS as u64) * 4) as u32;
    load_const(2, sp_base, &mut halfwords);
    ops.push(OracleOp::LoadConst { rd: 2, value: sp_base });

    const N_ALU: usize = 18; // R-type ALU
    const N_IMM: usize = 10; // I-type immediate ALU
    const N_MEM: usize = 8; // Load/store
    const N_COMP: usize = 17; // C-extension ops (0-12: ALU, 13: C.LW, 14: C.SW, 15: C.LWSP, 16: C.SWSP)
    const N_CSR: usize = 5; // CSR ops (CSRRW, CSRRS, CSRRC, CSRRCI, CSRRSI)
    const N_TOTAL: usize = N_ALU + N_IMM + N_MEM + N_COMP + N_CSR; // = 58

    for _ in 0..n_ops {
        let op_idx = rng.range(N_TOTAL as u64) as usize;

        if op_idx < N_ALU {
            // R-type ALU op on x1-x8
            let rd = (rng.range(8) + 1) as u8;
            let rs1 = (rng.range(8) + 1) as u8;
            let rs2 = (rng.range(8) + 1) as u8;
            let (word, oracle_op) = match op_idx {
                0 => (
                    enc_r(0x00, rs2, rs1, 0x0, rd, 0x33),
                    OracleOp::Add { rd, rs1, rs2 },
                ),
                1 => (
                    enc_r(0x20, rs2, rs1, 0x0, rd, 0x33),
                    OracleOp::Sub { rd, rs1, rs2 },
                ),
                2 => (
                    enc_r(0x00, rs2, rs1, 0x7, rd, 0x33),
                    OracleOp::And { rd, rs1, rs2 },
                ),
                3 => (
                    enc_r(0x00, rs2, rs1, 0x6, rd, 0x33),
                    OracleOp::Or { rd, rs1, rs2 },
                ),
                4 => (
                    enc_r(0x00, rs2, rs1, 0x4, rd, 0x33),
                    OracleOp::Xor { rd, rs1, rs2 },
                ),
                5 => (
                    enc_r(0x00, rs2, rs1, 0x1, rd, 0x33),
                    OracleOp::Sll { rd, rs1, rs2 },
                ),
                6 => (
                    enc_r(0x00, rs2, rs1, 0x5, rd, 0x33),
                    OracleOp::Srl { rd, rs1, rs2 },
                ),
                7 => (
                    enc_r(0x20, rs2, rs1, 0x5, rd, 0x33),
                    OracleOp::Sra { rd, rs1, rs2 },
                ),
                8 => (
                    enc_r(0x00, rs2, rs1, 0x2, rd, 0x33),
                    OracleOp::Slt { rd, rs1, rs2 },
                ),
                9 => (
                    enc_r(0x00, rs2, rs1, 0x3, rd, 0x33),
                    OracleOp::Sltu { rd, rs1, rs2 },
                ),
                10 => (
                    enc_r(0x01, rs2, rs1, 0x0, rd, 0x33),
                    OracleOp::Mul { rd, rs1, rs2 },
                ),
                11 => (
                    enc_r(0x01, rs2, rs1, 0x1, rd, 0x33),
                    OracleOp::Mulh { rd, rs1, rs2 },
                ),
                12 => (
                    enc_r(0x01, rs2, rs1, 0x3, rd, 0x33),
                    OracleOp::Mulhu { rd, rs1, rs2 },
                ),
                13 => (
                    enc_r(0x01, rs2, rs1, 0x2, rd, 0x33),
                    OracleOp::Mulhsu { rd, rs1, rs2 },
                ),
                14 => (
                    enc_r(0x01, rs2, rs1, 0x4, rd, 0x33),
                    OracleOp::Div { rd, rs1, rs2 },
                ),
                15 => (
                    enc_r(0x01, rs2, rs1, 0x5, rd, 0x33),
                    OracleOp::Divu { rd, rs1, rs2 },
                ),
                16 => (
                    enc_r(0x01, rs2, rs1, 0x6, rd, 0x33),
                    OracleOp::Rem { rd, rs1, rs2 },
                ),
                17 => (
                    enc_r(0x01, rs2, rs1, 0x7, rd, 0x33),
                    OracleOp::Remu { rd, rs1, rs2 },
                ),
                _ => unreachable!(),
            };
            push32(&mut halfwords, word);
            ops.push(oracle_op);
        } else if op_idx < N_ALU + N_IMM {
            // I-type immediate ALU on x1-x8
            let imm_op = op_idx - N_ALU;
            let rd = (rng.range(8) + 1) as u8;
            let rs1 = (rng.range(8) + 1) as u8;

            match imm_op {
                0 => {
                    let imm = (rng.u32() as i32) << 20 >> 20;
                    push32(&mut halfwords, enc_i(imm, rs1, 0x0, rd, 0x13));
                    ops.push(OracleOp::Addi { rd, rs1, imm });
                }
                1 => {
                    let imm = (rng.u32() as i32) << 20 >> 20;
                    push32(&mut halfwords, enc_i(imm, rs1, 0x2, rd, 0x13));
                    ops.push(OracleOp::Slti { rd, rs1, imm });
                }
                2 => {
                    let imm = (rng.u32() as i32) << 20 >> 20;
                    push32(&mut halfwords, enc_i(imm, rs1, 0x3, rd, 0x13));
                    ops.push(OracleOp::Sltiu { rd, rs1, imm });
                }
                3 => {
                    let imm = (rng.u32() as i32) << 20 >> 20;
                    push32(&mut halfwords, enc_i(imm, rs1, 0x4, rd, 0x13));
                    ops.push(OracleOp::Xori { rd, rs1, imm });
                }
                4 => {
                    let imm = (rng.u32() as i32) << 20 >> 20;
                    push32(&mut halfwords, enc_i(imm, rs1, 0x6, rd, 0x13));
                    ops.push(OracleOp::Ori { rd, rs1, imm });
                }
                5 => {
                    let imm = (rng.u32() as i32) << 20 >> 20;
                    push32(&mut halfwords, enc_i(imm, rs1, 0x7, rd, 0x13));
                    ops.push(OracleOp::Andi { rd, rs1, imm });
                }
                6 => {
                    let shamt = rng.range(32) as u32;
                    push32(&mut halfwords, enc_r(0x00, shamt as u8, rs1, 0x1, rd, 0x13));
                    ops.push(OracleOp::Slli { rd, rs1, shamt });
                }
                7 => {
                    let shamt = rng.range(32) as u32;
                    push32(&mut halfwords, enc_r(0x00, shamt as u8, rs1, 0x5, rd, 0x13));
                    ops.push(OracleOp::Srli { rd, rs1, shamt });
                }
                8 => {
                    let shamt = rng.range(32) as u32;
                    push32(&mut halfwords, enc_r(0x20, shamt as u8, rs1, 0x5, rd, 0x13));
                    ops.push(OracleOp::Srai { rd, rs1, shamt });
                }
                9 => {
                    let rd = (rng.range(8) + 1) as u8;
                    let imm = rng.u32() & 0xFFFF_F000;
                    let pc = (RAM_BASE + (halfwords.len() as u64 / 2) * 4) as u32;
                    let auipc_word = (imm & 0xFFFF_F000) | ((rd as u32) << 7) | 0x17;
                    push32(&mut halfwords, auipc_word);
                    ops.push(OracleOp::Auipc { rd, pc, imm });
                }
                _ => unreachable!(),
            }
        } else if op_idx < N_ALU + N_IMM + N_MEM {
            // Memory op
            let mem_op = op_idx - N_ALU - N_IMM;
            let rd = (rng.range(8) + 1) as u8;
            let rs2 = (rng.range(8) + 1) as u8;

            match mem_op {
                0 => {
                    let slot = rng.range(WORD_SLOTS as u64) as u32;
                    let off = (slot * 4) as usize;
                    push32(&mut halfwords, enc_s(off as i32, rs2, BASE_REG, 0x2));
                    ops.push(OracleOp::Sw { rs2, off });
                }
                1 => {
                    let slot = rng.range(HALF_SLOTS as u64) as u32;
                    let off = (slot * 2) as usize;
                    push32(&mut halfwords, enc_s(off as i32, rs2, BASE_REG, 0x1));
                    ops.push(OracleOp::Sh { rs2, off });
                }
                2 => {
                    let off = rng.range(BYTE_SLOTS as u64) as usize;
                    push32(&mut halfwords, enc_s(off as i32, rs2, BASE_REG, 0x0));
                    ops.push(OracleOp::Sb { rs2, off });
                }
                3 => {
                    let slot = rng.range(WORD_SLOTS as u64) as u32;
                    let off = (slot * 4) as usize;
                    push32(&mut halfwords, enc_i(off as i32, BASE_REG, 0x2, rd, 0x03));
                    ops.push(OracleOp::Lw { rd, off });
                }
                4 => {
                    let slot = rng.range(HALF_SLOTS as u64) as u32;
                    let off = (slot * 2) as usize;
                    push32(&mut halfwords, enc_i(off as i32, BASE_REG, 0x1, rd, 0x03));
                    ops.push(OracleOp::Lh { rd, off });
                }
                5 => {
                    let slot = rng.range(HALF_SLOTS as u64) as u32;
                    let off = (slot * 2) as usize;
                    push32(&mut halfwords, enc_i(off as i32, BASE_REG, 0x5, rd, 0x03));
                    ops.push(OracleOp::Lhu { rd, off });
                }
                6 => {
                    let off = rng.range(BYTE_SLOTS as u64) as usize;
                    push32(&mut halfwords, enc_i(off as i32, BASE_REG, 0x0, rd, 0x03));
                    ops.push(OracleOp::Lb { rd, off });
                }
                7 => {
                    let off = rng.range(BYTE_SLOTS as u64) as usize;
                    push32(&mut halfwords, enc_i(off as i32, BASE_REG, 0x4, rd, 0x03));
                    ops.push(OracleOp::Lbu { rd, off });
                }
                _ => unreachable!(),
            }
        } else if op_idx < N_ALU + N_IMM + N_MEM + N_COMP {
            // ── C-extension instructions ──
            let comp_op = op_idx - N_ALU - N_IMM - N_MEM;

            match comp_op {
                // C.ADDI: uses full registers x1-x8
                0 => {
                    let rd = (rng.range(8) + 1) as u8;
                    let imm = (rng.u32() as i32) << 20 >> 20; // random 6-bit sign-extended
                    push16(&mut halfwords, enc_c_addi(rd, imm));
                    ops.push(OracleOp::Addi { rd, rs1: rd, imm });
                }
                // C.LI: uses full registers x1-x8
                1 => {
                    let rd = (rng.range(8) + 1) as u8;
                    let imm = (rng.u32() as i32) << 20 >> 20;
                    push16(&mut halfwords, enc_c_li(rd, imm));
                    ops.push(OracleOp::Addi { rd, rs1: 0, imm });
                }
                // C.LUI: uses full registers x1-x8 (skip x2=SP, x0)
                2 => {
                    let rd = loop {
                        let r = (rng.range(8) + 1) as u8;
                        if r != 2 { break r; }
                    };
                    // Generate a non-zero nzimm: pick random upper bits, ensure bit 17 area is set
                    let raw = rng.u32() & 0x3F; // 6-bit value
                    let nzimm = (raw << 12) as u32; // place in bits 17:12
                    if nzimm != 0 {
                        push16(&mut halfwords, enc_c_lui(rd, nzimm));
                        ops.push(OracleOp::LoadConst { rd, value: nzimm });
                    } else {
                        // Skip: nzimm=0 is Invalid for C.LUI, generate a C.ADDI instead
                        let imm = (rng.u32() as i32) << 20 >> 20;
                        push16(&mut halfwords, enc_c_addi(rd, imm));
                        ops.push(OracleOp::Addi { rd, rs1: rd, imm });
                    }
                }
                // C.MV: uses full registers x1-x8
                3 => {
                    let rd = (rng.range(8) + 1) as u8;
                    let rs2 = (rng.range(8) + 1) as u8;
                    push16(&mut halfwords, enc_c_mv(rd, rs2));
                    ops.push(OracleOp::Add { rd, rs1: 0, rs2 });
                }
                // C.ADD: uses full registers x1-x8
                4 => {
                    let rd = (rng.range(8) + 1) as u8;
                    let rs2 = (rng.range(8) + 1) as u8;
                    push16(&mut halfwords, enc_c_add(rd, rs2));
                    ops.push(OracleOp::Add { rd, rs1: rd, rs2 });
                }
                // C.SRLI: uses register primes (x8-x15), rd_p = bits[9:7]
                5 => {
                    let rd_p = (rng.range(8)) as u8; // 0-7, maps to x8-x15
                    let rd = 8 + rd_p;
                    let shamt = rng.range(32) as u32;
                    push16(&mut halfwords, enc_c_srli(rd_p, shamt));
                    ops.push(OracleOp::Srli { rd, rs1: rd, shamt });
                }
                // C.SRAI: uses register primes
                6 => {
                    let rd_p = (rng.range(8)) as u8;
                    let rd = 8 + rd_p;
                    let shamt = rng.range(32) as u32;
                    push16(&mut halfwords, enc_c_srai(rd_p, shamt));
                    ops.push(OracleOp::Srai { rd, rs1: rd, shamt });
                }
                // C.ANDI: uses register primes
                7 => {
                    let rd_p = (rng.range(8)) as u8;
                    let rd = 8 + rd_p;
                    let imm = (rng.u32() as i32) << 20 >> 20;
                    push16(&mut halfwords, enc_c_andi(rd_p, imm));
                    ops.push(OracleOp::Andi { rd, rs1: rd, imm });
                }
                // C.SUB: uses register primes
                8 => {
                    let rd_p = (rng.range(8)) as u8;
                    let rs2_p = (rng.range(8)) as u8;
                    let rd = 8 + rd_p;
                    let rs2 = 8 + rs2_p;
                    push16(&mut halfwords, enc_c_sub(rd_p, rs2_p));
                    ops.push(OracleOp::Sub { rd, rs1: rd, rs2 });
                }
                // C.XOR: uses register primes
                9 => {
                    let rd_p = (rng.range(8)) as u8;
                    let rs2_p = (rng.range(8)) as u8;
                    let rd = 8 + rd_p;
                    let rs2 = 8 + rs2_p;
                    push16(&mut halfwords, enc_c_xor(rd_p, rs2_p));
                    ops.push(OracleOp::Xor { rd, rs1: rd, rs2 });
                }
                // C.OR: uses register primes
                10 => {
                    let rd_p = (rng.range(8)) as u8;
                    let rs2_p = (rng.range(8)) as u8;
                    let rd = 8 + rd_p;
                    let rs2 = 8 + rs2_p;
                    push16(&mut halfwords, enc_c_or(rd_p, rs2_p));
                    ops.push(OracleOp::Or { rd, rs1: rd, rs2 });
                }
                // C.AND: uses register primes
                11 => {
                    let rd_p = (rng.range(8)) as u8;
                    let rs2_p = (rng.range(8)) as u8;
                    let rd = 8 + rd_p;
                    let rs2 = 8 + rs2_p;
                    push16(&mut halfwords, enc_c_and(rd_p, rs2_p));
                    ops.push(OracleOp::And { rd, rs1: rd, rs2 });
                }
                // C.SLLI: uses full registers x1-x8
                12 => {
                    let rd = (rng.range(8) + 1) as u8;
                    let shamt = rng.range(32) as u32;
                    push16(&mut halfwords, enc_c_slli(rd, shamt));
                    ops.push(OracleOp::Slli { rd, rs1: rd, shamt });
                }
                // C.LW: register primes, base=x9 (prime 1)
                13 => {
                    let rd_p = (rng.range(8)) as u8;
                    let rd = 8 + rd_p;
                    let rs1_p = 1; // x9 = data base
                    let slot = rng.range(WORD_SLOTS as u64) as u32;
                    let offset = (slot * 4) as u32;
                    push16(&mut halfwords, enc_c_lw(rd_p, rs1_p, offset));
                    ops.push(OracleOp::Lw { rd, off: offset as usize });
                }
                // C.SW: register primes, base=x9 (prime 1)
                14 => {
                    let rs2_p = (rng.range(8)) as u8;
                    let rs2 = 8 + rs2_p;
                    let rs1_p = 1; // x9 = data base
                    let slot = rng.range(WORD_SLOTS as u64) as u32;
                    let offset = (slot * 4) as u32;
                    push16(&mut halfwords, enc_c_sw(rs2_p, rs1_p, offset));
                    ops.push(OracleOp::Sw { rs2, off: offset as usize });
                }
                // C.LWSP: full registers x1-x8, SP-relative
                15 => {
                    let rd = (rng.range(8) + 1) as u8;
                    // x2=SP points into data region (see SP init below)
                    let slot = rng.range(SP_SLOTS as u64) as u32;
                    let offset = (slot * 4) as u32;
                    push16(&mut halfwords, enc_c_lwsp(rd, offset));
                    ops.push(OracleOp::Lw { rd, off: (DATA_SIZE - (SP_SLOTS as usize) * 4 + offset as usize) });
                }
                // C.SWSP: full registers x1-x8, SP-relative
                16 => {
                    let rs2 = (rng.range(8) + 1) as u8;
                    let slot = rng.range(SP_SLOTS as u64) as u32;
                    let offset = (slot * 4) as u32;
                    push16(&mut halfwords, enc_c_swsp(rs2, offset));
                    ops.push(OracleOp::Sw { rs2, off: (DATA_SIZE - (SP_SLOTS as usize) * 4 + offset as usize) });
                }
                _ => unreachable!(),
            }
        } else {
            // ── CSR operations ──
            let csr_op = op_idx - N_ALU - N_IMM - N_MEM - N_COMP;
            let csr = FUZZ_CSRS[rng.range(FUZZ_CSRS.len() as u64) as usize] as u32;
            let rd = (rng.range(8) + 1) as u8; // x1-x8

            match csr_op {
                // CSRRW: swap
                0 => {
                    let rs1 = (rng.range(8) + 1) as u8;
                    push32(&mut halfwords, enc_csrrw(rd, rs1, csr as u16));
                    ops.push(OracleOp::Csrrw { rd, rs1, csr });
                    tracked_csrs.push(csr as u32);
                }
                // CSRRS: read and set bits
                1 => {
                    let rs1 = (rng.range(8) + 1) as u8;
                    push32(&mut halfwords, enc_csrrs(rd, rs1, csr as u16));
                    ops.push(OracleOp::Csrrs { rd, rs1, csr });
                    tracked_csrs.push(csr as u32);
                }
                // CSRRC: read and clear bits
                2 => {
                    let rs1 = (rng.range(8) + 1) as u8;
                    push32(&mut halfwords, enc_csrrc(rd, rs1, csr as u16));
                    ops.push(OracleOp::Csrrc { rd, rs1, csr });
                    tracked_csrs.push(csr as u32);
                }
                // CSRRCI: read and clear bits (immediate)
                3 => {
                    let uimm = (rng.range(32)) as u8;
                    push32(&mut halfwords, enc_csrrci(rd, uimm, csr as u16));
                    ops.push(OracleOp::Csrrci { rd, uimm, csr });
                    tracked_csrs.push(csr as u32);
                }
                // CSRRSI: read and set bits (immediate)
                4 => {
                    let uimm = (rng.range(32)) as u8;
                    push32(&mut halfwords, enc_csrrsi(rd, uimm, csr as u16));
                    ops.push(OracleOp::Csrrsi { rd, uimm, csr });
                    tracked_csrs.push(csr as u32);
                }
                _ => unreachable!(),
            }
        }
    }

    // EBREAK as 32-bit instruction
    push32(&mut halfwords, enc_ebreak());

    // Pack halfwords into 32-bit words (little-endian)
    let mut words: Vec<u32> = Vec::new();
    let mut i = 0;
    while i < halfwords.len() {
        let lo = halfwords[i] as u32;
        let hi = if i + 1 < halfwords.len() {
            halfwords[i + 1] as u32
        } else {
            // Odd halfword: pad with NOP (0x0001 = C.NOP on little-endian)
            // Actually, 0x0001 in the high halfword: bits[31:16] = 0x0001
            // That's bits[1:0]=00, funct3=000 -> C.ADDI4SPN with nzuimm=0 -> NOP
            0x0001
        };
        words.push(lo | (hi << 16));
        i += 2;
    }

    // Deduplicate tracked CSRs
    tracked_csrs.sort();
    tracked_csrs.dedup();

    Program {
        words,
        ops,
        tracked_csrs,
    }
}

// ─── Run a program through the RISC-V VM ──────────────────────────────────

fn run_program(prog: &Program) -> Result<([u32; 32], Box<[u8]>, Vec<(u32, u32)>), String> {
    let mut vm = riscv::RiscvVm::new_with_base(RAM_BASE, RAM_SIZE);
    vm.cpu.pc = RAM_BASE as u32;
    vm.cpu.csr.satp = 0;
    vm.cpu.csr.mie = 0;
    vm.cpu.csr.mstatus = 0;

    // Verify code fits before data region
    let code_bytes = prog.words.len() * 4;
    if code_bytes as u64 > DATA_OFF {
        return Err(format!(
            "program too large: {} bytes > {}",
            code_bytes, DATA_OFF
        ));
    }

    for (i, &word) in prog.words.iter().enumerate() {
        let addr = RAM_BASE + (i as u64) * 4;
        vm.bus
            .write_word(addr, word)
            .map_err(|e| format!("write at {:08x}: {:?}", addr, e))?;
    }

    let max_steps = prog.words.len() * 4 + 100; // more steps since compressed = more instructions per word
    for _ in 0..max_steps {
        match vm.step() {
            cpu::StepResult::Ok => {}
            cpu::StepResult::Ebreak => {
                // Snapshot data region from bus
                let mut data = vec![0u8; DATA_SIZE];
                for (i, slot) in data.iter_mut().enumerate().take(DATA_SIZE) {
                    *slot = vm
                        .bus
                        .read_byte(RAM_BASE + DATA_OFF + i as u64)
                        .map_err(|e| format!("read data[{}]: {:?}", i, e))?;
                }
                // Read tracked CSR values
                let mut csr_vals: Vec<(u32, u32)> = Vec::new();
                for &csr in &prog.tracked_csrs {
                    let val = vm.cpu.csr.read(csr as u32);
                    csr_vals.push((csr, val));
                }
                return Ok((vm.cpu.x, data.into_boxed_slice(), csr_vals));
            }
            other => return Err(format!("StepResult::{:?} at pc={:08x}", other, vm.cpu.pc)),
        }
    }
    Err(format!("no EBREAK within {} steps", max_steps))
}

// ─── Check oracle vs VM ───────────────────────────────────────────────────

fn check_program(
    prog: &Program,
    vm_regs: &[u32; 32],
    vm_data: &[u8],
    vm_csrs: &[(u32, u32)],
) -> bool {
    let mut oracle = Oracle::new();
    for op in &prog.ops {
        oracle.apply(op);
    }

    let mut ok = true;

    // Debug: trace all ops
    if std::env::args().any(|a| a == "debug") {
        eprintln!("=== Program ops ({} ops) ===", prog.ops.len());
        for (i, op) in prog.ops.iter().enumerate() {
            eprintln!("  [{}] {:?}", i, op);
        }
        eprintln!("=== Oracle final state ===");
        for reg in 0u8..=15 {
            eprintln!("  x{} = {:#010x}", reg, oracle.x[reg as usize]);
        }
        eprintln!("=== VM final state ===");
        for reg in 0u8..=15 {
            eprintln!("  x{} = {:#010x}", reg, vm_regs[reg as usize]);
        }
    }

    // Check x1-x9 (x9 is data base, should be unchanged)
    for reg in 1u8..=9 {
        let expected = oracle.x[reg as usize];
        let got = vm_regs[reg as usize];
        if expected != got {
            eprintln!("  x{}: oracle={:#010x}  vm={:#010x}", reg, expected, got);
            ok = false;
        }
    }

    // Check data region
    for (i, (expected, got)) in oracle.mem.iter().zip(vm_data.iter()).enumerate() {
        if expected != got {
            eprintln!("  mem[{}]: oracle={:#04x}  vm={:#04x}", i, expected, got);
            ok = false;
            break; // report first divergence only
        }
    }

    // Check CSR values
    for &(csr, vm_val) in vm_csrs {
        let oracle_val = oracle.csr_read(csr as u32);
        if oracle_val != vm_val {
            eprintln!(
                "  csr[{:#05x}]: oracle={:#010x}  vm={:#010x}",
                csr, oracle_val, vm_val
            );
            ok = false;
        }
    }

    ok
}

// ─── Main ─────────────────────────────────────────────────────────────────

fn main() {
    let n_programs: u64 = std::env::args()
        .nth(1)
        .and_then(|s| s.parse().ok())
        .unwrap_or(10_000);
    let n_ops: usize = std::env::args()
        .nth(2)
        .and_then(|s| s.parse().ok())
        .unwrap_or(20);
    let seed: u64 = std::env::args()
        .nth(3)
        .and_then(|s| s.parse().ok())
        .unwrap_or(42);
    let debug: bool = std::env::args()
        .nth(4)
        .map(|s| s == "debug" || s == "1")
        .unwrap_or(false);

    let mut rng = Rng::new(seed);
    let mut failures = 0u64;

    eprintln!(
        "RISC-V oracle fuzzer v2: {} programs × {} ops, seed={} (C-ext + CSR)",
        n_programs, n_ops, seed
    );

    for i in 0..n_programs {
        let prog = gen_program(&mut rng, n_ops);
        match run_program(&prog) {
            Err(e) => {
                eprintln!("program {}: VM error: {}", i, e);
                failures += 1;
            }
            Ok((vm_regs, vm_data, vm_csrs)) => {
                if !check_program(&prog, &vm_regs, &vm_data, &vm_csrs) {
                    eprintln!("program {}: oracle mismatch:", i);
                    for op in &prog.ops {
                        eprintln!("  {:?}", op);
                    }
                    failures += 1;
                    if failures >= 5 {
                        eprintln!("aborting after 5 failures");
                        std::process::exit(1);
                    }
                }
            }
        }

        if (i + 1) % 1000 == 0 {
            eprintln!("  {}/{} done, {} failures", i + 1, n_programs, failures);
        }
    }

    if failures == 0 {
        eprintln!("OK: {} programs passed", n_programs);
    } else {
        eprintln!("FAILED: {}/{} mismatches", failures, n_programs);
        std::process::exit(1);
    }
}
