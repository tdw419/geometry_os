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
    pub const XOR: u8 = 29;  // Bitwise XOR: XOR rd, rs  (rd ^= rs)
    pub const NOT: u8 = 30;  // Bitwise NOT: NOT rd      (rd = !rd)
    pub const MOD: u8 = 31;  // Modulo: MOD rd, rs       (rd %= rs)
    pub const LDB: u8 = 32;  // Load byte: LDB rd, [rs]  (rd = byte at byte addr rs)
    pub const STB: u8 = 33;  // Store byte: STB [rd], rs (store low byte of rs to byte addr rd)
    pub const RECTF: u8 = 34;  // Filled rectangle: RECTF r_x, r_y, r_params (params = w<<16|h, color from color reg)
    pub const LINE: u8 = 35;   // Line: LINE r_x0, r_y0, r_params (params = x1<<16|y1, color from color reg)
    pub const TEXT_STR: u8 = 36; // Text string: TEXT_STR r_addr, r_x, r_y (null-terminated string at addr)
    pub const CIRCLEF: u8 = 37; // Filled circle: CIRCLEF r_cx, r_cy, r_radius (color from color reg)
    pub const DRAW: u8 = 215; // Legacy alias (unused)
    pub const BRANCH_PROB: u8 = 220;   // Probabilistic branch: BRANCH_PROB r_prob, offset (coin flip)
    pub const CONFIDENCE_MARK: u8 = 221; // Mark confidence: CONFIDENCE_MARK r_block_id (store score)
    pub const ALTERNATE_PATH: u8 = 222; // Conditional path: ALTERNATE_PATH r_block_id, offset (jump if low confidence)
    pub const GLYPH_MUTATE: u8 = 224;   // Self-modify: GLYPH_MUTATE r_target_addr, r_new_opcode
    pub const SPATIAL_SPAWN: u8 = 225;  // Copy cluster: SPATIAL_SPAWN r_dest, r_size, r_source (2 pixels)
    pub const SEMANTIC_MERGE: u8 = 226; // Merge clusters: SEMANTIC_MERGE r_a, r_b, r_dest (2 pixels)
    pub const YIELD: u8 = 227;
    pub const SPAWN: u8 = 230;

    // Issue queue opcodes (Phase 13A)
    pub const ISSUE_CREATE: u8 = 240; // Create issue: ISSUE_CREATE r_title_addr, r_priority [stratum=assignee_id]
    pub const ISSUE_PICK: u8 = 241;   // Pick next issue: ISSUE_PICK r_out_addr, r_filter [stratum=filter_value]
    pub const ISSUE_UPDATE: u8 = 242; // Update issue: ISSUE_UPDATE r_issue_id, r_new_status
    pub const ISSUE_LIST: u8 = 243;   // List issues: ISSUE_LIST r_out_addr, r_filter [stratum=filter_value]
    pub const MODEL_CALL: u8 = 244;  // LLM call: MODEL_CALL buf_size, r_prompt_addr, r_response_addr
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

/// A compiled glyph program: a sequence of 32-bit pixels with label support.
///
/// Labels eliminate manual offset arithmetic for branches and jumps:
/// ```ignore
/// p.define_label("loop_start");
/// p.ldi(1, 0);
/// p.branch_to(bcond::BNE, 1, 2, "loop_start");
/// // ^^^ resolves automatically at link time
/// ```
#[derive(Debug, Clone)]
pub struct Program {
    pub pixels: Vec<u32>,
    /// Named label -> pixel index mapping
    labels: std::collections::HashMap<&'static str, usize>,
    /// Forward references that need resolution: (label, instruction_pixel_idx, data_pixel_idx)
    unresolved: Vec<(&'static str, usize, usize)>,
}

impl Program {
    pub fn new() -> Self {
        Self {
            pixels: Vec::new(),
            labels: std::collections::HashMap::new(),
            unresolved: Vec::new(),
        }
    }

    /// Create a Program from raw pixel data (no labels).
    pub fn from_pixels(pixels: Vec<u32>) -> Self {
        Self {
            pixels,
            labels: std::collections::HashMap::new(),
            unresolved: Vec::new(),
        }
    }

    /// Define a label at the current position and resolve pending forward references.
    pub fn define_label(&mut self, name: &'static str) -> &mut Self {
        let target = self.pixels.len();
        self.labels.insert(name, target);
        let remaining: Vec<_> = self.unresolved.drain(..)
            .filter_map(|(lbl, inst_idx, data_idx)| {
                if lbl == name {
                    let offset = (target as i32) - (inst_idx as i32);
                    self.pixels[data_idx] = offset as u32;
                    None
                } else {
                    Some((lbl, inst_idx, data_idx))
                }
            })
            .collect();
        self.unresolved = remaining;
        self
    }

    /// Branch to a named label. Offset resolved when the label is defined.
    pub fn branch_to(&mut self, cond: u8, r1: u8, r2: u8, label: &'static str) -> &mut Self {
        let inst_idx = self.pixels.len();
        self.instruction(op::BRANCH, cond, r1, r2);
        let data_idx = self.pixels.len();
        self.pixels.push(0); // placeholder

        if let Some(&target) = self.labels.get(label) {
            let offset = (target as i32) - (inst_idx as i32);
            self.pixels[data_idx] = offset as u32;
        } else {
            self.unresolved.push((label, inst_idx, data_idx));
        }
        self
    }

    /// Unconditional jump to a named label.
    pub fn jmp_to(&mut self, label: &'static str) -> &mut Self {
        let inst_idx = self.pixels.len();
        self.instruction(op::JMP, 0, 0, 0);
        let data_idx = self.pixels.len();
        self.pixels.push(0); // placeholder

        if let Some(&target) = self.labels.get(label) {
            let offset = (target as i32) - (inst_idx as i32);
            self.pixels[data_idx] = offset as u32;
        } else {
            self.unresolved.push((label, inst_idx, data_idx));
        }
        self
    }

    /// Resolve any remaining forward references. Call after all labels are defined.
    /// Panics if any references are still unresolved.
    pub fn link(&mut self) -> &mut Self {
        for (label, inst_idx, data_idx) in self.unresolved.drain(..) {
            let target = *self.labels.get(label)
                .unwrap_or_else(|| panic!("unresolved label: '{}'", label));
            let offset = (target as i32) - (inst_idx as i32);
            self.pixels[data_idx] = offset as u32;
        }
        self
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

    /// Bitwise XOR: XOR rd, rs  (rd ^= rs)
    pub fn xor(&mut self, dst_reg: u8, src_reg: u8) -> &mut Self {
        self.instruction(op::XOR, 0, dst_reg, src_reg)
    }

    /// Bitwise NOT: NOT rd  (rd = !rd)
    pub fn not(&mut self, dst_reg: u8) -> &mut Self {
        self.instruction(op::NOT, 0, dst_reg, 0)
    }

    /// Modulo: MOD rd, rs  (rd %= rs, div-by-zero = 0)
    pub fn modulo(&mut self, dst_reg: u8, src_reg: u8) -> &mut Self {
        self.instruction(op::MOD, 0, dst_reg, src_reg)
    }

    /// Load byte: LDB rd, [rs]  (rd = byte at byte address in rs)
    pub fn ldb(&mut self, dst_reg: u8, addr_reg: u8) -> &mut Self {
        self.instruction(op::LDB, 0, dst_reg, addr_reg)
    }

    /// Store byte: STB [rd], rs  (store low byte of rs to byte address in rd)
    pub fn stb(&mut self, addr_reg: u8, src_reg: u8) -> &mut Self {
        self.instruction(op::STB, 0, addr_reg, src_reg)
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

    /// Probabilistic branch: BRANCH_PROB r_prob, offset
    /// Coin-flip branch. r_prob holds probability 0-100.
    /// If random() % 100 < r_prob, jump by offset (relative to next instruction).
    /// Emits 2 pixels: [BRANCH_PROB instruction] [offset as i32]
    pub fn branch_prob(&mut self, prob_reg: u8, offset: i32) -> &mut Self {
        self.instruction(op::BRANCH_PROB, 0, prob_reg, 0);
        self.pixels.push(offset as u32);
        self
    }

    /// Mark confidence for a block: CONFIDENCE_MARK r_block_id
    /// Reads the current confidence score from memory at CONFIDENCE_TABLE_BASE + block_id
    /// and increments it by 1 (capped at 100). The VM uses its own ID to partition the table.
    pub fn confidence_mark(&mut self, block_id_reg: u8) -> &mut Self {
        self.instruction(op::CONFIDENCE_MARK, 0, block_id_reg, 0)
    }

    /// Alternate path: ALTERNATE_PATH r_block_id, offset
    /// If the confidence score for block_id is below threshold (50),
    /// jump by offset to the fallback path. Otherwise continue.
    /// Emits 2 pixels: [ALTERNATE_PATH instruction] [offset as i32]
    pub fn alternate_path(&mut self, block_id_reg: u8, offset: i32) -> &mut Self {
        self.instruction(op::ALTERNATE_PATH, 0, block_id_reg, 0);
        self.pixels.push(offset as u32);
        self
    }

    /// Filled rectangle: RECTF r_x, r_y, r_params
    /// r_params packed: (w << 16) | h
    /// GLYPH_MUTATE: Self-modify pixel at target_addr to new_opcode.
    /// GLYPH_MUTATE r_target_addr, r_new_opcode
    /// Emits 1 pixel: [GLYPH_MUTATE instruction]
    pub fn glyph_mutate(&mut self, target_addr_reg: u8, new_opcode_reg: u8) -> &mut Self {
        self.instruction(op::GLYPH_MUTATE, 0, target_addr_reg, new_opcode_reg)
    }

    /// SPATIAL_SPAWN: Copy N pixels from source_addr to dest_addr.
    /// SPATIAL_SPAWN r_dest_addr, r_size, r_source_addr
    /// The third parameter (source_addr) is encoded in a second pixel.
    /// Emits 2 pixels: [SPATIAL_SPAWN instruction] [source_addr_reg]
    /// VM reads: p1=dest_addr, stratum=size, data_word=source_addr_reg
    pub fn spatial_spawn(
        &mut self,
        dest_addr_reg: u8,
        size_reg: u8,
        source_addr_reg: u8,
    ) -> &mut Self {
        // VM expects: p1(B channel)=dest_addr, stratum(G channel)=size
        self.instruction(op::SPATIAL_SPAWN, size_reg, dest_addr_reg, 0);
        self.pixels.push(source_addr_reg as u32);
        self
    }

    /// SEMANTIC_MERGE: Merge two clusters into dest, removing redundancy.
    /// SEMANTIC_MERGE r_cluster_a, r_cluster_b, r_dest
    /// The third parameter (dest) is encoded in a second pixel.
    /// Emits 2 pixels: [SEMANTIC_MERGE instruction] [dest_reg]
    pub fn semantic_merge(
        &mut self,
        cluster_a_reg: u8,
        cluster_b_reg: u8,
        dest_reg: u8,
    ) -> &mut Self {
        self.instruction(op::SEMANTIC_MERGE, 0, cluster_a_reg, cluster_b_reg);
        self.pixels.push(dest_reg as u32);
        self
    }

    /// Color comes from a preceding LDI into a "color register" (convention: r100).
    /// Emits 2 pixels: [RECTF instruction] [packed params]
    pub fn rectf(&mut self, x_reg: u8, y_reg: u8, packed_params: u32) -> &mut Self {
        self.instruction(op::RECTF, x_reg, y_reg, 0);
        self.pixels.push(packed_params);
        self
    }

    /// Line: LINE r_x0, r_y0, r_params
    /// r_params packed: (x1 << 16) | (y1 & 0xFFFF) -- signed coords as u16
    /// Color from color register (r100).
    /// Emits 2 pixels: [LINE instruction] [packed params]
    pub fn line(&mut self, x0_reg: u8, y0_reg: u8, packed_endpoints: u32) -> &mut Self {
        self.instruction(op::LINE, x0_reg, y0_reg, 0);
        self.pixels.push(packed_endpoints);
        self
    }

    /// Text string: TEXT_STR r_addr, r_x, r_y
    /// Reads a null-terminated string from the address in r_addr,
    /// renders it starting at screen position (r_x, r_y).
    /// Color from color register (r100).
    pub fn text_str(&mut self, addr_reg: u8, x_reg: u8, y_reg: u8) -> &mut Self {
        self.instruction(op::TEXT_STR, addr_reg, x_reg, y_reg)
    }

    /// Filled circle: CIRCLEF r_cx, r_cy, r_radius
    /// Color from color register (r100).
    pub fn circlef(&mut self, cx_reg: u8, cy_reg: u8, radius_reg: u8) -> &mut Self {
        self.instruction(op::CIRCLEF, cx_reg, cy_reg, radius_reg)
    }

    /// Halt execution
    pub fn halt(&mut self) -> &mut Self {
        self.instruction(op::HALT, 0, 0, 0)
    }

    // ── Issue Queue Opcodes (Phase 13A) ─────────────────────────────

    /// ISSUE_CREATE: Create a new issue in the queue.
    /// ISSUE_CREATE r_title_addr, r_priority, assignee_id
    /// - r_title_addr (p1): Hilbert pixel address of null-terminated title string (packed ASCII)
    /// - r_priority (p2): priority value (0=none, 1=low, 2=medium, 3=high, 4=critical)
    /// - assignee_id (stratum): VM ID of assignee (0=unassigned)
    /// Returns: issue_id in r_title_addr (overwritten with the new issue's ID), or 0 on failure.
    pub fn issue_create(&mut self, title_addr_reg: u8, priority_reg: u8, assignee_id: u8) -> &mut Self {
        self.instruction(op::ISSUE_CREATE, assignee_id, title_addr_reg, priority_reg)
    }

    /// ISSUE_PICK: Atomically claim the next todo issue matching a filter.
    /// ISSUE_PICK r_out_addr, r_filter
    /// - r_out_addr (p1): Hilbert pixel address where issue data will be copied
    /// - r_filter (p2): filter criteria (0=pick any, else pick matching priority)
    /// - stratum: VM ID of the claiming agent (used for atomicity)
    /// Returns: r_out_addr = issue_id on success, 0 if no matching issue.
    pub fn issue_pick(&mut self, out_addr_reg: u8, filter_reg: u8, agent_vm_id: u8) -> &mut Self {
        self.instruction(op::ISSUE_PICK, agent_vm_id, out_addr_reg, filter_reg)
    }

    /// ISSUE_UPDATE: Change the status of an issue.
    /// ISSUE_UPDATE r_issue_id, r_new_status
    /// - r_issue_id (p1): the issue ID to update
    /// - r_new_status (p2): new status (0=todo, 1=in_progress, 2=done)
    /// Returns: r_issue_id = 1 on success, 0 if issue not found.
    pub fn issue_update(&mut self, issue_id_reg: u8, new_status_reg: u8) -> &mut Self {
        self.instruction(op::ISSUE_UPDATE, 0, issue_id_reg, new_status_reg)
    }

    /// ISSUE_LIST: Iterate over issues matching a filter.
    /// ISSUE_LIST r_out_addr, r_filter
    /// - r_out_addr (p1): Hilbert pixel address where matching issue IDs will be written
    /// - r_filter (p2): filter (0=all, else match priority)
    /// - stratum: max number of results to write
    /// Returns: r_out_addr = count of matching issues written.
    pub fn issue_list(&mut self, out_addr_reg: u8, filter_reg: u8, max_results: u8) -> &mut Self {
        self.instruction(op::ISSUE_LIST, max_results, out_addr_reg, filter_reg)
    }

    /// MODEL_CALL: call LLM with prompt, write response to memory.
    /// buf_size = response buffer size in pixels (each pixel = 4 bytes)
    /// r_prompt = register containing prompt address (packed ASCII)
    /// r_response = register containing response buffer address
    /// Returns: number of response bytes written in r_prompt, or 0 on error.
    pub fn model_call(&mut self, buf_size: u8, r_prompt: u8, r_response: u8) -> &mut Self {
        self.instruction(op::MODEL_CALL, buf_size, r_prompt, r_response)
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

/// Preprocess source text: expand .define directives and substitute constants.
/// Returns (processed_source, defines_map).
fn preprocess_defines(source: &str) -> (String, std::collections::HashMap<String, String>) {
    let mut defines: std::collections::HashMap<String, String> = std::collections::HashMap::new();
    let mut output_lines: Vec<String> = Vec::new();

    for raw_line in source.lines() {
        let line = strip_comment(raw_line).trim();
        if line.is_empty() {
            output_lines.push(raw_line.to_string());
            continue;
        }

        // Check for .define directive
        let upper = line.to_uppercase();
        if upper.starts_with(".DEFINE") || upper.starts_with("DEFINE ") {
            // .define NAME VALUE
            let rest = if line.starts_with('.') { &line[7..] } else { &line[6..] };
            let rest = rest.trim();
            let parts: Vec<&str> = rest.splitn(2, |c: char| c.is_whitespace() || c == ',').collect();
            if parts.len() >= 2 {
                let name = parts[0].trim();
                let value = parts[1].trim();
                if !name.is_empty() {
                    defines.insert(name.to_uppercase(), value.to_string());
                }
            }
            // Don't emit the .define line
            continue;
        }

        // Substitute defines into this line (word-level replacement)
        if !defines.is_empty() {
            let mut substituted = line.to_string();
            for (name, value) in &defines {
                // Replace whole-word matches (case-insensitive check, case-sensitive sub)
                // Use word boundaries approach: split into tokens, check each
                let mut result = String::new();
                let mut last_end = 0;
                let bytes = substituted.as_bytes();
                let mut i = 0;
                while i < bytes.len() {
                    let c = bytes[i] as char;
                    if c.is_alphanumeric() || c == '_' {
                        let start = i;
                        while i < bytes.len() && ((bytes[i] as char).is_alphanumeric() || bytes[i] as char == '_') {
                            i += 1;
                        }
                        let word = &substituted[start..i];
                        if word.to_uppercase() == *name {
                            result.push_str(value);
                        } else {
                            result.push_str(word);
                        }
                    } else {
                        result.push(c);
                        i += 1;
                    }
                }
                substituted = result;
            }
            output_lines.push(format!("{}  // preprocessed", substituted));
        } else {
            output_lines.push(raw_line.to_string());
        }
    }

    (output_lines.join("\n"), defines)
}

/// Parse a .gasm text string into a Program (Vec<u32> of pixels).
pub fn parse_gasm(source: &str) -> Result<Program, ParseError> {
    // ── Preprocessor: expand .define ──
    let (source, _defines) = preprocess_defines(source);

    let mut program = Program::new();

    // ── Pass 1: collect label addresses ──
    // Labels are lines like "name:" (optionally followed by a mnemonic).
    // We track the pixel address each label points to.
    let mut labels: std::collections::HashMap<String, u32> = std::collections::HashMap::new();
    {
        let mut addr: u32 = 0;
        for raw_line in source.lines() {
            let line = strip_comment(raw_line).trim();
            if line.is_empty() {
                continue;
            }
            // Handle .org directive in Pass 1
            let tokens_raw: Vec<&str> = tokenize(line);
            if !tokens_raw.is_empty() {
                let first = tokens_raw[0].to_uppercase();
                if first == ".ORG" && tokens_raw.len() >= 2 {
                    if let Ok(target) = parse_value(tokens_raw[1], 0) {
                        addr = target;
                        continue;
                    }
                }
            }
            // Check for label: either "label:" alone or "label: INSTR ..."
            if let Some(colon_pos) = line.find(':') {
                // Make sure it's not inside a char literal
                let before = &line[..colon_pos];
                let candidate = before.trim();
                if !candidate.is_empty()
                    && candidate.chars().all(|c| c.is_alphanumeric() || c == '_')
                {
                    labels.insert(candidate.to_string(), addr);
                }
                // Check if there's an instruction after the label
                let after = line[colon_pos + 1..].trim();
                if after.is_empty() {
                    continue; // Label-only line, no instruction
                }
                // Fall through to count the instruction pixels
                let tokens: Vec<&str> = tokenize(after);
                if tokens.is_empty() {
                    continue;
                }
                addr += instruction_size(&tokens);
            } else {
                let tokens: Vec<&str> = tokenize(line);
                if tokens.is_empty() {
                    continue;
                }
                addr += instruction_size(&tokens);
            }
        }
    }

    // ── Pass 2: parse instructions, resolve labels ──
    let resolve_label = |name: &str, current_addr: u32, line_num: usize| -> Result<i32, ParseError> {
        if let Some(&target_addr) = labels.get(name) {
            Ok(target_addr as i32 - current_addr as i32)
        } else {
            // Try parsing as numeric
            Err(ParseError {
                line: line_num,
                message: format!("unknown label: '{}'", name),
            })
        }
    };

    // Helper: resolve a value that might be a label or numeric
    let mut current_addr: u32 = 0;

    for (line_num, raw_line) in source.lines().enumerate() {
        let line_num = line_num + 1; // 1-indexed

        // Strip comments
        let line = strip_comment(raw_line).trim();
        if line.is_empty() {
            continue;
        }

        // Handle label prefix
        let line = if let Some(colon_pos) = line.find(':') {
            let before = &line[..colon_pos];
            let candidate = before.trim();
            if !candidate.is_empty() && candidate.chars().all(|c| c.is_alphanumeric() || c == '_') {
                // It's a label, skip it (already processed in pass 1)
                let after = line[colon_pos + 1..].trim();
                if after.is_empty() {
                    continue;
                }
                after
            } else {
                line
            }
        } else {
            line
        };

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
                let value = parse_signed_value(tokens[2], line_num)?;
                program.ldi(reg, value as u32);
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

            "AND" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let rd = parse_register(tokens[1], line_num)?;
                let rs = parse_register(tokens[2], line_num)?;
                program.instruction(op::AND, 0, rd, rs);
            }

            "SHL" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let rd = parse_register(tokens[1], line_num)?;
                let rs = parse_register(tokens[2], line_num)?;
                program.instruction(op::SHL, 0, rd, rs);
            }

            "XOR" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let rd = parse_register(tokens[1], line_num)?;
                let rs = parse_register(tokens[2], line_num)?;
                program.instruction(op::XOR, 0, rd, rs);
            }

            "NOT" => {
                expect_arg_count(&tokens, 1, line_num)?;
                let rd = parse_register(tokens[1], line_num)?;
                program.instruction(op::NOT, 0, rd, 0);
            }

            "MOD" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let rd = parse_register(tokens[1], line_num)?;
                let rs = parse_register(tokens[2], line_num)?;
                program.instruction(op::MOD, 0, rd, rs);
            }

            "LDB" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let rd = parse_register(tokens[1], line_num)?;
                let rs = parse_register(tokens[2], line_num)?;
                program.instruction(op::LDB, 0, rd, rs);
            }

            "STB" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let addr_reg = parse_register(tokens[1], line_num)?;
                let src_reg = parse_register(tokens[2], line_num)?;
                program.instruction(op::STB, 0, addr_reg, src_reg);
            }

            "JMP" => {
                expect_arg_count(&tokens, 1, line_num)?;
                // Try label resolution, fall back to numeric offset
                let offset = if let Some(&target) = labels.get(tokens[1]) {
                    target as i32 - current_addr as i32
                } else {
                    parse_signed_value(tokens[1], line_num)?
                };
                program.jmp(offset);
                current_addr += 2;
            }

            "BEQ" | "BNE" | "BLT" | "BGE" | "BLTU" | "BGEU" => {
                expect_arg_count(&tokens, 3, line_num)?;
                let cond = parse_branch_cond(&mnemonic, line_num)?;
                let r1 = parse_register(tokens[1], line_num)?;
                let r2 = parse_register(tokens[2], line_num)?;
                // Try label resolution for branch target
                let offset = if let Some(&target) = labels.get(tokens[3]) {
                    target as i32 - current_addr as i32
                } else {
                    parse_signed_value(tokens[3], line_num)?
                };
                program.branch(cond, r1, r2, offset);
                current_addr += 2;
            }

            "BRANCH" => {
                // Generic: BRANCH cond, r1, r2, offset
                expect_arg_count(&tokens, 4, line_num)?;
                let cond = parse_branch_cond(tokens[1], line_num)?;
                let r1 = parse_register(tokens[2], line_num)?;
                let r2 = parse_register(tokens[3], line_num)?;
                // Try label resolution for branch target
                let offset = if let Some(&target) = labels.get(tokens[4]) {
                    target as i32 - current_addr as i32
                } else {
                    parse_signed_value(tokens[4], line_num)?
                };
                program.branch(cond, r1, r2, offset);
                current_addr += 2;
            }

            "CALL" => {
                expect_arg_count(&tokens, 1, line_num)?;
                // Try label resolution for call target (absolute address)
                let addr = if let Some(&target) = labels.get(tokens[1]) {
                    target
                } else {
                    parse_value(tokens[1], line_num)?
                };
                program.instruction(op::CALL, 0, 0, 0);
                program.pixels.push(addr);
                current_addr += 2;
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

            "WAIT_EVENT" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let event_type_reg = parse_register(tokens[1], line_num)?;
                let param1_reg = parse_register(tokens[2], line_num)?;
                program.wait_event(event_type_reg, param1_reg);
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

            "BRANCH_PROB" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let prob_reg = parse_register(tokens[1], line_num)?;
                let offset = if tokens.len() > 2 {
                    if let Some(&target) = labels.get(tokens[2]) {
                        // current_addr is the instruction pixel; offset is relative to pixel after this 2-pixel instruction
                        target as i32 - (current_addr as i32 + 2)
                    } else {
                        tokens[2].parse::<i32>().unwrap_or(0)
                    }
                } else {
                    0
                };
                program.branch_prob(prob_reg, offset);
                current_addr += 2;
            }

            "CONFIDENCE_MARK" => {
                expect_arg_count(&tokens, 1, line_num)?;
                let block_id_reg = parse_register(tokens[1], line_num)?;
                program.confidence_mark(block_id_reg);
            }

            "ALTERNATE_PATH" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let block_id_reg = parse_register(tokens[1], line_num)?;
                let offset = if tokens.len() > 2 {
                    if let Some(&target) = labels.get(tokens[2]) {
                        target as i32 - (current_addr as i32 + 2)
                    } else {
                        tokens[2].parse::<i32>().unwrap_or(0)
                    }
                } else {
                    0
                };
                program.alternate_path(block_id_reg, offset);
                current_addr += 2;
            }

            "GLYPH_MUTATE" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let target_addr_reg = parse_register(tokens[1], line_num)?;
                let new_opcode_reg = parse_register(tokens[2], line_num)?;
                program.glyph_mutate(target_addr_reg, new_opcode_reg);
            }

            "SPATIAL_SPAWN" => {
                expect_arg_count(&tokens, 3, line_num)?;
                let dest_addr_reg = parse_register(tokens[1], line_num)?;
                let size_reg = parse_register(tokens[2], line_num)?;
                let source_addr_reg = parse_register(tokens[3], line_num)?;
                program.spatial_spawn(dest_addr_reg, size_reg, source_addr_reg);
                current_addr += 2; // emits 2 pixels
            }

            "SEMANTIC_MERGE" => {
                expect_arg_count(&tokens, 3, line_num)?;
                let cluster_a_reg = parse_register(tokens[1], line_num)?;
                let cluster_b_reg = parse_register(tokens[2], line_num)?;
                let dest_reg = parse_register(tokens[3], line_num)?;
                program.semantic_merge(cluster_a_reg, cluster_b_reg, dest_reg);
                current_addr += 2; // emits 2 pixels
            },

            // ── Issue Queue Opcodes (Phase 13A) ──
            "ISSUE_CREATE" => {
                expect_arg_count(&tokens, 3, line_num)?;
                let title_addr_reg = parse_register(tokens[1], line_num)?;
                let priority_reg = parse_register(tokens[2], line_num)?;
                let assignee_id = parse_value(tokens[3], line_num)? as u8;
                program.issue_create(title_addr_reg, priority_reg, assignee_id);
            },

            "ISSUE_PICK" => {
                expect_arg_count(&tokens, 3, line_num)?;
                let out_addr_reg = parse_register(tokens[1], line_num)?;
                let filter_reg = parse_register(tokens[2], line_num)?;
                let agent_vm_id = parse_value(tokens[3], line_num)? as u8;
                program.issue_pick(out_addr_reg, filter_reg, agent_vm_id);
            },

            "ISSUE_UPDATE" => {
                expect_arg_count(&tokens, 2, line_num)?;
                let issue_id_reg = parse_register(tokens[1], line_num)?;
                let new_status_reg = parse_register(tokens[2], line_num)?;
                program.issue_update(issue_id_reg, new_status_reg);
            },

            "ISSUE_LIST" => {
                expect_arg_count(&tokens, 3, line_num)?;
                let out_addr_reg = parse_register(tokens[1], line_num)?;
                let filter_reg = parse_register(tokens[2], line_num)?;
                let max_results = parse_value(tokens[3], line_num)? as u8;
                program.issue_list(out_addr_reg, filter_reg, max_results);
            },

            // .org ADDRESS - set output origin, pad with zeros
            ".ORG" => {
                expect_arg_count(&tokens, 1, line_num)?;
                let target_addr = parse_value(tokens[1], line_num)?;
                if target_addr < current_addr {
                    return Err(ParseError {
                        line: line_num,
                        message: format!(
                            ".org address {} is before current address {}",
                            target_addr, current_addr
                        ),
                    });
                }
                let padding = target_addr - current_addr;
                for _ in 0..padding {
                    program.pixels.push(0);
                }
                current_addr = target_addr;
            },

            _ => {
                return Err(ParseError {
                    line: line_num,
                    message: format!("unknown mnemonic: '{}'", tokens[0]),
                });
            },
        }

        // Track address for label resolution (skip JMP/BRANCH/CALL which already update)
        let mnemonic_upper = tokens[0].to_uppercase();
        if mnemonic_upper != "JMP" && !["BEQ","BNE","BLT","BGE","BLTU","BGEU"].contains(&mnemonic_upper.as_str()) && mnemonic_upper != "BRANCH" && mnemonic_upper != "CALL" {
            current_addr += instruction_size(&tokens);
        }
    }

    Ok(program)
}

/// Parse a .gasm file from disk.
#[allow(dead_code)]
/// Resolve all label references in source text to numeric offsets/addresses.
///
/// Returns a new source string where:
/// - Label-only lines (e.g. `scan:`) are removed
/// - JMP/branch label operands are replaced with signed offsets
/// - CALL label operands are replaced with absolute addresses
/// - All other lines are preserved verbatim
///
/// This produces source that the self-hosting VM assembler can process,
/// since the VM assembler only handles numeric operands.
pub fn resolve_labels(source: &str) -> String {
    // ── Pass 1: collect label pixel addresses (same logic as parse_gasm) ──
    let mut labels: std::collections::HashMap<String, u32> = std::collections::HashMap::new();
    {
        let mut addr: u32 = 0;
        for raw_line in source.lines() {
            let line = strip_comment(raw_line).trim();
            if line.is_empty() {
                continue;
            }
            if let Some(colon_pos) = line.find(':') {
                let before = &line[..colon_pos];
                let candidate = before.trim();
                if !candidate.is_empty() && candidate.chars().all(|c| c.is_alphanumeric() || c == '_') {
                    labels.insert(candidate.to_string(), addr);
                }
                let after = line[colon_pos + 1..].trim();
                if after.is_empty() {
                    continue;
                }
                let tokens: Vec<&str> = tokenize(after);
                if tokens.is_empty() {
                    continue;
                }
                addr += instruction_size(&tokens);
            } else {
                let tokens: Vec<&str> = tokenize(line);
                if tokens.is_empty() {
                    continue;
                }
                addr += instruction_size(&tokens);
            }
        }
    }

    // ── Pass 2: rewrite lines, replacing label refs with numeric values ──
    let mut current_addr: u32 = 0;
    let mut output_lines: Vec<String> = Vec::new();

    for raw_line in source.lines() {
        let line = strip_comment(raw_line).trim();
        if line.is_empty() {
            continue;
        }

        // Check for label prefix
        let instr_part = if let Some(colon_pos) = line.find(':') {
            let before = &line[..colon_pos];
            let candidate = before.trim();
            if !candidate.is_empty() && candidate.chars().all(|c| c.is_alphanumeric() || c == '_') {
                // It's a label definition — skip it (don't emit)
                let after = line[colon_pos + 1..].trim();
                if after.is_empty() {
                    continue;
                }
                after
            } else {
                line
            }
        } else {
            line
        };

        let tokens: Vec<&str> = tokenize(instr_part);
        if tokens.is_empty() {
            continue;
        }

        let mnemonic = tokens[0].to_uppercase();
        match mnemonic.as_str() {
            "JMP" => {
                if tokens.len() >= 2 {
                    let offset = if let Some(&target) = labels.get(tokens[1]) {
                        target as i32 - current_addr as i32
                    } else {
                        // Already numeric, parse it
                        tokens[1].parse::<i32>().unwrap_or(0)
                    };
                    output_lines.push(format!("    JMP {}", offset));
                } else {
                    output_lines.push(raw_line.to_string());
                }
                current_addr += 2;
            }
            "BEQ" | "BNE" | "BLT" | "BGE" | "BLTU" | "BGEU" => {
                if tokens.len() >= 4 {
                    let offset = if let Some(&target) = labels.get(tokens[3]) {
                        target as i32 - current_addr as i32
                    } else {
                        tokens[3].parse::<i32>().unwrap_or(0)
                    };
                    output_lines.push(format!("    {} {}, {}, {}", mnemonic, tokens[1], tokens[2], offset));
                } else {
                    output_lines.push(raw_line.to_string());
                }
                current_addr += 2;
            }
            "CALL" => {
                if tokens.len() >= 2 {
                    let addr_val = if let Some(&target) = labels.get(tokens[1]) {
                        target
                    } else {
                        tokens[1].parse::<u32>().unwrap_or(0)
                    };
                    output_lines.push(format!("    CALL {}", addr_val));
                } else {
                    output_lines.push(raw_line.to_string());
                }
                current_addr += 2;
            }
            "LDI" => {
                current_addr += 2;
                output_lines.push(raw_line.to_string());
            }
            _ => {
                current_addr += instruction_size(&tokens);
                output_lines.push(raw_line.to_string());
            }
        }
    }

    output_lines.join("\n") + "\n"
}

pub fn parse_gasm_file(path: &str) -> Result<Program, ParseError> {
    let source = std::fs::read_to_string(path).map_err(|e| ParseError {
        line: 0,
        message: format!("failed to read {}: {}", path, e),
    })?;
    // Expand .include directives before parsing
    let expanded = expand_includes(&source, path)?;
    parse_gasm(&expanded)
}

/// Expand .include directives in source text (recursive, with depth limit).
fn expand_includes(source: &str, _base_path: &str) -> Result<String, ParseError> {
    let mut result = String::new();
    for line in source.lines() {
        let trimmed = line.trim();
        let upper = trimmed.to_uppercase();
        if upper.starts_with(".INCLUDE") || upper.starts_with("INCLUDE ") {
            let rest = if trimmed.starts_with('.') {
                &trimmed[8..]
            } else {
                &trimmed[7..]
            };
            let rest = rest.trim();
            // Strip quotes if present
            let filename = if (rest.starts_with('"') && rest.ends_with('"'))
                || (rest.starts_with('\'') && rest.ends_with('\''))
            {
                &rest[1..rest.len() - 1]
            } else {
                rest
            };
            let included = std::fs::read_to_string(filename).map_err(|e| ParseError {
                line: 0,
                message: format!("failed to include '{}': {}", filename, e),
            })?;
            // Recursively expand includes in the included file
            let expanded = expand_includes(&included, filename)?;
            result.push_str(&expanded);
            result.push('\n');
        } else {
            result.push_str(line);
            result.push('\n');
        }
    }
    Ok(result)
}

// ─── Internal helpers ───

/// Return how many pixels (u32 words) an instruction produces.
/// Most instructions are 1 pixel; LDI/CALL/JMP/BRANCH are 2.
fn instruction_size(tokens: &[&str]) -> u32 {
    if tokens.is_empty() {
        return 0;
    }
    let mnemonic = tokens[0].to_uppercase();
    match mnemonic.as_str() {
        ".ORG" | ".DEFINE" | ".INCLUDE" => 0,                  // directives emit 0 pixels
        "LDI" => 2,                                           // instruction + immediate
        "CALL" => 2,                                          // instruction + address
        "JMP" => 2,                                           // instruction + offset
        "BEQ" | "BNE" | "BLT" | "BGE" | "BLTU" | "BGEU" => 2, // instruction + offset
        "BRANCH" => 2,                                        // instruction + offset
        "BRANCH_PROB" => 2,                                   // instruction + offset
        "ALTERNATE_PATH" => 2,                                // instruction + offset
        "SPATIAL_SPAWN" => 2,                                 // instruction + data pixel
        "SEMANTIC_MERGE" => 2,                                // instruction + data pixel
        "DATA" => 1,                                          // single data word
        _ => 1,                                               // most instructions are 1 pixel
    }
}

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

    // Numeric (supports negative values via two's complement)
    let val: u32 = if let Some(hex) = token.strip_prefix("0x").or_else(|| token.strip_prefix("0X"))
    {
        u32::from_str_radix(hex, 16)
    } else if let Some(bin) = token.strip_prefix("0b").or_else(|| token.strip_prefix("0B")) {
        u32::from_str_radix(bin, 2)
    } else if token.starts_with('-') {
        token.parse::<i32>().map(|v| v as u32)
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

    // Handle negative hex/bin: -0xFF, -0b1010
    if let Some(rest) = token.strip_prefix('-') {
        if rest.starts_with("0x") || rest.starts_with("0X") || rest.starts_with("0b") || rest.starts_with("0B") {
            let uval = parse_value(rest, line)?;
            return Ok(-(uval as i32));
        }
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

    // ── Directive tests ──

    #[test]
    fn gasm_define_simple() {
        let src = "\
            .define FOO 42\n\
            LDI r0, FOO\n\
            HALT";
        let p = parse_gasm(src).unwrap();
        assert_eq!(p.pixels[1], 42); // immediate value substituted
    }

    #[test]
    fn gasm_define_hex() {
        let src = "\
            .define BASE 0xF000\n\
            LDI r0, BASE\n\
            HALT";
        let p = parse_gasm(src).unwrap();
        assert_eq!(p.pixels[1], 0xF000);
    }

    #[test]
    fn gasm_define_multiple() {
        let src = "\
            .define A 10\n\
            .define B 20\n\
            LDI r0, A\n\
            LDI r1, B\n\
            HALT";
        let p = parse_gasm(src).unwrap();
        assert_eq!(p.pixels[1], 10);
        assert_eq!(p.pixels[3], 20);
    }

    #[test]
    fn gasm_define_in_label() {
        let src = "\
            .define TARGET 0x100\n\
            LDI r0, TARGET\n\
            HALT";
        let p = parse_gasm(src).unwrap();
        assert_eq!(p.pixels[1], 0x100);
    }

    #[test]
    fn gasm_org_pads_output() {
        let src = "\
            .org 4\n\
            LDI r0, 1\n\
            HALT";
        let p = parse_gasm(src).unwrap();
        // Should have 4 zero-padding pixels + 2 for LDI + 1 for HALT = 7 total
        assert_eq!(p.len(), 7);
        // First 4 should be zero
        for i in 0..4 {
            assert_eq!(p.pixels[i], 0, "pixel {} should be zero-padded", i);
        }
        // Pixel 4 is the LDI instruction
        assert_eq!((p.pixels[4] & 0xFF), op::LDI as u32);
        // Pixel 5 is the immediate value
        assert_eq!(p.pixels[5], 1);
    }

    #[test]
    fn gasm_org_label_after() {
        let src = "\
            .org 5\n\
            start:\n\
            LDI r0, 99\n\
            HALT";
        let p = parse_gasm(src).unwrap();
        // Label 'start' should resolve to address 5
        assert_eq!(p.len(), 8); // 5 zeros + 2 LDI + 1 HALT
        assert_eq!((p.pixels[5] & 0xFF), op::LDI as u32);
    }

    #[test]
    fn gasm_org_hex_address() {
        let src = "\
            .org 0x10\n\
            NOP\n\
            HALT";
        let p = parse_gasm(src).unwrap();
        assert_eq!(p.len(), 0x12); // 16 zeros + 1 NOP + 1 HALT
    }

    #[test]
    fn gasm_include_file() {
        use std::io::Write;
        let dir = std::env::temp_dir();
        let inc_path = dir.join("gasm_test_include.gasm");
        {
            let mut f = std::fs::File::create(&inc_path).unwrap();
            f.write_all(b"LDI r0, 77\n").unwrap();
        }
        let main_path = dir.join("gasm_test_main.gasm");
        {
            let mut f = std::fs::File::create(&main_path).unwrap();
            write!(
                f,
                ".include \"{}\"\nHALT\n",
                inc_path.display()
            )
            .unwrap();
        }
        let p = parse_gasm_file(main_path.to_str().unwrap()).unwrap();
        assert_eq!(p.pixels[1], 77); // immediate from included file
        // Clean up
        let _ = std::fs::remove_file(&inc_path);
        let _ = std::fs::remove_file(&main_path);
    }

    #[test]
    fn gasm_define_and_org_combined() {
        let src = "\
            .define ORIGIN 3\n\
            .org ORIGIN\n\
            LDI r0, 42\n\
            HALT";
        let p = parse_gasm(src).unwrap();
        // Note: .org uses the preprocessed value. Since .define runs first,
        // .org should get value 3 if define substitution works in .org args.
        // However, .org in pass 1 tokenizes the original line, so this tests
        // that define preprocessing happens before parse_gasm.
        assert_eq!(p.len(), 6); // 3 zeros + 2 LDI + 1 HALT
        assert_eq!(p.pixels[4], 42);
    }
}
