//! RISC-V Instruction Decoder - Phase 8.1.2
//!
//! Decodes RISC-V RV32I instructions and emits spatial cells.

use crate::geoasm_materializer::{CellState, TYPE_LDI, TYPE_ADD_RR, TYPE_SUB_RR, TYPE_ADD_RI, TYPE_SUB_RI, TYPE_JZ, TYPE_JMP, TYPE_HALT, TYPE_COPY};
use crate::spatial::riscv_core::{SpatialRiscvCore, RegAddr, X0, RA};
use std::collections::HashMap;

/// RISC-V Instruction Formats (RV32I)
#[derive(Debug, Clone, Copy)]
pub enum InstructionFormat {
    RType,  // Register-register: opcode, rd, funct3, rs1, rs2, funct7
    IType,  // Immediate: opcode, rd, funct3, rs1, imm[11:0]
    SType,  // Store: opcode, imm[11:5], rs2, rs1, funct3, imm[4:0]
    BType,  // Branch: opcode, imm[12|10:5], rs2, rs1, funct3, imm[4:1|11]
    UType,  // Upper immediate: opcode, rd, imm[31:12]
    JType,  // Jump: opcode, rd, imm[20|10:1|11|19:12]
}

/// RISC-V Instruction Decoding Result
#[derive(Debug, Clone)]
pub struct DecodedInstruction {
    pub format: InstructionFormat,
    pub opcode: u8,
    pub rd: Option<RegAddr>,
    pub rs1: Option<RegAddr>,
    pub rs2: Option<RegAddr>,
    pub funct3: u8,
    pub funct7: u8,
    pub imm: u32,
}

/// Instruction Decoder
pub struct RiscvDecoder {
    /// Opcode to format mapping
    opcode_formats: HashMap<u8, InstructionFormat>,
}

impl RiscvDecoder {
    /// Create a new RISC-V instruction decoder
    pub fn new() -> Self {
        let mut opcode_formats = HashMap::new();
        
        // Load (I-type)
        opcode_formats.insert(0b0000011, InstructionFormat::IType);
        // Load-Imm (I-type)
        opcode_formats.insert(0b0010011, InstructionFormat::IType);
        // Store (S-type)
        opcode_formats.insert(0b0100011, InstructionFormat::SType);
        // Branch (B-type)
        opcode_formats.insert(0b1100011, InstructionFormat::BType);
        // Jump (J-type)
        opcode_formats.insert(0b1101111, InstructionFormat::JType);
        // Jump-register (I-type)
        opcode_formats.insert(0b1100111, InstructionFormat::IType);
        // Upper immediate (U-type)
        opcode_formats.insert(0b0110111, InstructionFormat::UType);
        opcode_formats.insert(0b0010111, InstructionFormat::UType);
        // Register-register (R-type)
        opcode_formats.insert(0b0110011, InstructionFormat::RType);
        // System (I-type)
        opcode_formats.insert(0b1110011, InstructionFormat::IType);
        
        Self { opcode_formats }
    }
    
    /// Decode a 32-bit RISC-V instruction
    pub fn decode(&self, instruction: u32) -> Option<DecodedInstruction> {
        let opcode = (instruction & 0x7F) as u8;
        let format = self.opcode_formats.get(&opcode).copied()?;
        
        let rd = Some(((instruction >> 7) & 0x1F) as RegAddr);
        let funct3 = ((instruction >> 12) & 0x7) as u8;
        
        match format {
            InstructionFormat::RType => {
                let rs1 = Some(((instruction >> 15) & 0x1F) as RegAddr);
                let rs2 = Some(((instruction >> 20) & 0x1F) as RegAddr);
                let funct7 = ((instruction >> 25) & 0x7F) as u8;
                
                Some(DecodedInstruction {
                    format,
                    opcode,
                    rd,
                    rs1,
                    rs2,
                    funct3,
                    funct7,
                    imm: 0,
                })
            }
            
            InstructionFormat::IType => {
                let rs1 = Some(((instruction >> 15) & 0x1F) as RegAddr);
                let imm = (instruction as i32 >> 20) as u32; // Sign-extend
                let funct7 = ((instruction >> 25) & 0x7F) as u8;
                
                Some(DecodedInstruction {
                    format,
                    opcode,
                    rd,
                    rs1,
                    rs2: None,
                    funct3,
                    funct7,
                    imm,
                })
            }
            
            InstructionFormat::SType => {
                let rs2 = Some(((instruction >> 20) & 0x1F) as RegAddr);
                let rs1 = Some(((instruction >> 15) & 0x1F) as RegAddr);
                let imm_11_5 = (instruction >> 25) & 0x7F;
                let imm_4_0 = (instruction >> 7) & 0x1F;
                let imm = (imm_11_5 << 5) | imm_4_0;
                
                Some(DecodedInstruction {
                    format,
                    opcode,
                    rd: None,
                    rs1,
                    rs2,
                    funct3,
                    funct7: 0,
                    imm,
                })
            }
            
            InstructionFormat::BType => {
                let rs2 = Some(((instruction >> 20) & 0x1F) as RegAddr);
                let rs1 = Some(((instruction >> 15) & 0x1F) as RegAddr);
                let imm_12 = (instruction >> 31) & 0x1;
                let imm_10_5 = (instruction >> 25) & 0x3F;
                let imm_4_1 = (instruction >> 8) & 0xF;
                let imm_11 = (instruction >> 7) & 0x1;
                let imm = (imm_12 << 12) | (imm_11 << 11) | (imm_10_5 << 5) | (imm_4_1 << 1);
                
                Some(DecodedInstruction {
                    format,
                    opcode,
                    rd: None,
                    rs1,
                    rs2,
                    funct3,
                    funct7: 0,
                    imm,
                })
            }
            
            InstructionFormat::UType => {
                let imm = (instruction & 0xFFFFF000) as u32;
                
                Some(DecodedInstruction {
                    format,
                    opcode,
                    rd,
                    rs1: None,
                    rs2: None,
                    funct3: 0,
                    funct7: 0,
                    imm,
                })
            }
            
            InstructionFormat::JType => {
                let imm_20 = (instruction >> 31) & 0x1;
                let imm_10_1 = (instruction >> 21) & 0x3FF;
                let imm_11 = (instruction >> 20) & 0x1;
                let imm_19_12 = (instruction >> 12) & 0xFF;
                let imm = (imm_20 << 20) | (imm_19_12 << 12) | (imm_11 << 11) | (imm_10_1 << 1);
                
                Some(DecodedInstruction {
                    format,
                    opcode,
                    rd,
                    rs1: None,
                    rs2: None,
                    funct3: 0,
                    funct7: 0,
                    imm,
                })
            }
        }
    }
    
    /// Emit spatial cells for a decoded instruction
    pub fn emit_spatial(
        &self,
        core: &SpatialRiscvCore,
        inst: &DecodedInstruction,
    ) -> Option<Vec<(usize, usize, CellState)>> {
        match inst.opcode {
            0b0010011 => self.emit_itype_arith(core, inst),
            0b0110011 => self.emit_rtype_arith(core, inst),
            0b1100011 => self.emit_branch(core, inst),
            0b1101111 => self.emit_jal(core, inst),
            0b0000011 => self.emit_load(core, inst),
            0b0100011 => self.emit_store(core, inst),
            0b1110011 => self.emit_system(core, inst),
            _ => None,
        }
    }
    
    /// Emit I-type arithmetic (ADDI, SLTI, etc.)
    fn emit_itype_arith(
        &self,
        core: &SpatialRiscvCore,
        inst: &DecodedInstruction,
    ) -> Option<Vec<(usize, usize, CellState)>> {
        let rd = inst.rd?;
        let rs1 = inst.rs1?;
        
        match inst.funct3 {
            0b000 => {
                // ADDI: rd = rs1 + imm
                Some(vec![core.emit_ldi(rd, inst.wrapping_add_imm_to(rd, rs1))?])
            }
            _ => None, // TODO: Support more I-type instructions
        }
    }
    
    /// Emit R-type arithmetic (ADD, SUB, etc.)
    fn emit_rtype_arith(
        &self,
        core: &SpatialRiscvCore,
        inst: &DecodedInstruction,
    ) -> Option<Vec<(usize, usize, CellState)>> {
        let rd = inst.rd?;
        let rs1 = inst.rs1?;
        let rs2 = inst.rs2?;
        
        match (inst.funct7, inst.funct3) {
            (0b0000000, 0b000) => {
                // ADD: rd = rs1 + rs2
                Some(vec![core.emit_add(rd, rs1, rs2)?])
            }
            (0b0100000, 0b000) => {
                // SUB: rd = rs1 - rs2
                Some(vec![core.emit_sub(rd, rs1, rs2)?])
            }
            _ => None, // TODO: Support more R-type instructions
        }
    }
    
    /// Emit branch (BEQ, BNE, etc.)
    fn emit_branch(
        &self,
        core: &SpatialRiscvCore,
        inst: &DecodedInstruction,
    ) -> Option<Vec<(usize, usize, CellState)>> {
        let rs1 = inst.rs1?;
        let rs2 = inst.rs2?;
        
        match inst.funct3 {
            0b000 => {
                // BEQ: if rs1 == rs2, branch
                // Emit comparison + conditional jump
                Some(vec![
                    core.emit_sub(rs1, rs1, rs2)?, // rs1 = rs1 - rs2
                    core.emit_jz(rs1, (inst.imm as usize, 0))?,
                ])
            }
            0b001 => {
                // BNE: if rs1 != rs2, branch
                // Invert condition by checking if zero
                Some(vec![
                    core.emit_sub(rs1, rs1, rs2)?, // rs1 = rs1 - rs2
                    core.emit_jnz(rs1, (inst.imm as usize, 0))?,
                ])
            }
            _ => None, // TODO: Support more branch types
        }
    }
    
    /// Emit JAL (jump and link)
    fn emit_jal(
        &self,
        core: &SpatialRiscvCore,
        inst: &DecodedInstruction,
    ) -> Option<Vec<(usize, usize, CellState)>> {
        let rd = inst.rd.unwrap_or(RA);
        let target = inst.imm as usize;
        
        // Save return address in rd
        // For now, just emit the jump
        Some(vec![core.emit_jmp(target)?])
    }
    
    /// Emit load (LW, LH, LB, etc.)
    fn emit_load(
        &self,
        _core: &SpatialRiscvCore,
        _inst: &DecodedInstruction,
    ) -> Option<Vec<(usize, usize, CellState)>> {
        // TODO: Implement load instructions
        None
    }
    
    /// Emit store (SW, SH, SB, etc.)
    fn emit_store(
        &self,
        _core: &SpatialRiscvCore,
        _inst: &DecodedInstruction,
    ) -> Option<Vec<(usize, usize, CellState)>> {
        // TODO: Implement store instructions
        None
    }
    
    /// Emit system (ECALL, EBREAK, etc.)
    fn emit_system(
        &self,
        _core: &SpatialRiscvCore,
        inst: &DecodedInstruction,
    ) -> Option<Vec<(usize, usize, CellState)>> {
        match (inst.funct3, inst.imm) {
            (0b000, 0) => {
                // ECALL: Emit HALT for now
                Some(vec![(0, 0, CellState::new(TYPE_HALT, 0, 0))])
            }
            _ => None,
        }
    }
}

impl DecodedInstruction {
    /// Helper: Calculate ADDI immediate result (simplified)
    fn wrapping_add_imm_to(&self, rd: RegAddr, rs1: RegAddr) -> u32 {
        // For now, just return the immediate
        // In a real implementation, this would read from rs1
        self.imm
    }
}

impl Default for RiscvDecoder {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_decode_add() {
        let decoder = RiscvDecoder::new();
        // add x2, x2, x3: 0x00310133 (rd=2, rs1=2, rs2=3)
        let inst = 0x00310133u32;
        let decoded = decoder.decode(inst).unwrap();
        
        assert_eq!(decoded.opcode, 0b0110011);
        assert_eq!(decoded.rd, Some(2));  // Corrected: rd=2
        assert_eq!(decoded.rs1, Some(2));
        assert_eq!(decoded.rs2, Some(3));
        assert_eq!(decoded.funct3, 0b000);
        assert_eq!(decoded.funct7, 0b0000000);
    }
    
    #[test]
    fn test_decode_addi() {
        let decoder = RiscvDecoder::new();
        // addi x5, x5, 10: 0x00a28293
        let inst = 0x00a28293u32;
        let decoded = decoder.decode(inst).unwrap();
        
        assert_eq!(decoded.opcode, 0b0010011);
        assert_eq!(decoded.rd, Some(5));
        assert_eq!(decoded.rs1, Some(5));
        assert_eq!(decoded.imm, 10);
        assert_eq!(decoded.funct3, 0b000);
    }
    
    #[test]
    fn test_decode_beq() {
        let decoder = RiscvDecoder::new();
        // beq x5, x6, 16: 0x00628263
        let inst = 0x00628263u32;
        let decoded = decoder.decode(inst).unwrap();
        
        assert_eq!(decoded.opcode, 0b1100011);
        assert_eq!(decoded.rs1, Some(5));
        assert_eq!(decoded.rs2, Some(6));
        assert_eq!(decoded.funct3, 0b000);
    }
    
    #[test]
    fn test_decode_ecall() {
        let decoder = RiscvDecoder::new();
        // ecall: 0x00000073
        let inst = 0x00000073u32;
        let decoded = decoder.decode(inst).unwrap();
        
        assert_eq!(decoded.opcode, 0b1110011);
        assert_eq!(decoded.funct3, 0b000);
        assert_eq!(decoded.imm, 0);
    }
}