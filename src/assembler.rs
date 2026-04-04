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
    (opcode as u32) | ((stratum as u32) << 8) | ((p1 as u32) << 16) | ((p2 as u32) << 24)
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
    pub const ENTRY: u8 = 14; // Read entry_point into register
    pub const CHAR: u8 = 15;  // Blit character from font atlas: CHAR r_ascii, r_target
    pub const BLIT: u8 = 16;  // Copy N pixels: BLIT r_src, r_dst [count]
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

    /// Multiply: MUL dst_reg, src_reg  (dst *= src)
    pub fn mul(&mut self, dst_reg: u8, src_reg: u8) -> &mut Self {
        self.instruction(op::MUL, 0, dst_reg, src_reg)
    }

    /// Divide: DIV dst_reg, src_reg  (dst /= src)
    pub fn div(&mut self, dst_reg: u8, src_reg: u8) -> &mut Self {
        self.instruction(op::DIV, 0, dst_reg, src_reg)
    }

    /// Unconditional jump: JMP offset
    /// Emits 2 pixels: [JMP instruction] [offset as i32]
    pub fn jmp(&mut self, offset: i32) -> &mut Self {
        self.instruction(op::JMP, 0, 0, 0);
        self.pixels.push(offset as u32);
        self
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

    /// Entry point: ENTRY rd -- load vm.entry_point into rd
    pub fn entry(&mut self, reg: u8) -> &mut Self {
        self.instruction(op::ENTRY, 0, reg, 0)
    }

    /// Blit character from font atlas: CHAR r_ascii, r_target
    /// Copies 8 row bitmasks from the font atlas at FONT_BASE + (ascii * 8)
    /// to the destination address in r_target.
    pub fn char_blit(&mut self, ascii_reg: u8, target_reg: u8) -> &mut Self {
        self.instruction(op::CHAR, 0, ascii_reg, target_reg)
    }

    /// Blit N pixels: BLIT r_src, r_dst, count
    /// Copies `count` pixels from Hilbert address in r_src to r_dst.
    pub fn blit(&mut self, src_reg: u8, dst_reg: u8, count: u32) -> &mut Self {
        self.instruction(op::BLIT, 0, src_reg, dst_reg);
        self.pixels.push(count);
        self
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
    p.ldi(0, 0); // r0 = 0  (source start address)
    p.ldi(1, 100); // r1 = 100 (destination address)
    p.ldi(2, 0); // r2 = 0 (loop counter)
    p.ldi(3, 1); // r3 = 1 (increment constant)
    p.ldi(4, 18); // r4 = 18 (program length)
                  // Copy loop: addresses 10-16
    p.load(5, 0); // r5 = mem[r0]
    p.store(1, 5); // mem[r1] = r5
    p.add(0, 3); // r0 += 1
    p.add(1, 3); // r1 += 1
    p.add(2, 3); // r2 += 1
    p.bne(2, 4, -7); // if r2 != r4, jump back to load (offset = -7)
                     // Done
    p.halt();
    p
}

/// Build a position-independent self-replicator.
/// Uses ENTRY instruction to discover its own address, then copies
/// itself to entry_point + 100. Chain: 0 -> 100 -> 200 -> 300...
///
/// Layout (19 pixels):
///   addr 0:  ENTRY r0        -- r0 = entry_point (where we are)
///   addr 1:  MOV r1, r0      -- r1 = r0 (copy of base)
///   addr 2:  LDI r6, 100     -- r6 = 100 (offset)
///   addr 3:  DATA 100
///   addr 4:  ADD r1, r6      -- r1 = entry_point + 100 (destination)
///   addr 5:  LDI r2, 0       -- r2 = 0 (loop counter)
///   addr 6:  DATA 0
///   addr 7:  LDI r3, 1       -- r3 = 1 (increment)
///   addr 8:  DATA 1
///   addr 9:  LDI r4, 19      -- r4 = 19 (program length in pixels)
///   addr 10: DATA 19
///   addr 11: LOAD r5, r0     -- r5 = mem[r0]
///   addr 12: STORE r1, r5    -- mem[r1] = r5
///   addr 13: ADD r0, r3      -- r0 += 1
///   addr 14: ADD r1, r3      -- r1 += 1
///   addr 15: ADD r2, r3      -- r2 += 1
///   addr 16: BNE r2, r4, -5  -- if r2 != r4, loop back to LOAD at addr 11
///   addr 17: DATA -5
///   addr 18: HALT
///
/// Total: 19 pixels. The program copies all 19 pixels (including itself).
pub fn chain_replicator() -> Program {
    let mut p = Program::new();
    let prog_len = 19u32; // Must match actual pixel count

    // Setup
    p.entry(0); // r0 = entry_point (source start)
    p.instruction(op::MOV, 0, 1, 0); // MOV r1, r0 (dest = source)
    p.ldi(6, 100); // r6 = 100 (replication offset)
    p.add(1, 6); // r1 += 100 (destination = entry_point + 100)
    p.ldi(2, 0); // r2 = 0 (loop counter)
    p.ldi(3, 1); // r3 = 1 (increment)
    p.ldi(4, prog_len); // r4 = program length

    // Copy loop (starts at address 11)
    p.load(5, 0); // r5 = mem[r0]
    p.store(1, 5); // mem[r1] = r5
    p.add(0, 3); // r0 += 1
    p.add(1, 3); // r1 += 1
    p.add(2, 3); // r2 += 1
    p.bne(2, 4, -5); // if r2 != r4, jump back to LOAD at addr 11

    // Done
    p.halt();

    // Verify length
    assert_eq!(
        p.len(),
        prog_len as usize,
        "chain_replicator must be exactly {prog_len} pixels"
    );
    p
}

/// Build a "HELLO" text rendering program using the CHAR opcode.
///
/// Uses the font atlas at FONT_BASE. Each CHAR instruction blits
/// one character's 8 row bitmasks to a destination address.
///
/// Layout:
///   LDI r0, 'H'     -- 2 pixels
///   LDI r1, 5000    -- 2 pixels (screen address for H)
///   CHAR r0, r1     -- 1 pixel
///   LDI r0, 'E'     -- 2 pixels
///   LDI r1, 5010    -- 2 pixels
///   CHAR r0, r1     -- 1 pixel
///   LDI r0, 'L'     -- 2 pixels
///   LDI r1, 5020    -- 2 pixels
///   CHAR r0, r1     -- 1 pixel
///   LDI r0, 'L'     -- 2 pixels
///   LDI r1, 5030    -- 2 pixels
///   CHAR r0, r1     -- 1 pixel
///   LDI r0, 'O'     -- 2 pixels
///   LDI r1, 5040    -- 2 pixels
///   CHAR r0, r1     -- 1 pixel
///   HALT             -- 1 pixel
/// Total: 22 pixels
pub fn hello_world() -> Program {
    let mut p = Program::new();

    // H
    p.ldi(0, b'H' as u32);
    p.ldi(1, 5000);
    p.char_blit(0, 1);
    // E
    p.ldi(0, b'E' as u32);
    p.ldi(1, 5010);
    p.char_blit(0, 1);
    // L
    p.ldi(0, b'L' as u32);
    p.ldi(1, 5020);
    p.char_blit(0, 1);
    // L
    p.ldi(0, b'L' as u32);
    p.ldi(1, 5030);
    p.char_blit(0, 1);
    // O
    p.ldi(0, b'O' as u32);
    p.ldi(1, 5040);
    p.char_blit(0, 1);

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
    fn chain_replicator_is_19_pixels() {
        let p = chain_replicator();
        assert_eq!(p.len(), 19, "chain-replicator must be exactly 19 pixels");
        // First pixel should be ENTRY r0 (opcode 14, p1=0)
        assert_eq!(p.pixels[0] & 0xFF, 14, "first instruction must be ENTRY");
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

    #[test]
    fn hello_world_is_26_pixels() {
        let p = hello_world();
        // 5 chars: each has LDI ascii(2) + LDI addr(2) + CHAR(1) = 5 pixels
        // Plus 1 HALT = 26 total
        assert_eq!(p.len(), 26, "hello_world must be exactly 26 pixels");
        // Should contain CHAR opcodes (opcode 15)
        let char_count = p.pixels.iter().filter(|&&px| (px & 0xFF) == 15).count();
        assert_eq!(char_count, 5, "hello_world should have 5 CHAR instructions");
    }
}
