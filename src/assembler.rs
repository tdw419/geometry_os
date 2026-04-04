// Glyph Assembler - Text to Opcodes
//
// Compiles human-readable assembly into 32-bit glyph instructions.
// Each instruction is one pixel: R=opcode, G=stratum, B=p1, A=p2.
//
// Example:
//   LDI r0, 0       -> 0x00000001  (R=1 LDI, G=0, B=0 r0, A=0)
//   DATA 0           -> 0x00000000
//   LDI r1, 100      -> 0x00010001  (R=1, G=0, B=1 r1, A=0)
//   DATA 100          -> 0x00000064
//   HALT              -> 0x0000000D
//
// The assembler is the bridge between human thought and GPU execution.

/// Encode an instruction pixel from components
pub fn glyph(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
    (opcode as u32)
        | ((stratum as u32) << 8)
        | ((p1 as u32) << 16)
        | ((p2 as u32) << 24)
}

/// Opcodes matching glyph_vm_scheduler.wgsl
pub mod op {
    pub const NOP: u8 = 0;
    pub const LDI: u8 = 1;
    pub const MOV: u8 = 2;
    pub const LOAD: u8 = 3;
    pub const STORE: u8 = 4;
    pub const ADD: u8 = 5;
    pub const SUB: u8 = 6;
    pub const MUL: u8 = 7;
    pub const DIV: u8 = 8;
    pub const JMP: u8 = 9;
    pub const BRANCH: u8 = 10;
    pub const CALL: u8 = 11;
    pub const RET: u8 = 12;
    pub const HALT: u8 = 13;
    pub const DRAW: u8 = 215;
    pub const SPAWN: u8 = 230;
    pub const YIELD: u8 = 227;
}

/// Branch condition types (encoded in stratum field)
pub mod bcond {
    pub const BEQ: u8 = 0;
    pub const BNE: u8 = 1;
    pub const BLT: u8 = 2;
    pub const BGE: u8 = 3;
    pub const BLTU: u8 = 4;
    pub const BGEU: u8 = 5;
}

/// A compiled glyph program: a sequence of 32-bit pixels
#[derive(Debug, Clone)]
pub struct Program {
    pub pixels: Vec<u32>,
}

impl Program {
    pub fn new() -> Self {
        Self { pixels: Vec::new() }
    }

    /// Add a raw instruction pixel
    pub fn instruction(&mut self, opcode: u8, stratum: u8, p1: u8, p2: u8) -> &mut Self {
        self.pixels.push(glyph(opcode, stratum, p1, p2));
        self
    }

    /// Load immediate: LDI reg, value
    /// Emits 2 pixels: [LDI instruction] [data word]
    pub fn ldi(&mut self, reg: u8, value: u32) -> &mut Self {
        self.instruction(op::LDI, 0, reg, 0);
        self.pixels.push(value);
        self
    }

    /// Load from memory: LOAD dst_reg, [addr_reg]
    pub fn load(&mut self, dst_reg: u8, addr_reg: u8) -> &mut Self {
        self.instruction(op::LOAD, 0, dst_reg, addr_reg)
    }

    /// Store to memory: STORE [addr_reg], src_reg
    pub fn store(&mut self, addr_reg: u8, src_reg: u8) -> &mut Self {
        self.instruction(op::STORE, 0, addr_reg, src_reg)
    }

    /// Add: ADD dst_reg, src_reg  (dst += src)
    pub fn add(&mut self, dst_reg: u8, src_reg: u8) -> &mut Self {
        self.instruction(op::ADD, 0, dst_reg, src_reg)
    }

    /// Subtract: SUB dst_reg, src_reg
    pub fn sub(&mut self, dst_reg: u8, src_reg: u8) -> &mut Self {
        self.instruction(op::SUB, 0, dst_reg, src_reg)
    }

    /// Branch conditional: emit as [BRANCH cond r1 r2] [offset as i32]
    pub fn branch(&mut self, cond: u8, r1: u8, r2: u8, offset: i32) -> &mut Self {
        self.instruction(op::BRANCH, cond, r1, r2);
        self.pixels.push(offset as u32);
        self
    }

    /// Branch if not equal
    pub fn bne(&mut self, r1: u8, r2: u8, offset: i32) -> &mut Self {
        self.branch(bcond::BNE, r1, r2, offset)
    }

    /// Halt execution
    pub fn halt(&mut self) -> &mut Self {
        self.instruction(op::HALT, 0, 0, 0)
    }

    pub fn len(&self) -> usize {
        self.pixels.len()
    }

    pub fn is_empty(&self) -> bool {
        self.pixels.is_empty()
    }
}

/// Build the self-replicating program from PIXELS_MOVE_PIXELS.md
/// 18 pixels that copy themselves from address 0 to address 100.
pub fn self_replicator() -> Program {
    let mut p = Program::new();
    // Setup: load constants into registers
    p.ldi(0, 0);     // r0 = 0  (source start address)
    p.ldi(1, 100);   // r1 = 100 (destination address)
    p.ldi(2, 0);     // r2 = 0 (loop counter)
    p.ldi(3, 1);     // r3 = 1 (increment constant)
    p.ldi(4, 18);    // r4 = 18 (program length)
    // Copy loop: addresses 10-16
    p.load(5, 0);    // r5 = mem[r0]
    p.store(1, 5);   // mem[r1] = r5
    p.add(0, 3);     // r0 += 1
    p.add(1, 3);     // r1 += 1
    p.add(2, 3);     // r2 += 1
    p.bne(2, 4, -7); // if r2 != r4, jump back to load (offset = -7)
    // Done
    p.halt();
    p
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn self_replicator_is_18_pixels() {
        let p = self_replicator();
        assert_eq!(p.len(), 18, "self-replicator must be exactly 18 pixels");
    }

    #[test]
    fn glyph_encoding() {
        // LDI r0 = opcode 1, stratum 0, p1=0, p2=0
        assert_eq!(glyph(1, 0, 0, 0), 0x00000001);
        // HALT = opcode 13
        assert_eq!(glyph(13, 0, 0, 0), 0x0000000D);
        // BRANCH BNE r2, r4 = opcode 10, stratum 1 (BNE), p1=2, p2=4
        assert_eq!(glyph(10, 1, 2, 4), 0x0402010A);
    }
}
