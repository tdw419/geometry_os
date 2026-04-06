//! RV64I Instruction Decoder with RVC (Compressed) Support

/// Decoded RV64I instruction
#[derive(Debug, Clone, Copy)]
pub struct Rv64Instruction {
    pub opcode: u32,
    pub rd: u32,
    pub rs1: u32,
    pub rs2: u32,
    pub funct3: u32,
    pub funct7: u32,
    pub imm: i64,
    pub raw: u32,
    /// True if this was a 16-bit compressed instruction
    pub compressed: bool,
}

/// Decode a 32-bit or 16-bit RISC-V instruction.
/// For compressed instructions (low 2 bits != 11), reads a 16-bit halfword
/// and expands it to the 32-bit equivalent.
pub fn decode_rv64(word: u32) -> Rv64Instruction {
    let low2 = word & 0x3;
    if low2 != 0x3 {
        // 16-bit compressed instruction
        let half = word as u16;
        let expanded = expand_rvc(half);
        let mut inst = decode_rv64_32bit(expanded);
        inst.compressed = true;
        inst.raw = half as u32; // store original 16-bit for debugging
        inst
    } else {
        decode_rv64_32bit(word)
    }
}

/// Expand a 16-bit RVC instruction to its 32-bit equivalent.
/// This is a comprehensive RVC expander covering Quadrant 0, 1, and 2.
fn expand_rvc(half: u16) -> u32 {
    let quadrant = (half & 0x3) as u32;
    let funct3 = ((half >> 13) & 0x7) as u32;

    match quadrant {
        0 => expand_rvc_quadrant0(half, funct3),
        1 => expand_rvc_quadrant1(half, funct3),
        2 => expand_rvc_quadrant2(half, funct3),
        _ => 0, // 32-bit instruction, shouldn't reach here
    }
}

/// Quadrant 0: Stack-based loads/stores and misc
fn expand_rvc_quadrant0(half: u16, funct3: u32) -> u32 {
    let half = half as u32;
    match funct3 {
        0 => {
            // C.ADDI4SPN: addi rd', x2, nzuimm
            let rd = ((half >> 2) & 0x7) as u32 + 8;
            let nzuimm = (((half >> 5) & 1) << 3)
                | (((half >> 6) & 1) << 2)
                | (((half >> 7) & 0xF) << 6)
                | (((half >> 11) & 0x3) << 4);
            if nzuimm == 0 {
                // Invalid encoding, treat as NOP
                encode_i_type(0, 0, 0, 0, 0x13)
            } else {
                encode_i_type(nzuimm, 2, 0, rd, 0x13) // ADDI
            }
        }
        1 => {
            // C.LW: lw rd', offset(rs1')
            let offset = (((half >> 5) & 1) << 5)
                | (((half >> 6) & 1) << 2)
                | (((half >> 10) & 0x7) << 3);
            let rs1 = ((half >> 7) & 0x7) as u32 + 8;
            let rd = ((half >> 2) & 0x7) as u32 + 8;
            encode_i_type(offset, rs1, 2, rd, 0x03) // LW
        }
        2 => {
            // C.LD: ld rd', offset(rs1') (RV64 only)
            let offset = (((half >> 5) & 0x3) << 3)
                | (((half >> 10) & 0x7) << 6);
            let rs1 = ((half >> 7) & 0x7) as u32 + 8;
            let rd = ((half >> 2) & 0x7) as u32 + 8;
            encode_i_type(offset, rs1, 3, rd, 0x03) // LD
        }
        5 => {
            // C.FLW (RV32) / C.LDSP (RV64) - skip for now
            0
        }
        6 => {
            // C.SW: sw rs2', offset(rs1')
            let offset = (((half >> 5) & 1) << 5)
                | (((half >> 6) & 1) << 2)
                | (((half >> 10) & 0x7) << 3);
            let rs1 = ((half >> 7) & 0x7) as u32 + 8;
            let rs2 = ((half >> 2) & 0x7) as u32 + 8;
            encode_s_type(offset, rs2, rs1, 2, 0x23) // SW
        }
        7 => {
            // C.SD: sd rs2', offset(rs1') (RV64)
            let offset = (((half >> 5) & 0x3) << 3)
                | (((half >> 10) & 0x7) << 6);
            let rs1 = ((half >> 7) & 0x7) as u32 + 8;
            let rs2 = ((half >> 2) & 0x7) as u32 + 8;
            encode_s_type(offset, rs2, rs1, 3, 0x23) // SD
        }
        _ => 0, // Unknown
    }
}

/// Quadrant 1: Register-immediate operations and jumps
fn expand_rvc_quadrant1(half: u16, funct3: u32) -> u32 {
    let half = half as u32;
    match funct3 {
        0 => {
            // C.ADDI: addi rd, x0, imm (or C.NOP if rd=0)
            let rd = ((half >> 7) & 0x1F) as u32;
            let imm = sign_extend_5(((half >> 12) & 1) << 5 | ((half >> 2) & 0x1F));
            encode_i_type(imm as u32, 0, 0, rd, 0x13) // ADDI
        }
        1 => {
            // C.ADDIW: addiw rd, x0, imm (RV64 only)
            let rd = ((half >> 7) & 0x1F) as u32;
            let imm = sign_extend_5(((half >> 12) & 1) << 5 | ((half >> 2) & 0x1F));
            encode_i_type(imm as u32, 0, 0, rd, 0x1B) // ADDIW
        }
        2 => {
            // C.LI: addi rd, x0, imm
            let rd = ((half >> 7) & 0x1F) as u32;
            let imm = sign_extend_5(((half >> 12) & 1) << 5 | ((half >> 2) & 0x1F));
            encode_i_type(imm as u32, 0, 0, rd, 0x13) // ADDI
        }
        3 => {
            // C.LUI/Addi16sp: depends on rd
            let rd = ((half >> 7) & 0x1F) as u32;
            if rd == 2 {
                // C.ADDI16SP: addi x2, x2, nzimm
                let nzimm = (((half >> 12) & 1) << 9)
                    | (((half >> 5) & 1) << 4)
                    | (((half >> 6) & 1) << 6)
                    | (((half >> 3) & 3) << 7)
                    | (((half >> 2) & 1) << 5);
                let imm = sign_extend_10(nzimm);
                encode_i_type(imm as u32, 2, 0, 2, 0x13) // ADDI
            } else {
                // C.LUI: lui rd, nzimm
                // nzimm has bits already in place (bit12 = nzimm[17], bits[6:2] = nzimm[16:12])
                // encode_u_type does (imm << 12), so we need to pass nzimm >> 12
                let nzimm = ((half >> 12) & 1) << 5 | ((half >> 2) & 0x1F);
                let imm = sign_extend_6(nzimm) as u32;
                encode_u_type(imm, rd, 0x37) // LUI
            }
        }
        4 => {
            // Multiple ops based on funct2 (bits 11:10)
            let funct2 = ((half >> 10) & 0x3) as u32;
            let rd = ((half >> 7) & 0x7) as u32 + 8;
            match funct2 {
                0 => {
                    // C.SRLI: srli rd', rd', shamt
                    let shamt = (((half >> 12) & 1) << 5) | ((half >> 2) & 0x1F);
                    encode_i_type(shamt, rd, 5, rd, 0x13) // SRLI
                }
                1 => {
                    // C.SRAI: srai rd', rd', shamt
                    let shamt = (((half >> 12) & 1) << 5) | ((half >> 2) & 0x1F);
                    encode_i_type(shamt, rd, 5, rd, 0x13) | (0x20 << 25) // SRAI (funct7=0x20)
                }
                2 => {
                    // C.ANDI: andi rd', rd', imm
                    let imm = sign_extend_5(((half >> 12) & 1) << 5 | ((half >> 2) & 0x1F));
                    encode_i_type(imm as u32, rd, 7, rd, 0x13) // ANDI
                }
                3 => {
                    // Sub-ops based on bit 12 and funct2_lo (bits 11:10)
                    let rs1 = ((half >> 7) & 0x7) as u32 + 8;
                    let rs2 = ((half >> 2) & 0x7) as u32 + 8;
                    let bit12 = (half >> 12) & 1;
                    let funct2_lo = ((half >> 10) & 0x3) as u32;
                    match (bit12, funct2_lo) {
                        (0, 0) => encode_r_type(0, rs2, rs1, 7, rs1, 0x33), // C.SUB: SUB
                        (0, 1) => encode_r_type(0, rs2, rs1, 6, rs1, 0x33), // C.XOR: XOR
                        (0, 2) => encode_r_type(0, rs2, rs1, 4, rs1, 0x33), // C.OR: OR
                        (0, 3) => encode_r_type(0, rs2, rs1, 5, rs1, 0x33), // C.AND: AND
                        (1, 0) => encode_r_type(0x20, rs2, rs1, 0, rs1, 0x3B), // C.SUBW
                        (1, 1) => encode_r_type(0, rs2, rs1, 0, rs1, 0x3B),   // C.ADDW
                        _ => 0,
                    }
                }
                _ => 0,
            }
        }
        5 => {
            // C.J: jal x0, offset
            let offset = expand_cj_offset(half as u16);
            encode_j_type(offset as u32, 0, 0x6F) // JAL x0
        }
        6 => {
            // C.BEQZ: beq rs1', x0, offset
            let rs1 = ((half >> 7) & 0x7) as u32 + 8;
            let offset = expand_cb_offset(half as u16);
            encode_b_type(offset as u32, 0, rs1, 0, 0x63) // BEQ
        }
        7 => {
            // C.BNEZ: bne rs1', x0, offset
            let rs1 = ((half >> 7) & 0x7) as u32 + 8;
            let offset = expand_cb_offset(half as u16);
            encode_b_type(offset as u32, 0, rs1, 1, 0x63) // BNE
        }
        _ => 0,
    }
}

/// Quadrant 2: Register-register, stack pointer ops, stores
fn expand_rvc_quadrant2(half: u16, funct3: u32) -> u32 {
    let half = half as u32;
    match funct3 {
        0 => {
            // C.SLLI: slli rd, rd, shamt
            let rd = ((half >> 7) & 0x1F) as u32;
            let shamt = (((half >> 12) & 1) << 5) | ((half >> 2) & 0x1F);
            encode_i_type(shamt, rd, 1, rd, 0x13) // SLLI
        }
        1 => {
            // C.LDSP: ld rd, offset(x2) (RV64)
            let rd = ((half >> 7) & 0x1F) as u32;
            let offset = (((half >> 5) & 0x3) << 3)
                | (((half >> 10) & 0xF) << 6)
                | (((half >> 12) & 1) << 5);
            encode_i_type(offset, 2, 3, rd, 0x03) // LD
        }
        2 => {
            // C.LWSP: lw rd, offset(x2)
            let rd = ((half >> 7) & 0x1F) as u32;
            let offset = (((half >> 4) & 0x7) << 2)
                | (((half >> 12) & 1) << 5)
                | (((half >> 2) & 1) << 6);
            encode_i_type(offset, 2, 2, rd, 0x03) // LW
        }
        4 => {
            // Multiple ops based on bit 12
            let bit12 = (half >> 12) & 1;
            let rd = ((half >> 7) & 0x1F) as u32;
            if bit12 == 0 {
                let rs2 = ((half >> 2) & 0x1F) as u32;
                if rd == 0 && rs2 == 0 {
                    // C.EBREAK
                    0x00100073
                } else if rs2 == 0 {
                    // C.JR: jalr x0, rd, 0
                    encode_i_type(0, rd, 0, 0, 0x67) // JALR x0
                } else {
                    // C.MV: add rd, x0, rs2
                    encode_r_type(0, rs2, 0, 0, rd, 0x33) // ADD
                }
            } else {
                let rs2 = ((half >> 2) & 0x1F) as u32;
                if rs2 == 0 {
                    // C.JALR: jalr x1, rs1, 0
                    encode_i_type(0, rd, 0, 1, 0x67) // JALR x1
                } else {
                    // C.ADD: add rd, rd, rs2
                    encode_r_type(0, rs2, rd, 0, rd, 0x33) // ADD
                }
            }
        }
        5 => {
            // C.SDSP: sd rs2, offset(x2) (RV64)
            let rs2 = ((half >> 2) & 0x1F) as u32;
            let offset = (((half >> 5) & 0x3) << 3)
                | (((half >> 10) & 0xF) << 6)
                | (((half >> 12) & 1) << 5);
            encode_s_type(offset, rs2, 2, 3, 0x23) // SD
        }
        6 => {
            // C.SWSP: sw rs2, offset(x2)
            let rs2 = ((half >> 2) & 0x1F) as u32;
            let offset = (((half >> 9) & 0xF) << 2) | (((half >> 7) & 0x3) << 6);
            encode_s_type(offset, rs2, 2, 2, 0x23) // SW
        }
        _ => 0,
    }
}

/// Expand C.J offset (12-bit signed)
fn expand_cj_offset(half: u16) -> i32 {
    let half = half as u32;
    let raw = (((half >> 12) & 1) << 11)
        | (((half >> 11) & 1) << 4)
        | (((half >> 9) & 3) << 8)
        | (((half >> 8) & 1) << 10)
        | (((half >> 7) & 1) << 6)
        | (((half >> 6) & 1) << 7)
        | (((half >> 3) & 3) << 1)
        | (((half >> 2) & 1) << 5);
    sign_extend_12(raw)
}

/// Expand C.B offset (8-bit signed)
fn expand_cb_offset(half: u16) -> i32 {
    let half = half as u32;
    let raw = (((half >> 12) & 1) << 8)
        | (((half >> 10) & 3) << 3)
        | (((half >> 5) & 1) << 2)
        | (((half >> 3) & 3) << 5)
        | (((half >> 2) & 1) << 6);
    sign_extend_9(raw)
}

// Sign extension helpers
fn sign_extend_5(val: u32) -> i32 {
    if val & 0x10 != 0 {
        (val | 0xFFFFFFE0) as i32
    } else {
        val as i32
    }
}

fn sign_extend_6(val: u32) -> i32 {
    if val & 0x20 != 0 {
        (val | 0xFFFFFFC0) as i32
    } else {
        val as i32
    }
}

fn sign_extend_9(val: u32) -> i32 {
    if val & 0x100 != 0 {
        (val | 0xFFFFFE00) as i32
    } else {
        val as i32
    }
}

fn sign_extend_10(val: u32) -> i32 {
    if val & 0x200 != 0 {
        (val | 0xFFFFFC00) as i32
    } else {
        val as i32
    }
}

fn sign_extend_12(val: u32) -> i32 {
    if val & 0x800 != 0 {
        (val | 0xFFFFF000) as i32
    } else {
        val as i32
    }
}

fn sign_extend_18(val: u32) -> i32 {
    if val & 0x20000 != 0 {
        (val | 0xFFFC0000) as i32
    } else {
        val as i32
    }
}

/// Decode a 32-bit RISC-V instruction (original decoder)
fn decode_rv64_32bit(word: u32) -> Rv64Instruction {
    let opcode = word & 0x7F;
    let rd = (word >> 7) & 0x1F;
    let funct3 = (word >> 12) & 0x7;
    let rs1 = (word >> 15) & 0x1F;
    let rs2 = (word >> 20) & 0x1F;
    let funct7 = (word >> 25) & 0x7F;

    let imm = match opcode {
        // I-type
        0x03 | 0x0F | 0x13 | 0x67 => {
            sign_extend(((word >> 20) & 0xFFF) as u64, 12)
        },
        // S-type
        0x23 => {
            let imm11_5 = ((word >> 25) & 0x7F) as u64;
            let imm4_0 = ((word >> 7) & 0x1F) as u64;
            sign_extend((imm11_5 << 5) | imm4_0, 12)
        },
        // B-type
        0x63 => {
            let bit12 = ((word >> 31) & 1) as u64;
            let bit11 = ((word >> 7) & 1) as u64;
            let bits10_5 = ((word >> 25) & 0x3F) as u64;
            let bits4_1 = ((word >> 8) & 0xF) as u64;
            let bimm = (bit12 << 12) | (bit11 << 11) | (bits10_5 << 5) | (bits4_1 << 1);
            sign_extend(bimm, 13)
        },
        // U-type (sign-extend 32-bit result to 64-bit for RV64)
        0x17 | 0x37 => {
            let uimm32 = (word & 0xFFFFF000) as i32; // interpret as signed 32-bit
            uimm32 as i64 // sign-extend to 64-bit
        },
        // J-type
        0x6F => {
            let bit20 = ((word >> 31) & 1) as u64;
            let bits10_1 = ((word >> 21) & 0x3FF) as u64;
            let bit11 = ((word >> 20) & 1) as u64;
            let bits19_12 = ((word >> 12) & 0xFF) as u64;
            let jimm = (bit20 << 20) | (bits19_12 << 12) | (bit11 << 11) | (bits10_1 << 1);
            sign_extend(jimm, 21)
        },
        // OP-IMM-32
        0x1B => {
            sign_extend(((word >> 20) & 0xFFF) as u64, 12)
        },
        // R-type
        0x33 | 0x3B => 0,
        // SYSTEM
        0x73 => {
            sign_extend(((word >> 20) & 0xFFF) as u64, 12)
        },
        // AMO
        0x2F => 0,
        _ => 0,
    };

    Rv64Instruction { opcode, rd, rs1, rs2, funct3, funct7, imm, raw: word, compressed: false }
}

fn sign_extend(value: u64, bits: u32) -> i64 {
    let mask = 1u64 << (bits - 1);
    if value & mask != 0 {
        (value | !((1u64 << bits) - 1)) as i64
    } else {
        value as i64
    }
}

// Encoding helpers (used to expand RVC to 32-bit)
fn encode_r_type(funct7: u32, rs2: u32, rs1: u32, funct3: u32, rd: u32, opcode: u32) -> u32 {
    (funct7 << 25) | (rs2 << 20) | (rs1 << 15) | (funct3 << 12) | (rd << 7) | opcode
}

fn encode_i_type(imm: u32, rs1: u32, funct3: u32, rd: u32, opcode: u32) -> u32 {
    ((imm & 0xFFF) << 20) | (rs1 << 15) | (funct3 << 12) | (rd << 7) | opcode
}

fn encode_s_type(imm: u32, rs2: u32, rs1: u32, funct3: u32, opcode: u32) -> u32 {
    ((imm >> 5) << 25) | (rs2 << 20) | (rs1 << 15) | (funct3 << 12) | ((imm & 0x1F) << 7) | opcode
}

fn encode_b_type(imm: u32, rs2: u32, rs1: u32, funct3: u32, opcode: u32) -> u32 {
    (((imm >> 12) & 1) << 31) | (((imm >> 5) & 0x3F) << 25) | (rs2 << 20) | (rs1 << 15) |
    (funct3 << 12) | (((imm >> 1) & 0xF) << 8) | (((imm >> 11) & 1) << 7) | opcode
}

fn encode_u_type(imm: u32, rd: u32, opcode: u32) -> u32 {
    (imm << 12) | (rd << 7) | opcode
}

fn encode_j_type(imm: u32, rd: u32, opcode: u32) -> u32 {
    (((imm >> 20) & 1) << 31) | (((imm >> 1) & 0x3FF) << 21) | (((imm >> 11) & 1) << 20) |
    (((imm >> 12) & 0xFF) << 12) | (rd << 7) | opcode
}
