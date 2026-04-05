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
    pub const SEND: u8 = 17;  // IPC send: SEND r_target_vm, r_data_addr [length]
    pub const RECV: u8 = 18;  // IPC recv: RECV r_dest_addr, r_status
    pub const SHR: u8 = 19;  // Shift right: SHR rd, rs  (rd >>= rs)
    pub const OR: u8 = 20;     // Bitwise OR: OR rd, rs   (rd |= rs)
    pub const CHAR_AT: u8 = 21; // Blit char from arbitrary atlas: CHAR_AT r_ascii, r_target, r_atlas_base
    pub const GLYPH_DEF: u8 = 22; // Define live glyph: GLYPH_DEF r_charcode, r_bitmap_addr
    pub const PSET: u8 = 23; // Write pixel to screen: PSET r_x, r_y, r_color
    pub const PGET: u8 = 24; // Read pixel from screen: PGET r_dst, r_x, r_y
    pub const AND: u8 = 25;  // Bitwise AND: AND rd, rs  (rd &= rs)
    pub const SHL: u8 = 26;  // Shift left: SHL rd, rs   (rd <<= rs)
    pub const FRAME: u8 = 27; // Film strip frame jump: FRAME r_target (jump to frame index in r_target)
    pub const WAIT_EVENT: u8 = 28; // Block until event arrives: WAIT_EVENT r_event_type, r_param1
    pub const DRAW: u8 = 215; // Legacy alias (unused)
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

    /// Shift right: SHR dst_reg, src_reg  (dst >>= src)
    pub fn shr(&mut self, dst_reg: u8, src_reg: u8) -> &mut Self {
        self.instruction(op::SHR, 0, dst_reg, src_reg)
    }

    /// Bitwise OR: OR dst_reg, src_reg  (dst |= src)
    pub fn or(&mut self, dst_reg: u8, src_reg: u8) -> &mut Self {
        self.instruction(op::OR, 0, dst_reg, src_reg)
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

    /// Blit character from arbitrary atlas: CHAR_AT r_ascii, r_target, r_atlas_base
    /// Like CHAR but reads from atlas_base + (ascii * 8) instead of hardcoded FONT_BASE.
    /// Uses p2 for atlas_base (encoded as a third operand via the stratum trick).
    pub fn char_at_blit(&mut self, ascii_reg: u8, target_reg: u8, atlas_base_reg: u8) -> &mut Self {
        self.instruction(op::CHAR_AT, atlas_base_reg, ascii_reg, target_reg)
    }

    /// Define a live glyph: GLYPH_DEF r_charcode, r_bitmap_addr
    /// Reads 8 row bitmasks from the address in r_bitmap_addr and writes them
    /// to the live glyph atlas at 0x00F20000 + ((charcode - 128) * 8).
    /// Charcodes 128-255 are valid.
    pub fn glyph_def(&mut self, charcode_reg: u8, bitmap_addr_reg: u8) -> &mut Self {
        self.instruction(op::GLYPH_DEF, 0, charcode_reg, bitmap_addr_reg)
    }

    /// Blit N pixels: BLIT r_src, r_dst, count
    /// Copies `count` pixels from Hilbert address in r_src to r_dst.
    pub fn blit(&mut self, src_reg: u8, dst_reg: u8, count: u32) -> &mut Self {
        self.instruction(op::BLIT, 0, src_reg, dst_reg);
        self.pixels.push(count);
        self
    }

    /// IPC Send: SEND r_target_vm, r_data_addr, length
    /// Sends `length` data pixels from Hilbert address in r_data_addr to the
    /// mailbox of VM whose ID is in r_target_vm.
    /// Emits 2 pixels: [SEND instruction] [length as u32]
    pub fn send(&mut self, target_vm_reg: u8, data_addr_reg: u8, length: u32) -> &mut Self {
        self.instruction(op::SEND, 0, target_vm_reg, data_addr_reg);
        self.pixels.push(length);
        self
    }

    /// IPC Receive: RECV r_dest_addr, r_status
    /// Checks this VM's mailbox. On success r_status = 1 and data is copied
    /// to the Hilbert address in r_dest_addr. On empty mailbox r_status = 0.
    pub fn recv(&mut self, dest_addr_reg: u8, status_reg: u8) -> &mut Self {
        self.instruction(op::RECV, 0, dest_addr_reg, status_reg)
    }

    /// Write pixel to screen: PSET r_x, r_y, r_color
    /// Encoding: glyph(23, r_color, r_x, r_y) -- stratum = color register
    pub fn pset(&mut self, x_reg: u8, y_reg: u8, color_reg: u8) -> &mut Self {
        self.instruction(op::PSET, color_reg, x_reg, y_reg)
    }

    /// Read pixel from screen: PGET r_dst, r_x, r_y
    /// Encoding: glyph(24, r_y, r_dst, r_x)
    pub fn pget(&mut self, dst_reg: u8, x_reg: u8, y_reg: u8) -> &mut Self {
        self.instruction(op::PGET, y_reg, dst_reg, x_reg)
    }

    /// Bitwise AND: AND rd, rs  (rd &= rs)
    pub fn and(&mut self, dst_reg: u8, src_reg: u8) -> &mut Self {
        self.instruction(op::AND, 0, dst_reg, src_reg)
    }

    /// Shift left: SHL rd, rs  (rd <<= rs)
    pub fn shl(&mut self, dst_reg: u8, src_reg: u8) -> &mut Self {
        self.instruction(op::SHL, 0, dst_reg, src_reg)
    }

    /// Film strip frame jump: FRAME r_target
    /// Encoding: glyph(27, 0, r_target, 0)
    /// Sets frame_ptr to the value in r_target and jumps PC to the start of that frame.
    /// If r_target is out of range, the VM faults.
    pub fn frame(&mut self, target_reg: u8) -> &mut Self {
        self.instruction(op::FRAME, 0, target_reg, 0)
    }

    /// Spawn a child VM: SPAWN r_base_addr, r_entry_offset
    /// Deferred: stores spawn params in parent's regs[125-127].
    /// Post-frame, the host initializes the child VM.
    /// Returns child VM ID in r_base_addr, or 0xFF if no slot available.
    /// Child VM ID = parent_id + 1 (must be < MAX_VMS=8).
    pub fn spawn(&mut self, base_addr_reg: u8, entry_offset_reg: u8) -> &mut Self {
        self.instruction(op::SPAWN, 0, base_addr_reg, entry_offset_reg)
    }

    /// Yield execution: YIELD
    /// VM transitions to WAITING state and exits the frame early.
    /// On next frame, the VM resumes in RUNNING state.
    pub fn yield_op(&mut self) -> &mut Self {
        self.instruction(op::YIELD, 0, 0, 0)
    }

    /// WAIT_EVENT: Block until event arrives. r_event_type, r_param1
    pub fn wait_event(&mut self, event_type_reg: u8, param1_reg: u8) -> &mut Self {
        self.instruction(op::WAIT_EVENT, event_type_reg, param1_reg, 0)
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


/// Build a bold font atlas generator program.
///
/// Reads the seed font atlas at FONT_BASE (0x00F00000), creates a bold variant
/// by OR-ing each row bitmask with itself shifted right 1 bit, and writes the
/// result to FONT_BASE + 0x10000 (0x00F10000 = DERIVED_ATLAS_BASE).
///
/// Algorithm (pseudocode):
///   for char in 0..128:
///     for row in 0..8:
///       src = FONT_BASE + char*8 + row
///       dst = DERIVED_ATLAS_BASE + char*8 + row
///       bold = mem[src] | (mem[src] >> 1)
///       mem[dst] = bold
///
/// Register allocation:
///   r0  = char counter (0..128)
///   r1  = row counter (0..8)
///   r2  = computed src address
///   r3  = computed dst address
///   r4  = original row bitmask
///   r5  = shifted copy (row >> 1)
///   r6  = constant 1
///   r7  = constant 128 (FONT_CHARS)
///   r8  = constant 8 (FONT_CHAR_HEIGHT)
///   r9  = FONT_BASE (0x00F00000)
///   r10 = DERIVED_ATLAS_BASE (0x00F10000)
///   r11 = shift amount (1)
///
/// Layout (34 pixels):
///   addr 0-1:   LDI r0, 0
///   addr 2-3:   LDI r6, 1
///   addr 4-5:   LDI r7, 128
///   addr 6-7:   LDI r8, 8
///   addr 8-9:   LDI r9, FONT_BASE
///   addr 10-11: LDI r10, DERIVED_ATLAS_BASE
///   addr 12-13: LDI r11, 1
///   --- outer loop (char) ---
///   addr 14-15: LDI r1, 0        ; row = 0
///   --- inner loop (row) ---
///   addr 16:    MOV r2, r0       ; r2 = char
///   addr 17:    MUL r2, r8       ; r2 = char * 8
///   addr 18:    ADD r2, r1       ; r2 = char * 8 + row
///   addr 19:    MOV r3, r2       ; r3 = char * 8 + row (copy for dst)
///   addr 20:    ADD r2, r9       ; r2 = FONT_BASE + offset (src)
///   addr 21:    ADD r3, r10      ; r3 = DERIVED_ATLAS_BASE + offset (dst)
///   addr 22:    LOAD r4, r2      ; r4 = original row bitmask
///   addr 23:    MOV r5, r4       ; r5 = copy
///   addr 24:    SHR r5, r11      ; r5 = row >> 1
///   addr 25:    OR r4, r5        ; r4 = row | (row >> 1) = bold
///   addr 26:    STORE r3, r4     ; mem[dst] = bold
///   addr 27:    ADD r1, r6       ; row++
///   addr 28-29: BNE r1, r8, -12 ; if row != 8, back to addr 16
///   addr 30:    ADD r0, r6       ; char++
///   addr 31-32: BNE r0, r7, -17 ; if char != 128, back to addr 14
///   addr 33:    HALT
pub fn bold_atlas_builder() -> Program {
    use crate::font_atlas::{FONT_BASE, FONT_CHARS, FONT_CHAR_HEIGHT};

    let derived_base = FONT_BASE + 0x10000;
    let mut p = Program::new();

    // Setup constants
    p.ldi(0, 0);                           // r0 = char counter = 0
    p.ldi(6, 1);                           // r6 = 1 (increment)
    p.ldi(7, FONT_CHARS);                  // r7 = 128 (char limit)
    p.ldi(8, FONT_CHAR_HEIGHT);            // r8 = 8 (row limit)
    p.ldi(9, FONT_BASE);                   // r9 = FONT_BASE
    p.ldi(10, derived_base);               // r10 = DERIVED_ATLAS_BASE
    p.ldi(11, 1);                          // r11 = 1 (shift amount)

    // Outer loop: iterate over 128 chars
    // addr 14
    p.ldi(1, 0);                           // r1 = row = 0

    // Inner loop: iterate over 8 rows per char
    // addr 16
    p.instruction(op::MOV, 0, 2, 0);       // MOV r2, r0 (r2 = char)
    p.mul(2, 8);                           // r2 = char * 8
    p.add(2, 1);                           // r2 = char * 8 + row
    p.instruction(op::MOV, 0, 3, 2);       // MOV r3, r2 (copy for dst)
    p.add(2, 9);                           // r2 = FONT_BASE + offset (src addr)
    p.add(3, 10);                          // r3 = DERIVED_ATLAS_BASE + offset (dst addr)
    p.load(4, 2);                          // r4 = mem[r2] = original row bitmask
    p.instruction(op::MOV, 0, 5, 4);       // MOV r5, r4 (copy for shift)
    p.shr(5, 11);                          // r5 = row >> 1
    p.or(4, 5);                            // r4 = row | (row >> 1) = bold
    p.store(3, 4);                         // mem[r3] = bold
    p.add(1, 6);                           // row++
    p.bne(1, 8, -12);                      // if row != 8, jump to addr 16

    // Continue outer loop
    p.add(0, 6);                           // char++
    p.bne(0, 7, -17);                      // if char != 128, jump to addr 14

    p.halt();

    assert_eq!(p.len(), 34, "bold_atlas_builder must be exactly 34 pixels, got {}", p.len());
    p
}

// ─── Text Assembler: Parse .gasm text files into pixel programs ───
//
// Syntax (one instruction per line):
//   LDI r0, 42          ; load immediate
//   MOV r1, r0          ; move register
//   LOAD r5, r0         ; load from memory (alias: LD)
//   STORE r1, r5        ; store to memory (alias: ST)
//   ADD r0, r1           ; add
//   SUB r0, r1           ; subtract
//   MUL r0, r1           ; multiply
//   DIV r0, r1           ; divide
//   JMP -5               ; unconditional jump (relative offset)
//   BEQ r0, r1, -3       ; branch if equal
//   BNE r0, r1, -3       ; branch if not equal
//   BLT r0, r1, -3       ; branch if less than (signed)
//   BGE r0, r1, -3       ; branch if greater or equal (signed)
//   BLTU r0, r1, -3      ; branch if less than (unsigned)
//   BGEU r0, r1, -3      ; branch if greater or equal (unsigned)
//   CALL 100             ; call subroutine (absolute address)
//   RET                  ; return
//   HALT                 ; halt
//   ENTRY r0             ; load entry point
//   CHAR r0, r1          ; blit character
//   CHAR_AT r0, r1, r2   ; blit char from arbitrary atlas
//   BLIT r0, r1, 8       ; blit N pixels
//   NOP                  ; no-op
//   DATA 42              ; raw 32-bit data word
//
// Comments: ; or // (to end of line)
// Blank lines are ignored.
// Register syntax: r0-r127 (case-insensitive, also R0-R127)
// Numbers: decimal, 0xHEX, 0bBINARY, 'c' for ASCII char

/// Parse error with line number and message
#[derive(Debug, Clone)]
pub struct ParseError {
    pub line: usize,
    pub message: String,
}

impl std::fmt::Display for ParseError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "line {}: {}", self.line, self.message)
    }
}

impl std::error::Error for ParseError {}

/// Parse a .gasm text string into a Program (Vec<u32> of pixels).
pub fn parse_gasm(source: &str) -> Result<Program, ParseError> {
    let mut program = Program::new();

    for (line_num, raw_line) in source.lines().enumerate() {
        let line_num = line_num + 1; // 1-indexed

        // Strip comments
        let line = strip_comment(raw_line).trim();
        if line.is_empty() {
            continue;
        }

        // Tokenize: split on whitespace and commas
        let tokens = tokenize(line);
        if tokens.is_empty() {
            continue;
        }

        let mnemonic = tokens[0].to_uppercase();

        match mnemonic.as_str() {
            "NOP" => {
                expect_arg_count(&tokens, 0, line_num)?;
                program.instruction(op::NOP, 0, 0, 0);
            }

            "LDI" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let reg = parse_register(tokens[1], line_num)?;
                let value = parse_value(tokens[2], line_num)?;
                program.ldi(reg, value);
            }

            "MOV" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let rd = parse_register(tokens[1], line_num)?;
                let rs = parse_register(tokens[2], line_num)?;
                program.instruction(op::MOV, 0, rd, rs);
            }

            "LOAD" | "LD" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let rd = parse_register(tokens[1], line_num)?;
                let rs = parse_register(tokens[2], line_num)?;
                program.instruction(op::LOAD, 0, rd, rs);
            }

            "STORE" | "ST" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let addr_reg = parse_register(tokens[1], line_num)?;
                let src_reg = parse_register(tokens[2], line_num)?;
                program.instruction(op::STORE, 0, addr_reg, src_reg);
            }

            "ADD" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let rd = parse_register(tokens[1], line_num)?;
                let rs = parse_register(tokens[2], line_num)?;
                program.instruction(op::ADD, 0, rd, rs);
            }

            "SUB" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let rd = parse_register(tokens[1], line_num)?;
                let rs = parse_register(tokens[2], line_num)?;
                program.instruction(op::SUB, 0, rd, rs);
            }

            "MUL" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let rd = parse_register(tokens[1], line_num)?;
                let rs = parse_register(tokens[2], line_num)?;
                program.instruction(op::MUL, 0, rd, rs);
            }

            "DIV" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let rd = parse_register(tokens[1], line_num)?;
                let rs = parse_register(tokens[2], line_num)?;
                program.instruction(op::DIV, 0, rd, rs);
            }

            "SHR" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let rd = parse_register(tokens[1], line_num)?;
                let rs = parse_register(tokens[2], line_num)?;
                program.instruction(op::SHR, 0, rd, rs);
            }

            "OR" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let rd = parse_register(tokens[1], line_num)?;
                let rs = parse_register(tokens[2], line_num)?;
                program.instruction(op::OR, 0, rd, rs);
            }

            "JMP" => {
                expect_arg_count(&tokens, 1, line_num)?;
                let offset = parse_signed_value(tokens[1], line_num)?;
                program.jmp(offset);
            }

            "BEQ" | "BNE" | "BLT" | "BGE" | "BLTU" | "BGEU" => {
                expect_arg_count(&tokens, 3, line_num)?;
                let cond = parse_branch_cond(&mnemonic, line_num)?;
                let r1 = parse_register(tokens[1], line_num)?;
                let r2 = parse_register(tokens[2], line_num)?;
                let offset = parse_signed_value(tokens[3], line_num)?;
                program.branch(cond, r1, r2, offset);
            }

            "BRANCH" => {
                // Generic: BRANCH cond, r1, r2, offset
                expect_arg_count(&tokens, 4, line_num)?;
                let cond = parse_branch_cond(tokens[1], line_num)?;
                let r1 = parse_register(tokens[2], line_num)?;
                let r2 = parse_register(tokens[3], line_num)?;
                let offset = parse_signed_value(tokens[4], line_num)?;
                program.branch(cond, r1, r2, offset);
            }

            "CALL" => {
                expect_arg_count(&tokens, 1, line_num)?;
                let addr = parse_value(tokens[1], line_num)?;
                program.instruction(op::CALL, 0, 0, 0);
                program.pixels.push(addr);
            }

            "RET" => {
                expect_arg_count(&tokens, 0, line_num)?;
                program.instruction(op::RET, 0, 0, 0);
            }

            "HALT" => {
                expect_arg_count(&tokens, 0, line_num)?;
                program.halt();
            }

            "ENTRY" => {
                expect_arg_count(&tokens, 1, line_num)?;
                let reg = parse_register(tokens[1], line_num)?;
                program.entry(reg);
            }

            "CHAR" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let ascii_reg = parse_register(tokens[1], line_num)?;
                let target_reg = parse_register(tokens[2], line_num)?;
                program.char_blit(ascii_reg, target_reg);
            }

            "CHAR_AT" => {
                expect_arg_count(&tokens, 3, line_num)?;
                let ascii_reg = parse_register(tokens[1], line_num)?;
                let target_reg = parse_register(tokens[2], line_num)?;
                let atlas_base_reg = parse_register(tokens[3], line_num)?;
                program.char_at_blit(ascii_reg, target_reg, atlas_base_reg);
            }

            "GLYPH_DEF" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let charcode_reg = parse_register(tokens[1], line_num)?;
                let bitmap_addr_reg = parse_register(tokens[2], line_num)?;
                program.glyph_def(charcode_reg, bitmap_addr_reg);
            }

            "BLIT" => {
                expect_arg_count(&tokens, 3, line_num)?;
                let src_reg = parse_register(tokens[1], line_num)?;
                let dst_reg = parse_register(tokens[2], line_num)?;
                let count = parse_value(tokens[3], line_num)?;
                program.blit(src_reg, dst_reg, count);
            }

            "DATA" => {
                expect_arg_count(&tokens, 1, line_num)?;
                let value = parse_signed_value(tokens[1], line_num)?;
                program.pixels.push(value as u32);
            }

            "SPAWN" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let base_addr_reg = parse_register(tokens[1], line_num)?;
                let entry_offset_reg = parse_register(tokens[2], line_num)?;
                program.spawn(base_addr_reg, entry_offset_reg);
            }

            "YIELD" => {
                expect_arg_count(&tokens, 0, line_num)?;
                program.yield_op();
            }

            "SEND" => {
                expect_arg_count(&tokens, 3, line_num)?;
                let target_vm_reg = parse_register(tokens[1], line_num)?;
                let data_addr_reg = parse_register(tokens[2], line_num)?;
                let length = parse_value(tokens[3], line_num)?;
                program.send(target_vm_reg, data_addr_reg, length);
            }

            "RECV" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let dest_addr_reg = parse_register(tokens[1], line_num)?;
                let status_reg = parse_register(tokens[2], line_num)?;
                program.recv(dest_addr_reg, status_reg);
            }

            "FRAME" => {
                expect_arg_count(&tokens, 1, line_num)?;
                let target_reg = parse_register(tokens[1], line_num)?;
                program.frame(target_reg);
            }

            _ => {
                return Err(ParseError {
                    line: line_num,
                    message: format!("unknown mnemonic: '{}'", tokens[0]),
                });
            }
        }
    }

    Ok(program)
}

/// Parse a .gasm file from disk.
#[allow(dead_code)]
pub fn parse_gasm_file(path: &str) -> Result<Program, ParseError> {
    let source = std::fs::read_to_string(path).map_err(|e| ParseError {
        line: 0,
        message: format!("failed to read {}: {}", path, e),
    })?;
    parse_gasm(&source)
}

// ─── Internal helpers ───

/// Strip comments (// or ;) from a line.
fn strip_comment(line: &str) -> &str {
    // Find the first // or ; that isn't inside a char literal
    let mut chars = line.char_indices().peekable();
    while let Some((i, c)) = chars.next() {
        if c == '\'' {
            // Skip char literal: 'X' or '\n' etc.
            if chars.peek().is_some() {
                chars.next(); // the character or backslash
                if chars.peek().map(|(_, c)| *c) == Some('\'') {
                    chars.next(); // closing quote
                    continue;
                }
            }
        }
        if c == ';' {
            return &line[..i];
        }
        if c == '/' && chars.peek().map(|(_, c)| *c) == Some('/') {
            return &line[..i];
        }
    }
    line
}

/// Tokenize a line: split on whitespace and commas, but preserve char literals like 'H'.
fn tokenize(line: &str) -> Vec<&str> {
    let mut tokens = Vec::new();
    let mut start = None;
    let chars = line.as_bytes();
    let len = chars.len();
    let mut i = 0;

    while i < len {
        let c = chars[i] as char;
        if c == '\'' {
            // Char literal: find closing quote
            if let Some(s) = start {
                // flush previous token
                tokens.push(&line[s..i]);
                start = None;
            }
            let literal_start = i;
            i += 1; // skip opening quote
            // Find closing quote
            while i < len && (chars[i] as char) != '\'' {
                i += 1;
            }
            if i < len {
                i += 1; // include closing quote
            }
            tokens.push(&line[literal_start..i]);
            continue;
        }
        if c.is_whitespace() || c == ',' {
            if let Some(s) = start {
                tokens.push(&line[s..i]);
                start = None;
            }
            i += 1;
        } else {
            if start.is_none() {
                start = Some(i);
            }
            i += 1;
        }
    }
    if let Some(s) = start {
        tokens.push(&line[s..]);
    }
    tokens
}

fn expect_arg_count(tokens: &[&str], expected: usize, line: usize) -> Result<(), ParseError> {
    // tokens[0] = mnemonic, tokens[1..] = args
    let actual = tokens.len() - 1;
    if actual != expected {
        Err(ParseError {
            line,
            message: format!(
                "expected {} argument(s), got {}",
                expected, actual
            ),
        })
    } else {
        Ok(())
    }
}

/// Parse a register: r0-r127 (case-insensitive).
fn parse_register(token: &str, line: usize) -> Result<u8, ParseError> {
    let lower = token.to_lowercase();
    if !lower.starts_with('r') {
        return Err(ParseError {
            line,
            message: format!("expected register (r0-r127), got '{}'", token),
        });
    }
    let num: u8 = lower[1..]
        .parse()
        .map_err(|_| ParseError {
            line,
            message: format!("invalid register number: '{}'", token),
        })?;
    if num > 127 {
        return Err(ParseError {
            line,
            message: format!("register out of range (0-127): '{}'", token),
        });
    }
    Ok(num)
}

/// Parse an unsigned value: decimal, 0xHEX, 0bBINARY, or 'c' for ASCII.
fn parse_value(token: &str, line: usize) -> Result<u32, ParseError> {
    // Char literal
    if token.starts_with('\'') && token.ends_with('\'') && token.len() >= 3 {
        let inner = &token[1..token.len() - 1];
        let ch = if inner.starts_with('\\') {
            match inner.get(1..) {
                Some("n") => '\n',
                Some("r") => '\r',
                Some("t") => '\t',
                Some("\\") => '\\',
                Some("'") => '\'',
                Some("0") => '\0',
                _ => {
                    return Err(ParseError {
                        line,
                        message: format!("unknown escape sequence: '{}'", inner),
                    })
                }
            }
        } else {
            inner
                .chars()
                .next()
                .ok_or_else(|| ParseError {
                    line,
                    message: format!("empty char literal: '{}'", token),
                })?
        };
        return Ok(ch as u32);
    }

    // Numeric
    let val: u32 = if let Some(hex) = token.strip_prefix("0x").or_else(|| token.strip_prefix("0X"))
    {
        u32::from_str_radix(hex, 16)
    } else if let Some(bin) = token.strip_prefix("0b").or_else(|| token.strip_prefix("0B")) {
        u32::from_str_radix(bin, 2)
    } else {
        token.parse()
    }
    .map_err(|_| ParseError {
        line,
        message: format!("invalid number: '{}'", token),
    })?;
    Ok(val)
}

/// Parse a signed value (for JMP offsets, DATA, etc).
fn parse_signed_value(token: &str, line: usize) -> Result<i32, ParseError> {
    // Char literal -> u32 -> i32
    if token.starts_with('\'') {
        let uval = parse_value(token, line)?;
        return Ok(uval as i32);
    }

    // Try signed decimal first
    if let Ok(val) = token.parse::<i32>() {
        return Ok(val);
    }

    // Try hex/bin as unsigned -> cast
    let uval = parse_value(token, line)?;
    Ok(uval as i32)
}

/// Parse a branch condition mnemonic to its bcond value.
fn parse_branch_cond(token: &str, line: usize) -> Result<u8, ParseError> {
    match token.to_uppercase().as_str() {
        "BEQ" | "0" => Ok(bcond::BEQ),
        "BNE" | "1" => Ok(bcond::BNE),
        "BLT" | "2" => Ok(bcond::BLT),
        "BGE" | "3" => Ok(bcond::BGE),
        "BLTU" | "4" => Ok(bcond::BLTU),
        "BGEU" | "5" => Ok(bcond::BGEU),
        _ => Err(ParseError {
            line,
            message: format!("unknown branch condition: '{}'", token),
        }),
    }
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

    // ─── Text assembler (.gasm) tests ───

    #[test]
    fn gasm_ldi_halt() {
        let src = "LDI r0, 42\nHALT";
        let p = parse_gasm(src).unwrap();
        // LDI r0, 42 = 2 pixels (instruction + data), HALT = 1 pixel
        assert_eq!(p.len(), 3);
        assert_eq!(p.pixels[0] & 0xFF, op::LDI as u32); // opcode
        assert_eq!(p.pixels[1], 42); // immediate value
        assert_eq!(p.pixels[2] & 0xFF, op::HALT as u32); // HALT
    }

    #[test]
    fn gasm_basic_arithmetic() {
        let src = "\
            LDI r0, 10\n\
            LDI r1, 20\n\
            ADD r0, r1\n\
            HALT";
        let p = parse_gasm(src).unwrap();
        let expected = {
            let mut prog = Program::new();
            prog.ldi(0, 10);
            prog.ldi(1, 20);
            prog.add(0, 1);
            prog.halt();
            prog
        };
        assert_eq!(p.pixels, expected.pixels);
    }

    #[test]
    fn gasm_comments_and_blank_lines() {
        let src = "\
            ; This is a comment\n\
            LDI r0, 5  // inline comment\n\
            \n\
            HALT ; end";
        let p = parse_gasm(src).unwrap();
        assert_eq!(p.len(), 3); // LDI(2) + HALT(1)
        assert_eq!(p.pixels[1], 5);
    }

    #[test]
    fn gasm_char_literal() {
        let src = "LDI r0, 'H'\nHALT";
        let p = parse_gasm(src).unwrap();
        assert_eq!(p.pixels[1], b'H' as u32);
    }

    #[test]
    fn gasm_hex_and_binary() {
        let src = "LDI r0, 0xFF\nLDI r1, 0b1010\nHALT";
        let p = parse_gasm(src).unwrap();
        assert_eq!(p.pixels[1], 255);
        assert_eq!(p.pixels[3], 10);
    }

    #[test]
    fn gasm_self_replicator_from_text() {
        // Write the self-replicator as .gasm text
        let src = "\
            LDI r0, 0\n\
            LDI r1, 100\n\
            LDI r2, 0\n\
            LDI r3, 1\n\
            LDI r4, 18\n\
            LOAD r5, r0\n\
            STORE r1, r5\n\
            ADD r0, r3\n\
            ADD r1, r3\n\
            ADD r2, r3\n\
            BNE r2, r4, -7\n\
            HALT";
        let p = parse_gasm(src).unwrap();
        let expected = self_replicator();
        assert_eq!(p.pixels, expected.pixels);
        assert_eq!(p.len(), 18);
    }

    #[test]
    fn gasm_mov_store_load() {
        let src = "\
            LDI r0, 77\n\
            MOV r1, r0\n\
            LDI r2, 200\n\
            STORE r2, r1\n\
            LOAD r3, r2\n\
            HALT";
        let p = parse_gasm(src).unwrap();
        let expected = {
            let mut prog = Program::new();
            prog.ldi(0, 77);
            prog.instruction(op::MOV, 0, 1, 0); // MOV r1, r0
            prog.ldi(2, 200);
            prog.store(2, 1);
            prog.load(3, 2);
            prog.halt();
            prog
        };
        assert_eq!(p.pixels, expected.pixels);
    }

    #[test]
    fn gasm_call_ret() {
        let src = "\
            LDI r0, 42\n\
            CALL 10\n\
            HALT\n\
            ADD r0, r0\n\
            RET";
        let p = parse_gasm(src).unwrap();
        // Verify CALL emits opcode 11 + address 10
        // LDI r0,42 = pixels 0,1; CALL = pixel 2 (opcode 11), pixel 3 (addr=10)
        assert_eq!((p.pixels[2] & 0xFF) as u8, op::CALL);
        assert_eq!(p.pixels[3], 10);
        // Verify RET is emitted
        let has_ret = p.pixels.iter().any(|&px| (px & 0xFF) == op::RET as u32);
        assert!(has_ret, "program should contain a RET instruction");
    }

    #[test]
    fn gasm_entry_char_blit() {
        let src = "\
            ENTRY r0\n\
            LDI r1, 'A'\n\
            LDI r2, 5000\n\
            CHAR r1, r2\n\
            BLIT r0, r2, 8\n\
            HALT";
        let p = parse_gasm(src).unwrap();
        let expected = {
            let mut prog = Program::new();
            prog.entry(0);
            prog.ldi(1, b'A' as u32);
            prog.ldi(2, 5000);
            prog.char_blit(1, 2);
            prog.blit(0, 2, 8);
            prog.halt();
            prog
        };
        assert_eq!(p.pixels, expected.pixels);
    }

    #[test]
    fn gasm_unknown_mnemonic_error() {
        let src = "INVALID r0, r1";
        let err = parse_gasm(src).unwrap_err();
        assert_eq!(err.line, 1);
        assert!(err.message.contains("unknown mnemonic"));
    }

    #[test]
    fn gasm_bad_register_error() {
        let src = "LDI x0, 42";
        let err = parse_gasm(src).unwrap_err();
        assert_eq!(err.line, 1);
        assert!(err.message.contains("register"));
    }

    #[test]
    fn gasm_wrong_arg_count_error() {
        let src = "LDI r0";
        let err = parse_gasm(src).unwrap_err();
        assert_eq!(err.line, 1);
        assert!(err.message.contains("argument"));
    }

    #[test]
    fn gasm_nop() {
        let src = "NOP\nHALT";
        let p = parse_gasm(src).unwrap();
        assert_eq!(p.pixels[0] & 0xFF, op::NOP as u32);
    }

    #[test]
    fn gasm_case_insensitive_mnemonics() {
        let src = "ldi R0, 42\nhalt";
        let p = parse_gasm(src).unwrap();
        assert_eq!(p.pixels[1], 42);
    }

    #[test]
    fn gasm_aliases_ld_st() {
        let src = "\
            LDI r0, 99\n\
            LDI r1, 50\n\
            ST r1, r0\n\
            LD r2, r1\n\
            HALT";
        let p = parse_gasm(src).unwrap();
        // ST should produce opcode 4 (STORE), LD should produce opcode 3 (LOAD)
        let has_store = p.pixels.iter().any(|&px| (px & 0xFF) == op::STORE as u32);
        let has_load = p.pixels.iter().any(|&px| (px & 0xFF) == op::LOAD as u32);
        assert!(has_store);
        assert!(has_load);
    }
}
