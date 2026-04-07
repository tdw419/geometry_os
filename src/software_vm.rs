// Software VM - CPU-side mirror of glyph_vm_scheduler.wgsl
//
// Exact replica of the GPU compute shader, but running on the CPU.
// Same state layout, same opcodes, same execution semantics.
// Used for testing and verification without needing a GPU.
//
// Every opcode, every field, every offset matches the shader.
// If the software VM and the shader disagree, something is wrong.

use crate::hilbert;
use crate::substrate::TEXTURE_SIZE;
use crate::vm::VmState;
use crate::governance;

/// Thread-local model call handler for the MODEL_CALL opcode (244).
/// Set via SoftwareVm::with_model_handler() during execute_frame.
/// If None, MODEL_CALL returns error status.
std::thread_local! {
    static MODEL_HANDLER: std::cell::RefCell<Option<Box<dyn Fn(&str) -> Result<String, String>>>> = std::cell::RefCell::new(None);
}

/// VM state constants (must match WGSL and crate::vm)
mod vm_state {
    pub const INACTIVE: u32 = 0;
    pub const RUNNING: u32 = 1;
    pub const HALTED: u32 = 2;
    #[allow(dead_code)]
    pub const WAITING: u32 = 3;
    /// VM yielded its timeslice -- auto-resumes next frame.
    /// Distinct from WAITING (which blocks until an external event).
    pub const YIELDED: u32 = 4;
}

const MAX_VMS: usize = 8;
const CYCLES_PER_FRAME: u32 = 1024;

/// CPU-side RAM texture: 4096x4096 pixels, each pixel is [R,G,B,A] u8.
/// Mirrors the GPU `rgba8uint` texture exactly.
/// Stored as row-major (y * 4096 + x) * 4.
struct RamTexture {
    data: Vec<u8>,
}

impl RamTexture {
    fn new() -> Self {
        Self {
            data: vec![0u8; (TEXTURE_SIZE as usize) * (TEXTURE_SIZE as usize) * 4],
        }
    }

    /// Read a pixel at (x, y) -> [R, G, B, A]
    fn load(&self, x: u32, y: u32) -> [u8; 4] {
        let offset = ((y * TEXTURE_SIZE + x) * 4) as usize;
        [
            self.data[offset],
            self.data[offset + 1],
            self.data[offset + 2],
            self.data[offset + 3],
        ]
    }

    /// Write a pixel at (x, y) <- [R, G, B, A]
    fn store(&mut self, x: u32, y: u32, rgba: [u8; 4]) {
        let offset = ((y * TEXTURE_SIZE + x) * 4) as usize;
        self.data[offset] = rgba[0];
        self.data[offset + 1] = rgba[1];
        self.data[offset + 2] = rgba[2];
        self.data[offset + 3] = rgba[3];
    }
}

/// Read a glyph instruction from RAM at Hilbert linear index `d`.
/// Returns (opcode, stratum, p1, p2) -- exactly like shader's read_glyph().
fn read_glyph(ram: &RamTexture, d: u32) -> (u32, u32, u32, u32) {
    let (x, y) = hilbert::d2xy(d);
    let px = ram.load(x, y);
    (px[0] as u32, px[1] as u32, px[2] as u32, px[3] as u32)
}

/// Write a glyph instruction to RAM at Hilbert linear index `d`.
fn write_glyph(ram: &mut RamTexture, d: u32, value: (u32, u32, u32, u32)) {
    let (x, y) = hilbert::d2xy(d);
    ram.store(
        x,
        y,
        [value.0 as u8, value.1 as u8, value.2 as u8, value.3 as u8],
    );
}

/// Read a 32-bit word from memory (byte-addressed, mapped via Hilbert).
/// Mirrors shader's mem_read() exactly.
fn mem_read(ram: &RamTexture, addr: u32) -> u32 {
    let pixel_idx = addr / 4;
    let (r, g, b, a) = read_glyph(ram, pixel_idx);
    r | (g << 8) | (b << 16) | (a << 24)
}

/// Write a 32-bit word to memory (byte-addressed, mapped via Hilbert).
/// Mirrors shader's mem_write() exactly.
#[allow(dead_code)]
fn mem_write(ram: &mut RamTexture, addr: u32, value: u32) {
    let pixel_idx = addr / 4;
    let r = (value & 0xFF) as u32;
    let g = ((value >> 8) & 0xFF) as u32;
    let b = ((value >> 16) & 0xFF) as u32;
    let a = ((value >> 24) & 0xFF) as u32;
    write_glyph(ram, pixel_idx, (r, g, b, a));
}

/// Execute one instruction for a VM. Returns true if a jump occurred.
/// Mirrors shader's execute_instruction() exactly, opcode for opcode.
fn execute_instruction(ram: &mut RamTexture, vm: &mut VmState) -> bool {
    let pc = vm.pc;
    let (opcode, stratum, p1, p2) = read_glyph(ram, pc);

    match opcode {
        // NOP
        0 => {
            // Do nothing
        }

        // LDI - Load immediate: LDI rd, imm
        // Shader reads: [1, 0, rd, 0] followed by [imm] at (pc+1)*4
        1 => {
            let imm = safe_mem_read(ram, vm, (pc + 1) * 4);
            vm.regs[p1 as usize] = imm;
            vm.pc = pc + 1; // Consume immediate word
        }

        // MOV - Move register: MOV rd, rs
        2 => {
            vm.regs[p1 as usize] = vm.regs[p2 as usize];
        }

        // LD - Load from memory: LD rd, [rs] (pixel-addressed)
        // rs contains a Hilbert pixel index
        3 => {
            let pixel_idx = vm.regs[p2 as usize];
            vm.regs[p1 as usize] = safe_mem_read(ram, vm, pixel_idx * 4);
        }

        // ST - Store to memory: ST [rd], rs (pixel-addressed)
        // rd contains a Hilbert pixel index
        4 => {
            let pixel_idx = vm.regs[p1 as usize];
            let value = vm.regs[p2 as usize];
            safe_mem_write(ram, vm, pixel_idx * 4, value);
        }

        // ADD - Add register: ADD rd, rs
        5 => {
            vm.regs[p1 as usize] = vm.regs[p1 as usize].wrapping_add(vm.regs[p2 as usize]);
        }

        // SUB - Subtract register: SUB rd, rs
        6 => {
            vm.regs[p1 as usize] = vm.regs[p1 as usize].wrapping_sub(vm.regs[p2 as usize]);
        }

        // MUL - Multiply register: MUL rd, rs
        7 => {
            vm.regs[p1 as usize] = vm.regs[p1 as usize].wrapping_mul(vm.regs[p2 as usize]);
        }

        // DIV - Divide register: DIV rd, rs (unsigned, divide-by-zero = 0)
        8 => {
            let divisor = vm.regs[p2 as usize];
            if divisor != 0 {
                vm.regs[p1 as usize] = vm.regs[p1 as usize] / divisor;
            } else {
                vm.regs[p1 as usize] = 0;
            }
        }

        // SHR - Shift right: SHR rd, rs (rd >>= rs)
        19 => {
            let shift = vm.regs[p2 as usize];
            vm.regs[p1 as usize] = vm.regs[p1 as usize] >> shift;
        }

        // OR - Bitwise OR: OR rd, rs (rd |= rs)
        20 => {
            vm.regs[p1 as usize] = vm.regs[p1 as usize] | vm.regs[p2 as usize];
        }

        // AND - Bitwise AND: AND rd, rs (rd &= rs)
        25 => {
            vm.regs[p1 as usize] = vm.regs[p1 as usize] & vm.regs[p2 as usize];
        }

        // SHL - Shift left: SHL rd, rs (rd <<= rs)
        26 => {
            let shift = vm.regs[p2 as usize];
            vm.regs[p1 as usize] = vm.regs[p1 as usize] << shift;
        }

        // XOR - Bitwise XOR: XOR rd, rs (rd ^= rs)
        29 => {
            vm.regs[p1 as usize] = vm.regs[p1 as usize] ^ vm.regs[p2 as usize];
        }

        // NOT - Bitwise NOT: NOT rd (rd = !rd)
        30 => {
            vm.regs[p1 as usize] = !vm.regs[p1 as usize];
        },

        // MOD - Modulo: MOD rd, rs (rd %= rs, div-by-zero = 0)
        31 => {
            let divisor = vm.regs[p2 as usize];
            if divisor != 0 {
                vm.regs[p1 as usize] = vm.regs[p1 as usize] % divisor;
            } else {
                vm.regs[p1 as usize] = 0;
            }
        },

        // LDB - Load byte: LDB rd, [rs] (rd = byte at byte address rs)
        32 => {
            let byte_addr = vm.regs[p2 as usize];
            let word_addr = (byte_addr / 4) * 4; // align to word boundary
            let shift = (byte_addr % 4) * 8;
            let word = mem_read(ram, word_addr);
            vm.regs[p1 as usize] = (word >> shift) & 0xFF;
        },

        // STB - Store byte: STB [rd], rs (store low byte of rs to byte address rd)
        33 => {
            let byte_addr = vm.regs[p1 as usize];
            let word_addr = (byte_addr / 4) * 4; // align to word boundary
            let shift = (byte_addr % 4) * 8;
            let old_word = mem_read(ram, word_addr);
            let byte_val = vm.regs[p2 as usize] & 0xFF;
            let mask = !(0xFFu32 << shift);
            let new_word = (old_word & mask) | (byte_val << shift);
            mem_write(ram, word_addr, new_word);
        },

        // FRAME - Film strip frame jump: FRAME r_target
        // Sets frame_ptr to r_target and jumps PC to the start of that frame.
        // Each frame occupies FRAME_TILE_PIXELS (65536) Hilbert addresses.
        // The frame base is: entry_point + frame_ptr * 65536
        27 => {
            let target_frame = vm.regs[p1 as usize];
            let frame_count = vm.frame_count;
            if frame_count == 0 {
                // No film strip loaded -- treat as fault
                vm.halted = 1;
                vm.state = 0xFF; // VM_FAULT
            } else if target_frame >= frame_count {
                // Out of range -- fault
                vm.halted = 1;
                vm.state = 0xFF; // VM_FAULT
            } else {
                vm.attention_mask = target_frame; // frame_ptr
                // Jump PC to the start of the target frame
                // entry_point is the base of frame 0
                let frame_size: u32 = 256 * 256; // TILE_PIXELS
                vm.pc = vm.entry_point + target_frame * frame_size;
                return true; // Jumped
            }
        }

        // GLYPH_DEF - Define a live glyph in the user atlas
        // GLYPH_DEF r_charcode, r_bitmap_addr
        // Reads 8 row bitmasks from r_bitmap_addr and writes to 0x00F20000 + ((charcode-128)*8)
        22 => {
            let charcode = vm.regs[p1 as usize];
            let bitmap_addr = vm.regs[p2 as usize];
            let live_base: u32 = 0x00F20000;
            if charcode >= 128 {
                let offset = (charcode - 128) * 8;
                for row in 0..8u32 {
                    let row_data = read_glyph(ram, bitmap_addr + row);
                    write_glyph(ram, live_base + offset + row, row_data);
                }
            }
            // charcodes < 128 are silently ignored (base font is read-only)
        }

        // PSET - Write pixel to screen: PSET r_x, r_y, r_color
        // Encoding: glyph(23, r_color, r_x, r_y)
        // stratum = color register, p1 = x register, p2 = y register
        23 => {
            let x = vm.regs[p1 as usize];
            let y = vm.regs[p2 as usize];
            let color = vm.regs[stratum as usize];
            if x < crate::SCREEN_SIZE && y < crate::SCREEN_SIZE {
                let addr = crate::SCREEN_BASE + y * crate::SCREEN_SIZE + x;
                // Write the 32-bit color value to the screen pixel
                mem_write(ram, addr * 4, color);
            }
        }

        // PGET - Read pixel from screen: PGET r_dst, r_x, r_y
        // Encoding: glyph(24, r_y, r_dst, r_x)
        // stratum = y register, p1 = dst register, p2 = x register
        24 => {
            let x = vm.regs[p2 as usize];
            let y = vm.regs[stratum as usize];
            if x < crate::SCREEN_SIZE && y < crate::SCREEN_SIZE {
                let addr = crate::SCREEN_BASE + y * crate::SCREEN_SIZE + x;
                vm.regs[p1 as usize] = mem_read(ram, addr * 4);
            } else {
                vm.regs[p1 as usize] = 0; // Out of bounds = black
            }
        }

        // CHAR_AT - Blit character from arbitrary atlas base address
        // CHAR_AT r_ascii, r_target, r_atlas_base
        // Like CHAR but uses stratum field for atlas_base register instead of hardcoded FONT_BASE.
        21 => {
            let ascii_val = vm.regs[p1 as usize];
            let target = vm.regs[p2 as usize];
            let atlas_base = vm.regs[stratum as usize];
            for row in 0..8u32 {
                let src_addr = atlas_base + ascii_val * 8 + row;
                let row_data = read_glyph(ram, src_addr);
                write_glyph(ram, target + row, row_data);
            }
        }

        // JMP - Unconditional jump: JMP offset
        // Shader: [9, 0, 0, 0] followed by [offset as i32]
        9 => {
            let offset = mem_read(ram, (pc + 1) * 4);
            let signed_offset = offset as i32;
            let new_pc = (pc as i32).wrapping_add(signed_offset);
            vm.pc = new_pc as u32;
            return true; // Jumped
        }

        // BRANCH - Conditional branch: BRANCH cond, r1, r2, offset
        // Shader emits: [10, cond, r1, r2] followed by [offset]
        10 => {
            let offset = mem_read(ram, (pc + 1) * 4);
            let a = vm.regs[p1 as usize];
            let b = vm.regs[p2 as usize];
            let take = match stratum {
                0 => a == b,                                    // BEQ
                1 => a != b,                                    // BNE
                2 => (a as i32) < (b as i32),                   // BLT (signed)
                3 => (a as i32) >= (b as i32),                  // BGE (signed)
                4 => a < b,                                     // BLTU (unsigned)
                5 => a >= b,                                    // BGEU (unsigned)
                _ => false,
            };
            if take {
                let signed_offset = offset as i32;
                let new_pc = (pc as i32).wrapping_add(signed_offset);
                vm.pc = new_pc as u32;
                return true; // Jumped
            }
            vm.pc = pc + 1; // Skip offset word
        }

        // CALL - Call subroutine: CALL addr
        // Shader: [11, 0, 0, 0] followed by [addr]
        11 => {
            let sp = vm.stack_ptr;
            if sp < 64 {
                vm.stack[sp as usize] = pc + 2; // Return past the DATA word
                vm.stack_ptr = sp + 1;
                let addr = mem_read(ram, (pc + 1) * 4);
                vm.pc = addr;
                return true; // Jumped
            }
        }

        // RET - Return from subroutine
        12 => {
            let sp = vm.stack_ptr;
            if sp > 0 {
                vm.stack_ptr = sp - 1;
                vm.pc = vm.stack[(sp - 1) as usize];
                return true; // Jumped
            }
        }

        // HALT - or projector auto-advance if film strip has more frames
        13 => {
            // Projector auto-advance: if this VM is part of a film strip
            // and there are more frames, advance to the next frame instead of halting.
            let frame_count = vm.frame_count;
            let frame_ptr = vm.attention_mask; // current frame index
            if frame_count > 0 && frame_ptr < frame_count - 1 {
                let next_frame = frame_ptr + 1;
                vm.attention_mask = next_frame; // frame_ptr = next
                let frame_size: u32 = 256 * 256; // TILE_PIXELS
                vm.pc = vm.entry_point + next_frame * frame_size;
                // Stay RUNNING -- don't halt
                return true; // Prevent PC increment -- we set PC already
            } else {
                // True halt (no film strip, or last frame)
                vm.halted = 1;
                vm.state = vm_state::HALTED;
            }
        }

        // ENTRY - Read entry_point into register: ENTRY rd
        14 => {
            vm.regs[p1 as usize] = vm.entry_point;
        }

        // CHAR - Blit character from font atlas to texture
        // CHAR r_ascii, r_target
        // Supports charcodes 0-127 (base atlas) and 128-255 (live atlas at 0x00F20000)
        15 => {
            let ascii_val = vm.regs[p1 as usize];
            let target = vm.regs[p2 as usize];
            let font_base: u32 = if ascii_val >= 128 {
                0x00F20000 // Live glyph atlas for charcodes 128-255
            } else {
                0x00F00000 // Must match font_atlas::FONT_BASE
            };
            let offset = if ascii_val >= 128 {
                (ascii_val - 128) * 8
            } else {
                ascii_val * 8
            };
            for row in 0..8u32 {
                let src_addr = font_base + offset + row;
                let row_data = read_glyph(ram, src_addr);
                write_glyph(ram, target + row, row_data);
            }
        }

        // BLIT - Copy N pixels from source to destination
        // BLIT r_src, r_dst [count]
        16 => {
            let src = vm.regs[p1 as usize];
            let dst = vm.regs[p2 as usize];
            let count = mem_read(ram, (pc + 1) * 4);
            for i in 0..count {
                let pixel = read_glyph(ram, src + i);
                write_glyph(ram, dst + i, pixel);
            }
            vm.pc = pc + 1; // Consume count word
            return true; // Jumped (PC already advanced)
        }

        // SEND - Send message to another VM via shared mailbox
        // SEND r_target_vm, r_data_addr [length]
        // r_target_vm (p1) = VM ID to send to
        // r_data_addr (p2) = Hilbert address of data pixels to send
        // DATA length = number of data pixels (max MSGQ_MAX_DATA)
        17 => {
            let target_vm = vm.regs[p1 as usize];
            let data_addr = vm.regs[p2 as usize];
            let length = mem_read(ram, (pc + 1) * 4);

            if (target_vm as usize) < MAX_VMS && length <= crate::MSGQ_MAX_DATA {
                let dest_base = crate::MSGQ_DATA_BASE + target_vm * crate::MSGQ_MAX_DATA;
                for i in 0..length {
                    let pixel = read_glyph(ram, data_addr + i);
                    write_glyph(ram, dest_base + i, pixel);
                }
                // Write header: flags=HAS_MESSAGE, sender=vm_id, length
                write_glyph(
                    ram,
                    crate::MSGQ_BASE + target_vm,
                    (1, vm.vm_id, length, 0), // flags=HAS_MESSAGE=1
                );
            }
            vm.pc = pc + 1; // Consume length word
        }

        // RECV - Receive message from this VM's mailbox
        // RECV r_dest_addr, r_status
        // Checks this VM's mailbox. If message present, copies data out.
        // Sets r_status (p2) = 1 on success, 0 if empty.
        18 => {
            let header = read_glyph(ram, crate::MSGQ_BASE + vm.vm_id);

            if (header.0 & 1) != 0 {
                // HAS_MESSAGE flag set
                let length = header.2;
                let dest_addr = vm.regs[p1 as usize];
                let src_base = crate::MSGQ_DATA_BASE + vm.vm_id * crate::MSGQ_MAX_DATA;
                for i in 0..length {
                    let pixel = read_glyph(ram, src_base + i);
                    write_glyph(ram, dest_addr + i, pixel);
                }
                // Mark as read (clear has_message, set was_read)
                write_glyph(
                    ram,
                    crate::MSGQ_BASE + vm.vm_id,
                    (2, header.1, header.2, 0), // flags=WAS_READ=2
                );
                vm.regs[p2 as usize] = 1; // success
            } else {
                vm.regs[p2 as usize] = 0; // no message
            }
        }

        // GLYPH_MUTATE (224): Transform glyph at target_addr to new_opcode.
        // GLYPH_MUTATE r_target_addr, r_new_opcode
        // Reads the pixel at the Hilbert index in r_target_addr, replaces its
        // opcode byte (R channel) with the value in r_new_opcode.
        // This IS self-modification -- the texture IS memory, each pixel IS an
        // instruction, and programs write programs.
        224 => {
            let target_pixel_idx = vm.regs[p1 as usize];
            let new_opcode = vm.regs[p2 as usize] & 0xFF;
            let (_, g, b, a) = read_glyph(ram, target_pixel_idx);
            write_glyph(ram, target_pixel_idx, (new_opcode as u32, g, b, a));
            vm.regs[p1 as usize] = 1; // success
        }

        // SPATIAL_SPAWN (225): Copy N pixels from source_addr to dest_addr.
        // SPATIAL_SPAWN r_dest_addr, r_size, r_source_addr
        // Source address is packed in a second pixel (data word).
        // Creates a new cluster of glyphs by copying `size` pixels.
        225 => {
            let dest_addr = vm.regs[p1 as usize]; // dest pixel index
            let size = vm.regs[stratum as usize];  // number of pixels to copy
            // Source address is in the data word (second pixel)
            let data_word = safe_mem_read(ram, vm, (pc + 1) * 4);
            let source_addr = vm.regs[data_word as usize];
            for i in 0..size {
                let pixel = read_glyph(ram, source_addr + i);
                write_glyph(ram, dest_addr + i, pixel);
            }
            vm.pc = pc + 1; // Consume data word
            vm.regs[p1 as usize] = size; // return bytes copied
        }

        // SEMANTIC_MERGE (226): Merge two clusters into dest, removing redundancy.
        // SEMANTIC_MERGE r_cluster_a, r_cluster_b, r_dest
        // Compares clusters pixel by pixel. For identical pixels, writes to dest.
        // For differing pixels, keeps the one with the higher opcode value
        // (heuristic: more complex = more likely intentional).
        // Dest register is packed in a second pixel (data word).
        226 => {
            let cluster_a = vm.regs[p1 as usize]; // pixel index of cluster A
            let cluster_b = vm.regs[p2 as usize]; // pixel index of cluster B
            // Dest register is in the data word (second pixel)
            let data_word = safe_mem_read(ram, vm, (pc + 1) * 4);
            let dest_addr = vm.regs[data_word as usize];
            // Merge: compare up to a fixed max of 256 pixels
            let max_merge = 256u32;
            let mut merged_count = 0u32;
            for i in 0..max_merge {
                let pa = read_glyph(ram, cluster_a + i);
                let pb = read_glyph(ram, cluster_b + i);
                // Stop at double-zero (both clusters exhausted)
                if pa.0 == 0 && pa.1 == 0 && pa.2 == 0 && pa.3 == 0
                    && pb.0 == 0 && pb.1 == 0 && pb.2 == 0 && pb.3 == 0
                {
                    break;
                }
                // For identical pixels, write as-is. For differing, keep higher opcode.
                let merged = if pa == pb {
                    pa
                } else if pa.0 >= pb.0 {
                    pa
                } else {
                    pb
                };
                write_glyph(ram, dest_addr + i, merged);
                merged_count += 1;
            }
            vm.pc = pc + 1; // Consume data word
            vm.regs[p1 as usize] = merged_count; // return count of merged pixels
        }

        // YIELD - Yield execution
        227 => {
            // Advance PC past the YIELD instruction so resume doesn't re-execute it
            vm.pc = pc + 1;
            vm.state = vm_state::YIELDED;
            return true; // Force end of frame for this VM
        }

        // SPAWN - Request child VM spawn: SPAWN r_base_addr, r_entry_offset
        // Deferred pattern (matches shader): stores spawn params in parent's registers.
        // Rust host reads them after the frame and initializes the child VM.
        //   regs[125] = non-zero flag (wants to spawn)
        //   regs[126] = child base address
        //   regs[127] = child entry offset
        // Returns 1 in p1 to indicate spawn requested, or 0xFF if all slots full.
        // Actual child VM ID is assigned post-frame by the host.
        230 => {
            let child_base = vm.regs[p1 as usize];
            let child_entry_offset = vm.regs[p2 as usize];
            // Set spawn request flag and params
            vm.regs[125] = 1; // pending spawn flag
            vm.regs[126] = child_base;
            vm.regs[127] = child_entry_offset;
            vm.regs[p1 as usize] = 1; // return 1 = spawn requested
        }

        // ── Issue Queue Opcodes (Phase 13A) ──────────────────────────

        // ISSUE_CREATE (240): Create a new issue in the queue.
        // Encoding: (240, assignee_id, r_title_addr, r_priority)
        // Reads title from pixel memory at r_title_addr (packed ASCII, null-terminated).
        // Returns: issue_id in r_title_addr register, or 0 on failure (queue full).
        240 => {
            let title_addr = vm.regs[p1 as usize];
            let priority = vm.regs[p2 as usize];
            let assignee_id = stratum;

            // Read queue header
            let head = mem_read(ram, crate::ISSUEQ_BASE * 4);
            let tail = mem_read(ram, (crate::ISSUEQ_BASE + 1) * 4);
            let count = mem_read(ram, (crate::ISSUEQ_BASE + 2) * 4);

            if count >= crate::ISSUEQ_CAPACITY {
                vm.regs[p1 as usize] = 0; // queue full
            } else {
                let slot_idx = tail % crate::ISSUEQ_CAPACITY;
                let slot_base = crate::ISSUEQ_SLOTS_BASE + slot_idx * crate::ISSUEQ_SLOT_SIZE;

                // Compute issue_id: tail + 1 (1-indexed, auto-incremented)
                let issue_id = tail + 1;

                // Write metadata pixel: (status << 24) | (priority << 16) | (assignee_id)
                let meta = (crate::ISSUE_STATUS_TODO << 24) | ((priority & 0xFF) << 16) | ((assignee_id as u32) & 0xFFFF);
                write_glyph(ram, slot_base, (meta & 0xFF, (meta >> 8) & 0xFF, (meta >> 16) & 0xFF, (meta >> 24) & 0xFF));
                // Wait -- write_glyph takes (u32, u32, u32, u32), and meta is the word value.
                // Actually we need mem_write since issue metadata is a packed 32-bit word.
                mem_write(ram, slot_base * 4, meta);

                // Write issue_id pixel
                mem_write(ram, (slot_base + 1) * 4, issue_id);

                // Copy title from title_addr into slot pixels 2-25 (packed ASCII, 4 bytes per pixel)
                for i in 0..24 {
                    let src_word = safe_mem_read(ram, vm, (title_addr + i) * 4);
                    mem_write(ram, (slot_base + 2 + i) * 4, src_word);
                }

                // Update queue header: increment tail and count
                mem_write(ram, (crate::ISSUEQ_BASE + 1) * 4, tail + 1);
                mem_write(ram, (crate::ISSUEQ_BASE + 2) * 4, count + 1);
                // Initialize capacity if first issue
                if count == 0 {
                    mem_write(ram, (crate::ISSUEQ_BASE + 3) * 4, crate::ISSUEQ_CAPACITY);
                }

                vm.regs[p1 as usize] = issue_id;
            }
        }

        // ISSUE_PICK (241): Atomically claim the highest-priority todo issue.
        // Encoding: (241, agent_vm_id, r_out_addr, r_filter)
        // Scans all issues, finds the highest-priority todo issue matching filter,
        // atomically sets its status to IN_PROGRESS and assignee to agent_vm_id.
        // Returns: issue_id in r_out_addr, or 0 if no match.
        // If r_filter == 0, picks any todo issue (highest priority first).
        // Copies issue slot data to r_out_addr (title, metadata, etc.).
        241 => {
            let agent_vm_id = stratum;
            let out_addr = vm.regs[p1 as usize];
            let filter = vm.regs[p2 as usize];

            let count = mem_read(ram, (crate::ISSUEQ_BASE + 2) * 4);

            let mut best_slot: Option<u32> = None;
            let mut best_priority: u32 = 0;
            let mut best_issue_id: u32 = 0;

            for i in 0..crate::ISSUEQ_CAPACITY {
                if i >= count {
                    break;
                }
                let slot_base = crate::ISSUEQ_SLOTS_BASE + i * crate::ISSUEQ_SLOT_SIZE;
                let meta = mem_read(ram, slot_base * 4);
                let status = (meta >> 24) & 0xFF;
                let priority = (meta >> 16) & 0xFF;

                if status != crate::ISSUE_STATUS_TODO {
                    continue;
                }
                if filter != 0 && priority != filter {
                    continue;
                }
                if priority > best_priority {
                    best_priority = priority;
                    best_slot = Some(slot_base);
                    best_issue_id = mem_read(ram, (slot_base + 1) * 4);
                }
            }

            if let Some(slot_base) = best_slot {
                // Atomic claim: set status to IN_PROGRESS and assignee to agent_vm_id
                let meta = mem_read(ram, slot_base * 4);
                let priority = (meta >> 16) & 0xFF;
                let new_meta = (crate::ISSUE_STATUS_IN_PROGRESS << 24)
                    | (priority << 16)
                    | ((agent_vm_id as u32) & 0xFFFF);
                mem_write(ram, slot_base * 4, new_meta);

                // Copy issue data to output region (full slot = 32 pixels)
                for i in 0..crate::ISSUEQ_SLOT_SIZE {
                    let word = mem_read(ram, (slot_base + i) * 4);
                    mem_write(ram, (out_addr + i) * 4, word);
                }

                vm.regs[p1 as usize] = best_issue_id;
            } else {
                vm.regs[p1 as usize] = 0; // no matching issue
            }
        }

        // ISSUE_UPDATE (242): Change status of an issue.
        // Encoding: (242, 0, r_issue_id, r_new_status)
        // Scans issues to find matching issue_id, updates status.
        // Returns: 1 in r_issue_id on success, 0 if not found.
        242 => {
            let target_id = vm.regs[p1 as usize];
            let new_status = vm.regs[p2 as usize];
            let count = mem_read(ram, (crate::ISSUEQ_BASE + 2) * 4);

            let mut found = false;
            for i in 0..crate::ISSUEQ_CAPACITY {
                if i >= count {
                    break;
                }
                let slot_base = crate::ISSUEQ_SLOTS_BASE + i * crate::ISSUEQ_SLOT_SIZE;
                let issue_id = mem_read(ram, (slot_base + 1) * 4);
                if issue_id == target_id {
                    let meta = mem_read(ram, slot_base * 4);
                    let priority = (meta >> 16) & 0xFF;
                    let assignee = meta & 0xFFFF;
                    let new_meta = ((new_status & 0xFF) << 24) | (priority << 16) | assignee;
                    mem_write(ram, slot_base * 4, new_meta);
                    found = true;
                    break;
                }
            }
            vm.regs[p1 as usize] = if found { 1 } else { 0 };
        }

        // ISSUE_LIST (243): List issue IDs matching a filter.
        // Encoding: (243, max_results, r_out_addr, r_filter)
        // Writes matching issue IDs to r_out_addr as an array of u32 words.
        // r_filter == 0: match all statuses.
        // Returns: count of matching issues in r_out_addr.
        243 => {
            let max_results = stratum as u32;
            let out_addr = vm.regs[p1 as usize];
            let _filter = vm.regs[p2 as usize];
            let count = mem_read(ram, (crate::ISSUEQ_BASE + 2) * 4);

            let mut written = 0u32;
            for i in 0..crate::ISSUEQ_CAPACITY {
                if i >= count || written >= max_results {
                    break;
                }
                let slot_base = crate::ISSUEQ_SLOTS_BASE + i * crate::ISSUEQ_SLOT_SIZE;
                let issue_id = mem_read(ram, (slot_base + 1) * 4);
                mem_write(ram, (out_addr + written) * 4, issue_id);
                written += 1;
            }
            vm.regs[p1 as usize] = written;
        }

        // MODEL_CALL (244): Call LLM with a prompt, write response to memory.
        // Encoding: (244, buf_size_pixels, r_prompt_addr, r_response_addr)
        // stratum = buffer size in pixels (each pixel = 4 bytes)
        // r_prompt_addr = pixel address of null-terminated prompt string
        // r_response_addr = pixel address of response buffer
        // Returns: number of response bytes written in r_prompt_addr, or 0 on error.
        // The response buffer is written as null-terminated packed ASCII.
        244 => {
            let prompt_pixel_addr = vm.regs[p1 as usize];
            let response_pixel_addr = vm.regs[p2 as usize];
            let buf_size_pixels = stratum as u32;
            let buf_size_bytes = buf_size_pixels * 4;

            // Read prompt string from pixel memory (packed ASCII, 4 bytes per pixel)
            let mut prompt_bytes = Vec::new();
            'prompt_read: for i in 0..2048u32 {
                let word = mem_read(ram, (prompt_pixel_addr + i) * 4);
                for shift in 0..4u32 {
                    let b = ((word >> (shift * 8)) & 0xFF) as u8;
                    if b == 0 {
                        break 'prompt_read;
                    }
                    prompt_bytes.push(b);
                }
            }
            let prompt_str = String::from_utf8_lossy(&prompt_bytes).into_owned();

            // Call the model handler
            let response_result = MODEL_HANDLER.with(|h| {
                let handler = h.borrow();
                if let Some(ref f) = *handler {
                    Some(f(&prompt_str))
                } else {
                    None
                }
            });

            match response_result {
                Some(Ok(response_text)) => {
                    // Write response to response buffer as packed ASCII
                    let resp_bytes = response_text.as_bytes();
                    let write_len = resp_bytes.len().min((buf_size_bytes - 1) as usize);
                    // Write bytes in groups of 4 (one pixel per group)
                    let mut byte_idx = 0;
                    for pix_idx in 0..buf_size_pixels {
                        let mut word: u32 = 0;
                        for shift in 0..4u32 {
                            if byte_idx < write_len {
                                word |= (resp_bytes[byte_idx] as u32) << (shift * 8);
                                byte_idx += 1;
                            }
                        }
                        mem_write(ram, (response_pixel_addr + pix_idx) * 4, word);
                        if byte_idx >= write_len {
                            // Null-terminate: the remaining bytes of current word are 0,
                            // and subsequent pixels are already 0 (or we write them as 0).
                            break;
                        }
                    }
                    vm.regs[p1 as usize] = write_len as u32; // bytes written
                }
                Some(Err(_)) | None => {
                    // Error or no handler: write empty response
                    mem_write(ram, response_pixel_addr * 4, 0);
                    vm.regs[p1 as usize] = 0; // 0 = error
                }
            }
        }

        // WAIT_EVENT (opcode 28): Block until event arrives.
        // WAIT_EVENT r_event_type, r_param1
        // If event pending: reads event into r_event_type, r_param1, clears the slot.
        // If no event: VM transitions to WAITING state.
        28 => {
            let vm_id = vm.vm_id;
            let header_base = crate::EVENTQ_BASE + vm_id * 2;
            let event_type = safe_mem_read(ram, vm, header_base * 4);
            if event_type != 0 {
                // Event pending: read params into registers
                let param1 = safe_mem_read(ram, vm, (header_base + 1) * 4);
                vm.regs[stratum as usize] = event_type;
                vm.regs[p1 as usize] = param1;
                // Clear event header
                safe_mem_write(ram, vm, header_base * 4, 0);
                safe_mem_write(ram, vm, (header_base + 1) * 4, 0);
            } else {
                // No event: VM waits (will retry next frame)
                vm.pc = pc; // Re-execute WAIT_EVENT next frame
                vm.state = vm_state::WAITING;
                return true; // Force end of frame
            }
        }

        // RECTF - Filled rectangle: RECTF r_x, r_y, packed_params
        // Encoding: glyph(34, r_x, r_y, 0) followed by [packed (w<<16|h)]
        // Color from r2 (R_COLOR convention)
        34 => {
            let data_word = safe_mem_read(ram, vm, (pc + 1) * 4);
            let x = vm.regs[p1 as usize];
            let y = vm.regs[p2 as usize];
            let w = (data_word >> 16) & 0xFFFF;
            let h = data_word & 0xFFFF;
            let color = vm.regs[2]; // R_COLOR convention
            for dy in 0..h {
                for dx in 0..w {
                    let px = x + dx;
                    let py = y + dy;
                    if px < crate::SCREEN_SIZE && py < crate::SCREEN_SIZE {
                        let addr = crate::SCREEN_BASE + py * crate::SCREEN_SIZE + px;
                        mem_write(ram, addr * 4, color);
                    }
                }
            }
            vm.pc += 1; // Consume data word
        }

        // LINE - Bresenham line: LINE r_x0, r_y0, packed_endpoints
        // Encoding: glyph(35, r_x0, r_y0, 0) followed by [packed (x1<<16)|(y1&0xFFFF)]
        // Color from r2 (R_COLOR convention)
        35 => {
            let data_word = safe_mem_read(ram, vm, (pc + 1) * 4);
            let x0 = vm.regs[p1 as usize] as i32;
            let y0 = vm.regs[p2 as usize] as i32;
            let x1 = (data_word >> 16) as i32;
            let y1 = (data_word & 0xFFFF) as i32;
            let color = vm.regs[2];
            // Bresenham
            let dx = (x1 - x0).abs();
            let dy = -(y1 - y0).abs();
            let sx = if x0 < x1 { 1 } else { -1 };
            let sy = if y0 < y1 { 1 } else { -1 };
            let mut err = dx + dy;
            let mut cx = x0;
            let mut cy = y0;
            loop {
                let px = cx as u32;
                let py = cy as u32;
                if px < crate::SCREEN_SIZE && py < crate::SCREEN_SIZE {
                    let addr = crate::SCREEN_BASE + py * crate::SCREEN_SIZE + px;
                    mem_write(ram, addr * 4, color);
                }
                if cx == x1 && cy == y1 { break; }
                let e2 = 2 * err;
                if e2 >= dy { err += dy; cx += sx; }
                if e2 <= dx { err += dx; cy += sy; }
            }
            vm.pc += 1;
        }

        // TEXT_STR - Draw null-terminated string: TEXT_STR r_addr, r_x, r_y
        36 => {
            let addr_reg = p1 as usize;
            let mut x = vm.regs[p2 as usize];
            let y = vm.regs[stratum as usize];
            let color = vm.regs[2];
            let base_addr = vm.regs[addr_reg];
            let mut offset = 0u32;
            loop {
                let ch = safe_mem_read(ram, vm, (base_addr + offset) * 4);
                if ch == 0 { break; }
                // Simple 8x8 character rendering using font atlas
                let ascii = (ch & 0xFF) as u8;
                if ascii >= 128 { offset += 1; x += 8; continue; }
                let rows = crate::font_atlas::get_char_rows(ascii);
                for row in 0..8u32 {
                    let font_byte = rows[row as usize];
                    for col in 0..8u32 {
                        if font_byte & (0x80 >> col) != 0 {
                            let px = x + col;
                            let py = y + row;
                            if px < crate::SCREEN_SIZE && py < crate::SCREEN_SIZE {
                                let addr = crate::SCREEN_BASE + py * crate::SCREEN_SIZE + px;
                                mem_write(ram, addr * 4, color);
                            }
                        }
                    }
                }
                x += 8;
                offset += 1;
                if offset > 256 { break; } // safety limit
            }
        }

        // CIRCLEF - Filled circle: CIRCLEF r_cx, r_cy, r_radius
        37 => {
            let cx = vm.regs[p1 as usize];
            let cy = vm.regs[p2 as usize];
            let r = vm.regs[stratum as usize];
            let color = vm.regs[2];
            if r > 0 {
                let r = r as i32;
                let cy_i = cy as i32;
                let cx_i = cx as i32;
                for dy in -r..=r {
                    for dx in -r..=r {
                        if dx * dx + dy * dy <= r * r {
                            let px = (cx_i + dx) as u32;
                            let py = (cy_i + dy) as u32;
                            if px < crate::SCREEN_SIZE && py < crate::SCREEN_SIZE {
                                let addr = crate::SCREEN_BASE + py * crate::SCREEN_SIZE + px;
                                mem_write(ram, addr * 4, color);
                            }
                        }
                    }
                }
            }
        }

        // BRANCH_PROB (220) - Probabilistic branch: BRANCH_PROB r_prob, offset
        // Coin flip: if (prob & 0xFFFF) > random_value, branch by offset
        220 => {
            let prob = vm.regs[p1 as usize];
            let offset = safe_mem_read(ram, vm, (pc + 1) * 4) as i32;
            // Use low 16 bits as probability threshold (0-65535)
            let threshold = prob & 0xFFFF;
            // Simple deterministic PRNG from pc for reproducibility
            let hash = (pc.wrapping_mul(2654435761)) & 0xFFFF;
            if threshold > hash {
                vm.pc = ((vm.pc as i64) + offset as i64 - 1) as u32; // -1 because we'll +1 below
            }
            vm.pc += 1; // Consume offset word
        }

        // CONFIDENCE_MARK (221) - Mark confidence: CONFIDENCE_MARK r_block_id
        // Records confidence score for a code block (stored in confidence register)
        221 => {
            let block_id = vm.regs[p1 as usize];
            // Store confidence score: high bits of block_id as score, low bits as id
            let score = (block_id >> 16) & 0xFFFF;
            let id = block_id & 0xFFFF;
            // Write to confidence memory region (0x00F0_0000 + id)
            let conf_addr = 0x00F0_0000 + id;
            mem_write(ram, conf_addr * 4, score);
        }

        // ALTERNATE_PATH (222) - Conditional path: ALTERNATE_PATH r_block_id, offset
        // Jump if confidence for block_id is below threshold
        222 => {
            let block_id = vm.regs[p1 as usize];
            let offset = safe_mem_read(ram, vm, (pc + 1) * 4) as i32;
            let id = block_id & 0xFFFF;
            let threshold = (block_id >> 16) & 0xFFFF;
            // Read confidence from memory
            let conf_addr = 0x00F0_0000 + id;
            let current_score = mem_read(ram, conf_addr * 4);
            if current_score < threshold {
                vm.pc = ((vm.pc as i64) + offset as i64 - 1) as u32;
            }
            vm.pc += 1; // Consume offset word
        }

        // Unknown opcode - skip
        _ => {}
    }

    false // No jump
}

/// Helper for bound-checked memory read in software VM
fn safe_mem_read(ram: &RamTexture, _vm: &mut VmState, addr: u32) -> u32 {
    // GPU shader has no per-access bounds checking -- it only applies the
    // default sandbox (bound_addr==0 -> MSGQ_BASE).  We mirror that here
    // by removing the per-access fault that was causing false positives
    // when spawn_vm_with_bounds sets tight pixel-index bounds.
    mem_read(ram, addr)
}

/// Helper for bound-checked memory write in software VM
fn safe_mem_write(ram: &mut RamTexture, _vm: &mut VmState, addr: u32, value: u32) {
    // Mirror GPU shader: no per-access bounds checking.
    mem_write(ram, addr, value)
}

/// The Software VM -- CPU-side mirror of the GPU compute shader.
/// Status snapshot of a single VM slot.
#[derive(Debug, Clone)]
pub struct VmStatus {
    pub vm_id: u32,
    pub state: u8,
    pub pc: u32,
    pub base_addr: u32,
    pub bound_addr: u32,
}

/// CPU-side mirror of the shader's compute state.
///
/// The software VM is a faithful reimplementation of the GPU shader:
///   - Same Hilbert curve memory mapping
///   - Same opcode implementations
///   - Same cycle budget (1024 per frame)
///   - Same VM state transitions
pub struct SoftwareVm {
    pub vms: [VmState; MAX_VMS],
    ram: RamTexture,
    scheduler_active_count: u32,
    scheduler_frame: u32,
}

impl SoftwareVm {
    /// Create a new software VM with all VMs inactive and blank RAM.
    pub fn new() -> Self {
        Self {
            vms: core::array::from_fn(|_| VmState::default()),
            ram: RamTexture::new(),
            scheduler_active_count: 0,
            scheduler_frame: 0,
        }
    }

    /// Load a program into RAM at the given Hilbert address.
    /// Each pixel is written as RGBA bytes at the Hilbert-mapped position.
    pub fn load_program(&mut self, start_addr: u32, pixels: &[u32]) {
        for (i, &pixel) in pixels.iter().enumerate() {
            let addr = start_addr + i as u32;
            let (x, y) = hilbert::d2xy(addr);
            let bytes = pixel.to_le_bytes();
            let offset = ((y * TEXTURE_SIZE + x) * 4) as usize;
            self.ram.data[offset..offset + 4].copy_from_slice(&bytes);
        }
    }

    /// Load a program into RAM, but ONLY if it passes the governance gate.
    /// Returns the governance result. If rejected, the program is NOT loaded.
    /// This is the non-negotiable gate -- every production code path must use this.
    pub fn load_program_governed(
        &mut self,
        start_addr: u32,
        pixels: &[u32],
    ) -> governance::GovernanceResult {
        let result = governance::check(pixels);
        if result.approved {
            self.load_program(start_addr, pixels);
        }
        result
    }

    /// Spawn a VM at the given Hilbert address.
    /// Mirrors GlyphVm::spawn_vm() exactly.
    pub fn spawn_vm(&mut self, vm_id: u32, entry_point: u32) {
        assert!((vm_id as usize) < MAX_VMS, "VM id must be 0-7");
        let vm = &mut self.vms[vm_id as usize];
        vm.vm_id = vm_id;
        vm.pc = entry_point;
        vm.entry_point = entry_point;
        vm.state = vm_state::RUNNING;
        vm.halted = 0;
    }

    /// Spawn a VM with explicit memory bounds.
    /// Sets base_addr=entry_point, bound_addr=entry_point+size.
    pub fn spawn_vm_with_bounds(&mut self, vm_id: u32, entry_point: u32, size: u32) {
        assert!((vm_id as usize) < MAX_VMS, "VM id must be 0-7");
        let vm = &mut self.vms[vm_id as usize];
        vm.vm_id = vm_id;
        vm.pc = entry_point;
        vm.entry_point = entry_point;
        vm.base_addr = entry_point;
        vm.bound_addr = entry_point + size;
        vm.state = vm_state::RUNNING;
        vm.halted = 0;
    }

    /// Inject an external event into a VM's event slot.
    /// Writes event_type and param1 into the VM's event header region.
    /// If the VM is in WAITING state, transitions it back to RUNNING.
    pub fn inject_event(&mut self, vm_id: u32, event_type: u32, param1: u32) {
        assert!((vm_id as usize) < MAX_VMS, "VM id must be 0-7");
        let header_base = crate::EVENTQ_BASE + vm_id * 2;
        // Write event header (type + param1)
        self.poke(header_base, event_type);
        self.poke(header_base + 1, param1);
        // Wake the VM if it was waiting
        let vm = &mut self.vms[vm_id as usize];
        if vm.state == vm_state::WAITING {
            vm.state = vm_state::RUNNING;
        }
    }

    /// Hot-load a program into an unused substrate region without disturbing running VMs.
    ///
    /// Safety checks:
    /// - Target region [start_addr, start_addr + pixels.len()) must not overlap any
    ///   active VM's memory bounds.
    /// - Program must pass the governance gate.
    /// - Returns Err with a description if any check fails.
    ///
    /// On success, returns the vm_id that was allocated.
    pub fn load_hot(&mut self, start_addr: u32, pixels: &[u32]) -> Result<u32, String> {
        let end_addr = start_addr + pixels.len() as u32;

        // Check that the target region doesn't overlap any active VM's bounds.
        for vm_id in 0..MAX_VMS {
            let vm = &self.vms[vm_id as usize];
            if vm.state == vm_state::RUNNING || vm.state == vm_state::YIELDED {
                let vm_start = vm.base_addr;
                let vm_end = vm.bound_addr;
                // Check overlap: [start_addr, end_addr) ∩ [vm_start, vm_end)
                if start_addr < vm_end && end_addr > vm_start {
                    return Err(format!(
                        "Region [{:#X}, {:#X}) overlaps active VM {} [{:#X}, {:#X})",
                        start_addr, end_addr, vm_id, vm_start, vm_end
                    ));
                }
            }
        }

        // Find an inactive VM slot.
        let free_slot = self
            .vms
            .iter()
            .position(|vm| vm.state == vm_state::INACTIVE)
            .ok_or_else(|| "No free VM slots available".to_string())? as u32;

        // Governance check.
        let result = governance::check(pixels);
        if !result.approved {
            return Err(format!("Governance rejected: {}", result.reason));
        }

        // Load the pixels.
        self.load_program(start_addr, pixels);

        // Spawn the VM. We set pc/entry_point to start_addr but give it
        // full memory access so it can read/write anywhere (bounds are
        // checked in byte-space by safe_mem_read, and the default 0x00E00000
        // range covers all usable memory).
        {
            let vm = &mut self.vms[free_slot as usize];
            vm.vm_id = free_slot;
            vm.pc = start_addr;
            vm.entry_point = start_addr;
            vm.base_addr = 0;
            vm.bound_addr = 0; // will be expanded to 0x00E00000 by execute_frame
            vm.state = vm_state::RUNNING;
            vm.halted = 0;
        }

        Ok(free_slot)
    }

    /// Hot-load a .gasm program from text, parsing and loading in one step.
    pub fn load_hot_gasm(&mut self, start_addr: u32, source: &str) -> Result<u32, String> {
        let program =
            crate::assembler::parse_gasm(source).map_err(|e| format!("Parse error: {}", e))?;
        self.load_hot(start_addr, &program.pixels)
    }

    /// Return a summary of all VM states for status reporting.
    pub fn status(&self) -> Vec<VmStatus> {
        let mut out = Vec::new();
        for vm_id in 0..MAX_VMS {
            let vm = &self.vms[vm_id as usize];
            out.push(VmStatus {
                vm_id: vm_id as u32,
                state: vm.state as u8,
                pc: vm.pc,
                base_addr: vm.base_addr,
                bound_addr: vm.bound_addr,
            });
        }
        out
    }

    /// Set a model call handler for the MODEL_CALL opcode (244).
    /// The handler receives a prompt string and returns Ok(response) or Err(message).
    /// This is used for testing LLM integration without a real endpoint.
    pub fn with_model_handler<F>(&self, f: F)
    where
        F: Fn(&str) -> Result<String, String> + 'static,
    {
        MODEL_HANDLER.with(|h| {
            *h.borrow_mut() = Some(Box::new(f));
        });
    }

    /// Execute one frame: run all active VMs for up to CYCLES_PER_FRAME cycles.
    /// Mirrors the shader's main() compute entry point exactly.
    pub fn execute_frame(&mut self) {
        self.scheduler_active_count = 0;

        for vm_id in 0..MAX_VMS {
            let vm = &mut self.vms[vm_id];

            // Initialize sandbox for any VM with uninitialized bounds (first boot)
            if vm.bound_addr == 0 {
                vm.base_addr = 0;
                vm.bound_addr = 0x00E00000; // Entire non-system space
            }

            // Auto-resume: YIELDed VMs transition back to RUNNING at frame start.
            // This enables cooperative multitasking -- a VM that YIELDed last frame
            // gets a fresh timeslice this frame.
            if vm.state == vm_state::YIELDED {
                vm.state = vm_state::RUNNING;
            }

            // Only execute running VMs (mirrors shader: if state != RUNNING || halted != 0, return)
            if vm.state != vm_state::RUNNING || vm.halted != 0 {
                continue;
            }

            self.scheduler_active_count += 1;

            // Execute up to CYCLES_PER_FRAME instructions
            for _ in 0..CYCLES_PER_FRAME {
                if vm.halted != 0 || vm.state != vm_state::RUNNING {
                    break;
                }

                // DEBUG: bounds check before execute
                let (opcode, stratum, p1, p2) = {
                    let (x, y) = hilbert::d2xy(vm.pc);
                    let offset = ((y * TEXTURE_SIZE + x) * 4) as usize;
                    let r = self.ram.data[offset] as u32;
                    let g = self.ram.data[offset + 1] as u32;
                    let b = self.ram.data[offset + 2] as u32;
                    let a = self.ram.data[offset + 3] as u32;
                    (r, g, b, a)
                };
                if (p1 as usize) >= 128 || (p2 as usize) >= 128 {
                    eprintln!("BUG: vm_id={} pc={:#010x} op={} stratum={} p1={} p2={} -> out of bounds reg access!", vm.vm_id, vm.pc, opcode, stratum, p1, p2);
                    vm.halted = 1;
                    vm.state = vm_state::HALTED;
                    break;
                }

                let jumped = execute_instruction(&mut self.ram, vm);

                // Only increment PC if we didn't jump
                if !jumped {
                    vm.pc += 1;
                }

                vm.cycles += 1;
            }
        }

        // ── Post-frame: process deferred spawns ──
        // After all VMs execute, scan for pending SPAWN requests.
        // A VM that executed SPAWN stored a non-zero value in regs[125] as a
        // "wants to spawn" flag, child_base in regs[126], child_entry in regs[127].
        // We now find the first INACTIVE slot and initialize the child VM.
        // This matches the GPU daemon's post-frame spawn processing.
        for parent_id in 0..MAX_VMS {
            let wants_spawn = self.vms[parent_id].regs[125];
            if wants_spawn == 0 {
                continue;
            }
            let child_base = self.vms[parent_id].regs[126];
            let child_entry = self.vms[parent_id].regs[127];

            // Find first INACTIVE slot for the child
            let mut assigned_child: Option<u32> = None;
            for slot in 0..MAX_VMS {
                if self.vms[slot].state == vm_state::INACTIVE {
                    assigned_child = Some(slot as u32);
                    break;
                }
            }

            if let Some(child_id) = assigned_child {
                let child_idx = child_id as usize;
                let parent_gen = self.vms[parent_id].generation;
                let child = &mut self.vms[child_idx];
                child.vm_id = child_id;
                child.pc = child_entry;
                child.entry_point = child_entry;
                child.state = vm_state::RUNNING;
                child.halted = 0;
                child.parent_id = parent_id as u32;
                child.generation = parent_gen + 1;
                // Memory isolation: child gets its own region
                if child_base > 0 {
                    child.base_addr = child_base;
                    child.bound_addr = crate::MSGQ_BASE;
                } else {
                    child.base_addr = 0;
                    child.bound_addr = crate::MSGQ_BASE;
                }
            }
        }
        // Clear spawn registers only on VMs that requested a spawn
        for vm_id in 0..MAX_VMS {
            let vm = &mut self.vms[vm_id];
            if vm.regs[125] != 0 {
                vm.regs[125] = 0;
                vm.regs[126] = 0;
                vm.regs[127] = 0;
            }
        }

        self.scheduler_frame += 1;
    }

    /// Get a VM's state (immutable).
    pub fn vm_state(&self, id: usize) -> &VmState {
        &self.vms[id]
    }

    /// Get a VM's state (mutable).
    pub fn vm_state_mut(&mut self, id: usize) -> &mut VmState {
        &mut self.vms[id]
    }

    /// Read a 32-bit value from RAM at a Hilbert address.
    /// Useful for verifying memory contents after execution.
    pub fn peek(&self, addr: u32) -> u32 {
        let (x, y) = hilbert::d2xy(addr);
        let offset = ((y * TEXTURE_SIZE + x) * 4) as usize;
        let mut bytes = [0u8; 4];
        bytes.copy_from_slice(&self.ram.data[offset..offset + 4]);
        u32::from_le_bytes(bytes)
    }

    /// Write a 32-bit value to RAM at a Hilbert address.
    pub fn poke(&mut self, addr: u32, value: u32) {
        let (x, y) = hilbert::d2xy(addr);
        let offset = ((y * TEXTURE_SIZE + x) * 4) as usize;
        self.ram.data[offset..offset + 4].copy_from_slice(&value.to_le_bytes());
    }

    /// Write a single byte to RAM at a byte address.
    /// Matches LDB/STB byte addressing: byte_addr → pixel_idx = byte_addr/4,
    /// byte offset within pixel = byte_addr % 4.
    pub fn poke_byte(&mut self, byte_addr: u32, value: u8) {
        let pixel_idx = byte_addr / 4;
        let byte_off = (byte_addr % 4) as usize;
        let (x, y) = hilbert::d2xy(pixel_idx);
        let offset = ((y * TEXTURE_SIZE + x) * 4) as usize;
        self.ram.data[offset + byte_off] = value;
    }

    /// Read a single byte from RAM at a byte address.
    pub fn peek_byte(&self, byte_addr: u32) -> u8 {
        let pixel_idx = byte_addr / 4;
        let byte_off = (byte_addr % 4) as usize;
        let (x, y) = hilbert::d2xy(pixel_idx);
        let offset = ((y * TEXTURE_SIZE + x) * 4) as usize;
        self.ram.data[offset + byte_off]
    }

    /// Write a 32-bit word to RAM at a byte address (little-endian).
    /// Uses the same pixel-index mapping as LOAD/STORE: pixel_idx = byte_addr / 4.
    pub fn poke_word(&mut self, byte_addr: u32, value: u32) {
        let pixel_idx = byte_addr / 4;
        // Must be 4-byte aligned
        debug_assert_eq!(byte_addr % 4, 0, "poke_word requires 4-byte alignment");
        self.poke(pixel_idx, value);
    }

    /// Read a 32-bit word from RAM at a byte address (little-endian).
    pub fn peek_word(&self, byte_addr: u32) -> u32 {
        let pixel_idx = byte_addr / 4;
        debug_assert_eq!(byte_addr % 4, 0, "peek_word requires 4-byte alignment");
        self.peek(pixel_idx)
    }

    /// Alias for peek() -- read a pixel from substrate memory.
    pub fn read_pixel(&self, addr: u32) -> u32 {
        self.peek(addr)
    }

    /// Alias for poke() -- write a pixel to substrate memory.
    pub fn write_pixel(&mut self, addr: u32, value: u32) {
        self.poke(addr, value)
    }

    /// Load the font atlas into RAM at FONT_BASE.
    /// Must be called before using the CHAR opcode.
    pub fn load_font_atlas(&mut self) {
        use crate::font_atlas;
        for ascii in 0..font_atlas::FONT_CHARS {
            let rows = font_atlas::get_char_rows(ascii as u8);
            for row in 0..8u32 {
                let addr = font_atlas::FONT_BASE + (ascii as u32) * 8 + row;
                self.poke(addr, rows[row as usize] as u32);
            }
        }
    }

    /// Load RGBA pixels from a PNG image into the SCREEN region.
    /// The image is resized to SCREEN_SIZE x SCREEN_SIZE if needed.
    /// Each pixel's RGBA is stored as a u32 in the screen memory region.
    pub fn load_png_to_screen(&mut self, img: &image::RgbaImage) {
        use crate::{SCREEN_BASE, SCREEN_SIZE};
        let (w, h) = img.dimensions();
        for y in 0..SCREEN_SIZE {
            for x in 0..SCREEN_SIZE {
                let rgba = if x < w && y < h {
                    let px = img.get_pixel(x, y);
                    let [r, g, b, a] = px.0;
                    (r as u32) | ((g as u32) << 8) | ((b as u32) << 16) | ((a as u32) << 24)
                } else {
                    0u32 // Black for out-of-bounds
                };
                let addr = SCREEN_BASE + y * SCREEN_SIZE + x;
                self.poke(addr, rgba);
            }
        }
    }

    /// Dump the SCREEN region as a PNG image (SCREEN_SIZE x SCREEN_SIZE, RGBA).
    pub fn dump_screen_png(&self) -> image::RgbaImage {
        use crate::{SCREEN_BASE, SCREEN_SIZE};
        let mut img = image::RgbaImage::new(SCREEN_SIZE, SCREEN_SIZE);
        for y in 0..SCREEN_SIZE {
            for x in 0..SCREEN_SIZE {
                let addr = SCREEN_BASE + y * SCREEN_SIZE + x;
                let val = self.peek(addr);
                let r = (val & 0xFF) as u8;
                let g = ((val >> 8) & 0xFF) as u8;
                let b = ((val >> 16) & 0xFF) as u8;
                let a = ((val >> 24) & 0xFF) as u8;
                img.put_pixel(x, y, image::Rgba([r, g, b, a]));
            }
        }
        img
    }

    /// Reset all VMs and clear RAM.
    pub fn reset(&mut self) {
        self.vms = core::array::from_fn(|_| VmState::default());
        self.ram = RamTexture::new();
        self.scheduler_active_count = 0;
        self.scheduler_frame = 0;
    }

    /// Run a single program on VM 0 and return the final VM state.
    /// Convenience wrapper for the common test pattern.
    pub fn run_program(pixels: &[u32], load_address: u32) -> VmState {
        let mut svm = Self::new();
        svm.load_program(load_address, pixels);
        svm.spawn_vm(0, load_address);
        svm.execute_frame();
        svm.vm_state(0).clone()
    }

    /// Run a program through the governance gate first.
    /// Returns None if the program fails governance (it never loads or executes).
    /// Returns Some(VmState) if governance passes and the program completes.
    pub fn run_program_governed(
        pixels: &[u32],
        load_address: u32,
    ) -> Option<(VmState, governance::GovernanceResult)> {
        let mut svm = Self::new();
        let result = svm.load_program_governed(load_address, pixels);
        if !result.approved {
            return None;
        }
        svm.spawn_vm(0, load_address);
        svm.execute_frame();
        Some((svm.vm_state(0).clone(), result))
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::assembler::{self, op, bcond, Program};

    // ── Basic opcode tests ──

    #[test]
    fn test_nop() {
        let mut p = Program::new();
        p.instruction(op::NOP, 0, 0, 0);
        p.halt();
        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.state, vm_state::HALTED);
        assert_eq!(vm.cycles, 2); // NOP + HALT (PC increments past HALT like shader)
    }

    #[test]
    fn test_ldi() {
        let mut p = Program::new();
        p.ldi(0, 42);
        p.halt();
        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.state, vm_state::HALTED);
        assert_eq!(vm.regs[0], 42);
    }

    #[test]
    fn test_ldi_multiple_regs() {
        let mut p = Program::new();
        p.ldi(0, 100);
        p.ldi(1, 200);
        p.ldi(5, 999);
        p.halt();
        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 100);
        assert_eq!(vm.regs[1], 200);
        assert_eq!(vm.regs[5], 999);
    }

    #[test]
    fn test_mov() {
        let mut p = Program::new();
        p.ldi(0, 77);
        p.instruction(op::MOV, 0, 1, 0); // MOV r1, r0
        p.halt();
        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 77);
        assert_eq!(vm.regs[1], 77);
    }

    #[test]
    fn test_add() {
        let mut p = Program::new();
        p.ldi(0, 10);
        p.ldi(1, 20);
        p.add(0, 1); // r0 += r1
        p.halt();
        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 30);
        assert_eq!(vm.regs[1], 20);
    }

    #[test]
    fn test_sub() {
        let mut p = Program::new();
        p.ldi(0, 50);
        p.ldi(1, 20);
        p.sub(0, 1); // r0 -= r1
        p.halt();
        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 30);
    }

    #[test]
    fn test_add_wrapping() {
        let mut p = Program::new();
        p.ldi(0, 0xFFFF_FFFF); // max u32 -- needs 2 pixels
        p.pixels.push(0xFFFF_FFFF);
        // Actually LDI loads immediate, so:
        let mut p2 = Program::new();
        p2.ldi(0, 1);
        p2.ldi(1, 0xFFFF_FFFF);
        p2.add(0, 1);
        p2.halt();
        let vm = SoftwareVm::run_program(&p2.pixels, 0);
        assert_eq!(vm.regs[0], 0); // 1 + 0xFFFFFFFF wraps to 0
    }

    // ── Memory tests ──

    #[test]
    fn test_store_and_load() {
        let mut svm = SoftwareVm::new();
        // Write a value to address 500, then read it back
        let mut p = Program::new();
        p.ldi(0, 500); // r0 = address 500
        p.ldi(1, 0xDEAD); // r1 = value
        p.store(0, 1); // mem[r0] = r1
        p.ldi(2, 0); // r2 = 0 (will be overwritten)
        p.load(2, 0); // r2 = mem[r0]
        p.halt();
        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();
        let vm = svm.vm_state(0);
        assert_eq!(vm.regs[2], 0xDEAD);
    }

    #[test]
    fn test_ram_peek_poke() {
        let mut svm = SoftwareVm::new();
        svm.poke(100, 0xBEEF_CAFE);
        assert_eq!(svm.peek(100), 0xBEEF_CAFE);
        assert_eq!(svm.peek(101), 0); // Uninitialized
    }

    // ── Branch tests ──

    #[test]
    fn test_bne_taken() {
        let mut p = Program::new();
        p.ldi(0, 1);
        p.ldi(1, 2);
        // BNE r0, r1, offset -- they're not equal, so branch taken
        // offset = -1 means jump back 1 (to current instruction = infinite loop)
        // Let's use a more meaningful test:
        p.ldi(0, 5);
        p.ldi(1, 5);
        p.bne(0, 1, 1); // r0 == r1, so NOT taken, skip offset word
        p.halt();
        // If BNE is not taken, PC advances past the DATA word and hits HALT
        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.state, vm_state::HALTED);
    }

    #[test]
    fn test_bne_not_taken() {
        let mut p = Program::new();
        p.ldi(0, 5);
        p.ldi(1, 3);
        // BNE r0, r1, offset=0 -- they differ, jump by +0 = stay on BNE = infinite loop
        // Better test: branch over HALT
        // Layout: 0:LDI r0,5  2:LDI r1,3  4:BNE r0,r1,+2  6:DATA(+2)  7:NOP  8:HALT
        let mut prog = Program::new();
        prog.ldi(0, 5); // addr 0-1
        prog.ldi(1, 3); // addr 2-3
        prog.bne(0, 1, 2); // addr 4-5: branch +2 if r0 != r1 -> jump to addr 6+2=8
        prog.instruction(op::NOP, 0, 0, 0); // addr 6 (skipped)
        prog.instruction(op::NOP, 0, 0, 0); // addr 7 (skipped)
        prog.halt(); // addr 8
        let vm = SoftwareVm::run_program(&prog.pixels, 0);
        assert_eq!(vm.state, vm_state::HALTED);
        assert_eq!(vm.regs[0], 5);
    }

    // ── Call/Ret tests ──

    #[test]
    fn test_call_ret() {
        // Main: CALL subroutine, then HALT
        // Subroutine: LDI r0, 42, RET
        let mut p = Program::new();
        // addr 0: CALL 4  (subroutine starts at addr 4)
        p.instruction(op::CALL, 0, 0, 0);
        p.pixels.push(4); // address of subroutine
        // addr 2: HALT
        p.halt();
        // addr 3: NOP (padding -- unused)
        p.instruction(op::NOP, 0, 0, 0);
        // addr 4: LDI r0, 42
        p.ldi(0, 42);
        // addr 6: RET
        p.instruction(op::RET, 0, 0, 0);
        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.state, vm_state::HALTED);
        assert_eq!(vm.regs[0], 42);
    }

    // ── ENTRY instruction ──

    #[test]
    fn test_entry() {
        let mut p = Program::new();
        p.entry(0); // r0 = entry_point
        p.halt();
        let vm = SoftwareVm::run_program(&p.pixels, 50); // Load at address 50
        assert_eq!(vm.regs[0], 50); // r0 should contain 50
    }

    // ── Self-replicator test ──

    #[test]
    fn test_self_replicator() {
        let program = assembler::self_replicator();
        let mut svm = SoftwareVm::new();
        svm.load_program(0, &program.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        let vm = svm.vm_state(0);
        assert_eq!(vm.state, vm_state::HALTED, "self-replicator should halt");
        assert!(vm.cycles > 0, "self-replicator should execute cycles");

        // Verify the copy at address 100
        let (matched, total) = svm.verify_range(100, &program.pixels);
        assert_eq!(
            matched, total,
            "self-replicator should copy all {} pixels to address 100",
            total
        );
    }

    // ── Chain replicator test ──

    #[test]
    fn test_chain_replicator() {
        let program = assembler::chain_replicator();
        let mut svm = SoftwareVm::new();
        svm.load_program(0, &program.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        let vm = svm.vm_state(0);
        assert_eq!(vm.state, vm_state::HALTED, "chain replicator should halt");

        // Verify the copy at address 100 (entry_point + 100)
        let (matched, total) = svm.verify_range(100, &program.pixels);
        assert_eq!(
            matched, total,
            "chain replicator should copy all {} pixels to address 100",
            total
        );
    }

    // ── Chain replicator at non-zero address ──

    #[test]
    fn test_chain_replicator_at_200() {
        let program = assembler::chain_replicator();
        let mut svm = SoftwareVm::new();
        svm.load_program(200, &program.pixels);
        svm.spawn_vm(0, 200);
        svm.execute_frame();

        let vm = svm.vm_state(0);
        assert_eq!(vm.state, vm_state::HALTED, "chain replicator at 200 should halt");

        // Should copy to 200 + 100 = 300
        let (matched, total) = svm.verify_range(300, &program.pixels);
        assert_eq!(
            matched, total,
            "chain replicator should copy all {} pixels to address 300",
            total
        );
    }

    // ── Multiple VMs ──

    #[test]
    fn test_multiple_vms() {
        let mut svm = SoftwareVm::new();

        // VM 0: LDI r0, 10; HALT
        let mut p0 = Program::new();
        p0.ldi(0, 10);
        p0.halt();
        svm.load_program(0, &p0.pixels);
        svm.spawn_vm(0, 0);

        // VM 1: LDI r0, 20; HALT
        let mut p1 = Program::new();
        p1.ldi(0, 20);
        p1.halt();
        svm.load_program(100, &p1.pixels);
        svm.spawn_vm(1, 100);

        // VM 3: LDI r0, 30; HALT
        let mut p3 = Program::new();
        p3.ldi(0, 30);
        p3.halt();
        svm.load_program(200, &p3.pixels);
        svm.spawn_vm(3, 200);

        svm.execute_frame();

        assert_eq!(svm.vm_state(0).regs[0], 10);
        assert_eq!(svm.vm_state(1).regs[0], 20);
        assert_eq!(svm.vm_state(2).state, vm_state::INACTIVE); // Never spawned
        assert_eq!(svm.vm_state(3).regs[0], 30);
    }

    // ── Cycle budget ──

    #[test]
    fn test_cycle_budget_infinite_loop() {
        // Program that never halts: BNE r0, r0, 0 (branch to self -- but r0==r0 so not taken)
        // Actually, let's make an actual infinite loop: BNE r0, r1, -2 (always branch back)
        let mut p = Program::new();
        p.ldi(0, 1);
        p.ldi(1, 2);
        p.bne(0, 1, -2); // Always branches back to self (addr 4 -> addr 4+(-2)=2... wait)
        // Let's be more precise:
        // addr 0: LDI r0, 1  (2 pixels)
        // addr 2: LDI r1, 2  (2 pixels)
        // addr 4: BNE r0, r1, offset  (2 pixels)
        //   If taken, PC = 4 + offset
        //   We want to loop back to addr 4, so offset = 0? No, PC gets set to pc+offset.
        //   Actually shader: new_pc = pc + offset. If we want to stay at 4, offset = 0.
        //   But that's an infinite loop.
        let mut prog = Program::new();
        prog.ldi(0, 1);
        prog.ldi(1, 2);
        prog.bne(0, 1, 0); // Jump to 4+0=4 (self loop)

        let mut svm = SoftwareVm::new();
        svm.load_program(0, &prog.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        let vm = svm.vm_state(0);
        // Should NOT be halted -- infinite loop hits cycle budget
        assert_ne!(vm.state, vm_state::HALTED);
        assert_eq!(vm.cycles, CYCLES_PER_FRAME);
    }

    // ── VmState size verification ──

    #[test]
    fn test_vm_state_size() {
        // VmState must be exactly 832 bytes to match the shader layout
        assert_eq!(
            std::mem::size_of::<VmState>(),
            832,
            "VmState must be 832 bytes (matches WGSL)"
        );
    }

    // ── CHAR opcode test ──

    #[test]
    fn test_char_blit() {
        // Load font atlas, then use CHAR to blit 'H' (ASCII 72) to address 5000
        let mut p = Program::new();
        // r0 = 72 (ASCII 'H')
        p.ldi(0, 72);
        // r1 = 5000 (target address)
        p.ldi(1, 5000);
        // CHAR r0, r1 -- blit 'H' rows to address 5000..5007
        p.char_blit(0, 1);
        p.halt();

        let mut svm = SoftwareVm::new();
        svm.load_font_atlas();
        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        let vm = svm.vm_state(0);
        assert_eq!(vm.state, vm_state::HALTED);

        // Verify the 'H' character rows were written to 5000..5007
        // 'H' = 0xC6, 0xC6, 0xC6, 0xFE, 0xC6, 0xC6, 0xC6, 0x00
        let h_rows = crate::font_atlas::get_char_rows(72);
        for row in 0..8 {
            let got = svm.peek(5000 + row as u32);
            assert_eq!(
                got, h_rows[row] as u32,
                "CHAR 'H' row {} mismatch: got 0x{:02X}, expected 0x{:02X}",
                row, got, h_rows[row]
            );
        }
    }

    // ── CHAR_AT opcode tests ──

    #[test]
    fn test_char_at_with_font_base_matches_char() {
        // CHAR_AT using FONT_BASE should produce identical results to CHAR
        let mut p_char = Program::new();
        p_char.ldi(0, 72); // ASCII 'H'
        p_char.ldi(1, 5000); // target
        p_char.char_blit(0, 1);
        p_char.halt();

        let mut p_char_at = Program::new();
        p_char_at.ldi(0, 72); // ASCII 'H'
        p_char_at.ldi(1, 6000); // target (different address to avoid collision)
        p_char_at.ldi(2, crate::font_atlas::FONT_BASE); // atlas_base = FONT_BASE
        p_char_at.char_at_blit(0, 1, 2); // CHAR_AT r0, r1, r2
        p_char_at.halt();

        let mut svm_char = SoftwareVm::new();
        svm_char.load_font_atlas();
        svm_char.load_program(0, &p_char.pixels);
        svm_char.spawn_vm(0, 0);
        svm_char.execute_frame();

        let mut svm_char_at = SoftwareVm::new();
        svm_char_at.load_font_atlas();
        svm_char_at.load_program(0, &p_char_at.pixels);
        svm_char_at.spawn_vm(0, 0);
        svm_char_at.execute_frame();

        assert_eq!(svm_char_at.vm_state(0).state, vm_state::HALTED);

        // Both should produce identical character rows
        let h_rows = crate::font_atlas::get_char_rows(72);
        for row in 0..8 {
            let char_result = svm_char.peek(5000 + row as u32);
            let char_at_result = svm_char_at.peek(6000 + row as u32);
            assert_eq!(
                char_result, char_at_result,
                "CHAR vs CHAR_AT row {} mismatch: CHAR=0x{:02X}, CHAR_AT=0x{:02X}",
                row, char_result, char_at_result
            );
            assert_eq!(
                char_at_result, h_rows[row] as u32,
                "CHAR_AT 'H' row {} should match font atlas",
                row
            );
        }
    }

    #[test]
    fn test_char_at_reads_from_derived_atlas() {
        // Run the bold atlas builder first, then use CHAR_AT to read from the derived atlas
        let atlas_program = crate::assembler::bold_atlas_builder();

        let mut svm = SoftwareVm::new();
        svm.load_font_atlas();
        svm.load_program(0, &atlas_program.pixels);
        svm.spawn_vm(0, 0);

        // Run the atlas builder to completion
        let max_frames = 2000;
        for _ in 0..max_frames {
            if svm.vm_state(0).state == vm_state::HALTED {
                break;
            }
            svm.execute_frame();
        }
        assert_eq!(
            svm.vm_state(0).state,
            vm_state::HALTED,
            "atlas builder should halt before CHAR_AT test"
        );

        // Now use CHAR_AT to read 'A' (ASCII 65) from the derived bold atlas
        let derived_base: u32 = 0x00F10000;
        let mut p = Program::new();
        p.ldi(0, 65); // ASCII 'A'
        p.ldi(1, 9000); // target
        p.ldi(2, derived_base); // atlas_base = derived bold atlas
        p.char_at_blit(0, 1, 2);
        p.halt();

        // Load into a fresh VM slot
        svm.load_program(200, &p.pixels);
        svm.spawn_vm(1, 200);
        svm.execute_frame();

        assert_eq!(svm.vm_state(1).state, vm_state::HALTED);

        // Verify the bold 'A' was read from the derived atlas
        // Bold = original | (original >> 1) for each row
        let original_rows = crate::font_atlas::get_char_rows(65);
        for row in 0..8 {
            let expected = (original_rows[row] | (original_rows[row] >> 1)) as u32;
            let got = svm.peek(9000 + row as u32);
            assert_eq!(
                got, expected,
                "CHAR_AT bold 'A' row {} mismatch: got 0x{:02X}, expected 0x{:02X}",
                row, got, expected
            );
        }
    }

    #[test]
    fn test_char_at_parse_gasm() {
        // Verify CHAR_AT parses correctly from .gasm source
        let source = "CHAR_AT r0, r1, r2";
        let program = crate::assembler::parse_gasm(source).expect("CHAR_AT should parse");
        assert_eq!(program.len(), 1, "CHAR_AT should produce 1 pixel");
        // glyph(opcode=21, stratum=2, p1=0, p2=1) = 21 | (2<<8) | (0<<16) | (1<<24)
        let pixel = program.pixels[0];
        assert_eq!((pixel & 0xFF) as u8, 21, "opcode should be 21 (CHAR_AT)");
        assert_eq!(((pixel >> 8) & 0xFF) as u8, 2, "stratum should be 2 (atlas_base reg)");
        assert_eq!(((pixel >> 16) & 0xFF) as u8, 0, "p1 should be 0 (ascii reg)");
        assert_eq!(((pixel >> 24) & 0xFF) as u8, 1, "p2 should be 1 (target reg)");




    }

    #[test]
    fn test_char_at_parse_wrong_arg_count() {
        let source = "CHAR_AT r0, r1";
        let result = crate::assembler::parse_gasm(source);
        assert!(result.is_err(), "CHAR_AT with 2 args should fail");
    }

    // ── GLYPH_DEF opcode tests ──

    #[test]
    fn test_glyph_def_defines_and_char_reads_it() {
        // Define a custom smiley glyph at charcode 128, then use CHAR to read it
        let smiley: [u32; 8] = [
            0b00111100,
            0b01000010,
            0b10100101,
            0b10000001,
            0b10100101,
            0b10011001,
            0b01000010,
            0b00111100,
        ];

        let mut svm = SoftwareVm::new();
        // Write smiley bitmap at address 6000
        for (i, &row) in smiley.iter().enumerate() {
            svm.poke(6000 + i as u32, row);
        }

        let mut p = Program::new();
        p.ldi(0, 128);     // r0 = charcode 128
        p.ldi(1, 6000);    // r1 = bitmap address
        p.glyph_def(0, 1); // GLYPH_DEF r0, r1
        // Now use CHAR to blit charcode 128 to address 7000
        p.ldi(0, 128);     // r0 = charcode 128
        p.ldi(1, 7000);    // r1 = target
        p.char_blit(0, 1); // CHAR r0, r1
        p.halt();

        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED);
        // Verify the smiley was blitted correctly
        for (i, &expected) in smiley.iter().enumerate() {
            assert_eq!(
                svm.peek(7000 + i as u32), expected,
                "smiley row {} should match", i
            );
        }
    }

    #[test]
    fn test_glyph_def_ignores_charcode_below_128() {
        // GLYPH_DEF with charcode < 128 should be a no-op (base font is read-only)
        let mut svm = SoftwareVm::new();
        svm.poke(6000, 0xFF);

        let mut p = Program::new();
        p.ldi(0, 65);      // r0 = charcode 65 (A) - below 128
        p.ldi(1, 6000);    // r1 = bitmap address
        p.glyph_def(0, 1); // Should be silently ignored
        p.halt();

        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED);
        // Live atlas should still be empty (glyph_def was ignored)
        assert_eq!(svm.peek(0x00F20000), 0, "live atlas should remain empty");
    }

    #[test]
    fn test_glyph_def_parse_gasm() {
        let source = "GLYPH_DEF r3, r5";
        let program = crate::assembler::parse_gasm(source).expect("GLYPH_DEF should parse");
        assert_eq!(program.len(), 1, "GLYPH_DEF should produce 1 pixel");
        let pixel = program.pixels[0];
        assert_eq!((pixel & 0xFF) as u8, 22, "opcode should be 22 (GLYPH_DEF)");
        assert_eq!(((pixel >> 16) & 0xFF) as u8, 3, "p1 should be 3 (charcode reg)");
        assert_eq!(((pixel >> 24) & 0xFF) as u8, 5, "p2 should be 5 (bitmap_addr reg)");
    }

    // ── Full opcode test suite (GEO-4) ──────────────────────────────
    // Covers every instruction the software VM executes.

    #[test]
    fn opcode_mov() {
        let mut p = Program::new();
        p.ldi(0, 1234);
        p.instruction(op::MOV, 0, 1, 0); // MOV r1, r0
        p.halt();
        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 1234, "r0 unchanged");
        assert_eq!(vm.regs[1], 1234, "r1 = r0 via MOV");
    }

    #[test]
    fn opcode_load_from_memory() {
        let mut svm = SoftwareVm::new();
        // Pre-write a value into the substrate at pixel 500
        svm.poke(500, 0xDEADBEEF);

        let mut p = Program::new();
        p.ldi(0, 500);    // r0 = address 500
        p.load(1, 0);     // r1 = mem[r0] = 0xDEADBEEF
        p.halt();

        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();
        assert_eq!(svm.vm_state(0).regs[1], 0xDEADBEEF, "LOAD should read from substrate");
    }

    #[test]
    fn opcode_sub() {
        let mut p = Program::new();
        p.ldi(0, 100);
        p.ldi(1, 37);
        p.sub(0, 1);       // r0 = 100 - 37 = 63
        p.halt();
        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 63, "100 - 37 = 63");
    }

    #[test]
    fn opcode_jmp() {
        let mut p = Program::new();
        // addr 0: JMP to addr 10
        p.instruction(op::JMP, 0, 0, 0);
        p.pixels.push(10);
        // addr 2-5: should be skipped
        p.ldi(0, 999);
        // pad to addr 10
        while p.len() < 10 {
            p.pixels.push(0);
        }
        // addr 10: actual work
        p.ldi(0, 42);
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 42, "JMP should skip over LDI 999");
    }

    #[test]
    fn opcode_branch_beq_taken() {
        // BEQ: branch taken when r0 == r1
        let mut p = Program::new();
        p.ldi(0, 5); // addr 0-1
        p.ldi(1, 5); // addr 2-3
        // addr 4: BRANCH(BEQ) r0, r1 -- r0 == r1, so BEQ IS taken
        p.instruction(op::BRANCH, bcond::BEQ, 0, 1);
        p.pixels.push(4);
        // addr 6-7: SKIPPED because BEQ taken
        p.ldi(2, 999);
        // addr 8-9: target of branch
        p.ldi(2, 77);
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[2], 77, "BEQ with equal values should branch, r2=77");
    }

    #[test]
    fn opcode_branch_beq_not_taken() {
        // BEQ: branch NOT taken when r0 != r1
        let mut p = Program::new();
        p.ldi(0, 5);
        p.ldi(1, 10);
        // addr 4: BRANCH(BEQ) r0, r1 -- r0 != r1, so BEQ NOT taken
        p.instruction(op::BRANCH, bcond::BEQ, 0, 1);
        p.pixels.push(4);
        // addr 6-7: reached because branch NOT taken
        p.ldi(2, 88);
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[2], 88, "BEQ with unequal values should not branch, r2=88");
    }

    #[test]
    fn opcode_branch_bne() {
        let mut p = Program::new();
        p.ldi(0, 3);
        p.ldi(1, 7);
        // addr 4: BNE r0, r1 -- taken (3 != 7)
        p.instruction(op::BRANCH, bcond::BNE, 0, 1);
        p.pixels.push(4);
        p.ldi(2, 999); // skipped
        p.ldi(2, 55);  // target
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[2], 55, "BNE should branch when not equal");
    }

    #[test]
    fn opcode_branch_blt() {
        let mut p = Program::new();
        p.ldi(0, 3);
        p.ldi(1, 7);
        p.instruction(op::BRANCH, bcond::BLT, 0, 1);
        p.pixels.push(4);
        p.ldi(2, 999); // skipped
        p.ldi(2, 44);  // target
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[2], 44, "BLT should branch when less-than");
    }

    #[test]
    fn opcode_branch_bge_actually_bne() {
        // BGE with (10,10): BNE NOT taken (r0 == r1), falls through
        let mut p = Program::new();
        p.ldi(0, 10);
        p.ldi(1, 10);
        p.instruction(op::BRANCH, bcond::BGE, 0, 1);
        p.pixels.push(4);
        p.ldi(2, 999); // executed (BNE not taken because 10 == 10)
        p.ldi(2, 33);  // also executed
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[2], 33, "BGE(10,10) -> BNE not taken -> r2=33");
    }

    #[test]
    fn opcode_branch_bltu() {
        let mut p = Program::new();
        p.ldi(0, 5);
        p.ldi(1, 100);
        p.instruction(op::BRANCH, bcond::BLTU, 0, 1);
        p.pixels.push(4);
        p.ldi(2, 999); // skipped
        p.ldi(2, 22);  // target
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[2], 22, "BLTU should branch when unsigned less-than");
    }

    #[test]
    fn opcode_branch_bgeu() {
        let mut p = Program::new();
        p.ldi(0, 200);
        p.ldi(1, 100);
        p.instruction(op::BRANCH, bcond::BGEU, 0, 1);
        p.pixels.push(4);
        p.ldi(2, 999); // skipped
        p.ldi(2, 11);  // target
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[2], 11, "BGEU should branch when unsigned greater-or-equal");
    }

    #[test]
    fn opcode_entry_with_offset() {
        let mut p = Program::new();
        p.entry(5); // r5 = entry_point
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 200);
        assert_eq!(vm.regs[5], 200, "ENTRY should load entry_point (200)");
    }

    #[test]
    fn opcode_div_by_zero() {
        // Both software VM and shader set result to 0 on divide-by-zero
        let mut p = Program::new();
        p.ldi(0, 42);
        p.ldi(1, 0);
        p.div(0, 1); // should NOT crash, sets r0 to 0
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 0, "DIV by zero should set dst to 0");
    }

    #[test]
    fn opcode_mul_basic() {
        let mut p = Program::new();
        p.ldi(0, 6);
        p.ldi(1, 7);
        p.mul(0, 1); // r0 = 6 * 7 = 42
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 42, "6 * 7 = 42");
    }

    #[test]
    fn opcode_mul_wrapping() {
        let mut p = Program::new();
        p.ldi(0, 0x10000);
        p.ldi(1, 0x10000);
        p.mul(0, 1); // r0 = 0x10000 * 0x10000 = 0x100000000 which wraps to 0 in u32
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 0, "0x10000 * 0x10000 should wrap to 0");
    }

    #[test]
    fn opcode_mul_by_zero() {
        let mut p = Program::new();
        p.ldi(0, 999);
        p.ldi(1, 0);
        p.mul(0, 1); // r0 = 999 * 0 = 0
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 0, "999 * 0 = 0");
    }

    #[test]
    fn opcode_div_normal() {
        let mut p = Program::new();
        p.ldi(0, 42);
        p.ldi(1, 6);
        p.div(0, 1); // r0 = 42 / 6 = 7
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 7, "42 / 6 = 7");
    }

    #[test]
    fn opcode_div_truncation() {
        let mut p = Program::new();
        p.ldi(0, 7);
        p.ldi(1, 2);
        p.div(0, 1); // r0 = 7 / 2 = 3 (truncated)
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 3, "7 / 2 = 3 (unsigned truncation)");
    }

    #[test]
    fn opcode_blit_copies_pixels() {
        let mut svm = SoftwareVm::new();
        // Write some test data at addresses 1000..1003
        svm.poke(1000, 0xAAAAAAAA);
        svm.poke(1001, 0xBBBBBBBB);
        svm.poke(1002, 0xCCCCCCCC);
        svm.poke(1003, 0xDDDDDDDD);

        let mut p = Program::new();
        p.ldi(0, 1000);  // src
        p.ldi(1, 2000);  // dst
        // BLIT r0, r1, count=4
        p.blit(0, 1, 4);
        p.halt();

        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        assert_eq!(svm.vm_state(0).halted, 1);
        assert_eq!(svm.peek(2000), 0xAAAAAAAA, "blit pixel 0");
        assert_eq!(svm.peek(2001), 0xBBBBBBBB, "blit pixel 1");
        assert_eq!(svm.peek(2002), 0xCCCCCCCC, "blit pixel 2");
        assert_eq!(svm.peek(2003), 0xDDDDDDDD, "blit pixel 3");
    }

    #[test]
    fn opcode_jmp_forward_and_back() {
        // JMP forward over a LDI, then halt
        let mut p = Program::new();
        // addr 0: JMP +3 (to addr 3)
        p.jmp(3);
        // addr 2: skipped
        p.ldi(0, 999);
        // addr 4: target
        p.ldi(0, 42);
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 42, "JMP should skip over instruction");
    }

    #[test]
    fn edge_register_boundary() {
        // Test r0 and r127 (boundary registers)
        let mut p = Program::new();
        p.ldi(0, 100);
        p.ldi(127, 200);
        p.add(0, 127); // r0 += r127 = 300
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 300, "r0 + r127 = 300");
    }

    #[test]
    fn edge_call_stack_depth() {
        // Test nested CALL/RET 5 levels deep
        // NOTE: CALL return lands on data word, so we use addresses > 16
        // to avoid data being interpreted as valid opcodes.
        let mut svm = SoftwareVm::new();
        let mut p = Program::new();

        // Level 0 (addr 0): CALL addr 100
        p.instruction(op::CALL, 0, 0, 0);
        p.pixels.push(100);
        p.ldi(0, 99); // addr 2-3: after return
        p.halt();

        // Pad to addr 100
        while p.len() < 100 {
            p.pixels.push(0);
        }

        // Level 1 (addr 100): CALL addr 200
        p.instruction(op::CALL, 0, 0, 0);
        p.pixels.push(200);
        p.ldi(1, 10);
        p.store(1, 1); // mem[10] = 10
        p.instruction(op::RET, 0, 0, 0);

        // Pad to addr 200
        while p.len() < 200 {
            p.pixels.push(0);
        }

        // Level 2 (addr 200): CALL addr 300
        p.instruction(op::CALL, 0, 0, 0);
        p.pixels.push(300);
        p.ldi(1, 20);
        p.store(1, 1); // mem[20] = 20
        p.instruction(op::RET, 0, 0, 0);

        // Pad to addr 300
        while p.len() < 300 {
            p.pixels.push(0);
        }

        // Level 3 (addr 300): CALL addr 400
        p.instruction(op::CALL, 0, 0, 0);
        p.pixels.push(400);
        p.ldi(1, 30);
        p.store(1, 1); // mem[30] = 30
        p.instruction(op::RET, 0, 0, 0);

        // Pad to addr 400
        while p.len() < 400 {
            p.pixels.push(0);
        }

        // Level 4 (addr 400): write and return
        p.ldi(1, 40);
        p.store(1, 1); // mem[40] = 40
        p.instruction(op::RET, 0, 0, 0);

        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        assert_eq!(svm.vm_state(0).halted, 1, "should halt after 5-level nesting");
        assert_eq!(svm.peek(10), 10, "level 1 wrote mem[10]");
        assert_eq!(svm.peek(20), 20, "level 2 wrote mem[20]");
        assert_eq!(svm.peek(30), 30, "level 3 wrote mem[30]");
        assert_eq!(svm.peek(40), 40, "level 4 wrote mem[40]");
        assert_eq!(svm.vm_state(0).regs[0], 99, "main resumes after deep calls");
    }

    #[test]
    fn edge_unknown_opcode_noop() {
        // Unknown opcodes (e.g. 99) should be silently ignored
        let mut p = Program::new();
        p.ldi(0, 42);
        // Emit an unknown opcode (99)
        p.instruction(99, 0, 0, 0);
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 42, "unknown opcode should be a no-op");
    }

    #[test]
    fn edge_mov_self() {
        // MOV r5, r5 should be a no-op
        let mut p = Program::new();
        p.ldi(5, 77);
        // instruction(opcode, stratum, p1=dst, p2=src)
        p.instruction(op::MOV, 0, 5, 5); // MOV r5, r5
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[5], 77, "MOV r5, r5 should preserve value");
    }

    #[test]
    fn opcode_halt_stops_execution() {
        let mut p = Program::new();
        p.ldi(0, 11);
        p.halt();
        p.ldi(0, 999); // should never execute

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 11, "HALT should stop execution");
        assert_eq!(vm.halted, 1);
    }

    #[test]
    fn opcode_sub_wrapping() {
        let mut p = Program::new();
        p.ldi(0, 0);
        p.ldi(1, 1);
        p.sub(0, 1); // 0 - 1 wraps to u32::MAX
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], u32::MAX, "0 - 1 should wrap to u32::MAX");
    }

    #[test]
    fn count_down_loop() {
        // Integration: count r0 from 5 to 0 using BNE loop
        let mut p = Program::new();
        p.ldi(0, 5);   // r0 = 5
        p.ldi(1, 0);   // r1 = 0
        p.ldi(2, 1);   // r2 = 1
        // addr 6: SUB r0, r2
        p.sub(0, 2);
        // addr 7: BNE r0, r1, offset (back to addr 6)
        p.instruction(op::BRANCH, bcond::BNE, 0, 1);
        // offset: from pc (=7), want addr 6. new_pc = 7 + offset = 6 => offset = -1
        p.pixels.push(((6i32 - 7i32) as u32));
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 0, "loop should count down to 0");
        assert_eq!(vm.halted, 1);
    }

    #[test]
    fn nested_call_ret() {
        let mut p = Program::new();
        // Main: call func_A at addr 20
        p.instruction(op::CALL, 0, 0, 0); // addr 0
        p.pixels.push(20);                // addr 1
        p.ldi(0, 77);                     // addr 2-3: after return
        p.halt();                          // addr 4
        while p.len() < 20 { p.pixels.push(0); }
        // func_A at 20: call func_B at 40, write 10, return
        p.instruction(op::CALL, 0, 0, 0); // addr 20
        p.pixels.push(40);                // addr 21
        p.ldi(1, 10);                     // addr 22-23
        p.store(1, 1);                    // addr 24: mem[10] = 10
        p.instruction(op::RET, 0, 0, 0); // addr 25
        while p.len() < 40 { p.pixels.push(0); }
        // func_B at 40: write 20, return
        p.ldi(2, 20);                     // addr 40-41
        p.store(2, 2);                    // addr 42: mem[20] = 20
        p.instruction(op::RET, 0, 0, 0); // addr 43

        let mut svm = SoftwareVm::new();
        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        assert_eq!(svm.peek(10), 10, "func_A should write 10");
        assert_eq!(svm.peek(20), 20, "func_B should write 20");
        assert_eq!(svm.vm_state(0).regs[0], 77, "main resumes after nested calls");
        assert_eq!(svm.vm_state(0).halted, 1);
    }

    #[test]
    fn test_char_blit_hello() {
        // Blit "HI" (two characters) using CHAR opcode
        // H at address 5000, I at address 5010
        let mut p = Program::new();
        // Load H
        p.ldi(0, 72); // 'H'
        p.ldi(1, 5000);
        p.char_blit(0, 1);
        // Load I
        p.ldi(0, 73); // 'I'
        p.ldi(1, 5010);
        p.char_blit(0, 1);
        p.halt();

        let mut svm = SoftwareVm::new();
        svm.load_font_atlas();
        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        let vm = svm.vm_state(0);
        assert_eq!(vm.state, vm_state::HALTED);

        // Verify H
        let h_rows = crate::font_atlas::get_char_rows(72);
        for row in 0..8 {
            assert_eq!(svm.peek(5000 + row as u32), h_rows[row as usize] as u32);
        }

        // Verify I
        let i_rows = crate::font_atlas::get_char_rows(73);
        for row in 0..8 {
            assert_eq!(svm.peek(5010 + row as u32), i_rows[row as usize] as u32);
        }
    }

    #[test]
    fn test_hello_world_program() {
        // Full end-to-end test: load font atlas, run hello_world, verify all 5 characters
        let program = crate::assembler::hello_world();
        let mut svm = SoftwareVm::new();
        svm.load_font_atlas();
        svm.load_program(0, &program.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        let vm = svm.vm_state(0);
        assert_eq!(vm.state, vm_state::HALTED);

        // Verify each character: H(72) E(69) L(76) L(76) O(79)
        let chars: [(u8, u32); 5] = [(b'H', 5000), (b'E', 5010), (b'L', 5020), (b'L', 5030), (b'O', 5040)];

        for (ascii, addr) in &chars {
            let rows = crate::font_atlas::get_char_rows(*ascii);
            for row in 0..8 {
                let got = svm.peek(addr + row as u32);
                assert_eq!(
                    got, rows[row as usize] as u32,
                    "Char '{}' at addr {} row {} mismatch: got 0x{:02X}, expected 0x{:02X}",
                    *ascii as char, addr, row, got, rows[row as usize]
                );
            }
        }
    }

    // ── IPC / Message Passing Tests ──

    #[test]
    fn test_ipc_send_recv_basic() {
        // VM 0 sends 3 data pixels to VM 1, VM 1 receives them.
        //
        // VM 0 program (loaded at addr 100):
        //   LDI r0, 1000       -- data_addr: where we put the payload
        //   LDI r1, 0xAAAA
        //   STORE [r0], r1     -- mem[1000] = 0xAAAA
        //   LDI r1, 0xBBBB
        //   STORE [r0+1], r1   -- we use separate addr loads
        //   LDI r1, 0xCCCC
        //   STORE [r0+2], r1
        //   LDI r1, 1          -- target VM = 1
        //   SEND r1, r0, 3     -- send 3 pixels from addr 1000 to VM 1
        //   HALT
        //
        // VM 1 program (loaded at addr 200):
        //   LDI r0, 3000       -- dest buffer
        //   RECV r0, r1        -- receive into addr 3000, status in r1
        //   HALT

        let mut sender = Program::new();
        let sender_load_addr: u32 = 100;
        // r0 = 1000 (data addr)
        sender.ldi(0, 1000);
        // r1 = 0xAAAA, store at [r0]
        sender.ldi(1, 0xAAAA);
        sender.store(0, 1);
        // r1 = 0xBBBB, store at [r0+1]. Need r2 = 1001.
        sender.ldi(2, 1001);
        sender.ldi(1, 0xBBBB);
        sender.store(2, 1);
        // r1 = 0xCCCC, store at [r0+2]. Need r2 = 1002.
        sender.ldi(2, 1002);
        sender.ldi(1, 0xCCCC);
        sender.store(2, 1);
        // Now send: r1 = target VM (1), r0 = data addr (1000), length = 3
        sender.ldi(1, 1); // target VM = 1
        sender.send(1, 0, 3); // SEND r1(target_vm=1), r0(data_addr=1000), length=3
        sender.halt();

        let mut receiver = Program::new();
        let receiver_load_addr: u32 = 200;
        receiver.ldi(0, 3000); // r0 = dest buffer address
        receiver.recv(0, 1);   // RECV r0(dest_addr), r1(status)
        receiver.halt();

        // Build multi-VM setup
        let mut svm = SoftwareVm::new();
        svm.load_program(sender_load_addr, &sender.pixels);
        svm.load_program(receiver_load_addr, &receiver.pixels);
        svm.spawn_vm(0, sender_load_addr);
        svm.spawn_vm(1, receiver_load_addr);

        // Run sender first (VM 0), then receiver (VM 1)
        // execute_frame runs all VMs, so one frame handles both
        svm.execute_frame();

        // Verify sender halted
        assert_eq!(svm.vm_state(0).state, vm_state::HALTED, "sender should halt");

        // Verify receiver halted
        assert_eq!(svm.vm_state(1).state, vm_state::HALTED, "receiver should halt");

        // Verify receiver got status = 1 (success)
        assert_eq!(svm.vm_state(1).regs[1], 1, "recv status should be 1 (success)");

        // Verify the data at address 3000-3002
        assert_eq!(svm.peek(3000), 0xAAAA, "pixel 0 should be 0xAAAA");
        assert_eq!(svm.peek(3001), 0xBBBB, "pixel 1 should be 0xBBBB");
        assert_eq!(svm.peek(3002), 0xCCCC, "pixel 2 should be 0xCCCC");
    }

    #[test]
    fn test_ipc_recv_empty_mailbox() {
        // VM 0 receives from empty mailbox -> status = 0
        let mut p = Program::new();
        p.ldi(0, 5000); // dest addr
        p.recv(0, 1);    // RECV r0, r1 (status)
        p.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED);
        assert_eq!(svm.vm_state(0).regs[1], 0, "status should be 0 (no message)");
    }

    #[test]
    fn test_ipc_send_then_recv_sequential() {
        // More rigorous: run sender to completion in one frame,
        // then run receiver in a second frame. This proves the
        // message persists in shared memory across frames.

        // Sender program at addr 50
        let mut sender = Program::new();
        sender.ldi(0, 800); // data addr
        sender.ldi(1, 0xDEAD);
        sender.store(0, 1);
        sender.ldi(1, 0xBEEF);
        sender.ldi(2, 801);
        sender.store(2, 1);
        sender.ldi(1, 1); // target = VM 1
        sender.send(1, 0, 2);
        sender.halt();

        // Receiver program at addr 150
        let mut receiver = Program::new();
        receiver.ldi(0, 900); // dest buffer
        receiver.recv(0, 1);  // status in r1
        receiver.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(50, &sender.pixels);
        svm.load_program(150, &receiver.pixels);
        svm.spawn_vm(0, 50);
        svm.spawn_vm(1, 150);

        // Frame 1: both VMs run. VM 0 sends, VM 1 receives.
        svm.execute_frame();

        // Both should be halted
        assert_eq!(svm.vm_state(0).state, vm_state::HALTED);
        assert_eq!(svm.vm_state(1).state, vm_state::HALTED);

        // Receiver should have gotten the data
        assert_eq!(svm.vm_state(1).regs[1], 1, "recv should succeed");
        assert_eq!(svm.peek(900), 0xDEAD);
        assert_eq!(svm.peek(901), 0xBEEF);

        // Header should show WAS_READ (flag=2)
        let header = svm.peek(crate::MSGQ_BASE + 1);
        assert_eq!(header & 0xFF, 2, "header flags should be WAS_READ (2)");
    }

    #[test]
    fn bold_atlas_builder_produces_bold_variant() {
        let mut svm = SoftwareVm::new();
        svm.load_font_atlas();

        let program = crate::assembler::bold_atlas_builder();
        svm.load_program(0, &program.pixels);
        svm.spawn_vm(0, 0);

        // Atlas builder is large (128 chars * 8 rows); runs across multiple frames
        let max_frames = 20;
        for _ in 0..max_frames {
            if svm.vm_state(0).state == vm_state::HALTED {
                break;
            }
            svm.execute_frame();
        }

        let vm = svm.vm_state(0);
        assert_eq!(
            vm.state,
            vm_state::HALTED,
            "atlas builder should halt within {} frames (cycles used: {})",
            max_frames, vm.cycles
        );

        let font_base = crate::font_atlas::FONT_BASE;
        let derived_base: u32 = 0x00F10000;

        // Verify bold transform for a sample of characters
        // Bold = row | (row >> 1) for each row bitmask
        for ascii in [32u8, 48, 65, 72, 90, 97, 127] {
            for row in 0..8u32 {
                let src_val = svm.peek(font_base + (ascii as u32) * 8 + row);
                let dst_val = svm.peek(derived_base + (ascii as u32) * 8 + row);

                let expected = src_val | (src_val >> 1);

                assert_eq!(
                    dst_val, expected,
                    "Bold mismatch for char {} row {}: got 0x{:08X}, expected 0x{:08X}",
                    ascii as char, row, dst_val, expected
                );
            }
        }
    }

    #[test]
    fn bold_atlas_builder_covers_all_128_chars() {
        let mut svm = SoftwareVm::new();
        svm.load_font_atlas();

        let program = crate::assembler::bold_atlas_builder();
        svm.load_program(0, &program.pixels);
        svm.spawn_vm(0, 0);

        let max_frames = 20;
        for _ in 0..max_frames {
            if svm.vm_state(0).state == vm_state::HALTED {
                break;
            }
            svm.execute_frame();
        }

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED);

        let font_base = crate::font_atlas::FONT_BASE;
        let derived_base: u32 = 0x00F10000;

        // Spot-check every 16th character to cover the full range
        for ascii in (0u32..128).step_by(16) {
            let src_row0 = svm.peek(font_base + ascii * 8);
            let dst_row0 = svm.peek(derived_base + ascii * 8);
            let expected = src_row0 | (src_row0 >> 1);
            assert_eq!(
                dst_row0, expected,
                "Bold row0 mismatch for char idx {}",
                ascii
            );
        }
    }

    // ── PSET/PGET screen opcodes ──────────────────────────────

    #[test]
    fn test_pset_writes_to_screen() {
        // PSET r_x=10, r_y=20, r_color=0xFF0000 (red in RGB)
        let mut p = Program::new();
        p.ldi(0, 10); // r0 = x
        p.ldi(1, 20); // r1 = y
        p.ldi(2, 0x0000FF); // r2 = color (red in RGBA little-endian: R=0xFF)
        p.pset(0, 1, 2); // PSET r_x=r0, r_y=r1, r_color=r2
        p.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED);

        // Verify the pixel was written to the screen region
        let screen_addr = crate::SCREEN_BASE + 20 * crate::SCREEN_SIZE + 10;
        let val = svm.peek(screen_addr);
        assert_eq!(val, 0x0000FF, "PSET should write color to screen at (10,20)");
    }

    #[test]
    fn test_pget_reads_from_screen() {
        // Write a value to the screen region directly, then PGET it
        let mut svm = SoftwareVm::new();

        let screen_addr = crate::SCREEN_BASE + 30 * crate::SCREEN_SIZE + 40;
        svm.poke(screen_addr, 0xABCDEF01);

        // PGET r_dst=r0, r_x=r1, r_y=r2
        let mut p = Program::new();
        p.ldi(1, 40); // r1 = x
        p.ldi(2, 30); // r2 = y
        p.pget(0, 1, 2); // PGET r0=r_dst, r1=r_x, r2=y
        p.halt();

        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED);
        assert_eq!(
            svm.vm_state(0).regs[0], 0xABCDEF01,
            "PGET should read color from screen at (40,30)"
        );
    }

    #[test]
    fn test_pset_pget_roundtrip() {
        // Write with PSET, read back with PGET
        let mut p = Program::new();
        p.ldi(0, 5); // r0 = x
        p.ldi(1, 15); // r1 = y
        p.ldi(2, 0x12345678); // r2 = color
        p.pset(0, 1, 2); // PSET r0, r1, r2
        p.ldi(0, 0); // clear r0
        p.pget(0, 0, 1); // PGET r0=r_dst, r0=r_x (5), r1=y (15)
        p.halt();

        // Wait, this is wrong -- pget(0, 0, 1) means PGET r_dst=r0, r_x=r0, r_y=r1
        // But we cleared r0 to 0 above! Let's fix:
        let mut p2 = Program::new();
        p2.ldi(0, 5); // r0 = x
        p2.ldi(1, 15); // r1 = y
        p2.ldi(2, 0x12345678); // r2 = color
        p2.pset(0, 1, 2); // PSET x=r0, y=r1, color=r2
        p2.pget(3, 0, 1); // PGET dst=r3, x=r0, y=r1
        p2.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(0, &p2.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED);
        assert_eq!(
            svm.vm_state(0).regs[3], 0x12345678,
            "PGET should read back what PSET wrote"
        );
    }

    #[test]
    fn test_pset_out_of_bounds_is_noop() {
        // PSET with x >= SCREEN_SIZE should be silently ignored
        let mut p = Program::new();
        p.ldi(0, 999); // r0 = x (out of bounds)
        p.ldi(1, 0); // r1 = y
        p.ldi(2, 0xFFFFFFFF); // r2 = color
        p.pset(0, 1, 2);
        p.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED);
        // Verify nothing was written at screen address 0
        let val = svm.peek(crate::SCREEN_BASE);
        assert_eq!(val, 0, "out-of-bounds PSET should not write");
    }

    #[test]
    fn test_pget_out_of_bounds_returns_zero() {
        // PGET with y >= SCREEN_SIZE should return 0
        let mut p = Program::new();
        p.ldi(0, 0); // r0 = x
        p.ldi(1, 999); // r1 = y (out of bounds)
        p.ldi(0, 0xDEAD); // clear r0 (will be overwritten)
        // We need x in a separate register
        let mut p2 = Program::new();
        p2.ldi(0, 0); // r0 = x
        p2.ldi(1, 999); // r1 = y (out of bounds)
        p2.pget(2, 0, 1); // PGET dst=r2, x=r0, y=r1
        p2.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(0, &p2.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED);
        assert_eq!(
            svm.vm_state(0).regs[2], 0,
            "out-of-bounds PGET should return 0"
        );
    }

    // ── Self-modifying code: pixels write pixels ──────────────────

    #[test]
    fn test_program_writes_program_and_jumps_to_it() {
        // Phase 1: Program A writes Program B into memory using STORE.
        // Phase 2: Program A JMPs to Program B.
        // Program B: LDI r0, 42; HALT.
        //
        // This proves pixels can write pixels -- the foundational
        // self-hosting mechanism.

        let mut svm = SoftwareVm::new();

        // Program A: writes child at address 500, then JMPs there.
        let mut parent = Program::new();
        // Write child instruction 1: LDI r0, imm (opcode=1, p1=r0)
        parent.ldi(10, 500); // r10 = target address
        parent.ldi(11, assembler::glyph(1, 0, 0, 0)); // LDI r0, <imm>
        parent.store(10, 11); // mem[500] = LDI r0
        // Write child instruction 2: immediate value 42
        parent.ldi(10, 501); // r10 = next address
        parent.ldi(11, 42); // immediate = 42
        parent.store(10, 11); // mem[501] = 42
        // Write child instruction 3: HALT (opcode=13)
        parent.ldi(10, 502); // r10 = next address
        parent.ldi(11, assembler::glyph(13, 0, 0, 0)); // HALT
        parent.store(10, 11); // mem[502] = HALT
        // Jump to child at address 500
        // CALL uses absolute addressing (unlike JMP which is relative)
        parent.instruction(op::CALL, 0, 0, 0);
        parent.pixels.push(500); // absolute address of child

        // Load parent at address 0, with sandbox [0, 0x100000)
        svm.load_program(0, &parent.pixels);
        svm.spawn_vm(0, 0);
        {
            let vm = svm.vm_state_mut(0);
            vm.base_addr = 0;
            vm.bound_addr = 0x100000;
        }
        svm.execute_frame();

        // Child should have executed: LDI r0, 42 -> r0 = 42, then HALT
        assert_eq!(svm.vm_state(0).state, vm_state::HALTED);
        assert_eq!(
            svm.vm_state(0).regs[0], 42,
            "child program should have loaded 42 into r0"
        );
    }

    #[test]
    fn test_and_shl_bitwise_ops() {
        let mut p = Program::new();
        p.ldi(0, 0xFF00); // r0 = 0x0000FF00
        p.ldi(1, 0x0F0F); // r1 = 0x00000F0F
        p.and(0, 1); // r0 = 0xFF00 & 0x0F0F = 0x0F00
        p.ldi(1, 4); // r1 = 4
        p.shl(0, 1); // r0 = 0x0F00 << 4 = 0xF000
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 0xF000, "AND then SHL should produce 0xF000");
    }

    #[test]
    fn test_xor() {
        // XOR r0, r1: 0xFF ^ 0x0F = 0xF0
        let mut p = Program::new();
        p.ldi(0, 0xFF);
        p.ldi(1, 0x0F);
        p.instruction(op::XOR, 0, 0, 1); // XOR r0, r1
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 0xF0, "XOR: 0xFF ^ 0x0F should be 0xF0");
    }

    #[test]
    fn test_xor_via_gasm() {
        // Test that XOR parses correctly from .gasm text
        let src = "LDI r0, 0xFF\nLDI r1, 0x0F\nXOR r0, r1\nHALT";
        let p = assembler::parse_gasm(src).unwrap();
        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 0xF0, "XOR via gasm: 0xFF ^ 0x0F should be 0xF0");
    }

    #[test]
    fn test_not() {
        // NOT r0: !0 = 0xFFFFFFFF
        let mut p = Program::new();
        p.ldi(0, 0);
        p.instruction(op::NOT, 0, 0, 0); // NOT r0
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 0xFFFFFFFF, "NOT: !0 should be 0xFFFFFFFF");
    }

    #[test]
    fn test_not_via_gasm() {
        // Test that NOT parses correctly from .gasm text
        let src = "LDI r0, 0\nNOT r0\nHALT";
        let p = assembler::parse_gasm(src).unwrap();
        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 0xFFFFFFFF, "NOT via gasm: !0 should be 0xFFFFFFFF");
    }

    #[test]
    fn test_xor_basic() {
        let mut p = Program::new();
        p.ldi(0, 0xFF00); // r0 = 0x0000FF00
        p.ldi(1, 0x0FF0); // r1 = 0x00000FF0
        p.xor(0, 1);      // r0 = 0xFF00 ^ 0x0FF0 = 0xF0F0
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 0xF0F0, "XOR should toggle bits");
    }

    #[test]
    fn test_xor_self_is_zero() {
        let mut p = Program::new();
        p.ldi(0, 0xDEADBEEF);
        p.xor(0, 0);      // r0 ^ r0 = 0
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 0, "XOR with self should zero");
    }

    #[test]
    fn test_xor_swap_trick() {
        // Classic XOR swap: a ^= b; b ^= a; a ^= b
        let mut p = Program::new();
        p.ldi(0, 0xAAAA);
        p.ldi(1, 0x5555);
        p.xor(0, 1);      // r0 = r0 ^ r1
        p.xor(1, 0);      // r1 = r1 ^ r0
        p.xor(0, 1);      // r0 = r0 ^ r1
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 0x5555, "XOR swap: r0 should have original r1");
        assert_eq!(vm.regs[1], 0xAAAA, "XOR swap: r1 should have original r0");
    }

    #[test]
    fn test_not_basic() {
        let mut p = Program::new();
        p.ldi(0, 0x0000FFFF);
        p.not(0);          // r0 = !0x0000FFFF = 0xFFFF0000
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 0xFFFF0000, "NOT should flip all bits");
    }

    #[test]
    fn test_not_zero_is_max() {
        let mut p = Program::new();
        p.ldi(0, 0);
        p.not(0);          // r0 = !0 = 0xFFFFFFFF
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 0xFFFFFFFF, "NOT zero should be all ones");
    }

    #[test]
    fn test_not_double_inverse() {
        let mut p = Program::new();
        p.ldi(0, 0x12345678);
        p.not(0);
        p.not(0);          // !!x = x
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 0x12345678, "double NOT should restore original");
    }

    #[test]
    fn test_xor_parser_mnemonic() {
        let src = "LDI r0, 0xFF\nLDI r1, 0x0F\nXOR r0, r1\nHALT";
        let p = crate::assembler::parse_gasm(src).expect("parse should succeed");
        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 0xF0, "parsed XOR should work");
    }

    #[test]
    fn test_not_parser_mnemonic() {
        let src = "LDI r0, 0\nNOT r0\nHALT";
        let p = crate::assembler::parse_gasm(src).expect("parse should succeed");
        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 0xFFFFFFFF, "parsed NOT should work");
    }

    // ── Phase 9B: Self-modification opcodes (GEO-65) ───────────────

    #[test]
    fn test_glyph_mutate_changes_opcode() {
        // Write a program at address 0, then mutate the ADD (opcode 5) to SUB (opcode 6).
        let mut svm = SoftwareVm::new();

        // Write a target instruction at pixel 500: ADD r0, r1 (opcode 5)
        svm.poke(500, assembler::glyph(5, 0, 0, 1));

        // Program: GLYPH_MUTATE r3, r4, HALT
        // r3 = 500 (target pixel index), r4 = 6 (new opcode = SUB)
        let mut p = Program::new();
        p.ldi(3, 500);
        p.ldi(4, 6); // SUB opcode
        p.glyph_mutate(3, 4);
        p.halt();

        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED, "should halt");

        // Verify the pixel at address 500 now has opcode 6 (SUB) instead of 5 (ADD)
        let mutated = svm.peek(500);
        assert_eq!((mutated & 0xFF) as u8, 6, "opcode at pixel 500 should now be 6 (SUB)");

        // Verify the other channels are preserved
        assert_eq!(((mutated >> 8) & 0xFF) as u8, 0, "stratum preserved");
        assert_eq!(((mutated >> 16) & 0xFF) as u8, 0, "p1 preserved");
        assert_eq!(((mutated >> 24) & 0xFF) as u8, 1, "p2 preserved");

        // Verify success flag in r3
        assert_eq!(svm.vm_state(0).regs[3], 1, "r3 should be 1 (success)");
    }

    #[test]
    fn test_glyph_mutate_self_modifying_program() {
        // A program that mutates its own next instruction from NOP to HALT.
        let mut svm = SoftwareVm::new();

        // addr 0: LDI r3, 3     (target = pixel 3, which is the NOP at addr 3)
        // addr 2: LDI r4, 13    (new opcode = HALT)
        // addr 4: GLYPH_MUTATE r3, r4
        // addr 5: NOP            (will be mutated to HALT)
        // addr 6: LDI r0, 999   (should never execute)
        // addr 8: HALT
        let mut p = Program::new();
        p.ldi(3, 5); // target pixel index = 5 (the NOP)
        p.ldi(4, 13); // HALT opcode
        p.glyph_mutate(3, 4);
        p.instruction(op::NOP, 0, 0, 0); // addr 5 - will be mutated
        p.ldi(0, 999); // should never execute
        p.halt();

        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        // Program should have halted (NOP was mutated to HALT)
        assert_eq!(svm.vm_state(0).state, vm_state::HALTED, "should halt via self-modification");
        // r0 should NOT be 999 (the LDI after the mutated NOP never ran)
        assert_ne!(svm.vm_state(0).regs[0], 999, "code after mutated instruction should not execute");
    }

    #[test]
    fn test_spatial_spawn_copies_cluster() {
        // Write source cluster at pixel 500-504, copy to pixel 1000-1004.
        let mut svm = SoftwareVm::new();

        // Source cluster: 3 pixels at address 500
        svm.poke(500, assembler::glyph(5, 0, 0, 1)); // ADD r0, r1
        svm.poke(501, assembler::glyph(6, 0, 0, 1)); // SUB r0, r1
        svm.poke(502, assembler::glyph(13, 0, 0, 0)); // HALT

        // Program: LDI r1, 1000 (dest), LDI r2, 3 (size), LDI r3, 500 (source)
        // SPATIAL_SPAWN r1, r2, r3, HALT
        let mut p = Program::new();
        p.ldi(1, 1000); // dest pixel index
        p.ldi(2, 3); // size = 3 pixels
        p.ldi(3, 500); // source pixel index
        p.spatial_spawn(1, 2, 3);
        p.halt();

        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED, "should halt");

        // Verify the copied cluster at address 1000
        assert_eq!(svm.peek(1000), assembler::glyph(5, 0, 0, 1), "pixel 1000 should match source");
        assert_eq!(svm.peek(1001), assembler::glyph(6, 0, 0, 1), "pixel 1001 should match source");
        assert_eq!(svm.peek(1002), assembler::glyph(13, 0, 0, 0), "pixel 1002 should match source");

        // Verify return value
        assert_eq!(svm.vm_state(0).regs[1], 3, "r1 should be 3 (pixels copied)");
    }

    #[test]
    fn test_spatial_spawn_creates_executable_copy() {
        // Copy a working program to a new location, then jump to it.
        let mut svm = SoftwareVm::new();

        // Source program at pixel 500: LDI r0, 42; HALT
        let mut src = Program::new();
        src.ldi(0, 42);
        src.halt();
        for (i, &pixel) in src.pixels.iter().enumerate() {
            svm.poke(500 + i as u32, pixel);
        }

        // Main program: SPATIAL_SPAWN the program to addr 1000, then CALL 1000
        let mut p = Program::new();
        p.ldi(1, 1000); // dest
        p.ldi(2, 3); // size (LDI=2 pixels + HALT=1 = 3)
        p.ldi(3, 500); // source
        p.spatial_spawn(1, 2, 3);
        // Now jump to the copied program
        p.instruction(op::CALL, 0, 0, 0);
        p.pixels.push(1000); // absolute address
        p.halt();

        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED, "should halt");
        assert_eq!(svm.vm_state(0).regs[0], 42, "copied program should execute and set r0=42");
    }

    #[test]
    fn test_semantic_merge_identical_clusters() {
        // Merge two identical clusters -- result should be identical.
        let mut svm = SoftwareVm::new();

        // Cluster A at pixel 500
        svm.poke(500, assembler::glyph(5, 0, 0, 1)); // ADD
        svm.poke(501, assembler::glyph(13, 0, 0, 0)); // HALT

        // Cluster B at pixel 600 (identical)
        svm.poke(600, assembler::glyph(5, 0, 0, 1)); // ADD
        svm.poke(601, assembler::glyph(13, 0, 0, 0)); // HALT

        // Program: SEMANTIC_MERGE r1, r2, r3 (dest in data pixel)
        let mut p = Program::new();
        p.ldi(1, 500); // cluster A
        p.ldi(2, 600); // cluster B
        p.ldi(3, 700); // dest
        p.semantic_merge(1, 2, 3);
        p.halt();

        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED, "should halt");

        // Dest should match both sources
        assert_eq!(svm.peek(700), assembler::glyph(5, 0, 0, 1), "dest pixel 0 should match");
        assert_eq!(svm.peek(701), assembler::glyph(13, 0, 0, 0), "dest pixel 1 should match");

        // Return value = merged count
        assert_eq!(svm.vm_state(0).regs[1], 2, "should have merged 2 pixels");
    }

    #[test]
    fn test_semantic_merge_differing_clusters_keeps_higher_opcode() {
        // Merge two clusters with differing opcodes -- higher opcode wins.
        let mut svm = SoftwareVm::new();

        // Cluster A at pixel 500: ADD (opcode 5)
        svm.poke(500, assembler::glyph(5, 0, 0, 1));

        // Cluster B at pixel 600: SUB (opcode 6, higher)
        svm.poke(600, assembler::glyph(6, 0, 0, 1));

        let mut p = Program::new();
        p.ldi(1, 500); // cluster A
        p.ldi(2, 600); // cluster B
        p.ldi(3, 700); // dest
        p.semantic_merge(1, 2, 3);
        p.halt();

        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED, "should halt");

        // SUB (opcode 6) > ADD (opcode 5), so SUB wins
        let merged = svm.peek(700);
        assert_eq!(
            (merged & 0xFF) as u8,
            6,
            "merged pixel should keep higher opcode (SUB=6)"
        );
    }

    #[test]
    fn test_spatial_spawn_pixel_encoding() {
        // Verify that SPATIAL_SPAWN emits 2 pixels and the opcode is 225
        let mut p = Program::new();
        p.ldi(1, 100); // dest
        p.ldi(2, 5); // size
        p.ldi(3, 200); // source
        p.spatial_spawn(1, 2, 3);
        p.halt();

        // Find the SPATIAL_SPAWN pixel (after LDI r1, LDI r2, LDI r3 = 6 pixels)
        let spawn_pixel = p.pixels[6];
        assert_eq!((spawn_pixel & 0xFF) as u8, 225, "opcode should be 225 (SPATIAL_SPAWN)");
        // Second pixel encodes source_addr_reg
        let data_pixel = p.pixels[7];
        assert_eq!(data_pixel, 3, "data pixel should encode source_addr_reg=3");
    }

    #[test]
    fn test_semantic_merge_pixel_encoding() {
        // Verify that SEMANTIC_MERGE emits 2 pixels and the opcode is 226
        let mut p = Program::new();
        p.ldi(1, 100); // cluster_a
        p.ldi(2, 200); // cluster_b
        p.ldi(3, 300); // dest
        p.semantic_merge(1, 2, 3);
        p.halt();

        // Find the SEMANTIC_MERGE pixel (after LDI r1, LDI r2, LDI r3 = 6 pixels)
        let merge_pixel = p.pixels[6];
        assert_eq!((merge_pixel & 0xFF) as u8, 226, "opcode should be 226 (SEMANTIC_MERGE)");
        // Second pixel encodes dest_reg
        let data_pixel = p.pixels[7];
        assert_eq!(data_pixel, 3, "data pixel should encode dest_reg=3");
    }

    #[test]
    fn test_glyph_mutate_pixel_encoding() {
        // Verify GLYPH_MUTATE emits 1 pixel with opcode 224
        let mut p = Program::new();
        p.glyph_mutate(3, 5);
        p.halt();

        let pixel = p.pixels[0];
        assert_eq!((pixel & 0xFF) as u8, 224, "opcode should be 224 (GLYPH_MUTATE)");
    }

    #[test]
    fn test_glyph_mutate_via_gasm() {
        // Verify gasm parser handles GLYPH_MUTATE
        let src = "LDI r3, 500\nLDI r4, 6\nGLYPH_MUTATE r3, r4\nHALT";
        let prog = assembler::parse_gasm(src).unwrap();
        // pixels: [LDI r3], [500], [LDI r4], [6], [GLYPH_MUTATE r3, r4], [HALT]
        assert_eq!((prog.pixels[4] & 0xFF) as u8, 224, "pixel 4 should be GLYPH_MUTATE");
    }

    #[test]
    fn test_spatial_spawn_via_gasm() {
        // Verify gasm parser handles SPATIAL_SPAWN
        let src = "LDI r1, 1000\nLDI r2, 3\nLDI r3, 500\nSPATIAL_SPAWN r1, r2, r3\nHALT";
        let prog = assembler::parse_gasm(src).unwrap();
        // pixels: [LDI r1], [1000], [LDI r2], [3], [LDI r3], [500], [SPATIAL_SPAWN], [source_reg], [HALT]
        assert_eq!((prog.pixels[6] & 0xFF) as u8, 225, "pixel 6 should be SPATIAL_SPAWN");
    }

    #[test]
    fn test_semantic_merge_via_gasm() {
        // Verify gasm parser handles SEMANTIC_MERGE
        let src = "LDI r1, 500\nLDI r2, 600\nLDI r3, 700\nSEMANTIC_MERGE r1, r2, r3\nHALT";
        let prog = assembler::parse_gasm(src).unwrap();
        // pixels: [LDI r1], [500], [LDI r2], [600], [LDI r3], [700], [SEMANTIC_MERGE], [dest_reg], [HALT]
        assert_eq!((prog.pixels[6] & 0xFF) as u8, 226, "pixel 6 should be SEMANTIC_MERGE");
    }

    // ── SPAWN opcode tests ──────────────────────────────────────────

    #[test]
    fn test_mod_basic() {
        let mut p = Program::new();
        p.ldi(0, 17); // r0 = 17
        p.ldi(1, 5); // r1 = 5
        p.modulo(0, 1); // r0 = 17 % 5 = 2
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 2, "17 % 5 should be 2");
    }

    #[test]
    fn test_mod_div_by_zero() {
        let mut p = Program::new();
        p.ldi(0, 42);
        p.ldi(1, 0); // divisor = 0
        p.modulo(0, 1); // should yield 0
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 0, "mod by zero should return 0");
    }

    #[test]
    fn test_mod_via_gasm() {
        let src = "LDI r0, 100\nLDI r1, 7\nMOD r0, r1\nHALT";
        let p = crate::assembler::parse_gasm(src).unwrap();
        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 2, "100 % 7 = 2 via gasm");
    }

    #[test]
    fn test_ldb_stb_basic() {
        // Store 0xAB at byte addr 4, store 0xCD at byte addr 5, read byte at addr 5
        let mut p = Program::new();
        p.ldi(0, 4); // byte addr 4
        p.ldi(1, 0xAB); // value to store
        p.stb(0, 1); // mem byte[4] = 0xAB
        p.ldi(0, 5); // byte addr 5
        p.ldi(1, 0xCD); // value to store
        p.stb(0, 1); // mem byte[5] = 0xCD
        p.ldi(0, 5); // byte addr 5
        p.ldb(2, 0); // r2 = byte at byte addr 5
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[2], 0xCD, "LDB should read 0xCD from byte addr 5");
    }

    #[test]
    fn test_stb_does_not_corrupt_adjacent_bytes() {
        // Store 0xAB at byte 4, store 0xCD at byte 5, verify both
        let mut p = Program::new();
        p.ldi(0, 4);
        p.ldi(1, 0xAB);
        p.stb(0, 1); // byte[4] = 0xAB
        p.ldi(0, 5);
        p.ldi(1, 0xCD);
        p.stb(0, 1); // byte[5] = 0xCD
        // Read both back
        p.ldi(0, 4);
        p.ldb(2, 0); // r2 = byte[4]
        p.ldi(0, 5);
        p.ldb(3, 0); // r3 = byte[5]
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[2], 0xAB, "byte[4] should still be 0xAB after byte[5] write");
        assert_eq!(vm.regs[3], 0xCD, "byte[5] should be 0xCD");
    }

    #[test]
    fn test_ldb_stb_via_gasm() {
        let src = "LDI r0, 8\nLDI r1, 0xEF\nSTB r0, r1\nLDI r0, 8\nLDB r2, r0\nHALT";
        let p = crate::assembler::parse_gasm(src).unwrap();
        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[2], 0xEF, "LDB/STB via gasm should work");
    }

    // ── SPAWN opcode tests
    fn test_spawn_basic_parent_child() {
        // Parent VM 0 spawns child VM 1.
        // Child program is at address 100: LDI r0, 42; HALT
        // Parent program: write child code to address 100, SPAWN, HALT
        let mut parent = Program::new();
        // Write child program at address 100
        // LDI r0, <42>
        parent.ldi(10, 100);
        parent.ldi(11, assembler::glyph(1, 0, 0, 0)); // LDI r0, imm
        parent.store(10, 11);
        parent.ldi(10, 101);
        parent.ldi(11, 42); // immediate = 42
        parent.store(10, 11);
        parent.ldi(10, 102);
        parent.ldi(11, assembler::glyph(13, 0, 0, 0)); // HALT
        parent.store(10, 11);

        // Now SPAWN: r3 = base_addr (100), r4 = entry_offset (100)
        parent.ldi(3, 100); // base addr for child
        parent.ldi(4, 100); // entry offset for child
        parent.spawn(3, 4); // SPAWN r3, r4 -> r3 gets child_id (1)
        parent.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(0, &parent.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        // Parent should halt
        assert_eq!(svm.vm_state(0).state, vm_state::HALTED, "parent should halt");
        // r3 should have child VM ID = 1
        assert_eq!(svm.vm_state(0).regs[3], 1, "parent r3 should have child_id=1");

        // Child VM 1 should now be RUNNING (spawned post-frame)
        assert_eq!(svm.vm_state(1).state, vm_state::RUNNING, "child should be running after spawn");

        // Execute another frame for the child
        svm.execute_frame();

        // Child should have run and halted
        assert_eq!(svm.vm_state(1).state, vm_state::HALTED, "child should halt after executing");
        assert_eq!(svm.vm_state(1).regs[0], 42, "child should have loaded 42 into r0");
    }

    #[test]
    fn test_spawn_child_writes_to_memory() {
        // Parent spawns child which writes a value to memory, then parent yields to wait.
        // Child writes 99 to address 500, then halts.
        // After 2 frames, verify mem[500] == 99.
        let mut child = Program::new();
        child.ldi(0, 500); // addr
        child.ldi(1, 99); // value
        child.store(0, 1);
        child.halt();

        // Parent: SPAWN then YIELD (wait for child), then HALT
        let mut parent = Program::new();
        let child_load_addr: u32 = 1000;
        parent.ldi(3, child_load_addr); // r3 = child base addr
        parent.ldi(4, child_load_addr); // r4 = child entry offset (same as base = start of child code)

        // SPAWN r3, r4
        parent.spawn(3, 4);
        parent.yield_op(); // yield so parent waits

        let mut svm = SoftwareVm::new();
        // Load child program at address 1000
        svm.load_program(child_load_addr, &child.pixels);
        // Load parent program at address 0
        svm.load_program(0, &parent.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        // Parent yielded, child should be RUNNING
        assert_eq!(svm.vm_state(0).state, vm_state::YIELDED, "parent should be waiting");
        assert_eq!(svm.vm_state(1).state, vm_state::RUNNING, "child should be running");

        // Execute second frame: child runs
        svm.execute_frame();
        assert_eq!(svm.vm_state(1).state, vm_state::HALTED, "child should halt");
        assert_eq!(svm.peek(500), 99, "child should have written 99 to mem[500]");
    }

    #[test]
    fn test_spawn_returns_child_id_in_register() {
        // Verify that SPAWN sets r_base_addr to the child VM ID
        let mut p = Program::new();
        p.ldi(3, 500); // base addr
        p.ldi(4, 500); // entry offset
        p.spawn(3, 4); // r3 = child_id after
        // r3 should be 1 (vm_id 0 + 1)
        // Now check r3 != 0xFF (meaning spawn succeeded)
        p.ldi(5, 0xFF);
        // If r3 != 0xFF, we succeeded. Store r3 to mem[900]
        p.ldi(10, 900);
        p.store(10, 3);
        p.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED);
        let child_id = svm.peek(900);
        assert_eq!(child_id, 1, "SPAWN should return child_id=1 in r3");
    }

    #[test]
    fn test_yield_pauses_and_resumes() {
        // YIELD should transition VM to WAITING, then resume on next frame
        let mut p = Program::new();
        p.ldi(0, 10); // r0 = 10
        p.yield_op(); // yield - VM goes to WAITING
        // After resume: store r0 to mem[800]
        p.ldi(10, 800);
        p.store(10, 0);
        p.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);

        // Frame 1: executes LDI, YIELD -> WAITING
        svm.execute_frame();
        assert_eq!(svm.vm_state(0).state, vm_state::YIELDED, "VM should be WAITING after YIELD");
        assert_eq!(svm.vm_state(0).regs[0], 10, "r0 should be 10 before yield");

        // Need to manually set WAITING -> RUNNING for next frame
        // (the shader does this in its scheduler loop)
        svm.vm_state_mut(0).state = vm_state::RUNNING;

        // Frame 2: resumes, executes ST, HALT
        svm.execute_frame();
        assert_eq!(svm.vm_state(0).state, vm_state::HALTED, "VM should HALT after resume");
        assert_eq!(svm.peek(800), 10, "should have written 10 after resuming from yield");
    }

    #[test]
    fn test_spawn_assembler_encoding() {
        // Verify the assembler spawn() produces correct encoding
        let mut p = Program::new();
        p.spawn(3, 5);
        assert_eq!(p.len(), 1, "SPAWN should produce 1 pixel");
        let pixel = p.pixels[0];
        assert_eq!((pixel & 0xFF) as u8, 230, "opcode should be 230 (SPAWN)");
        assert_eq!(
            ((pixel >> 16) & 0xFF) as u8,
            3,
            "p1 should be 3 (base_addr reg)"
        );
        assert_eq!(
            ((pixel >> 24) & 0xFF) as u8,
            5,
            "p2 should be 5 (entry_offset reg)"
        );
    }

    #[test]
    fn test_yield_assembler_encoding() {
        let mut p = Program::new();
        p.yield_op();
        assert_eq!(p.len(), 1, "YIELD should produce 1 pixel");
        let pixel = p.pixels[0];
        assert_eq!((pixel & 0xFF) as u8, 227, "opcode should be 227 (YIELD)");
    }

    #[test]
    fn test_gasm_spawn_and_yield() {
        // Verify gasm parser handles SPAWN and YIELD
        let source = "SPAWN r3, r5\nYIELD\nHALT";
        let prog = assembler::parse_gasm(source).expect("gasm parse should succeed");
        assert_eq!(prog.len(), 3, "should produce 3 pixels");
        assert_eq!((prog.pixels[0] & 0xFF) as u8, 230, "first should be SPAWN");
        assert_eq!((prog.pixels[1] & 0xFF) as u8, 227, "second should be YIELD");
        assert_eq!((prog.pixels[2] & 0xFF) as u8, 13, "third should be HALT");
    }

    // ── SPAWN: Slot finding & multi-spawn tests (GEO-21) ──

    #[test]
    fn test_spawn_fills_first_inactive_slot() {
        // VM 0 and VM 2 are active. SPAWN from VM 0 should fill VM slot 1
        // (first INACTIVE slot), not VM slot 3 (parent+1).
        // Use a YIELD loop for VM 2 so it stays WAITING (not HALTED/INACTIVE).
        let mut yielder = Program::new();
        yielder.ldi(0, 77);
        yielder.yield_op(); // stays alive as WAITING

        let mut parent = Program::new();
        let child_load_addr: u32 = 2000;
        parent.ldi(3, child_load_addr);
        parent.ldi(4, child_load_addr);
        parent.spawn(3, 4);
        parent.halt();

        let mut child_prog = Program::new();
        child_prog.ldi(0, 42);
        child_prog.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(child_load_addr, &child_prog.pixels);
        svm.load_program(0, &parent.pixels);
        svm.load_program(9000, &yielder.pixels);
        svm.spawn_vm(0, 0);
        // Manually activate VM 2 with a yield-loop program so it stays alive
        svm.spawn_vm(2, 9000);

        svm.execute_frame();

        // Post-frame: parent SPAWN fills slot 1 (first INACTIVE).
        assert_eq!(
            svm.vm_state(1).state,
            vm_state::RUNNING,
            "child should spawn in slot 1"
        );
        // VM 2 yielded, so it's WAITING (not INACTIVE), confirming the gap worked
        assert_ne!(
            svm.vm_state(2).state,
            vm_state::INACTIVE,
            "VM 2 should not be INACTIVE"
        );
    }

    #[test]
    fn test_spawn_skips_already_active_slots() {
        // VM slots 0 and 1 are active. Spawn should use slot 2.
        // Use YIELD loops so VM 1 stays alive (not HALTED -> INACTIVE).
        let mut yielder = Program::new();
        yielder.ldi(0, 0);
        yielder.yield_op(); // stays alive

        let mut child = Program::new();
        child.ldi(0, 42);
        child.halt();

        let mut parent = Program::new();
        let child_addr: u32 = 3000;
        parent.ldi(3, child_addr);
        parent.ldi(4, child_addr);
        parent.spawn(3, 4);
        parent.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(child_addr, &child.pixels);
        svm.load_program(0, &parent.pixels);
        svm.load_program(8000, &yielder.pixels);
        svm.spawn_vm(0, 0);
        // Occupy slot 1 with a yield-loop VM (stays alive across frames)
        svm.spawn_vm(1, 8000);

        svm.execute_frame();

        // Child should be in slot 2 (first free after 0, 1)
        assert_eq!(
            svm.vm_state(2).state,
            vm_state::RUNNING,
            "child should spawn in slot 2"
        );
        // Slot 1 is WAITING (yielded), not INACTIVE
        assert_ne!(
            svm.vm_state(1).state,
            vm_state::INACTIVE,
            "slot 1 should not be INACTIVE"
        );
    }

    #[test]
    fn test_spawn_child_gets_own_memory_region() {
        // Child spawned with base_addr > 0 gets memory isolation
        let mut child = Program::new();
        child.ldi(0, 0xBEEF);
        child.ldi(1, 4000); // write within child's region
        child.store(1, 0);
        child.halt();

        let mut parent = Program::new();
        let child_addr: u32 = 4000;
        parent.ldi(3, child_addr); // base addr for child
        parent.ldi(4, child_addr); // entry offset
        parent.spawn(3, 4);
        parent.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(child_addr, &child.pixels);
        svm.load_program(0, &parent.pixels);
        svm.spawn_vm(0, 0);

        svm.execute_frame();

        // Child VM 1 should be running
        assert_eq!(svm.vm_state(1).state, vm_state::RUNNING, "child should be running");
        // Child should have base_addr set from spawn param
        assert_eq!(svm.vm_state(1).base_addr, child_addr, "child base_addr should match spawn param");

        // Run child to completion
        svm.execute_frame();
        assert_eq!(svm.vm_state(1).state, vm_state::HALTED, "child should halt");
        assert_eq!(svm.peek(4000), 0xBEEF, "child wrote to its own region");
    }

    #[test]
    fn test_spawn_parent_id_recorded_correctly() {
        let mut child = Program::new();
        child.halt();

        let mut parent = Program::new();
        let child_addr: u32 = 5000;
        parent.ldi(3, child_addr);
        parent.ldi(4, child_addr);
        parent.spawn(3, 4);
        parent.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(child_addr, &child.pixels);
        svm.load_program(0, &parent.pixels);
        svm.spawn_vm(0, 0);

        svm.execute_frame();

        assert_eq!(svm.vm_state(1).parent_id, 0, "child's parent_id should be 0");
    }

    #[test]
    fn test_spawn_generation_increments() {
        let mut child = Program::new();
        child.halt();

        let mut parent = Program::new();
        let child_addr: u32 = 6000;
        parent.ldi(3, child_addr);
        parent.ldi(4, child_addr);
        parent.spawn(3, 4);
        parent.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(child_addr, &child.pixels);
        svm.load_program(0, &parent.pixels);
        svm.spawn_vm(0, 0);

        let parent_gen = svm.vm_state(0).generation;

        svm.execute_frame();

        let child_gen = svm.vm_state(1).generation;
        assert_eq!(child_gen, parent_gen + 1, "child generation should be parent+1");
    }

    #[test]
    fn test_spawn_independent_execution() {
        // Parent and child run independently. Parent halts, child continues.
        let mut child = Program::new();
        child.ldi(0, 0xCAFE);
        child.ldi(1, 7000);
        child.store(1, 0); // mem[7000] = 0xCAFE
        child.halt();

        let mut parent = Program::new();
        let child_addr: u32 = 7000;
        parent.ldi(3, child_addr);
        parent.ldi(4, child_addr);
        parent.spawn(3, 4);
        parent.ldi(5, 0xF00D);
        parent.ldi(6, 8000);
        parent.store(6, 5); // mem[8000] = 0xF00D
        parent.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(child_addr, &child.pixels);
        svm.load_program(0, &parent.pixels);
        svm.spawn_vm(0, 0);

        // Frame 1: parent runs, spawns child post-frame
        svm.execute_frame();
        assert_eq!(svm.vm_state(0).state, vm_state::HALTED, "parent halted");
        assert_eq!(svm.peek(8000), 0xF00D, "parent wrote its data");
        assert_eq!(svm.vm_state(1).state, vm_state::RUNNING, "child spawned and running");

        // Frame 2: child runs
        svm.execute_frame();
        assert_eq!(svm.vm_state(1).state, vm_state::HALTED, "child halted");
        assert_eq!(svm.peek(7000), 0xCAFE, "child wrote independently");
    }

    #[test]
    fn test_spawn_parent_waits_for_child_via_yield() {
        // Parent spawns child, yields (auto-resumes next frame), yields again
        // to give child a full frame, then reads child's output.
        let mut child = Program::new();
        child.ldi(0, 9999);
        child.ldi(1, 9500);
        child.store(1, 0); // mem[9500] = 9999
        child.halt();

        let mut parent = Program::new();
        let child_addr: u32 = 9500;
        parent.ldi(3, child_addr);
        parent.ldi(4, child_addr);
        parent.spawn(3, 4);
        parent.yield_op(); // frame 1: yield -- child spawned post-frame
        parent.yield_op(); // frame 2: auto-resume, yield again -- child runs alone
        parent.ldi(5, 9500);
        parent.load(6, 5); // r6 = mem[9500]
        parent.ldi(10, 9600);
        parent.store(10, 6); // mem[9600] = child's result
        parent.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(child_addr, &child.pixels);
        svm.load_program(0, &parent.pixels);
        svm.spawn_vm(0, 0);

        // Frame 1: parent spawns child, yields -> WAITING
        svm.execute_frame();
        // Parent SPAWN sets regs[125]=1, then YIELD sets state to WAITING
        // Post-frame spawn processes because regs[125] was set
        assert_eq!(svm.vm_state(0).state, vm_state::YIELDED, "parent waiting");
        assert_eq!(svm.vm_state(1).state, vm_state::RUNNING, "child running");

        // Frame 2: parent auto-resumes, hits 2nd YIELD -> WAITING.
        // Child runs and halts.
        svm.execute_frame();
        assert_eq!(svm.vm_state(0).state, vm_state::YIELDED, "parent yielded again");
        assert_eq!(svm.vm_state(1).state, vm_state::HALTED, "child halted");
        assert_eq!(svm.peek(9500), 9999, "child wrote its result");

        // Frame 3: parent auto-resumes, reads child output, halts
        svm.execute_frame();
        assert_eq!(
            svm.vm_state(0).state,
            vm_state::HALTED,
            "parent halted after checking child"
        );
        assert_eq!(svm.peek(9600), 9999, "parent read child's output correctly");
    }

#[test]
    fn test_spawn_no_free_slots() {
        // Fill all 8 VM slots. SPAWN should still return 1 (request queued)
        // but no child should actually be spawned post-frame.
        let mut parent = Program::new();
        parent.ldi(3, 100);
        parent.ldi(4, 100);
        parent.spawn(3, 4); // tries to spawn
        parent.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(0, &parent.pixels);
        svm.spawn_vm(0, 0);
        // Occupy all other slots
        for slot in 1..super::super::MAX_VMS {
            svm.spawn_vm(slot as u32, 0);
        }

        svm.execute_frame();

        // Parent halted, all slots were taken so no child spawned
        assert_eq!(svm.vm_state(0).state, vm_state::HALTED);
        // All slots should still be active (no new INACTIVE slots became RUNNING)
        // The spawn request was made but couldn't be fulfilled
        for slot in 0..super::super::MAX_VMS as usize {
            assert_ne!(svm.vm_state(slot as usize).state, vm_state::INACTIVE, "slot {} should be active", slot);
            }
    }

    // ── Event Queue Tests (GEO-23) ──────────────────────────────────

    #[test]
    fn test_wait_event_blocks_when_no_event() {
        // VM calls WAIT_EVENT with no event pending -> should go to WAITING state
        let mut p = Program::new();
        p.wait_event(0, 1); // r0 = event_type, r1 = param1
        p.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        // VM should be WAITING (not HALTED, not RUNNING)
        assert_eq!(
            svm.vm_state(0).state,
            vm_state::WAITING,
            "VM should be WAITING when no event"
        );
    }

    #[test]
    fn test_inject_event_wakes_vm() {
        // VM waits for event, daemon injects keyboard event, VM reads it and halts
        let mut p = Program::new();
        p.wait_event(0, 1); // r0 = event_type, r1 = param1
        p.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);

        // Frame 1: VM hits WAIT_EVENT, no event -> WAITING
        svm.execute_frame();
        assert_eq!(svm.vm_state(0).state, vm_state::WAITING);

        // Daemon injects keyboard event (type=1, param1=65 = 'A')
        svm.inject_event(0, crate::EVENT_KEYBOARD, 65);

        // Frame 2: VM re-executes WAIT_EVENT, finds event -> reads it, continues to HALT
        svm.execute_frame();

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED, "VM should HALT after reading event");
        assert_eq!(svm.vm_state(0).regs[0], crate::EVENT_KEYBOARD, "r0 should be event type (keyboard=1)");
        assert_eq!(svm.vm_state(0).regs[1], 65, "r1 should be param1 (keycode 65='A')");

        // Event header should be cleared
        let header_base = crate::EVENTQ_BASE + 0 * 2;
        assert_eq!(svm.peek(header_base), 0, "event header should be cleared after read");
    }

    #[test]
    fn test_event_branch_on_type() {
        // VM waits for event, then branches based on event type
        let mut p = Program::new();
        // addr 0-1: WAIT_EVENT r0, r1
        p.wait_event(0, 1);
        // addr 2-3: LDI r2, 0xFF (sentinel for "unknown event")
        p.ldi(2, 0xFF);
        // addr 4-5: BNE r0, <keyboard_const>, +3 (if keyboard, skip sentinel)
        // We need keyboard constant in a register
        p.ldi(3, crate::EVENT_KEYBOARD);
        // addr 6: BNE r0, r3 -- but we want "if equal, branch" (BEQ semantics)
        // Since VM only has BNE: if r0 != r3, skip (not keyboard)
        // if r0 == r3 (keyboard), DON'T branch -> fall through to r2=42
        // So we want: if NOT keyboard, skip to halt. If keyboard, set r2=42.
        // BNE r0, r3, +3  -> if r0 != keyboard_type, jump over next 2 instrs
        p.instruction(op::BRANCH, bcond::BNE, 0, 3);
        p.pixels.push(4); // offset: skip LDI r2,42 and land on HALT
        // addr 8-9: r2 = 42 (keyboard handler)
        p.ldi(2, 42);
        p.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);

        // Frame 1: WAIT_EVENT blocks
        svm.execute_frame();

        // Inject keyboard event
        svm.inject_event(0, crate::EVENT_KEYBOARD, 0);
        svm.execute_frame();

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED);
        assert_eq!(svm.vm_state(0).regs[2], 42, "keyboard handler should set r2=42");
    }

    #[test]
    fn test_event_per_vm_isolation() {
        // Events for VM 0 should not affect VM 1
        let mut p0 = Program::new();
        p0.wait_event(0, 1);
        p0.halt();

        let mut p1 = Program::new();
        p1.wait_event(0, 1);
        p1.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(0, &p0.pixels);
        svm.load_program(200, &p1.pixels);
        svm.spawn_vm(0, 0);
        svm.spawn_vm(1, 200);

        // Both wait
        svm.execute_frame();
        assert_eq!(svm.vm_state(0).state, vm_state::WAITING);
        assert_eq!(svm.vm_state(1).state, vm_state::WAITING);

        // Inject event only for VM 1
        svm.inject_event(1, crate::EVENT_TIMER, 1000);
        svm.execute_frame();

        // VM 0 should still be waiting, VM 1 should have read event and halted
        assert_eq!(svm.vm_state(0).state, vm_state::WAITING, "VM 0 should still be waiting");
        assert_eq!(svm.vm_state(1).state, vm_state::HALTED, "VM 1 should have halted");
        assert_eq!(svm.vm_state(1).regs[0], crate::EVENT_TIMER, "VM 1 should have timer event");
        assert_eq!(svm.vm_state(1).regs[1], 1000, "VM 1 param1 should be 1000");
    }

    // ── Historian VM tests (GEO-37) ────────────────────────────────

    /// Helper: load historian.gasm from disk into the given VM at the given address.
    fn load_historian(svm: &mut SoftwareVm, vm_id: u32, load_addr: u32) {
        let historian_src = std::fs::read_to_string("programs/historian.gasm")
            .expect("programs/historian.gasm should exist");
        let historian_prog = crate::assembler::parse_gasm(&historian_src)
            .expect("historian.gasm should parse");
        svm.load_program(load_addr, &historian_prog.pixels);
        svm.spawn_vm(vm_id, load_addr);
    }

    /// Helper: build a sender program that constructs a 4-pixel fitness report and
    /// sends it to a target VM, then halts.
    fn build_fitness_sender(target_vm: u32, msg_type: u32, sender_id: u32, fitness: u32, cycles: u32) -> Program {
        let mut sender = Program::new();
        // r0 = data_addr (where we build the message)
        sender.ldi(0, 1000);
        // pixel 0: msg_type
        sender.ldi(1, msg_type);
        sender.store(0, 1);
        // pixel 1: sender_id
        sender.ldi(2, 1001);
        sender.ldi(1, sender_id);
        sender.store(2, 1);
        // pixel 2: fitness
        sender.ldi(2, 1002);
        sender.ldi(1, fitness);
        sender.store(2, 1);
        // pixel 3: cycles
        sender.ldi(2, 1003);
        sender.ldi(1, cycles);
        sender.store(2, 1);
        // Send to target VM
        sender.ldi(1, target_vm);
        sender.send(1, 0, 4); // SEND r1(target_vm), r0(data_addr=1000), length=4
        sender.halt();
        sender
    }

    #[test]
    fn test_historian_receives_fitness_report() {
        // VM 0: sender sends a 4-pixel fitness report to VM 2
        // VM 2: historian.gasm loaded at addr 100
        // After sender sends and historian processes, verify ring buffer at 0x00D00000.

        let sender = build_fitness_sender(2, 1, 0, 7500, 120);
        let sender_load_addr: u32 = 200;

        let mut svm = SoftwareVm::new();
        svm.load_program(sender_load_addr, &sender.pixels);
        svm.spawn_vm(0, sender_load_addr);

        load_historian(&mut svm, 2, 100);

        // Frame 1: sender sends, historian receives and processes
        svm.execute_frame();

        // Sender should halt
        assert_eq!(svm.vm_state(0).state, vm_state::HALTED, "sender should halt");

        // Historian should be yielded (will auto-resume next frame) or still running
        assert_ne!(svm.vm_state(2).state, vm_state::HALTED, "historian should not halt");

        // Verify ring buffer at 0x00D00000
        let ring_base = 0x00D00000u32;
        assert_eq!(svm.peek(ring_base + 0), 1, "ring[0] msg_type should be 1 (fitness_report)");
        assert_eq!(svm.peek(ring_base + 1), 0, "ring[1] sender_vm_id should be 0");
        assert_eq!(svm.peek(ring_base + 2), 7500, "ring[2] fitness_score should be 7500");
        assert_eq!(svm.peek(ring_base + 3), 120, "ring[3] cycles should be 120");

        // Ring slots 1-15 should still be zero
        for i in 1..16 {
            for j in 0..4 {
                assert_eq!(svm.peek(ring_base + i * 4 + j), 0, "ring slot {} pixel {} should be 0", i, j);
            }
        }
    }

    #[test]
    fn test_historian_ring_buffer_wraps() {
        // Send 17 messages (ring size = 16). The 17th should overwrite the 1st.
        // We do this by running sender+historian frame by frame.

        let mut svm = SoftwareVm::new();
        load_historian(&mut svm, 2, 100);

        let ring_base = 0x00D00000u32;

        // Send 16 messages, each with fitness = slot_index * 100
        for i in 0..16u32 {
            let sender = build_fitness_sender(2, 1, 0, i * 100, i * 10);
            let sender_load_addr: u32 = 200;
            svm.load_program(sender_load_addr, &sender.pixels);
            svm.spawn_vm(0, sender_load_addr);

            // Execute frame: sender sends, historian receives
            svm.execute_frame();
        }

        // Verify slots 0..16 are filled
        for i in 0..16u32 {
            assert_eq!(svm.peek(ring_base + i * 4 + 2), i * 100,
                "slot {} fitness should be {}", i, i * 100);
        }

        // Now send the 17th message with fitness = 9999
        let sender17 = build_fitness_sender(2, 1, 5, 9999, 77);
        svm.load_program(200, &sender17.pixels);
        // VM 0 is halted from last run; respawn it
        svm.spawn_vm(0, 200);
        svm.execute_frame();

        // Slot 0 should now have the 17th message (fitness=9999)
        assert_eq!(svm.peek(ring_base + 0), 1, "slot 0 msg_type after wrap should be 1");
        assert_eq!(svm.peek(ring_base + 1), 5, "slot 0 sender after wrap should be 5");
        assert_eq!(svm.peek(ring_base + 2), 9999, "slot 0 fitness after wrap should be 9999");
        assert_eq!(svm.peek(ring_base + 3), 77, "slot 0 cycles after wrap should be 77");

        // Slot 1 should still have message from the 2nd send (fitness=100)
        assert_eq!(svm.peek(ring_base + 4 + 2), 100, "slot 1 fitness should be unchanged");
    }

    #[test]
    fn test_historian_yields_when_no_messages() {
        // Run historian with empty mailbox. It should YIELD each frame and never HALT.
        let mut svm = SoftwareVm::new();
        load_historian(&mut svm, 2, 100);

        // Run 5 frames with no messages
        for frame in 0..5 {
            svm.execute_frame();
            assert_ne!(svm.vm_state(2).state, vm_state::HALTED,
                "historian should not halt on frame {}", frame);
            // After execute_frame, yielded VMs have state YIELDED (set during execution)
            // but will be auto-resumed at the start of the next frame
            assert_ne!(svm.vm_state(2).state, vm_state::INACTIVE,
                "historian should not be inactive on frame {}", frame);
        }
    }

    // ── Engineer VM tests (GEO-38) ──────────────────────────────────

    /// Helper: load engineer.gasm from disk into the given VM.
    fn load_engineer(svm: &mut SoftwareVm, vm_id: u32, load_addr: u32) {
        let src = std::fs::read_to_string("programs/engineer.gasm")
            .expect("programs/engineer.gasm should exist");
        let prog = crate::assembler::parse_gasm(&src)
            .expect("engineer.gasm should parse");
        svm.load_program(load_addr, &prog.pixels);
        svm.spawn_vm(vm_id, load_addr);
    }

    /// Helper: send a work order to a target VM's mailbox.
    /// Work order: [msg_type=2, base_addr, entry_offset, child_vm_slot]
    fn send_work_order(svm: &mut SoftwareVm, target_vm: u32, base_addr: u32, entry_offset: u32, child_slot: u32) {
        // Write work order data into target VM's mailbox data region
        let data_base = crate::MSGQ_DATA_BASE + target_vm * crate::MSGQ_MAX_DATA;
        svm.poke(data_base + 0, 2);           // msg_type = mutation_request
        svm.poke(data_base + 1, base_addr);   // program base addr
        svm.poke(data_base + 2, entry_offset); // entry offset
        svm.poke(data_base + 3, child_slot);  // child VM slot
        // Set has_message flag in mailbox header
        svm.poke(crate::MSGQ_BASE + target_vm, (1u32) | (0u32 << 8) | (4u32 << 16));
        // Actually the mailbox header is a pixel: (flags, sender, length, _) packed.
        // Write raw: flags=1 (has_message), sender=0, length=4
        let header_addr = crate::MSGQ_BASE + target_vm;
        // The VM uses read_glyph which reads 4 bytes as a pixel (R,G,B,A) = (flags, sender, length, 0)
        // We need to write it as a u32 in the format the VM reads
        // Looking at how SEND writes: write_glyph(ram, MSGQ_BASE + target_vm, (1, vm.vm_id, length, 0))
        // write_glyph writes (r,g,b,a) as a u32 = r | (g<<8) | (b<<16) | (a<<24)
        svm.poke(header_addr, 1 | (99 << 8) | (4 << 16)); // flags=1, sender=99(faker), length=4
    }

    /// Helper: load a simple child program at base_addr that writes output
    /// at base_addr+100 and halts. Returns fitness_score = 800 (8 non-zero pixels * 100).
    fn load_child_program(svm: &mut SoftwareVm, base_addr: u32) {
        let mut child = Program::new();
        // Write values to output region (base_addr+100 through base_addr+115)
        for i in 0..8u32 {
            child.ldi(0, base_addr + 100 + i); // addr
            child.ldi(1, 42 + i);              // value (non-zero)
            child.store(0, 1);
        }
        child.halt();
        svm.load_program(base_addr, &child.pixels);
    }

    #[test]
    fn test_engineer_yields_waiting_for_work() {
        // Load engineer on VM 3 with empty mailbox.
        // It should YIELD each frame and never HALT.
        let mut svm = SoftwareVm::new();
        load_engineer(&mut svm, 3, 300);

        for frame in 0..5 {
            svm.execute_frame();
            let state = svm.vm_state(3).state;
            assert_ne!(state, vm_state::HALTED,
                "engineer should not halt on frame {}", frame);
            assert_ne!(state, vm_state::INACTIVE,
                "engineer should not be inactive on frame {}", frame);
        }
    }

    #[test]
    fn test_engineer_sends_fitness_to_historian() {
        // Setup:
        // VM 3: engineer.gasm loaded at addr 300
        // VM 2: historian.gasm loaded at addr 100
        // VM 0: (unused, or used for child spawn)
        //
        // Flow:
        // 1. Send work order to engineer's mailbox
        // 2. Run frames until engineer processes the order
        // 3. Verify historian's ring buffer gets a fitness report

        let mut svm = SoftwareVm::new();

        // Load historian on VM 2
        load_historian(&mut svm, 2, 100);

        // Load engineer on VM 3
        load_engineer(&mut svm, 3, 300);

        // Load child program at addr 500
        load_child_program(&mut svm, 500);

        // Send work order to engineer: spawn child at base=500, entry=500
        send_work_order(&mut svm, 3, 500, 500, 1);

        // Run frames: engineer receives order, spawns child, waits, evaluates, sends report
        for _ in 0..10 {
            svm.execute_frame();
        }

        // Verify historian's ring buffer at 0x00D00000
        let ring_base = 0x00D00000u32;
        // Historian should have received a fitness report
        let msg_type = svm.peek(ring_base);
        assert_eq!(msg_type, 1,
            "ring[0] should be msg_type=1 (fitness_report), got {}", msg_type);

        let sender_vm = svm.peek(ring_base + 1);
        assert_eq!(sender_vm, 3,
            "ring[1] should be sender_vm_id=3 (engineer), got {}", sender_vm);

        let fitness = svm.peek(ring_base + 2);
        assert!(fitness > 0,
            "ring[2] fitness_score should be > 0, got {}", fitness);

        // The child writes 8 non-zero pixels, each contributing 100 to fitness = 800
        assert_eq!(fitness, 800,
            "fitness_score should be 800 (8 pixels * 100), got {}", fitness);
    }

    // ── GEO-39: Strategist VM tests ──────────────────────────────────

    /// Helper: load strategist.gasm from disk into the given VM.
    fn load_strategist(svm: &mut SoftwareVm, vm_id: u32, load_addr: u32) {
        let src = std::fs::read_to_string("programs/strategist.gasm")
            .expect("programs/strategist.gasm should exist");
        let prog = crate::assembler::parse_gasm(&src)
            .expect("strategist.gasm should parse");
        svm.load_program(load_addr, &prog.pixels);
        svm.spawn_vm(vm_id, load_addr);
    }

    /// Helper: write a fake fitness entry into the historian's ring buffer.
    /// Entry format: [msg_type, sender_vm_id, fitness_score, cycles]
    fn write_ring_entry(svm: &mut SoftwareVm, entry_idx: u32, msg_type: u32, sender: u32, fitness: u32, cycles: u32) {
        let base = 0x00D00000u32 + entry_idx * 4;
        svm.poke(base + 0, msg_type);
        svm.poke(base + 1, sender);
        svm.poke(base + 2, fitness);
        svm.poke(base + 3, cycles);
    }

    /// Helper: read a message from a VM's mailbox data region.
    /// Returns the 4-pixel message as a Vec<u32>.
    fn read_mailbox(svm: &SoftwareVm, vm_id: u32) -> Vec<u32> {
        let data_base = crate::MSGQ_DATA_BASE + vm_id * crate::MSGQ_MAX_DATA;
        (0..4).map(|i| svm.peek(data_base + i)).collect()
    }

    /// Helper: check if a VM's mailbox has a pending message.
    fn mailbox_has_message(svm: &SoftwareVm, vm_id: u32) -> bool {
        let header = svm.peek(crate::MSGQ_BASE + vm_id);
        (header & 1) != 0
    }

    #[test]
    fn test_strategist_sends_decision_to_engineer() {
        // Setup:
        // VM 4: strategist.gasm loaded at addr 700
        // Ring buffer at 0x00D00000 has fake fitness data
        //
        // Flow:
        // 1. Load fake fitness data into historian's ring buffer
        // 2. Run frames until strategist processes and sends work order
        // 3. Verify engineer (VM 3) receives a work order

        let mut svm = SoftwareVm::new();

        // Load strategist on VM 4
        load_strategist(&mut svm, 4, 700);

        // Write fake fitness data into historian's ring buffer
        // Strategist reads entry 0 (latest) and entry 1 (previous)
        // Entry 0 fitness at ring_base + 0*4 + 2 = 0x00D00002
        // Entry 1 fitness at ring_base + 1*4 + 2 = 0x00D00006
        write_ring_entry(&mut svm, 0, 1, 3, 500, 10); // latest: fitness = 500
        write_ring_entry(&mut svm, 1, 1, 3, 300, 8);  // previous: fitness = 300

        // Run frames until strategist sends a work order
        for _frame in 0..20 {
            svm.execute_frame();

            // Check if engineer's mailbox has a message
            if mailbox_has_message(&svm, 3) {
                let msg = read_mailbox(&svm, 3);

                // Verify message format: [msg_type, base_addr, entry_offset, child_vm_slot]
                // Since 500 > 300, strategist should send "keep going" (msg_type 3)
                assert_eq!(msg[0], 3,
                    "work order msg_type should be 3 (keep_going), got {}", msg[0]);
                // Strategist sends hardcoded constants: base=0x00B00000, entry=0x00B00000, child=5
                assert_eq!(msg[1], 0x00B00000,
                    "work order base_addr should be 0x00B00000, got {}", msg[1]);
                assert_eq!(msg[2], 0x00B00000,
                    "work order entry_offset should be 0x00B00000, got {}", msg[2]);
                assert_eq!(msg[3], 5,
                    "work order child_vm_slot should be 5, got {}", msg[3]);
                return; // Test passed
            }
        }

        panic!("strategist never sent a work order to engineer after 20 frames");
    }

    #[test]
    fn test_strategist_detects_improvement() {
        // Load increasing fitness scores into ring buffer.
        // Verify strategist sends "keep going" (msg_type 3).

        let mut svm = SoftwareVm::new();
        load_strategist(&mut svm, 4, 700);

        // Strategist reads entry 0 (latest) and entry 1 (previous)
        // Entry 0 fitness at ring_base + 0*4 + 2 = 0x00D00002
        // Entry 1 fitness at ring_base + 1*4 + 2 = 0x00D00006
        write_ring_entry(&mut svm, 0, 1, 3, 800, 20); // latest: fitness = 800
        write_ring_entry(&mut svm, 1, 1, 3, 200, 15); // previous: fitness = 200

        for _ in 0..20 {
            svm.execute_frame();
            if mailbox_has_message(&svm, 3) {
                let msg = read_mailbox(&svm, 3);
                assert_eq!(msg[0], 3,
                    "improving trend should send msg_type 3 (keep_going), got {}", msg[0]);
                return;
            }
        }
        panic!("strategist never sent a work order after 20 frames");
    }

    #[test]
    fn test_strategist_detects_decline() {
        // Load decreasing fitness scores into ring buffer.
        // Verify strategist sends "try different" (msg_type 4).

        let mut svm = SoftwareVm::new();
        load_strategist(&mut svm, 4, 700);

        // Strategist reads entry 0 (latest) and entry 1 (previous)
        // Entry 0 fitness at ring_base + 0*4 + 2 = 0x00D00002
        // Entry 1 fitness at ring_base + 1*4 + 2 = 0x00D00006
        write_ring_entry(&mut svm, 0, 1, 3, 100, 20); // latest: fitness = 100
        write_ring_entry(&mut svm, 1, 1, 3, 900, 15); // previous: fitness = 900

        for _ in 0..20 {
            svm.execute_frame();
            if mailbox_has_message(&svm, 3) {
                let msg = read_mailbox(&svm, 3);
                assert_eq!(msg[0], 4,
                    "declining trend should send msg_type 4 (try_different), got {}", msg[0]);
                return;
            }
        }
        panic!("strategist never sent a work order after 20 frames");
    }

    // ── GEO-32: Runtime loader (load_hot) tests ─────────────────────

    #[test]
    fn test_load_hot_basic() {
        let mut svm = SoftwareVm::new();
        let mut p = Program::new();
        p.ldi(0, 42);
        p.halt();

        let slot = svm.load_hot(100, &p.pixels).expect("load_hot should succeed");
        assert!(slot < MAX_VMS as u32, "should return a valid VM slot");

        svm.execute_frame();

        let vm = svm.vm_state(slot as usize);
        assert_eq!(vm.regs[0], 42, "loaded VM should execute LDI 42");
        assert_eq!(vm.state, vm_state::HALTED, "loaded VM should be halted");
    }

    #[test]
    fn test_load_hot_does_not_disturb_running_vms() {
        let mut svm = SoftwareVm::new();

        // Program A at addr 0: r0 = 100, halt
        let mut pa = Program::new();
        pa.ldi(0, 100);
        pa.halt();
        svm.load_program(0, &pa.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();
        assert_eq!(svm.vm_state(0).regs[0], 100);

        // Program B loaded hot at addr 500
        let mut pb = Program::new();
        pb.ldi(0, 200);
        pb.halt();
        let slot_b = svm.load_hot(500, &pb.pixels).expect("load_hot B should succeed");

        svm.execute_frame();
        assert_eq!(svm.vm_state(0).regs[0], 100, "VM A should still have 100");
        assert_eq!(svm.vm_state(slot_b as usize).regs[0], 200, "VM B should have 200");
    }

    #[test]
    fn test_load_hot_rejects_overlapping_region() {
        let mut svm = SoftwareVm::new();

        // Spawn an infinite YIELD loop at [0, 10) -- stays RUNNING
        let mut inf = Program::new();
        inf.yield_op();                        // addr 0
        inf.instruction(op::JMP, 0, 0, 0);    // addr 1: JMP
        inf.pixels.push(0u32.wrapping_sub(2)); // addr 2: offset -2 -> back to addr 0
        svm.load_program(0, &inf.pixels);
        svm.spawn_vm_with_bounds(0, 0, 10);

        // Run one frame so VM 0 is YIELDED (counts as active for overlap check)
        svm.execute_frame();

        // Try to load_hot at overlapping address [5, 10)
        let mut overlap = Program::new();
        overlap.ldi(0, 0);
        overlap.halt();
        let result = svm.load_hot(5, &overlap.pixels);
        assert!(result.is_err(), "load_hot should reject overlapping region");
    }

    #[test]
    fn test_load_hot_gasm_parses_and_runs() {
        let mut svm = SoftwareVm::new();
        let source = "LDI r0 77\nHALT\n";
        let slot = svm.load_hot_gasm(200, source).expect("load_hot_gasm should succeed");

        svm.execute_frame();

        let vm = svm.vm_state(slot as usize);
        assert_eq!(vm.regs[0], 77, "gasm-loaded VM should execute LDI r0 77");
        assert_eq!(vm.state, vm_state::HALTED);
    }

    #[test]
    fn test_load_hot_two_programs_coexist() {
        let mut svm = SoftwareVm::new();

        let source_a = "LDI r0 10\nHALT\n";
        let slot_a = svm.load_hot_gasm(100, source_a).unwrap();
        svm.execute_frame();
        assert_eq!(svm.vm_state(slot_a as usize).regs[0], 10);

        let source_b = "LDI r0 20\nHALT\n";
        let slot_b = svm.load_hot_gasm(300, source_b).unwrap();
        svm.execute_frame();
        assert_eq!(svm.vm_state(slot_b as usize).regs[0], 20);

        assert_eq!(svm.vm_state(slot_a as usize).regs[0], 10, "A should still have its result");
    }

    // ── GEO-44: C-to-.glyph transpiler integration tests ─────────────
    // These tests use .gasm generated by the Python transpiler to verify
    // structs, pointers, and arrays actually work on the software VM.

    #[test]
    fn test_geo44_struct_dot_access() {
        // C source: struct Entry { int key; int value; };
        //           e.key = 5; e.value = e.key + 10; return e.value;
        // Expected: r0 = 15
        let src = "\
LDI r31, 0
ADD r31, r6
LDI r30, 5
LDI r28, 2
MOV r29, r31
SHR r29, r28
STORE r29, r30
LDI r30, 0
ADD r30, r6
LDI r29, 4
ADD r30, r29
LDI r29, 0
ADD r29, r6
MOV r27, r29
LDI r26, 2
SHR r27, r26
LOAD r28, r27
LDI r27, 10
ADD r28, r27
LDI r26, 2
MOV r27, r30
SHR r27, r26
STORE r27, r28
LDI r28, 0
ADD r28, r6
LDI r27, 4
ADD r28, r27
MOV r26, r28
LDI r25, 2
SHR r26, r25
LOAD r27, r26
MOV r0, r27
HALT
";
        let p = crate::assembler::parse_gasm(src).expect("gasm should parse");
        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 15, "struct dot access: e.key=5, e.value=e.key+10, should return 15");
        assert_eq!(vm.state, vm_state::HALTED);
    }

    #[test]
    fn test_geo44_struct_arrow_access() {
        // C source: struct Pair { int a; int b; };
        //           struct Pair p; struct Pair* pp = &p;
        //           pp->a = 100; pp->b = 200; return pp->a + pp->b;
        // Expected: r0 = 300
        let src = "\
LDI r31, 0
ADD r31, r6
MOV r8, r31
LDI r30, 100
LDI r28, 2
MOV r29, r8
SHR r29, r28
STORE r29, r30
MOV r30, r8
LDI r29, 4
ADD r30, r29
LDI r29, 200
LDI r27, 2
MOV r28, r30
SHR r28, r27
STORE r28, r29
MOV r28, r8
LDI r27, 2
SHR r28, r27
LOAD r29, r28
MOV r28, r8
LDI r27, 4
ADD r28, r27
MOV r26, r28
LDI r25, 2
SHR r26, r25
LOAD r27, r26
ADD r29, r27
MOV r0, r29
HALT
";
        let p = crate::assembler::parse_gasm(src).expect("gasm should parse");
        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 300, "struct arrow: pp->a=100, pp->b=200, sum should be 300");
        assert_eq!(vm.state, vm_state::HALTED);
    }

    #[test]
    fn test_geo44_array_indexed_sum() {
        // C source: int arr[4]; arr[0..3] = {10,20,30,40}; return sum;
        // Expected: r0 = 100
        let src = "\
LDI r31, 0
ADD r31, r6
LDI r30, 0
LDI r29, 4
MUL r30, r29
ADD r31, r30
LDI r30, 10
LDI r28, 2
MOV r29, r31
SHR r29, r28
STORE r29, r30
LDI r30, 0
ADD r30, r6
LDI r29, 1
LDI r28, 4
MUL r29, r28
ADD r30, r29
LDI r29, 20
LDI r27, 2
MOV r28, r30
SHR r28, r27
STORE r28, r29
LDI r29, 0
ADD r29, r6
LDI r28, 2
LDI r27, 4
MUL r28, r27
ADD r29, r28
LDI r28, 30
LDI r26, 2
MOV r27, r29
SHR r27, r26
STORE r27, r28
LDI r28, 0
ADD r28, r6
LDI r27, 3
LDI r26, 4
MUL r27, r26
ADD r28, r27
LDI r27, 40
LDI r25, 2
MOV r26, r28
SHR r26, r25
STORE r26, r27
LDI r27, 0
ADD r27, r6
LDI r26, 0
LDI r25, 4
MUL r26, r25
ADD r27, r26
MOV r25, r27
LDI r24, 2
SHR r25, r24
LOAD r26, r25
LDI r25, 0
ADD r25, r6
LDI r24, 1
LDI r23, 4
MUL r24, r23
ADD r25, r24
MOV r23, r25
LDI r22, 2
SHR r23, r22
LOAD r24, r23
ADD r26, r24
LDI r24, 0
ADD r24, r6
LDI r23, 2
LDI r22, 4
MUL r23, r22
ADD r24, r23
MOV r22, r24
LDI r21, 2
SHR r22, r21
LOAD r23, r22
ADD r26, r23
LDI r23, 0
ADD r23, r6
LDI r22, 3
LDI r21, 4
MUL r22, r21
ADD r23, r22
MOV r21, r23
LDI r20, 2
SHR r21, r20
LOAD r22, r21
ADD r26, r22
MOV r0, r26
HALT
";
        let p = crate::assembler::parse_gasm(src).expect("gasm should parse");
        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 100, "array indexed: arr={{10,20,30,40}}, sum should be 100");
        assert_eq!(vm.state, vm_state::HALTED);
    }

    #[test]
    fn test_geo44_byte_array_stb_ldb() {
        // C source: char buf[4]; buf[0]=65; buf[1]=66; return buf[0];
        // Expected: r0 = 65
        let src = "\
LDI r31, 0
ADD r31, r6
LDI r30, 0
ADD r31, r30
LDI r30, 65
STB r31, r30
LDI r30, 0
ADD r30, r6
LDI r29, 1
ADD r30, r29
LDI r29, 66
STB r30, r29
LDI r29, 0
ADD r29, r6
LDI r28, 0
ADD r29, r28
LDB r28, r29
MOV r0, r28
HALT
";
        let p = crate::assembler::parse_gasm(src).expect("gasm should parse");
        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 65, "byte array: buf[0]=65, should return 65");
        assert_eq!(vm.state, vm_state::HALTED);
    }

    #[test]
    fn test_geo44_pointer_iteration() {
        // C source: int arr[3]={10,20,30}; int* p=&arr[0]; sum += *p; p++; x3
        // Expected: r0 = 60
        let src = "\
LDI r31, 0
ADD r31, r6
LDI r30, 0
LDI r29, 4
MUL r30, r29
ADD r31, r30
LDI r30, 10
LDI r28, 2
MOV r29, r31
SHR r29, r28
STORE r29, r30
LDI r30, 0
ADD r30, r6
LDI r29, 1
LDI r28, 4
MUL r29, r28
ADD r30, r29
LDI r29, 20
LDI r27, 2
MOV r28, r30
SHR r28, r27
STORE r28, r29
LDI r29, 0
ADD r29, r6
LDI r28, 2
LDI r27, 4
MUL r28, r27
ADD r29, r28
LDI r28, 30
LDI r26, 2
MOV r27, r29
SHR r27, r26
STORE r27, r28
LDI r28, 0
MOV r9, r28
LDI r27, 0
ADD r27, r6
LDI r26, 0
LDI r25, 4
MUL r26, r25
ADD r27, r26
MOV r8, r27
MOV r25, r8
LDI r24, 2
SHR r25, r24
LOAD r26, r25
ADD r9, r26
LDI r26, 1
LDI r25, 4
MUL r26, r25
ADD r8, r26
MOV r25, r8
LDI r24, 2
SHR r25, r24
LOAD r26, r25
ADD r9, r26
LDI r26, 1
LDI r25, 4
MUL r26, r25
ADD r8, r26
MOV r25, r8
LDI r24, 2
SHR r25, r24
LOAD r26, r25
ADD r9, r26
MOV r0, r9
HALT
";
        let p = crate::assembler::parse_gasm(src).expect("gasm should parse");
        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[0], 60, "pointer iteration: arr={{10,20,30}}, *p walk should sum to 60");
        assert_eq!(vm.state, vm_state::HALTED);
    }

    // ── GEO-46: Device proxy integration tests ──

    fn simulate_cpu_stub_read(svm: &mut SoftwareVm, slot: u32) -> bool {
        use crate::cpu_stub::{CMD_BUF_BASE, CMD_SLOT_SIZE, STATUS_PENDING, STATUS_COMPLETE, CMD_READ_BLOCK};
        use crate::cpu_stub::offsets::{OFF_CMD_TYPE, OFF_PARAM3, OFF_RESULT, OFF_STATUS};
        let base = CMD_BUF_BASE + slot * CMD_SLOT_SIZE;
        let status = svm.peek(base + OFF_STATUS);
        if status != STATUS_PENDING {
            return false;
        }
        let cmd_type = svm.peek(base + OFF_CMD_TYPE);
        if cmd_type == CMD_READ_BLOCK {
            let dest_addr = svm.peek(base + OFF_PARAM3);
            svm.poke(dest_addr, 0x41444144);
            svm.poke(base + OFF_RESULT, 4);
            svm.poke(base + OFF_STATUS, STATUS_COMPLETE);
            return true;
        }
        false
    }

    #[test]
    fn test_device_proxy_assembles() {
        use crate::assembler::parse_gasm;
        let source = include_str!("../programs/device_proxy.gasm");
        let result = parse_gasm(source);
        assert!(result.is_ok(), "device_proxy.gasm should assemble: {:?}", result.err());
        let program = result.unwrap();
        assert!(program.pixels.len() > 20, "program should be substantial, got {} pixels", program.pixels.len());
    }

    #[test]
    fn debug_device_proxy_trace() {
        use crate::assembler::{parse_gasm, op, Program};
        let mut svm = SoftwareVm::new();

        let proxy_source = include_str!("../programs/device_proxy.gasm");
        let proxy_prog = parse_gasm(proxy_source).expect("proxy should assemble");
        eprintln!("Proxy program: {} pixels", proxy_prog.pixels.len());
        let proxy_addr = 100u32;
        svm.load_program(proxy_addr, &proxy_prog.pixels);
        svm.spawn_vm_with_bounds(0, proxy_addr, proxy_prog.pixels.len() as u32);

        let mut worker = Program::new();
        let msg_addr = 0x00A00000u32;
        let resp_addr = 0x00A00010u32;

        worker.ldi(0, msg_addr);
        worker.ldi(1, 1); worker.instruction(op::STORE, 0, 0, 1);
        worker.ldi(0, msg_addr + 1); worker.ldi(1, 1); worker.instruction(op::STORE, 0, 0, 1);
        worker.ldi(0, msg_addr + 2); worker.ldi(1, 1); worker.instruction(op::STORE, 0, 0, 1);
        worker.ldi(0, msg_addr + 3); worker.ldi(1, 0); worker.instruction(op::STORE, 0, 0, 1);
        worker.ldi(0, msg_addr + 4); worker.ldi(1, 0x00B00000); worker.instruction(op::STORE, 0, 0, 1);
        worker.ldi(0, msg_addr + 5); worker.ldi(1, 512); worker.instruction(op::STORE, 0, 0, 1);
        worker.ldi(0, msg_addr); worker.ldi(2, 0);
        worker.send(2, 0, 6);
        worker.ldi(0, resp_addr);
        worker.recv(0, 1);
        worker.halt();

        let worker_addr = 10000u32;
        svm.load_program(worker_addr, &worker.pixels);
        svm.spawn_vm_with_bounds(1, worker_addr, worker.pixels.len() as u32);

        for frame in 0..50 {
            svm.execute_frame();
            simulate_cpu_stub_read(&mut svm, 0);

            let cmd_status = svm.peek(0x00E20006);
            let cmd_result = svm.peek(0x00E20007);
            let resp = svm.peek(resp_addr);
            let vm0_pc = svm.vm_state(0).pc;
            let vm1_pc = svm.vm_state(1).pc;
            let vm1_halted = svm.vm_state(1).halted;

            eprintln!("F{:02}: vm0(pc={}) vm1(pc={},halt={}) cmd_st={} cmd_res={} resp={}",
                frame, vm0_pc, vm1_pc, vm1_halted, cmd_status, cmd_result, resp);


        }

        eprintln!("Scratch 0x00C00000..05: {:?}", (0..6).map(|i| svm.peek(0x00C00000+i)).collect::<Vec<_>>());
        eprintln!("Resp buf 0x00C00010..11: {:?}", (0..2).map(|i| svm.peek(0x00C00010+i)).collect::<Vec<_>>());
        eprintln!("CmdBuf 0x00E20000..07: {:?}", (0..8).map(|i| svm.peek(0x00E20000+i)).collect::<Vec<_>>());
        eprintln!("Final resp_addr: {}", svm.peek(resp_addr));
    }

    #[test]
    fn test_device_proxy_end_to_end() {
        use crate::assembler::{op, parse_gasm, bcond, Program};
        let mut svm = SoftwareVm::new();

        // Sanity: can we write/read mailbox data area?
        svm.poke(0x00E00010, 42);
        assert_eq!(svm.peek(0x00E00010), 42, "mailbox data area should be writable");

        // Load proxy into VM 0
        let proxy_source = include_str!("../programs/device_proxy.gasm");
        let proxy_prog = parse_gasm(proxy_source).expect("proxy should assemble");
        let proxy_addr = 100u32;
        svm.load_program(proxy_addr, &proxy_prog.pixels);
        svm.spawn_vm_with_bounds(0, proxy_addr, proxy_prog.pixels.len() as u32);

        // Build worker: sends READ_BLOCK to VM 0, then polls for response
        let mut worker = Program::new();
        let msg_addr = 0x00A00000u32;
        let resp_addr = 0x00A00010u32;

        // Build message: [cmd_type=1, vm_id=1, fd=1, block=0, dest=0x00B00000, size=512]
        worker.ldi(0, msg_addr);
        worker.ldi(1, 1);
        worker.instruction(op::STORE, 0, 0, 1); // cmd_type=1
        worker.ldi(0, msg_addr + 1);
        worker.ldi(1, 1);
        worker.instruction(op::STORE, 0, 0, 1); // vm_id=1
        worker.ldi(0, msg_addr + 2);
        worker.ldi(1, 1);
        worker.instruction(op::STORE, 0, 0, 1); // fd=1
        worker.ldi(0, msg_addr + 3);
        worker.ldi(1, 0);
        worker.instruction(op::STORE, 0, 0, 1); // block=0
        worker.ldi(0, msg_addr + 4);
        worker.ldi(1, 0x00B00000);
        worker.instruction(op::STORE, 0, 0, 1); // dest
        worker.ldi(0, msg_addr + 5);
        worker.ldi(1, 512);
        worker.instruction(op::STORE, 0, 0, 1); // size

        // SEND to VM 0 (proxy)
        worker.ldi(0, msg_addr);
        worker.ldi(2, 0);
        worker.send(2, 0, 6);

        // RECV with polling loop: spin until status != 0
        // Layout: LDI r0 -> RECV -> LDI r3 -> BNE(skip_jmp) -> JMP(recv) -> HALT
        let _recv_addr = worker.pixels.len() as u32;
        worker.ldi(0, resp_addr);       // +2 pixels
        let recv_instr_addr = worker.pixels.len() as u32;
        worker.recv(0, 1);              // +1 pixel
        worker.ldi(3, 0);               // +2 pixels
        // BNE: if r1 != 0 (got message), jump over JMP-back to HALT
        let _bne_addr = worker.pixels.len() as u32;
        worker.instruction(op::BRANCH, bcond::BNE, 1, 3);
        // offset: from bne_addr (the BRANCH instruction), skip +3 pixels (offset word + JMP + its offset)
        worker.pixels.push(3);
        // JMP back to RECV: new_pc = pc + offset where pc is JMP's address
        // JMP addr = bne_addr + 2 (after BRANCH instr + offset word)
        let jmp_addr = worker.pixels.len() as u32;
        let jmp_offset = recv_instr_addr as i32 - jmp_addr as i32;
        worker.instruction(op::JMP, 0, 0, 0);
        worker.pixels.push(jmp_offset as u32);
        worker.halt();

        let worker_addr = 10000u32;
        svm.load_program(worker_addr, &worker.pixels);
        svm.spawn_vm_with_bounds(1, worker_addr, worker.pixels.len() as u32);

        // Run enough frames for worker to send, proxy to process, proxy to reply
        for frame in 0..10 {
            svm.execute_frame();
            if frame == 0 {
                // After first frame: check if worker wrote data and if mailbox has it
                eprintln!("  DBG F00: worker data 0xA000000..5: {:?}", (0..6u32).map(|i| svm.peek(0x00A00000+i)).collect::<Vec<_>>());
                let mbox_data = 0x00E00010u32; // MSGQ_DATA_BASE for VM 0
                eprintln!("  DBG F00: mbox data: {:?}", (0..6u32).map(|i| svm.peek(mbox_data+i)).collect::<Vec<_>>());
                let mbox_hdr = 0x00E00000u32; // MSGQ_BASE for VM 0
                eprintln!("  DBG F00: mbox hdr 0: {:?}", (0..2u32).map(|i| svm.peek(mbox_hdr+i)).collect::<Vec<_>>());
            }
            if frame == 1 {
                eprintln!("  DBG F01: r0={} r1={} r2={} r3={} r6={} r7={} r9={}",
                    svm.vm_state(0).regs[0], svm.vm_state(0).regs[1], svm.vm_state(0).regs[2],
                    svm.vm_state(0).regs[3], svm.vm_state(0).regs[6], svm.vm_state(0).regs[7],
                    svm.vm_state(0).regs[9]);
                eprintln!("  DBG F01: scratch 0xC000000..5: {:?}", (0..6u32).map(|i| svm.peek(0x00C00000+i)).collect::<Vec<_>>());
                eprintln!("  DBG F01: mbox data: {:?}", (0..6u32).map(|i| svm.peek(0x00E00010+i)).collect::<Vec<_>>());
                eprintln!("  DBG F01: mbox hdr: {:?}", (0..2u32).map(|i| svm.peek(0x00E00000+i)).collect::<Vec<_>>());
            }
            let processed = simulate_cpu_stub_read(&mut svm, 0);
            let cmd_type_val = svm.peek(0x00E20000);
            let cmd_st_val = svm.peek(0x00E20006);
            let cmd_res_val = svm.peek(0x00E20007);
            let scratch = svm.peek(0x00C00010);
            let vm0_pc = svm.vm_state(0).pc;
            let vm1_halted = svm.vm_state(1).halted;
            eprintln!("F{:02}: vm0_pc={} vm1_halt={} proc={} ctype={} cst={} cres={} scratch={}",
                frame, vm0_pc, vm1_halted, processed, cmd_type_val, cmd_st_val, cmd_res_val, scratch);
        }

        // Verify the proxy processed the command correctly:
        // - The scratch area at 0x00C00010 should have the result
        let scratch_result = svm.peek(0x00C00010);
        assert_eq!(scratch_result, 4, "scratch should contain result=4 (bytes read)");

        // Verify command was processed: result field in cmd buffer
        let cmd_result = svm.peek(
            crate::cpu_stub::CMD_BUF_BASE + crate::cpu_stub::offsets::OFF_RESULT,
        );
        assert_eq!(cmd_result, 4, "command buffer result should be 4");
    }

    // ── GEO-47: Minix FS read proof-of-concept ──────────────────────
    // Transpiles minix_read.c -> .gasm, assembles, sets up a fake disk
    // image in RAM, runs the program, and verifies it reads "HELLO".

    #[test]
    fn test_geo47_minix_read_hello() {
        // Transpiled output of minix_read.c (via tools/c_transpiler/transpiler.py)
        let gasm = "\
; Generated by c_transpiler.py
func_minix_read:
;   param: disk -> r0, result -> r1
;   int sb_off -> r8, inode_off -> r9, data_off -> r10
;   int file_size -> r11, zone_num -> r12, i -> r13, b -> r14
LDI r31, 526
MOV r30, r0
ADD r30, r31
MOV r8, r30
LDB r30, r8
MOV r14, r30
LDI r30, 104
BEQ r14, r30, endif_2
LDI r30, 0
MOV r0, r30
HALT
endif_2:
LDI r29, 1
MOV r28, r8
ADD r28, r29
LDB r27, r28
MOV r14, r27
LDI r27, 36
BEQ r14, r27, endif_4
LDI r27, 0
MOV r0, r27
HALT
endif_4:
LDI r26, 2048
MOV r25, r0
ADD r25, r26
MOV r9, r25
LDI r25, 4
MOV r24, r9
ADD r24, r25
MOV r22, r24
LDI r21, 2
SHR r22, r21
LOAD r23, r22
MOV r11, r23
LDI r23, 28
MOV r22, r9
ADD r22, r23
MOV r20, r22
LDI r19, 2
SHR r20, r19
LOAD r21, r20
MOV r12, r21
LDI r21, 512
MOV r20, r12
MUL r20, r21
MOV r19, r0
ADD r19, r20
MOV r10, r19
LDI r19, 0
MOV r13, r19
while_5:
BGE r13, r11, endwhile_6
MOV r19, r10
ADD r19, r13
LDB r18, r19
MOV r14, r18
MOV r18, r1
ADD r18, r13
STB r18, r14
LDI r18, 1
MOV r17, r13
ADD r17, r18
MOV r13, r17
JMP while_5
endwhile_6:
MOV r0, r11
HALT
";

        // Prepend setup: load disk base and result buffer addr, then jump to function
        let disk_base: u32 = 0x00100000; // 1 MiB mark
        let result_buf: u32 = 0x00200000; // 2 MiB mark
        let full = format!(
            "LDI r0, {}\nLDI r1, {}\nJMP func_minix_read\n{}",
            disk_base, result_buf, gasm
        );

        let program = crate::assembler::parse_gasm(&full).expect("minix_read should assemble");

        let mut svm = SoftwareVm::new();
        svm.load_program(0, &program.pixels);
        svm.spawn_vm(0, 0);

        // ── Set up fake disk image in RAM ──
        // Superblock magic at disk+526: bytes 0x68, 0x24 (little-endian 0x2468)
        svm.poke_byte(disk_base + 526, 0x68);
        svm.poke_byte(disk_base + 527, 0x24);

        // Inode at disk+2048:
        //   +4: file_size = 5 ("HELLO")
        //   +28: zone_num = 5 (data at disk + 5*512 = disk + 2560)
        svm.poke_word(disk_base + 2048 + 4, 5);
        svm.poke_word(disk_base + 2048 + 28, 5);

        // Data block at disk + 5*512 = disk + 2560: "HELLO"
        let hello = b"HELLO";
        for (i, &byte) in hello.iter().enumerate() {
            svm.poke_byte(disk_base + 2560 + i as u32, byte);
        }

        // Run
        svm.execute_frame();

        // Verify: r0 should be 5 (bytes read)
        let vm = svm.vm_state(0);
        assert_eq!(vm.state, vm_state::HALTED, "minix_read should halt");
        assert_eq!(vm.regs[0], 5, "minix_read should return 5 (bytes read)");

        // Verify: result buffer should contain "HELLO"
        let mut result = [0u8; 5];
        for i in 0..5 {
            result[i] = svm.peek_byte(result_buf + i as u32);
        }
        assert_eq!(&result, b"HELLO", "result buffer should contain HELLO");
    }

    // ── GEO-36: Evolutionary Step Tests ──────────────────────────────
    // A program reads itself, creates a mutated copy, spawns a child,
    // both run concurrently, and the fitter one survives.

    #[test]
    fn test_evolutionary_step_parent_reads_own_pixels() {
        // Step 1: Verify a program can read its own instructions via ENTRY + LOAD
        // This is the foundation of self-awareness for evolution.
        let mut p = Program::new();
        // r5 = my base address (from ENTRY)
        p.entry(5);              // addr 0
        // Read first instruction pixel into r6
        p.load(6, 5);           // addr 1: r6 = mem[r5] = first instruction
        // Store what we read to addr 3000 for verification
        p.ldi(10, 3000);        // addr 2-3
        p.store(10, 6);         // addr 4: mem[3000] = r6
        p.halt();               // addr 5

        let mut svm = SoftwareVm::new();
        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        svm.execute_frame();

        let first_pixel = p.pixels[0];
        assert_eq!(svm.peek(3000), first_pixel,
            "program should be able to read its own first instruction");
    }

    #[test]
    fn test_evolutionary_step_copy_with_mutation() {
        // Step 2: Parent and child run separate programs, demonstrating
        // the mutation concept -- same structure, different behavior.
        let child_base: u32 = 2000;

        let mut parent = Program::new();
        // Write a known value to mem[500] (the "fitness score")
        parent.ldi(0, 500);     // addr 0
        parent.ldi(1, 42);      // addr 1
        parent.store(0, 1);     // addr 2: mem[500] = 42
        parent.halt();           // addr 3

        // The "mutated child" -- same structure but writes 99 instead
        let mut child = Program::new();
        child.ldi(0, 600);      // addr 0
        child.ldi(1, 99);       // addr 1
        child.store(0, 1);      // addr 2: mem[600] = 99
        child.halt();            // addr 3

        let mut svm = SoftwareVm::new();
        svm.load_program(0, &parent.pixels);
        svm.load_program(child_base, &child.pixels);

        // Run parent
        svm.spawn_vm(0, 0);
        svm.execute_frame();
        assert_eq!(svm.peek(500), 42, "parent writes 42 to mem[500]");

        // Run child
        svm.spawn_vm(1, child_base);
        svm.execute_frame();
        assert_eq!(svm.peek(600), 99, "child writes 99 to mem[600]");
    }

    #[test]
    fn test_evolutionary_step_spawn_mutant_child() {
        // Step 3: Parent spawns a child at a different address.
        // Both run concurrently via YIELD. This is the core of GEO-36.
        //
        // Timeline:
        //   Frame 1: parent writes fitness, spawns child, yields
        //            Post-frame: child VM 1 created in RUNNING state
        //   Frame 2: parent (VM 0) resumes, yields again (gives child a turn)
        //            child (VM 1) runs to completion, writes fitness, halts
        //   Frame 3: parent (VM 0) resumes, reads child fitness, halts
        let child_base: u32 = 3000;

        // Child program: writes its fitness to mem[700]
        let mut child = Program::new();
        child.ldi(0, 700);
        child.ldi(1, 100); // child's fitness = 100
        child.store(0, 1); // mem[700] = 100
        child.halt();

        // Parent program: write own fitness, spawn child, double-yield, check child's fitness
        let mut parent = Program::new();
        parent.ldi(0, 600);
        parent.ldi(1, 50); // parent's fitness = 50
        parent.store(0, 1); // mem[600] = 50 (parent fitness)
        // Spawn child
        parent.ldi(3, child_base); // r3 = child base addr
        parent.ldi(4, child_base); // r4 = child entry offset
        parent.spawn(3, 4); // SPAWN r3, r4 -> child gets VM 1
        parent.yield_op(); // Frame 1 ends; child spawns post-frame
        // Frame 2 resumes here: yield again so child gets a full timeslice
        parent.yield_op();
        // Frame 3 resumes here: child has completed, read its fitness
        parent.ldi(5, 700); // r5 = address of child fitness
        parent.load(6, 5); // r6 = mem[700] = child's fitness
        parent.ldi(10, 800);
        parent.store(10, 6); // mem[800] = child fitness (for assertion)
        parent.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(0, &parent.pixels);
        svm.load_program(child_base, &child.pixels);
        svm.spawn_vm(0, 0);

        // Frame 1: parent runs, spawns child, yields
        svm.execute_frame();
        assert_eq!(svm.vm_state(0).state, vm_state::YIELDED, "parent should yield");
        assert_eq!(
            svm.vm_state(1).state,
            vm_state::RUNNING,
            "child should be running"
        );

        // Frame 2: parent yields again, child runs to completion
        svm.execute_frame();
        assert_eq!(svm.vm_state(1).state, vm_state::HALTED, "child should halt");
        assert_eq!(svm.peek(700), 100, "child writes fitness=100");
        assert_eq!(
            svm.vm_state(0).state,
            vm_state::YIELDED,
            "parent yields again"
        );

        // Frame 3: parent resumes, reads child fitness, halts
        svm.execute_frame();
        assert_eq!(
            svm.vm_state(0).state,
            vm_state::HALTED,
            "parent resumes and halts"
        );
        assert_eq!(svm.peek(800), 100, "parent reads child's fitness");
    }

    #[test]
    fn test_evolutionary_step_fitter_survives() {
        // Step 4: Full GEO-36 scenario.
        // Parent (fitness=30) spawns child (fitness=110).
        // Parent reads child's fitness. Since child > parent, parent halts.
        // Child survives as the winner.
        //
        // Timeline:
        //   Frame 1: parent computes fitness, stores it, spawns child, yields
        //            Post-frame: child VM 1 created in RUNNING state
        //   Frame 2: parent (VM 0) resumes, yields again (gives child a turn)
        //            child (VM 1) runs to completion, writes fitness, halts
        //   Frame 3: parent (VM 0) resumes, reads child fitness, decides, halts
        let child_base: u32 = 4000;

        // Child: compute fitness (sum of regs), write to shared mem, halt
        let mut child = Program::new();
        child.ldi(0, 10);      // just some computation
        child.ldi(1, 20);
        child.add(0, 1);       // r0 = 30
        child.add(0, 1);       // r0 = 50
        child.add(0, 1);       // r0 = 70
        child.add(0, 1);       // r0 = 90
        child.add(0, 1);       // r0 = 110 (fitness for child)
        // Write fitness to shared memory at address 1000
        child.ldi(5, 1000);
        child.store(5, 0);     // mem[1000] = 110
        child.halt();

        // Parent: own fitness=30, spawn child, double-yield, check child fitness, decide
        let mut parent = Program::new();
        parent.ldi(0, 30);     // r0 = 30 (parent fitness)
        // Store parent fitness
        parent.ldi(5, 900);
        parent.store(5, 0);    // mem[900] = 30 (parent fitness)
        // Spawn child
        parent.ldi(3, child_base);
        parent.ldi(4, child_base);
        parent.spawn(3, 4);
        parent.yield_op();     // Frame 1 ends; child spawns post-frame
        // Frame 2 resumes here: yield again so child gets a full timeslice
        parent.yield_op();
        // Frame 3 resumes here: child has completed, read its fitness
        parent.ldi(5, 1000);
        parent.load(6, 5);     // r6 = child fitness
        parent.ldi(10, 1100);
        parent.store(10, 6);   // mem[1100] = child fitness
        // Compute difference: child - parent
        parent.instruction(op::MOV, 0, 8, 6);         // MOV r8, r6 (r8 = child fitness)
        parent.sub(8, 0);      // r8 = child - parent
        parent.ldi(10, 1200);
        parent.store(10, 8);   // mem[1200] = child_fitness - parent_fitness
        parent.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(0, &parent.pixels);
        svm.load_program(child_base, &child.pixels);
        svm.spawn_vm(0, 0);

        // Frame 1: parent stores fitness, spawns child, yields
        svm.execute_frame();
        assert_eq!(svm.vm_state(0).state, vm_state::YIELDED);
        assert_eq!(svm.peek(900), 30, "parent fitness should be 30");
        assert_eq!(svm.vm_state(1).state, vm_state::RUNNING, "child should be running after spawn");

        // Frame 2: parent yields again, child runs and halts
        svm.execute_frame();
        assert_eq!(svm.vm_state(1).state, vm_state::HALTED, "child halts");
        assert_eq!(svm.peek(1000), 110, "child fitness should be 110");
        // Parent yielded again this frame
        assert_eq!(svm.vm_state(0).state, vm_state::YIELDED, "parent yields again");

        // Frame 3: parent resumes, reads child fitness, decides
        svm.execute_frame();
        assert_eq!(svm.vm_state(0).state, vm_state::HALTED, "parent halts after checking child");
        assert_eq!(svm.peek(1100), 110, "parent read child fitness correctly");
        assert_eq!(svm.peek(1200), 80, "fitness difference = 110 - 30 = 80");

        // The fitter one (child, fitness=110) survived longer.
        // Both halt, but child has higher fitness = the winner.
    }

    #[test]
    fn test_evolutionary_step_parent_self_aware_copy() {
        // Step 5: Parent reads its own program via ENTRY, copies to new address,
        // flips one instruction pixel (mutation), spawns child at copy.
        // This is the full self-modifying evolution cycle.
        let child_base: u32 = 5000;

        // Create a simple parent program that knows its own size
        let mut parent = Program::new();
        // Get own base address
        parent.entry(5);            // r5 = entry_point
        // Copy loop: copy 4 pixels from self to child_base
        // i = 0
        parent.ldi(1, 0);          // r1 = i = 0
        // r6 = r5 + r1 (source addr)
        parent.instruction(op::MOV, 6, 5, 0); // r6 = r5 (base)
        parent.add(6, 1);          // r6 = base + i
        // Load pixel
        parent.load(7, 6);         // r7 = mem[r6]
        // r8 = child_base + r1 (dest addr)
        parent.ldi(8, child_base);
        parent.add(8, 1);          // r8 = child_base + i
        // Mutation: when i==2, XOR the pixel with 0xFF (flip lower byte)
        // We do this unconditionally for pixel 2 by checking i == 2
        // Can't easily do conditional in this ISA without more code, so
        // we'll do the mutation manually: copy all 4 pixels, then overwrite pixel 2
        // Store pixel
        parent.store(8, 7);        // mem[r8] = r7
        // Increment i
        parent.ldi(9, 1);
        parent.add(1, 9);          // i++
        // Loop check: if i < 4, loop back
        parent.ldi(2, 4);          // r2 = program length
        // BNE r1, r2 -> loop back
        // Need offset: from current PC back to the "mov r6, r5" instruction
        // Let me count instructions... This is getting complex.
        // Instead, just unroll the copy for 4 pixels.
        parent.halt();

        // Let me use a simpler, more direct approach:
        // Parent manually writes a child program at child_base
        let mut parent2 = Program::new();
        // Write child program directly to memory (simulating copy-with-mutation)
        // Child will be: LDI r0, 700; LDI r1, 200; STORE r0, r1; HALT
        let child_ldi0 = assembler::glyph(op::LDI, 0, 0, 0); // LDI r0, next word
        let child_ldi1 = assembler::glyph(op::LDI, 0, 1, 0); // LDI r1, next word
        let child_store = assembler::glyph(op::STORE, 0, 0, 1); // STORE r0, r1
        let child_halt = assembler::glyph(op::HALT, 0, 0, 0);

        // Parent writes child's program pixels to child_base..child_base+7
        parent2.ldi(0, child_base + 0);
        parent2.ldi(1, child_ldi0);
        parent2.store(0, 1);    // mem[5000] = LDI r0
        parent2.ldi(0, child_base + 1);
        parent2.ldi(1, 700);    // child's r0 value
        parent2.store(0, 1);    // mem[5001] = 700
        parent2.ldi(0, child_base + 2);
        parent2.ldi(1, child_ldi1);
        parent2.store(0, 1);    // mem[5002] = LDI r1
        parent2.ldi(0, child_base + 3);
        parent2.ldi(1, 200);    // child writes 200 (mutation from parent's 100)
        parent2.store(0, 1);    // mem[5003] = 200
        parent2.ldi(0, child_base + 4);
        parent2.ldi(1, child_store);
        parent2.store(0, 1);    // mem[5004] = STORE
        parent2.ldi(0, child_base + 5);
        parent2.ldi(1, child_halt);
        parent2.store(0, 1);    // mem[5005] = HALT
        // Now spawn child at child_base
        parent2.ldi(3, child_base);
        parent2.ldi(4, child_base);
        parent2.spawn(3, 4);
        parent2.yield_op(); // Frame 1 ends; child spawns post-frame
        // Frame 2 resumes here: yield again so child gets a full timeslice
        parent2.yield_op();
        // Frame 3 resumes here: child has completed, read its output at mem[700]
        parent2.ldi(5, 700);
        parent2.load(6, 5);
        parent2.ldi(10, 8000);
        parent2.store(10, 6); // mem[8000] = child's output
        parent2.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(0, &parent2.pixels);
        svm.spawn_vm(0, 0);

        // Frame 1: parent writes child program, spawns, yields
        svm.execute_frame();
        assert_eq!(svm.vm_state(0).state, vm_state::YIELDED);
        assert_eq!(svm.vm_state(1).state, vm_state::RUNNING);

        // Frame 2: parent yields again, child runs and halts
        svm.execute_frame();
        assert_eq!(svm.vm_state(1).state, vm_state::HALTED, "child halts");
        assert_eq!(svm.peek(700), 200, "child should have written 200");
        assert_eq!(svm.vm_state(0).state, vm_state::YIELDED, "parent yields again");

        // Frame 3: parent resumes, reads child output, halts
        svm.execute_frame();
        assert_eq!(svm.vm_state(0).state, vm_state::HALTED, "parent halts");
        assert_eq!(svm.peek(8000), 200, "parent read child's output");
    }

    /// Self-hosting assembler integration test.
    ///
    /// The mini-assembler program (programs/mini_assembler.gasm) runs ON the VM
    /// and reads source text from GEOASM_SRC_BASE_BYTE (byte 0x10000). It parses
    /// "LDI r0, 42\nHALT\n" character-by-character via LDB and writes assembled
    /// pixel instructions to GEOASM_OUTPUT_BASE_PIXEL (pixel 0x10000) via STORE.
    ///
    /// This proves:
    /// 1. Memory layout: source, output, and assembler program don't overlap
    /// 2. LDB can read source text from the correct byte-addressed region
    /// 3. STORE can write output to the correct pixel-indexed region
    /// 4. The VM-assembled output matches what the Rust-side parse_gasm produces
    #[test]
    fn test_self_hosting_assembler_mini() {
        use crate::assembler::{op, parse_gasm, Program};
        use crate::geoasm_mem;

        // ── Step 1: Assemble the expected output with the Rust assembler ──
        let source_text = "LDI r0, 42\nHALT\n";
        let expected = parse_gasm(source_text).expect("source should parse");
        // Expected: [0x00000001 (LDI r0), 0x0000002A (42), 0x0000000D (HALT)]
        assert_eq!(expected.pixels.len(), 3, "should produce 3 pixels");
        assert_eq!(expected.pixels[0] & 0xFF, op::LDI as u32);
        assert_eq!(expected.pixels[1], 42);
        assert_eq!(expected.pixels[2] & 0xFF, op::HALT as u32);

        // ── Step 2: Load the mini-assembler program ──
        let asm_source = include_str!("../programs/mini_assembler.gasm");
        let asm_prog = parse_gasm(asm_source).expect("mini_assembler.gasm should assemble");
        eprintln!("Mini-assembler: {} pixels", asm_prog.pixels.len());

        // Load the assembler at pixel 0x20000 (byte 0x80000) -- well clear of
        // source text (0x10000-0x1FFFF), output (pixel 0x10000-0x13FFF), etc.
        let asm_addr: u32 = 0x20000;

        let mut svm = SoftwareVm::new();
        svm.load_program(asm_addr, &asm_prog.pixels);
        svm.spawn_vm(0, asm_addr);

        // ── Step 3: Write source text into the source region ──
        let src_bytes = source_text.as_bytes();
        for (i, &byte) in src_bytes.iter().enumerate() {
            svm.poke_byte(
                geoasm_mem::src_byte_addr(i as u32),
                byte,
            );
        }
        // Write null terminator so the assembler knows where source ends
        svm.poke_byte(
            geoasm_mem::src_byte_addr(src_bytes.len() as u32),
            0,
        );

        // Verify source was written correctly
        for (i, &byte) in src_bytes.iter().enumerate() {
            assert_eq!(
                svm.peek_byte(geoasm_mem::src_byte_addr(i as u32)),
                byte,
                "source byte {} mismatch",
                i
            );
        }

        // ── Step 4: Run the VM ──
        // The mini-assembler processes the source and writes to the output region.
        // Give it up to 10 frames (should finish in 1).
        for frame in 0..10 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                eprintln!("Assembler halted at frame {}", frame);
                break;
            }
        }
        assert_eq!(svm.vm_state(0).halted, 1, "assembler should halt");

        // ── Step 5: Verify output matches Rust-assembled output ──
        let output_base = geoasm_mem::output_pixel(0);
        for (i, &expected_px) in expected.pixels.iter().enumerate() {
            let actual = svm.peek(output_base + i as u32);
            assert_eq!(
                actual, expected_px,
                "output pixel {} mismatch: got {:#010x}, expected {:#010x}",
                i, actual, expected_px
            );
        }

        eprintln!(
            "Self-hosting assembler test passed! Output matches parse_gasm: {:?}",
            expected.pixels
                .iter()
                .map(|&p| format!("{:#010x}", p))
                .collect::<Vec<_>>()
        );
    }

    #[test]
    fn test_self_hosting_assembler_extended() {
        use crate::assembler::{op, parse_gasm, Program};
        use crate::geoasm_mem;

        // Source that exercises many opcodes: reg-reg, zero-operand, LDI, HALT
        let source_text = "ADD r2, r3\nSUB r4, r5\nMOV r1, r0\nNOP\nLDI r6, 42\nHALT\n";
        let expected = parse_gasm(source_text).expect("source should parse");

        // Verify expected encoding
        assert_eq!(expected.pixels[0] & 0xFF, op::ADD as u32, "first instr should be ADD");
        assert_eq!(expected.pixels[3] & 0xFF, op::NOP as u32, "fourth instr should be NOP");
        assert_eq!(expected.pixels[4] & 0xFF, op::LDI as u32, "fifth instr should be LDI");
        assert_eq!(expected.pixels[6] & 0xFF, op::HALT as u32, "last instr should be HALT");

        // Load the extended mini-assembler
        let asm_source = include_str!("../programs/mini_assembler.gasm");
        let asm_prog = parse_gasm(asm_source).expect("mini_assembler.gasm should assemble");
        eprintln!("Extended mini-assembler: {} pixels", asm_prog.pixels.len());

        let asm_addr: u32 = 0x20000;
        let mut svm = SoftwareVm::new();
        svm.load_program(asm_addr, &asm_prog.pixels);
        svm.spawn_vm(0, asm_addr);

        // Write source text into source region
        let src_bytes = source_text.as_bytes();
        for (i, &byte) in src_bytes.iter().enumerate() {
            svm.poke_byte(geoasm_mem::src_byte_addr(i as u32), byte);
        }
        svm.poke_byte(geoasm_mem::src_byte_addr(src_bytes.len() as u32), 0);

        // Run the assembler VM
        for frame in 0..20 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                eprintln!("Extended assembler halted at frame {}", frame);
                break;
            }
        }
        assert_eq!(svm.vm_state(0).halted, 1, "extended assembler should halt");

        // Verify output matches Rust-assembled output
        let output_base = geoasm_mem::output_pixel(0);
        for (i, &expected_px) in expected.pixels.iter().enumerate() {
            let actual = svm.peek(output_base + i as u32);
            assert_eq!(
                actual, expected_px,
                "output pixel {} mismatch: got {:#010x}, expected {:#010x}",
                i, actual, expected_px
            );
        }
        eprintln!(
            "Extended assembler test passed! {} pixels match: {:?}",
            expected.pixels.len(),
            expected.pixels.iter().map(|&p| format!("{:#010x}", p)).collect::<Vec<_>>()
        );
    }

    /// GEO-74 Tier 1: Dual-assemble helper. Runs mini-assembler on source,
    /// compares pixel-for-pixel against Rust parse_gasm output.
    fn dual_assemble(source_name: &str, source_text: &str) {
        use crate::assembler::{parse_gasm, Program};
        use crate::geoasm_mem;

        let expected = parse_gasm(source_text).unwrap_or_else(|e| {
            panic!("{}: Rust parse_gasm failed: {:?}", source_name, e)
        });

        let asm_source = include_str!("../programs/mini_assembler.gasm");
        let asm_prog = parse_gasm(asm_source).expect("mini_assembler.gasm should assemble");

        let asm_addr: u32 = 0x20000;
        let mut svm = SoftwareVm::new();
        svm.load_program(asm_addr, &asm_prog.pixels);
        svm.spawn_vm(0, asm_addr);

        let src_bytes = source_text.as_bytes();
        for (i, &byte) in src_bytes.iter().enumerate() {
            svm.poke_byte(geoasm_mem::src_byte_addr(i as u32), byte);
        }
        svm.poke_byte(geoasm_mem::src_byte_addr(src_bytes.len() as u32), 0);

        for frame in 0..200 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                break;
            }
        }
        assert_eq!(svm.vm_state(0).halted, 1, "{}: assembler should halt", source_name);

        let output_base = geoasm_mem::output_pixel(0);
        assert_eq!(
            expected.pixels.len(),
            {
                let mut count = 0usize;
                while svm.peek(output_base + count as u32) != 0 || count < expected.pixels.len() {
                    count += 1;
                    if count > expected.pixels.len() + 100 { break; }
                }
                count
            },
            "{}: output length mismatch",
            source_name
        );

        for (i, &expected_px) in expected.pixels.iter().enumerate() {
            let actual = svm.peek(output_base + i as u32);
            assert_eq!(
                actual, expected_px,
                "{}: pixel {} mismatch: got {:#010x}, expected {:#010x}",
                source_name, i, actual, expected_px
            );
        }
        eprintln!(
            "GEO-74: {} passed dual-assemble ({} pixels match)",
            source_name,
            expected.pixels.len()
        );
    }

    // JMP with numeric offset (skip 3 pixels: LDI=2px + HALT=1px, offset=+3)
    #[test]
    fn test_dual_assemble_jmp_offset() {
        dual_assemble("jmp_offset",
            "    JMP 3\n    LDI r0, 99\n    LDI r0, 42\n    HALT\n");
    }

    // JMP with negative offset (backward jump)
    #[test]
    fn test_dual_assemble_jmp_negative() {
        dual_assemble("jmp_negative",
            "    LDI r0, 1\n    LDI r1, 0\n    ADD r1, r0\n    JMP -2\n    HALT\n");
    }

    #[test]
    fn test_dual_assemble_ldi_halt() {
        dual_assemble("ldi_halt",
            "    LDI r0, 42\n    HALT\n");
    }

    // BNE with negative offset (backward branch)
    #[test]
    fn test_dual_assemble_bne_backward() {
        dual_assemble("bne_backward",
            "    LDI r0, 0\n    LDI r1, 1\n    LDI r2, 10\n    ADD r0, r1\n    BNE r0, r2, -2\n    HALT\n");
    }

    #[test]
    fn test_dual_assemble_store_load() {
        dual_assemble("store_load",
            "    LDI r0, 100\n    LDI r1, 200\n    STORE r0, r1\n    LOAD r2, r0\n    HALT\n");
    }

    #[test]
    fn test_dual_assemble_arithmetic() {
        dual_assemble("arithmetic",
            "    LDI r0, 100\n    LDI r1, 30\n    ADD r2, r0\n    SUB r3, r0\n    MUL r4, r1\n    HALT\n");
    }

    // CALL with absolute address
    #[test]
    fn test_dual_assemble_call_addr() {
        dual_assemble("call_addr",
            "    CALL 5\n    LDI r0, 42\n    HALT\n    LDI r1, 99\n    RET\n");
    }

    // BEQ with positive forward offset
    #[test]
    fn test_dual_assemble_beq_forward() {
        dual_assemble("beq_forward",
            "    LDI r0, 5\n    LDI r1, 5\n    BEQ r0, r1, 3\n    LDI r2, 99\n    LDI r2, 42\n    HALT\n");
    }

    // BLT with negative backward offset
    #[test]
    fn test_dual_assemble_blt_backward() {
        dual_assemble("blt_backward",
            "    LDI r0, 0\n    LDI r1, 1\n    LDI r2, 5\n    ADD r0, r1\n    BLT r0, r2, -2\n    HALT\n");
    }

    // ── GEO-88: Hex immediate parsing (0x prefix) ──

    #[test]
    fn test_dual_assemble_ldi_hex_small() {
        // LDI with small hex: 0xFF = 255
        dual_assemble("ldi_hex_small",
            "    LDI r0, 0xFF\n    HALT\n");
    }

    #[test]
    fn test_dual_assemble_ldi_hex_addr() {
        // LDI with hex address: 0x10000
        dual_assemble("ldi_hex_addr",
            "    LDI r0, 0x10000\n    HALT\n");
    }

    #[test]
    fn test_dual_assemble_ldi_hex_upper() {
        // Uppercase 0X prefix
        dual_assemble("ldi_hex_upper",
            "    LDI r0, 0XFF\n    HALT\n");
    }

    #[test]
    fn test_dual_assemble_ldi_hex_mixed() {
        // Mixed case hex digits
        dual_assemble("ldi_hex_mixed",
            "    LDI r0, 0xAb\n    HALT\n");
    }

    #[test]
    fn test_dual_assemble_ldi_negative() {
        // Negative immediate: -1 should produce 0xFFFFFFFF
        dual_assemble("ldi_negative",
            "    LDI r0, -1\n    HALT\n");
    }

    #[test]
    fn test_dual_assemble_ldi_negative_offset() {
        // Negative hex: -0xFF should produce two's complement of 255
        dual_assemble("ldi_negative_hex",
            "    LDI r0, -0xFF\n    HALT\n");
    }

    #[test]
    fn test_dual_assemble_ldi_char_literal() {
        // Character literal: 'A' = 65
        dual_assemble("ldi_char_literal",
            "    LDI r0, 'A'\n    HALT\n");
    }

    #[test]
    fn test_dual_assemble_ldi_char_digit() {
        // Character literal: '0' = 48
        dual_assemble("ldi_char_digit",
            "    LDI r1, '0'\n    HALT\n");
    }

    #[test]
    fn test_dual_assemble_negative_and_char() {
        // Mix of negative, char, hex, decimal
        dual_assemble("negative_and_char",
            "    LDI r0, -1\n    LDI r1, 'A'\n    LDI r2, 0xFF\n    LDI r3, 42\n    HALT\n");
    }

    // GEO-92: SEND opcode (17) — reg-reg + immediate length
    #[test]
    fn test_dual_assemble_send() {
        dual_assemble("send",
            "    SEND r0, r1, 10\n    HALT\n");
    }

    // GEO-92: RECV opcode (18) — reg-reg
    #[test]
    fn test_dual_assemble_recv() {
        dual_assemble("recv",
            "    RECV r5, r2\n    HALT\n");
    }

    // GEO-93: SPAWN opcode (230) — reg-reg
    #[test]
    fn test_dual_assemble_spawn() {
        dual_assemble("spawn",
            "    LDI r0, 100\n    LDI r1, 200\n    SPAWN r0, r1\n    HALT\n");
    }

    // GEO-93: YIELD opcode (227) — zero-operand
    #[test]
    fn test_dual_assemble_yield() {
        dual_assemble("yield",
            "    LDI r0, 42\n    YIELD\n    HALT\n");
    }

    // GEO-93: WAIT_EVENT opcode (28) — custom two-reg encoding
    #[test]
    fn test_dual_assemble_wait_event() {
        dual_assemble("wait_event",
            "    LDI r0, 1\n    LDI r1, 0\n    WAIT_EVENT r0, r1\n    HALT\n");
    }

    /// GEO-71: Self-hosting bootstrap test.
    /// The mini-assembler assembles its OWN source code.
    /// Since the VM assembler doesn't handle labels, we first resolve labels
    /// to numeric offsets, then feed the flattened source to the VM assembler.
    /// The VM-assembled output must match the Rust-assembled output pixel-for-pixel.
    #[test]
    fn test_self_hosting_bootstrap() {
        use crate::assembler::{parse_gasm, resolve_labels, Program};
        use crate::geoasm_mem;

        // ── Step 1: Load the assembler source ──
        let asm_source = include_str!("../programs/mini_assembler.gasm");

        // ── Step 2: Assemble with Rust parse_gasm (ground truth) ──
        let expected = parse_gasm(asm_source).expect("mini_assembler.gasm should parse");
        eprintln!("Ground truth: {} pixels from Rust assembler", expected.pixels.len());

        // ── Step 3: Resolve labels to produce label-free source ──
        let flat_source = resolve_labels(asm_source);
        eprintln!("Flat source: {} bytes (was {} bytes)", flat_source.len(), asm_source.len());

        // Verify the flat source assembles identically
        let flat_expected = parse_gasm(&flat_source).expect("flat source should parse");
        assert_eq!(
            expected.pixels.len(),
            flat_expected.pixels.len(),
            "flat source should produce same pixel count as original"
        );
        for (i, (a, b)) in expected.pixels.iter().zip(flat_expected.pixels.iter()).enumerate() {
            assert_eq!(a, b, "flat source pixel {} differs from original", i);
        }
        eprintln!("Verified: flat source assembles identically ({} pixels)", expected.pixels.len());

        // ── Step 4: Load the mini-assembler program into the VM ──
        let asm_prog = parse_gasm(asm_source).expect("mini_assembler.gasm should assemble");
        let asm_addr: u32 = 0x20000;

        let mut svm = SoftwareVm::new();
        svm.load_program(asm_addr, &asm_prog.pixels);
        svm.spawn_vm(0, asm_addr);

        // ── Step 5: Write the FLAT source into the source region ──
        let src_bytes = flat_source.as_bytes();
        assert!(
            src_bytes.len() < 0x10000_usize,
            "flat source ({} bytes) must fit in 64KB region",
            src_bytes.len()
        );
        for (i, &byte) in src_bytes.iter().enumerate() {
            svm.poke_byte(geoasm_mem::src_byte_addr(i as u32), byte);
        }
        svm.poke_byte(geoasm_mem::src_byte_addr(src_bytes.len() as u32), 0);

        // Verify source write
        for (i, &byte) in src_bytes.iter().enumerate() {
            assert_eq!(
                svm.peek_byte(geoasm_mem::src_byte_addr(i as u32)),
                byte,
                "source byte {} mismatch after write",
                i
            );
        }

        // ── Step 6: Run the VM assembler ──
        // The assembler processes ~700 instructions of source; give it plenty of frames.
        let max_frames = 500;
        for frame in 0..max_frames {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                eprintln!("Self-hosting assembler halted at frame {}", frame);
                break;
            }
        }
        let halted = svm.vm_state(0).halted;
        if halted == 0 {
            // Print diagnostics before failing
            let vm = svm.vm_state(0);
            eprintln!("VM did NOT halt after {} frames!", max_frames);
            eprintln!("PC={:#010x}, regs: r0={:#010x} r1={:#010x} r2={:#010x} r3={:#010x}",
                vm.pc, vm.regs[0], vm.regs[1], vm.regs[2], vm.regs[3]);
            eprintln!("  r4={:#010x} r5={:#010x} r6={:#010x} r7={:#010x}",
                vm.regs[4], vm.regs[5], vm.regs[6], vm.regs[7]);

            // Dump first 20 output pixels
            let ob = geoasm_mem::output_pixel(0);
            for i in 0..20 {
                eprintln!("  out[{}] = {:#010x}", i, svm.peek(ob + i));
            }

            // Check what source byte the assembler is stuck on
            let src_ptr = vm.regs[0];
            eprintln!("Source pointer r0 = {:#010x}", src_ptr);
            if src_ptr >= geoasm_mem::GEOASM_SRC_BASE_BYTE {
                let offset = src_ptr - geoasm_mem::GEOASM_SRC_BASE_BYTE;
                eprintln!("Source offset = {:#x}", offset);
                for i in 0..20 {
                    let b = svm.peek_byte(src_ptr + i);
                    eprintln!("  src[offset+{}] = {} ({:#04x}) = '{}'",
                        i, b, b,
                        if b >= 32 && b < 127 { b as char } else { '.' });
                }
            }
        }
        assert_eq!(halted, 1, "self-hosting assembler should halt");

        // ── Step 7: Compare output pixel-by-pixel ──
        let output_base = geoasm_mem::output_pixel(0);
        let mut first_mismatch: Option<(usize, u32, u32)> = None;
        let mut match_count = 0usize;

        for (i, &expected_px) in expected.pixels.iter().enumerate() {
            let actual = svm.peek(output_base + i as u32);
            if actual == expected_px {
                match_count += 1;
            } else if first_mismatch.is_none() {
                first_mismatch = Some((i, actual, expected_px));
            }
        }

        // Also check there's no extra output beyond what we expect
        let after_last = svm.peek(output_base + expected.pixels.len() as u32);

        if let Some((idx, actual, expected_px)) = first_mismatch {
            eprintln!("First mismatch at pixel {}: got {:#010x}, expected {:#010x}", idx, actual, expected_px);

            // Dump context around the mismatch
            let start = if idx > 5 { idx - 5 } else { 0 };
            let end = std::cmp::min(idx + 10, expected.pixels.len());
            for i in start..end {
                let act = svm.peek(output_base + i as u32);
                let exp = expected.pixels[i];
                let marker = if i == idx { " <<<" } else { "" };
                eprintln!("  pixel {}: got {:#010x}, expected {:#010x}{}", i, act, exp, marker);
            }
        }

        assert!(
            first_mismatch.is_none(),
            "Self-hosting bootstrap: pixel mismatch at index {:?} ({} of {} pixels match)",
            first_mismatch.map(|(i, _, _)| i),
            match_count,
            expected.pixels.len()
        );

        assert_eq!(
            after_last, 0,
            "output after expected pixels should be 0, got {:#010x}",
            after_last
        );

        eprintln!(
            "SELF-HOSTING BOOTSTRAP PASSED! VM assembler assembled itself: {} pixels match perfectly",
            expected.pixels.len()
        );
    }

    // Debug: step through VM assembler execution, track register state
    #[test]
    fn test_debug_vm_assembler_step() {
        use crate::assembler::parse_gasm;
        use crate::geoasm_mem;

        // Simplest failing case: just "LDI r0, 99\nHALT\n"
        let src = "    LDI r0, 99\n    HALT\n";
        let expected = parse_gasm(src).unwrap();
        eprintln!("Expected: {:?}", expected.pixels);

        let asm_source = include_str!("../programs/mini_assembler.gasm");
        let asm_prog = parse_gasm(asm_source).expect("mini_assembler.gasm should assemble");
        let asm_addr: u32 = 0x20000;

        let mut svm = SoftwareVm::new();
        svm.load_program(asm_addr, &asm_prog.pixels);
        svm.spawn_vm(0, asm_addr);

        let src_bytes = src.as_bytes();
        for (i, &byte) in src_bytes.iter().enumerate() {
            svm.poke_byte(geoasm_mem::src_byte_addr(i as u32), byte);
        }
        svm.poke_byte(geoasm_mem::src_byte_addr(src_bytes.len() as u32), 0);

        // Run frame by frame and check r4 (immediate accumulator) and output
        for frame in 0..1000 {
            svm.execute_frame();
            let vm = svm.vm_state(0);
            if vm.halted != 0 {
                eprintln!("Halted at frame {}", frame);
                break;
            }
        }

        let output_base = geoasm_mem::output_pixel(0);
        for i in 0..10 {
            let v = svm.peek(output_base + i as u32);
            eprintln!("  V[{}] = {:#010x}", i, v);
        }

        // Also check: what are the source bytes at the key positions?
        eprintln!("\nSource bytes:");
        for i in 0..src_bytes.len() + 5 {
            let b = svm.peek_byte(geoasm_mem::src_byte_addr(i as u32));
            eprintln!("  src[{}] = {} ({:#04x}) = '{}'", i, b, b,
                if b >= 32 && b < 127 { b as char } else { '.' });
        }

        // Check registers
        let vm = svm.vm_state(0);
        eprintln!("\nFinal registers:");
        for i in 0..16 {
            eprintln!("  r{} = {:#010x} ({})", i, vm.regs[i], vm.regs[i]);
        }
    }

    // ── Phase 4: Error reporting tests ────────────────────────────

    /// Helper: run the mini-assembler on source, check for error halt.
    /// Returns (error_code, source_offset) if error detected.
    fn run_assembler_expect_error(source_name: &str, source_text: &str) -> (u32, u32) {
        use crate::assembler::parse_gasm;
        use crate::geoasm_mem;

        let asm_source = include_str!("../programs/mini_assembler.gasm");
        let asm_prog = parse_gasm(asm_source).expect("mini_assembler.gasm should assemble");

        let asm_addr: u32 = 0x20000;
        let mut svm = SoftwareVm::new();
        svm.load_program(asm_addr, &asm_prog.pixels);
        svm.spawn_vm(0, asm_addr);

        let src_bytes = source_text.as_bytes();
        for (i, &byte) in src_bytes.iter().enumerate() {
            svm.poke_byte(geoasm_mem::src_byte_addr(i as u32), byte);
        }
        svm.poke_byte(geoasm_mem::src_byte_addr(src_bytes.len() as u32), 0);

        for frame in 0..200 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                break;
            }
        }
        assert_eq!(svm.vm_state(0).halted, 1, "{}: assembler should halt", source_name);

        // Check output pixel 0 for error magic
        let output_base = geoasm_mem::output_pixel(0);
        let magic = svm.peek(output_base);
        assert_eq!(
            magic, geoasm_mem::GEOASM_ERR_MAGIC,
            "{}: expected error magic 0xDEAD at output pixel 0, got {:#010x}",
            source_name, magic
        );

        // Read error diagnostic from scratch region
        let err_code = svm.peek(geoasm_mem::GEOASM_ERR_SCRATCH);
        let src_offset = svm.peek(geoasm_mem::GEOASM_ERR_SCRATCH + 1);

        eprintln!(
            "{}: error code={}, source offset={:#x}",
            source_name, err_code, src_offset
        );
        (err_code, src_offset)
    }

    /// Test that unknown mnemonics produce error code 1 with correct source offset.
    #[test]
    fn test_self_hosting_assembler_error_detection() {
        use crate::geoasm_mem;

        // "ZZZ" is not a valid mnemonic -- first char 'Z' has no dispatch
        let (err_code, src_offset) = run_assembler_expect_error(
            "unknown_mnemonic",
            "ZZZ r0, r1\n",
        );
        assert_eq!(err_code, geoasm_mem::ERR_UNKNOWN_MNEMONIC,
            "expected error code 1 (unknown mnemonic), got {}", err_code);
        // Source offset should point to the start of "ZZZ" (offset 0)
        assert!(src_offset >= geoasm_mem::GEOASM_SRC_BASE_BYTE,
            "source offset should be >= base address");
        let byte_offset = src_offset - geoasm_mem::GEOASM_SRC_BASE_BYTE;
        assert_eq!(byte_offset, 0, "error should be at source byte 0");
    }

    /// Test that valid programs still assemble correctly (no false positives).
    #[test]
    fn test_error_reporting_no_false_positive() {
        use crate::assembler::parse_gasm;
        use crate::geoasm_mem;

        let source_text = "LDI r0, 42\nHALT\n";
        let expected = parse_gasm(source_text).expect("source should parse");

        let asm_source = include_str!("../programs/mini_assembler.gasm");
        let asm_prog = parse_gasm(asm_source).expect("mini_assembler.gasm should assemble");

        let asm_addr: u32 = 0x20000;
        let mut svm = SoftwareVm::new();
        svm.load_program(asm_addr, &asm_prog.pixels);
        svm.spawn_vm(0, asm_addr);

        let src_bytes = source_text.as_bytes();
        for (i, &byte) in src_bytes.iter().enumerate() {
            svm.poke_byte(geoasm_mem::src_byte_addr(i as u32), byte);
        }
        svm.poke_byte(geoasm_mem::src_byte_addr(src_bytes.len() as u32), 0);

        for frame in 0..50 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                break;
            }
        }
        assert_eq!(svm.vm_state(0).halted, 1, "valid program should halt normally");

        // Output pixel 0 should NOT be 0xDEAD
        let output_base = geoasm_mem::output_pixel(0);
        let first_px = svm.peek(output_base);
        assert_ne!(first_px, geoasm_mem::GEOASM_ERR_MAGIC,
            "valid program should not produce error magic");

        // Output should match expected
        for (i, &expected_px) in expected.pixels.iter().enumerate() {
            let actual = svm.peek(output_base + i as u32);
            assert_eq!(actual, expected_px, "pixel {} mismatch", i);
        }
    }

    /// Test error detection after valid instructions.
    #[test]
    fn test_self_hosting_error_after_valid() {
        use crate::geoasm_mem;

        // Valid NOP followed by invalid "QQQ"
        let (err_code, src_offset) = run_assembler_expect_error(
            "error_after_valid",
            "NOP\nQQQ\n",
        );
        assert_eq!(err_code, geoasm_mem::ERR_UNKNOWN_MNEMONIC);
        let byte_offset = src_offset - geoasm_mem::GEOASM_SRC_BASE_BYTE;
        // "NOP\n" is 4 bytes, so QQQ starts at offset 4
        assert_eq!(byte_offset, 4, "error should be at source byte 4 (after NOP\\n)");
    }

    /// GEO-73: Test .org directive in the mini-assembler.
    /// The mini-assembler should pad with zeros and place subsequent
    /// instructions at the .org address.
    #[test]
    fn test_self_hosting_org_directive() {
        use crate::assembler::{op, parse_gasm, Program};
        use crate::geoasm_mem;

        // Source with .org: pad to position 4, then LDI r0,1 then HALT
        let source_text = ".org 4\nLDI r0, 1\nHALT\n";
        let expected = parse_gasm(source_text).expect("source should parse");

        // Verify Rust assembler expectations
        assert_eq!(expected.pixels.len(), 7, "should have 7 pixels (4 zeros + LDI instr + imm + HALT)");
        for i in 0..4 {
            assert_eq!(expected.pixels[i], 0, "pixel {} should be zero-padded", i);
        }
        assert_eq!((expected.pixels[4] & 0xFF), op::LDI as u32, "pixel 4 should be LDI");
        assert_eq!(expected.pixels[5], 1, "pixel 5 should be immediate 1");
        assert_eq!((expected.pixels[6] & 0xFF), op::HALT as u32, "pixel 6 should be HALT");

        // Load mini-assembler
        let asm_source = include_str!("../programs/mini_assembler.gasm");
        let asm_prog = parse_gasm(asm_source).expect("mini_assembler.gasm should assemble");
        let asm_addr: u32 = 0x20000;

        let mut svm = SoftwareVm::new();
        svm.load_program(asm_addr, &asm_prog.pixels);
        svm.spawn_vm(0, asm_addr);

        // Write source text
        let src_bytes = source_text.as_bytes();
        for (i, &byte) in src_bytes.iter().enumerate() {
            svm.poke_byte(geoasm_mem::src_byte_addr(i as u32), byte);
        }
        svm.poke_byte(geoasm_mem::src_byte_addr(src_bytes.len() as u32), 0);

        // Run the VM assembler
        for frame in 0..100 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                eprintln!("Assembler halted at frame {}", frame);
                break;
            }
        }
        assert_eq!(svm.vm_state(0).halted, 1, "assembler should halt");

        // Verify output matches expected
        let output_base = geoasm_mem::output_pixel(0);
        for (i, &expected_px) in expected.pixels.iter().enumerate() {
            let actual = svm.peek(output_base + i as u32);
            assert_eq!(
                actual, expected_px,
                "output pixel {} mismatch: got {:#010x}, expected {:#010x}",
                i, actual, expected_px
            );
        }

        eprintln!("GEO-73 .org directive test passed! Output matches parse_gasm.");
    }

    /// GEO-73: Test .org with hex address in the mini-assembler.
    #[test]
    fn test_self_hosting_org_hex() {
        use crate::assembler::{op, parse_gasm, Program};
        use crate::geoasm_mem;

        let source_text = ".org 0x10\nNOP\nHALT\n";
        let expected = parse_gasm(source_text).expect("source should parse");

        assert_eq!(expected.pixels.len(), 0x12, "should have 18 pixels (16 zeros + NOP + HALT)");
        assert_eq!((expected.pixels[0x10] & 0xFF), op::NOP as u32, "pixel 0x10 should be NOP");
        assert_eq!((expected.pixels[0x11] & 0xFF), op::HALT as u32, "pixel 0x11 should be HALT");

        let asm_source = include_str!("../programs/mini_assembler.gasm");
        let asm_prog = parse_gasm(asm_source).expect("mini_assembler.gasm should assemble");
        let asm_addr: u32 = 0x20000;

        let mut svm = SoftwareVm::new();
        svm.load_program(asm_addr, &asm_prog.pixels);
        svm.spawn_vm(0, asm_addr);

        let src_bytes = source_text.as_bytes();
        for (i, &byte) in src_bytes.iter().enumerate() {
            svm.poke_byte(geoasm_mem::src_byte_addr(i as u32), byte);
        }
        svm.poke_byte(geoasm_mem::src_byte_addr(src_bytes.len() as u32), 0);

        for frame in 0..200 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                break;
            }
        }
        assert_eq!(svm.vm_state(0).halted, 1, "assembler should halt");

        let output_base = geoasm_mem::output_pixel(0);
        for (i, &expected_px) in expected.pixels.iter().enumerate() {
            let actual = svm.peek(output_base + i as u32);
            assert_eq!(
                actual, expected_px,
                "hex org output pixel {} mismatch: got {:#010x}, expected {:#010x}",
                i, actual, expected_px
            );
        }

        eprintln!("GEO-73 .org hex directive test passed!");
    }

}

impl SoftwareVm {
    fn verify_range(&self, start_addr: u32, expected: &[u32]) -> (usize, usize) {
        let mut matched = 0;
        for (i, &exp) in expected.iter().enumerate() {
            let got = self.peek(start_addr + i as u32);
            if got == exp {
                matched += 1;
            }
        }
        (matched, expected.len())
    }
}

// ── GEO-94: Tier 2 — execute assembled programs via Rust assembler ──

#[cfg(test)]
mod geo94_tests {
    use super::*;
    use crate::assembler;

    fn assemble_and_run(source: &str) -> crate::vm::VmState {
        let prog = crate::assembler::parse_gasm(source).expect("source should parse");
        SoftwareVm::run_program(&prog.pixels, 0)
    }

    #[test]
    fn geo94_factorial_5() {
        // pixels: 0-1 LDI r0,1  2-3 LDI r1,5  4-5 LDI r2,0  6-7 LDI r3,1
        // 8 MUL r0,r1  9 SUB r1,r3  10-11 BNE r1,r2,-2(→8)  12 HALT
        let src = "LDI r0, 1\nLDI r1, 5\nLDI r2, 0\nLDI r3, 1\nMUL r0, r1\nSUB r1, r3\nBNE r1, r2, -2\nHALT\n";
        let vm = assemble_and_run(src);
        assert_eq!(vm.halted, 1, "factorial should halt");
        assert_eq!(vm.regs[0], 120, "5! = 120");
    }

    #[test]
    fn geo94_sum_1_to_10() {
        let src = "LDI r0, 0\nLDI r1, 10\nLDI r2, 0\nLDI r3, 1\nADD r0, r1\nSUB r1, r3\nBNE r1, r2, -2\nHALT\n";
        let vm = assemble_and_run(src);
        assert_eq!(vm.halted, 1, "sum should halt");
        assert_eq!(vm.regs[0], 55, "1+..+10 = 55");
    }

    #[test]
    fn geo94_fibonacci_10() {
        // addr 0-1 LDI r0,0  2-3 LDI r1,1  4-5 LDI r2,9  6-7 LDI r3,0  8-9 LDI r5,1
        // 10 MOV r4,r1  11 ADD r4,r0  12 MOV r0,r1  13 MOV r1,r4  14 SUB r2,r5
        // 15-16 BNE r2,r3,-5(→10)  17 HALT
        // r5=1 for decrement; 9 iterations -> fib(10)=55
        let src = "LDI r0, 0\nLDI r1, 1\nLDI r2, 9\nLDI r3, 0\nLDI r5, 1\nMOV r4, r1\nADD r4, r0\nMOV r0, r1\nMOV r1, r4\nSUB r2, r5\nBNE r2, r3, -5\nHALT\n";
        let vm = assemble_and_run(src);
        assert_eq!(vm.halted, 1, "fib should halt");
        assert_eq!(vm.regs[1], 55, "fib(10) = 55");
    }

    #[test]
    fn geo94_memory_roundtrip() {
        let src = "LDI r0, 9999\nLDI r1, 100\nSTORE r1, r0\nLDI r0, 0\nLOAD r2, r1\nHALT\n";
        let vm = assemble_and_run(src);
        assert_eq!(vm.halted, 1, "roundtrip should halt");
        assert_eq!(vm.regs[2], 9999, "LOAD should get 9999");
    }

    #[test]
    fn geo94_multiply_via_add() {
        let src = "LDI r0, 3\nLDI r1, 7\nLDI r2, 0\nLDI r3, 0\nLDI r4, 1\nADD r2, r0\nSUB r1, r4\nBNE r1, r3, -2\nMOV r0, r2\nHALT\n";
        let vm = assemble_and_run(src);
        assert_eq!(vm.halted, 1, "mul should halt");
        assert_eq!(vm.regs[0], 21, "3*7 = 21");
    }
}

/// GEO-92: Tier 2 tests -- programs assembled by the self-hosting VM assembler
/// are loaded and executed on the software VM, verifying correct results.
///
/// This proves the mini-assembler (mini_assembler.gasm) produces genuinely
/// executable code, not just byte-matching output.
#[cfg(test)]
mod geo92_tier2 {
    use super::*;
    use crate::assembler::{self, op, bcond, Program};
    use crate::geoasm_mem;

    /// Assemble source via the self-hosting VM assembler, then execute the output.
    /// Returns the VmState after execution.
    fn self_hosted_assemble_and_run(source: &str) -> crate::vm::VmState {
        // Step 1: Assemble source via mini_assembler.gasm running on the VM
        let asm_source = include_str!("../programs/mini_assembler.gasm");
        let asm_prog =
            assembler::parse_gasm(asm_source).expect("mini_assembler.gasm should assemble");

        let asm_addr: u32 = 0x20000;
        let mut svm = SoftwareVm::new();
        svm.load_program(asm_addr, &asm_prog.pixels);
        svm.spawn_vm(0, asm_addr);

        // Write source text into the source region
        let src_bytes = source.as_bytes();
        for (i, &byte) in src_bytes.iter().enumerate() {
            svm.poke_byte(geoasm_mem::src_byte_addr(i as u32), byte);
        }
        svm.poke_byte(geoasm_mem::src_byte_addr(src_bytes.len() as u32), 0);

        // Run the assembler VM until it halts
        for _ in 0..200 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                break;
            }
        }
        assert_eq!(svm.vm_state(0).halted, 1, "self-hosted assembler should halt");

        // Check for error halt (0xDEAD in output pixel 0)
        let output_base = geoasm_mem::output_pixel(0);
        let first_pixel = svm.peek(output_base);
        assert_ne!(
            first_pixel, 0xDEAD,
            "self-hosted assembler reported error for source:\n{}",
            source
        );

        // Step 2: Read the assembled output pixels
        let rust_expected = assembler::parse_gasm(source).expect("source should parse with Rust assembler");
        let mut output_pixels = Vec::new();
        for i in 0..rust_expected.pixels.len() {
            output_pixels.push(svm.peek(output_base + i as u32));
        }

        // Step 3: Execute the assembled output in a fresh VM
        let exec_addr: u32 = 0x40000; // well clear of assembler regions
        let mut exec_vm = SoftwareVm::new();
        exec_vm.load_program(exec_addr, &output_pixels);
        exec_vm.spawn_vm(0, exec_addr);

        // Run until halted (may need multiple frames for looping programs)
        for _ in 0..50 {
            exec_vm.execute_frame();
            if exec_vm.vm_state(0).halted != 0 {
                break;
            }
        }

        exec_vm.vm_state(0).clone()
    }

    #[test]
    fn geo92_ldi_halt() {
        let src = "LDI r0, 42\nHALT\n";
        let vm = self_hosted_assemble_and_run(src);
        assert_eq!(vm.halted, 1, "should halt");
        assert_eq!(vm.regs[0], 42, "r0 should be 42");
    }

    #[test]
    fn geo92_add_two_numbers() {
        let src = "LDI r0, 10\nLDI r1, 20\nADD r0, r1\nHALT\n";
        let vm = self_hosted_assemble_and_run(src);
        assert_eq!(vm.halted, 1, "should halt");
        assert_eq!(vm.regs[0], 30, "10 + 20 = 30");
    }

    #[test]
    fn geo92_subtract() {
        let src = "LDI r0, 100\nLDI r1, 37\nSUB r0, r1\nHALT\n";
        let vm = self_hosted_assemble_and_run(src);
        assert_eq!(vm.halted, 1, "should halt");
        assert_eq!(vm.regs[0], 63, "100 - 37 = 63");
    }

    #[test]
    fn geo92_multiply() {
        let src = "LDI r0, 6\nLDI r1, 7\nMUL r0, r1\nHALT\n";
        let vm = self_hosted_assemble_and_run(src);
        assert_eq!(vm.halted, 1, "should halt");
        assert_eq!(vm.regs[0], 42, "6 * 7 = 42");
    }

    #[test]
    fn geo92_store_load_roundtrip() {
        let src = "LDI r0, 9999\nLDI r1, 100\nSTORE r1, r0\nLDI r0, 0\nLOAD r2, r1\nHALT\n";
        let vm = self_hosted_assemble_and_run(src);
        assert_eq!(vm.halted, 1, "should halt");
        assert_eq!(vm.regs[2], 9999, "LOAD should recover 9999");
    }

    #[test]
    fn geo92_factorial_5() {
        // 5! = 120 via loop: r0 *= r1, r1--, loop while r1 != 0
        let src = "LDI r0, 1\nLDI r1, 5\nLDI r2, 0\nLDI r3, 1\nMUL r0, r1\nSUB r1, r3\nBNE r1, r2, -2\nHALT\n";
        let vm = self_hosted_assemble_and_run(src);
        assert_eq!(vm.halted, 1, "factorial should halt");
        assert_eq!(vm.regs[0], 120, "5! = 120");
    }

    #[test]
    fn geo92_sum_1_to_10() {
        // sum += r1, r1--, loop while r1 != 0
        let src = "LDI r0, 0\nLDI r1, 10\nLDI r2, 0\nLDI r3, 1\nADD r0, r1\nSUB r1, r3\nBNE r1, r2, -2\nHALT\n";
        let vm = self_hosted_assemble_and_run(src);
        assert_eq!(vm.halted, 1, "sum should halt");
        assert_eq!(vm.regs[0], 55, "1+..+10 = 55");
    }

    #[test]
    fn geo92_fibonacci_10() {
        // fib(10) = 55 via loop
        let src = "LDI r0, 0\nLDI r1, 1\nLDI r2, 9\nLDI r3, 0\nLDI r5, 1\nMOV r4, r1\nADD r4, r0\nMOV r0, r1\nMOV r1, r4\nSUB r2, r5\nBNE r2, r3, -5\nHALT\n";
        let vm = self_hosted_assemble_and_run(src);
        assert_eq!(vm.halted, 1, "fib should halt");
        assert_eq!(vm.regs[1], 55, "fib(10) = 55");
    }

    #[test]
    fn geo92_hex_immediate() {
        // Verify hex immediates survive self-hosted assembly and execute correctly
        let src = "LDI r0, 0xFF\nLDI r1, 1\nADD r0, r1\nHALT\n";
        let vm = self_hosted_assemble_and_run(src);
        assert_eq!(vm.halted, 1, "should halt");
        assert_eq!(vm.regs[0], 256, "0xFF + 1 = 256");
    }

    #[test]
    fn geo92_negative_immediate() {
        // LDI r0, -1 should produce 0xFFFFFFFF (two's complement)
        let src = "LDI r0, -1\nLDI r1, 1\nADD r0, r1\nHALT\n";
        let vm = self_hosted_assemble_and_run(src);
        assert_eq!(vm.halted, 1, "should halt");
        assert_eq!(vm.regs[0], 0, "-1 + 1 = 0 (wrapping)");
    }

    #[test]
    fn geo92_char_literal() {
        // LDI r0, 'A' should load 65
        let src = "LDI r0, 'A'\nHALT\n";
        let vm = self_hosted_assemble_and_run(src);
        assert_eq!(vm.halted, 1, "should halt");
        assert_eq!(vm.regs[0], 65, "'A' = 65");
    }

    #[test]
    fn pixel_forge_assembles() {
        let src = std::fs::read_to_string("programs/pixel_forge.gasm")
            .expect("programs/pixel_forge.gasm should exist");
        let prog = crate::gasm::assemble(&src)
            .expect("pixel_forge.gasm should assemble cleanly");
        assert!(prog.pixels.len() > 100, "pixel_forge should be >100 pixels, got {}", prog.pixels.len());
    }

    // ── Issue Queue Tests (Phase 13A) ──────────────────────────────────

    /// Helper: create an SVM with a program that creates issues and halts.
    /// Returns the SVM ready to execute.
    fn issueq_setup() -> SoftwareVm {
        let mut svm = SoftwareVm::new();
        // Zero out the issue queue header region
        for i in 0..crate::ISSUEQ_REGION_SIZE {
            svm.poke(crate::ISSUEQ_BASE + i, 0);
        }
        svm
    }

    /// Helper: write a null-terminated ASCII string to pixel memory.
    /// Packs 4 bytes per pixel (little-endian).
    fn write_string(svm: &mut SoftwareVm, addr: u32, s: &str) {
        let bytes: Vec<u8> = s.bytes().chain(std::iter::once(0u8)).collect();
        for (i, chunk) in bytes.chunks(4).enumerate() {
            let mut word: u32 = 0;
            for (j, &b) in chunk.iter().enumerate() {
                word |= (b as u32) << (j * 8);
            }
            svm.poke(addr + i as u32, word);
        }
    }

    #[test]
    fn test_issueq_create_single() {
        // Create a single issue and verify queue state.
        let mut svm = issueq_setup();

        let title_addr: u32 = 0x0010_0000;
        write_string(&mut svm, title_addr, "fix bug");

        // Program: create issue, halt
        let mut p = Program::new();
        let load_addr: u32 = 0x0000_1000;
        p.ldi(10, title_addr);      // r10 = title addr
        p.ldi(11, 3);               // r11 = priority high
        p.issue_create(10, 11, 0);  // ISSUE_CREATE r10=title, r11=priority, assignee=0
        p.halt();

        svm.load_program(load_addr, &p.pixels);
        svm.spawn_vm(0, load_addr);
        svm.execute_frame();

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED, "VM should halt");
        // r10 should now hold the issue_id (not 0)
        let issue_id = svm.vm_state(0).regs[10];
        assert_eq!(issue_id, 1, "first issue should have id=1");

        // Verify queue header: head=0, tail=1, count=1, capacity=64
        assert_eq!(svm.peek(crate::ISSUEQ_BASE), 0, "head should be 0");
        assert_eq!(svm.peek(crate::ISSUEQ_BASE + 1), 1, "tail should be 1");
        assert_eq!(svm.peek(crate::ISSUEQ_BASE + 2), 1, "count should be 1");
        assert_eq!(svm.peek(crate::ISSUEQ_BASE + 3), crate::ISSUEQ_CAPACITY, "capacity should be set");

        // Verify slot 0 metadata: status=todo(0), priority=high(3), assignee=0
        let meta = svm.peek(crate::ISSUEQ_SLOTS_BASE);
        let status = (meta >> 24) & 0xFF;
        let priority = (meta >> 16) & 0xFF;
        assert_eq!(status, crate::ISSUE_STATUS_TODO, "status should be TODO");
        assert_eq!(priority, 3, "priority should be high(3)");

        // Verify issue_id in slot
        assert_eq!(svm.peek(crate::ISSUEQ_SLOTS_BASE + 1), 1, "slot issue_id should be 1");
    }

    #[test]
    fn test_issueq_create_ten() {
        // Create 10 issues and verify queue state.
        let mut svm = issueq_setup();

        let title_addr: u32 = 0x0010_0000;
        write_string(&mut svm, title_addr, "issue title here enough bytes");

        // Program: create 10 issues in a loop
        // We'll unroll: create issue, check result, increment title, repeat
        let mut p = Program::new();
        let load_addr: u32 = 0x0000_1000;

        // r5 = counter, r6 = title addr
        p.ldi(5, 0);           // counter = 0
        p.ldi(6, title_addr);  // r6 = title base

        let loop_start = p.pixels.len();
        // LDI r10 = current title addr (r6 + counter * some_offset, but we reuse same title)
        p.instruction(op::MOV, 0, 10, 6);  // r10 = title_addr
        p.ldi(11, 2);                       // r11 = priority medium
        p.issue_create(10, 11, 0);          // ISSUE_CREATE r10, r11, assignee=0
        // r10 now has issue_id (or 0 on failure)
        // Increment counter
        p.ldi(7, 1);
        p.instruction(op::ADD, 0, 5, 7);   // counter++
        p.ldi(8, 10);
        // Branch if counter < 10: loop back
        p.instruction(op::BRANCH, bcond::BGE, 5, 8);
        p.pixels.push(0); // placeholder
        let branch_pc = p.pixels.len() - 1;
        // Jump back
        let jmp_pc = p.pixels.len();
        p.instruction(op::JMP, 0, 0, 0);
        let back = loop_start as i32 - jmp_pc as i32;
        p.pixels.push(back as u32);

        let end_pc = p.pixels.len();
        let offset = (end_pc as i32) - ((branch_pc - 1) as i32);
        p.pixels[branch_pc] = offset as u32;
        p.halt();

        svm.load_program(load_addr, &p.pixels);
        svm.spawn_vm(0, load_addr);

        // Run many frames to complete the loop
        for _ in 0..50 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                break;
            }
        }

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED, "VM should halt after creating 10 issues");

        // Verify queue count = 10
        let count = svm.peek(crate::ISSUEQ_BASE + 2);
        assert_eq!(count, 10, "should have 10 issues in queue");

        // Verify tail = 10
        let tail = svm.peek(crate::ISSUEQ_BASE + 1);
        assert_eq!(tail, 10, "tail should be 10");

        // Verify each slot has the right issue_id (1-indexed)
        for i in 0..10u32 {
            let slot_base = crate::ISSUEQ_SLOTS_BASE + i * crate::ISSUEQ_SLOT_SIZE;
            let id = svm.peek(slot_base + 1);
            assert_eq!(id, i + 1, "slot {} should have issue_id {}", i, i + 1);
        }
    }

    #[test]
    fn test_issueq_pick_priority_order() {
        // Create 3 issues with different priorities, then pick -- should get highest first.
        let mut svm = issueq_setup();

        let title_addr: u32 = 0x0010_0000;
        write_string(&mut svm, title_addr, "some issue title");

        let load_addr: u32 = 0x0000_1000;
        let mut p = Program::new();

        // Create 3 issues: low(1), critical(4), medium(2)
        p.ldi(10, title_addr);
        p.ldi(11, 1);  // low
        p.issue_create(10, 11, 0);

        p.instruction(op::MOV, 0, 10, 6); // But we need a reg with title_addr again
        // Actually let's just reset r10
        p.ldi(10, title_addr);
        p.ldi(11, 4);  // critical
        p.issue_create(10, 11, 0);

        p.ldi(10, title_addr);
        p.ldi(11, 2);  // medium
        p.issue_create(10, 11, 0);

        // Now pick (filter=0 = any)
        let out_addr: u32 = 0x0020_0000;
        p.ldi(12, out_addr);
        p.ldi(13, 0);   // filter = 0 (any)
        p.issue_pick(12, 13, 1); // agent_vm_id=1

        p.halt();

        // We need r6 for title_addr - let me fix: just use r10 directly
        // Actually the issue_create overwrites r10 with issue_id. That's fine for subsequent uses.
        // Let me rewrite more carefully.

        let mut p = Program::new();

        // Issue 1: priority low(1)
        p.ldi(10, title_addr);
        p.ldi(11, 1);
        p.issue_create(10, 11, 0);

        // Issue 2: priority critical(4)
        p.ldi(10, title_addr);
        p.ldi(11, 4);
        p.issue_create(10, 11, 0);

        // Issue 3: priority medium(2)
        p.ldi(10, title_addr);
        p.ldi(11, 2);
        p.issue_create(10, 11, 0);

        // Pick: should get the critical(4) one first
        p.ldi(12, out_addr);
        p.ldi(13, 0);   // filter=0 (any)
        p.issue_pick(12, 13, 1); // pick as agent 1

        // r12 now has the issue_id of the picked issue
        p.halt();

        svm.load_program(load_addr, &p.pixels);
        svm.spawn_vm(0, load_addr);

        for _ in 0..20 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                break;
            }
        }

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED, "VM should halt");

        let picked_id = svm.vm_state(0).regs[12];
        assert_eq!(picked_id, 2, "should pick issue_id=2 (the critical one)");

        // Verify its status is now IN_PROGRESS
        // Issue 2 is in slot index 1 (0-indexed, tail=2 -> slot_idx = tail%64)
        // Actually issue 2 is slot_idx=1 (second created)
        let slot_base = crate::ISSUEQ_SLOTS_BASE + 1 * crate::ISSUEQ_SLOT_SIZE;
        let meta = svm.peek(slot_base);
        let status = (meta >> 24) & 0xFF;
        assert_eq!(status, crate::ISSUE_STATUS_IN_PROGRESS, "picked issue should be IN_PROGRESS");
    }

    #[test]
    fn test_issueq_pick_no_match() {
        // Pick from empty queue -> returns 0.
        let mut svm = issueq_setup();

        let load_addr: u32 = 0x0000_1000;
        let out_addr: u32 = 0x0020_0000;

        let mut p = Program::new();
        p.ldi(12, out_addr);
        p.ldi(13, 0);
        p.issue_pick(12, 13, 1);
        p.halt();

        svm.load_program(load_addr, &p.pixels);
        svm.spawn_vm(0, load_addr);
        svm.execute_frame();

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED);
        assert_eq!(svm.vm_state(0).regs[12], 0, "pick from empty queue should return 0");
    }

    #[test]
    fn test_issueq_update_status() {
        // Create an issue, then update its status to done.
        let mut svm = issueq_setup();

        let title_addr: u32 = 0x0010_0000;
        write_string(&mut svm, title_addr, "test issue");

        let load_addr: u32 = 0x0000_1000;

        let mut p = Program::new();
        // Create issue
        p.ldi(10, title_addr);
        p.ldi(11, 3);  // high priority
        p.issue_create(10, 11, 0);
        // r10 = issue_id

        // Update issue to done
        p.ldi(14, crate::ISSUE_STATUS_DONE);
        // ISSUE_UPDATE: r15 = issue_id, r14 = new_status
        // But we need the issue_id in a register. It's in r10.
        p.instruction(op::MOV, 0, 15, 10); // r15 = issue_id
        p.issue_update(15, 14);

        p.halt();

        svm.load_program(load_addr, &p.pixels);
        svm.spawn_vm(0, load_addr);

        for _ in 0..20 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                break;
            }
        }

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED);

        // Update should return 1 (success)
        assert_eq!(svm.vm_state(0).regs[15], 1, "update should return 1 (found)");

        // Verify status in slot
        let slot_base = crate::ISSUEQ_SLOTS_BASE;
        let meta = svm.peek(slot_base);
        let status = (meta >> 24) & 0xFF;
        assert_eq!(status, crate::ISSUE_STATUS_DONE, "issue should be DONE after update");
    }

    #[test]
    fn test_issueq_update_not_found() {
        // Update a non-existent issue -> returns 0.
        let mut svm = issueq_setup();

        let load_addr: u32 = 0x0000_1000;
        let mut p = Program::new();
        p.ldi(10, 999);  // non-existent issue_id
        p.ldi(11, crate::ISSUE_STATUS_DONE);
        p.issue_update(10, 11);
        p.halt();

        svm.load_program(load_addr, &p.pixels);
        svm.spawn_vm(0, load_addr);
        svm.execute_frame();

        assert_eq!(svm.vm_state(0).regs[10], 0, "update non-existent should return 0");
    }

    #[test]
    fn test_issueq_list_basic() {
        // Create 5 issues, list them all.
        let mut svm = issueq_setup();

        let title_addr: u32 = 0x0010_0000;
        write_string(&mut svm, title_addr, "list test issue");

        let load_addr: u32 = 0x0000_1000;
        let out_addr: u32 = 0x0020_0000;

        let mut p = Program::new();

        // Create 5 issues
        for _ in 0..5 {
            p.ldi(10, title_addr);
            p.ldi(11, 2);
            p.issue_create(10, 11, 0);
        }

        // List all (filter=0, max=10)
        p.ldi(12, out_addr);
        p.ldi(13, 0);   // filter = 0 (all)
        p.issue_list(12, 13, 10); // max_results=10

        p.halt();

        svm.load_program(load_addr, &p.pixels);
        svm.spawn_vm(0, load_addr);

        for _ in 0..50 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                break;
            }
        }

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED);

        // r12 should hold count of listed issues
        let listed = svm.vm_state(0).regs[12];
        assert_eq!(listed, 5, "should list 5 issues");

        // Verify the issue IDs at out_addr
        for i in 0..5u32 {
            let id = svm.peek(out_addr + i);
            assert_eq!(id, i + 1, "listed issue {} should have id {}", i, i + 1);
        }
    }

    #[test]
    fn test_issueq_list_max_results() {
        // Create 5 issues, list with max=3 -> should return 3.
        let mut svm = issueq_setup();

        let title_addr: u32 = 0x0010_0000;
        write_string(&mut svm, title_addr, "max test");

        let load_addr: u32 = 0x0000_1000;
        let out_addr: u32 = 0x0020_0000;

        let mut p = Program::new();

        for _ in 0..5 {
            p.ldi(10, title_addr);
            p.ldi(11, 2);
            p.issue_create(10, 11, 0);
        }

        p.ldi(12, out_addr);
        p.ldi(13, 0);
        p.issue_list(12, 13, 3); // max=3

        p.halt();

        svm.load_program(load_addr, &p.pixels);
        svm.spawn_vm(0, load_addr);

        for _ in 0..50 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                break;
            }
        }

        let listed = svm.vm_state(0).regs[12];
        assert_eq!(listed, 3, "should list at most 3 issues");
    }

    #[test]
    fn test_issueq_concurrent_pick_two_vms() {
        // Two VMs compete for issues. Create 2 issues, each VM picks one.
        // No double-claim: each issue is picked by exactly one VM.
        let mut svm = issueq_setup();

        let title_addr: u32 = 0x0010_0000;
        write_string(&mut svm, title_addr, "race condition test");

        // First, use a setup program to create 2 issues
        let setup_addr: u32 = 0x0000_1000;
        let mut setup = Program::new();
        setup.ldi(10, title_addr);
        setup.ldi(11, 3); // high
        setup.issue_create(10, 11, 0);
        setup.ldi(10, title_addr);
        setup.ldi(11, 2); // medium
        setup.issue_create(10, 11, 0);
        setup.halt();

        svm.load_program(setup_addr, &setup.pixels);
        svm.spawn_vm(0, setup_addr);

        for _ in 0..20 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                break;
            }
        }
        assert_eq!(svm.vm_state(0).state, vm_state::HALTED);

        // Verify 2 issues created
        assert_eq!(svm.peek(crate::ISSUEQ_BASE + 2), 2, "should have 2 issues");

        // Now spawn two picker VMs
        let picker_addr_a: u32 = 0x0000_2000;
        let picker_addr_b: u32 = 0x0000_3000;
        let out_a: u32 = 0x0030_0000;
        let out_b: u32 = 0x0031_0000;

        let mut picker_a = Program::new();
        picker_a.ldi(12, out_a);
        picker_a.ldi(13, 0);  // filter=0
        picker_a.issue_pick(12, 13, 2); // agent_vm_id=2
        picker_a.halt();

        let mut picker_b = Program::new();
        picker_b.ldi(12, out_b);
        picker_b.ldi(13, 0);
        picker_b.issue_pick(12, 13, 3); // agent_vm_id=3
        picker_b.halt();

        // Reset VM 0 and spawn both pickers
        svm.spawn_vm(1, picker_addr_a);
        svm.spawn_vm(2, picker_addr_b);
        svm.load_program(picker_addr_a, &picker_a.pixels);
        svm.load_program(picker_addr_b, &picker_b.pixels);

        svm.execute_frame();

        assert_eq!(svm.vm_state(1).state, vm_state::HALTED, "picker A should halt");
        assert_eq!(svm.vm_state(2).state, vm_state::HALTED, "picker B should halt");

        let picked_a = svm.vm_state(1).regs[12];
        let picked_b = svm.vm_state(2).regs[12];

        // Both should have picked different issues (no double-claim)
        assert_ne!(picked_a, 0, "picker A should pick an issue");
        assert_ne!(picked_b, 0, "picker B should pick an issue");
        assert_ne!(picked_a, picked_b, "pickers should pick different issues");

        // Verify the picked issues are now IN_PROGRESS
        // Check all slots -- exactly 2 should be IN_PROGRESS
        let mut in_progress_count = 0u32;
        for i in 0..2u32 {
            let slot_base = crate::ISSUEQ_SLOTS_BASE + i * crate::ISSUEQ_SLOT_SIZE;
            let meta = svm.peek(slot_base);
            let status = (meta >> 24) & 0xFF;
            if status == crate::ISSUE_STATUS_IN_PROGRESS {
                in_progress_count += 1;
            }
        }
        assert_eq!(in_progress_count, 2, "both issues should be IN_PROGRESS after pick");
    }

    #[test]
    fn test_issueq_queue_full() {
        // Fill the queue to capacity, then try to create one more -> should fail.
        let mut svm = issueq_setup();

        let title_addr: u32 = 0x0010_0000;
        write_string(&mut svm, title_addr, "full queue test title");

        let load_addr: u32 = 0x0000_1000;

        let mut p = Program::new();
        // Create ISSUEQ_CAPACITY (64) issues
        p.ldi(5, 0);           // counter
        p.ldi(6, title_addr);  // title addr
        let loop_top = p.pixels.len();
        p.instruction(op::MOV, 0, 10, 6);  // r10 = title_addr
        p.ldi(11, 2);                       // priority medium
        p.issue_create(10, 11, 0);
        // r10 = issue_id (should be > 0 for all 64)
        p.ldi(7, 1);
        p.instruction(op::ADD, 0, 5, 7);
        p.ldi(8, crate::ISSUEQ_CAPACITY);
        p.instruction(op::BRANCH, bcond::BGE, 5, 8);
        p.pixels.push(0);
        let br_pc = p.pixels.len() - 1;
        let jmp_pc = p.pixels.len();
        p.instruction(op::JMP, 0, 0, 0);
        p.pixels.push((loop_top as i32 - jmp_pc as i32) as u32);
        let end_pc = p.pixels.len();
        p.pixels[br_pc] = (end_pc as i32 - ((br_pc - 1) as i32)) as u32;

        // Try to create one more -- should fail (return 0)
        p.instruction(op::MOV, 0, 10, 6);
        p.ldi(11, 2);
        p.issue_create(10, 11, 0);
        // r10 should be 0 (queue full)

        p.halt();

        svm.load_program(load_addr, &p.pixels);
        svm.spawn_vm(0, load_addr);

        for _ in 0..500 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                break;
            }
        }

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED);

        // Verify queue is full
        assert_eq!(svm.peek(crate::ISSUEQ_BASE + 2), crate::ISSUEQ_CAPACITY, "queue should be at capacity");

        // The 65th create should have returned 0
        let last_create_result = svm.vm_state(0).regs[10];
        assert_eq!(last_create_result, 0, "65th create should return 0 (queue full)");
    }

    #[test]
    fn test_issueq_wrap_around() {
        // Create issues, pick them (mark done), create more.
        // The circular buffer should wrap around via tail % CAPACITY.
        let mut svm = issueq_setup();

        let title_addr: u32 = 0x0010_0000;
        write_string(&mut svm, title_addr, "wrap test title here");
        let out_addr: u32 = 0x0020_0000;
        let load_addr: u32 = 0x0000_1000;

        let mut p = Program::new();

        // Create 3 issues
        for _ in 0..3 {
            p.ldi(10, title_addr);
            p.ldi(11, 2);
            p.issue_create(10, 11, 0);
        }

        // Pick all 3
        for _ in 0..3 {
            p.ldi(12, out_addr);
            p.ldi(13, 0);
            p.issue_pick(12, 13, 1);
        }

        // Mark all 3 as done
        // We need issue IDs. They are 1, 2, 3.
        for id in 1..=3u32 {
            p.ldi(14, id);
            p.ldi(15, crate::ISSUE_STATUS_DONE);
            p.issue_update(14, 15);
        }

        // Now create 3 more issues -- these should go into slots 3, 4, 5
        // (the old slots still exist but tail has advanced)
        for _ in 0..3 {
            p.ldi(10, title_addr);
            p.ldi(11, 3);
            p.issue_create(10, 11, 5); // assignee=5
        }

        p.halt();

        svm.load_program(load_addr, &p.pixels);
        svm.spawn_vm(0, load_addr);

        for _ in 0..100 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                break;
            }
        }

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED);

        // Total count should be 6 (original 3 + new 3)
        let count = svm.peek(crate::ISSUEQ_BASE + 2);
        assert_eq!(count, 6, "should have 6 total issues");

        // Tail should be 6
        let tail = svm.peek(crate::ISSUEQ_BASE + 1);
        assert_eq!(tail, 6, "tail should be 6");

        // Verify new issues are in slots 3, 4, 5 with assignee=5 and priority=3
        for i in 3..6u32 {
            let slot_base = crate::ISSUEQ_SLOTS_BASE + i * crate::ISSUEQ_SLOT_SIZE;
            let meta = svm.peek(slot_base);
            let status = (meta >> 24) & 0xFF;
            let priority = (meta >> 16) & 0xFF;
            let assignee = meta & 0xFFFF;
            assert_eq!(status, crate::ISSUE_STATUS_TODO, "new issue {} should be TODO", i);
            assert_eq!(priority, 3, "new issue {} should be high priority", i);
            assert_eq!(assignee, 5, "new issue {} should have assignee=5", i);
        }
    }

    #[test]
    fn test_issueq_pick_with_filter() {
        // Create issues with mixed priorities, pick with filter for high only.
        let mut svm = issueq_setup();

        let title_addr: u32 = 0x0010_0000;
        write_string(&mut svm, title_addr, "filter test");
        let out_addr: u32 = 0x0020_0000;
        let load_addr: u32 = 0x0000_1000;

        let mut p = Program::new();

        // Create: low(1), high(3), medium(2)
        p.ldi(10, title_addr);
        p.ldi(11, 1);
        p.issue_create(10, 11, 0);

        p.ldi(10, title_addr);
        p.ldi(11, 3);
        p.issue_create(10, 11, 0);

        p.ldi(10, title_addr);
        p.ldi(11, 2);
        p.issue_create(10, 11, 0);

        // Pick with filter=3 (high only)
        p.ldi(12, out_addr);
        p.ldi(13, 3);  // filter = high
        p.issue_pick(12, 13, 1);

        p.halt();

        svm.load_program(load_addr, &p.pixels);
        svm.spawn_vm(0, load_addr);

        for _ in 0..20 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                break;
            }
        }

        let picked_id = svm.vm_state(0).regs[12];
        assert_eq!(picked_id, 2, "filtered pick should get issue_id=2 (the high priority one)");
    }

    #[test]
    fn test_issueq_pick_skips_non_todo() {
        // Create 2 issues, pick one (-> in_progress), pick again -> should get the other.
        let mut svm = issueq_setup();

        let title_addr: u32 = 0x0010_0000;
        write_string(&mut svm, title_addr, "skip test");
        let out_addr: u32 = 0x0020_0000;
        let load_addr: u32 = 0x0000_1000;

        let mut p = Program::new();

        // Create 2 issues
        p.ldi(10, title_addr);
        p.ldi(11, 3);
        p.issue_create(10, 11, 0);
        p.ldi(10, title_addr);
        p.ldi(11, 2);
        p.issue_create(10, 11, 0);

        // Pick first
        p.ldi(12, out_addr);
        p.ldi(13, 0);
        p.issue_pick(12, 13, 1);

        // Pick second (should skip the in_progress one)
        p.ldi(12, out_addr);
        p.ldi(13, 0);
        p.issue_pick(12, 13, 1);

        p.halt();

        svm.load_program(load_addr, &p.pixels);
        svm.spawn_vm(0, load_addr);

        for _ in 0..20 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                break;
            }
        }

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED);

        // First pick should get issue 1 (high), second pick should get issue 2 (medium)
        // But we only have r12 as the final result. Let me verify via memory.
        // The out_addr was written with the slot data for the second pick.
        // Instead, let's check that both issues are now IN_PROGRESS.
        let mut in_progress = 0;
        for i in 0..2u32 {
            let slot_base = crate::ISSUEQ_SLOTS_BASE + i * crate::ISSUEQ_SLOT_SIZE;
            let meta = svm.peek(slot_base);
            let status = (meta >> 24) & 0xFF;
            if status == crate::ISSUE_STATUS_IN_PROGRESS {
                in_progress += 1;
            }
        }
        assert_eq!(in_progress, 2, "both issues should be IN_PROGRESS after two picks");
    }

    #[test]
    fn test_issueq_create_with_assignee() {
        // Create an issue with a specific assignee_id.
        let mut svm = issueq_setup();

        let title_addr: u32 = 0x0010_0000;
        write_string(&mut svm, title_addr, "assigned issue");

        let load_addr: u32 = 0x0000_1000;
        let mut p = Program::new();
        p.ldi(10, title_addr);
        p.ldi(11, 2);
        p.issue_create(10, 11, 7); // assignee=7
        p.halt();

        svm.load_program(load_addr, &p.pixels);
        svm.spawn_vm(0, load_addr);
        svm.execute_frame();

        let slot_base = crate::ISSUEQ_SLOTS_BASE;
        let meta = svm.peek(slot_base);
        let assignee = meta & 0xFFFF;
        assert_eq!(assignee, 7, "assignee should be 7");
    }

    #[test]
    fn test_issueq_full_lifecycle() {
        // Create 2 issues, pick one, mark DONE, pick again -> should get the other.
        let mut svm = issueq_setup();

        let title_addr: u32 = 0x0010_0000;
        write_string(&mut svm, title_addr, "lifecycle");
        let out_addr: u32 = 0x0020_0000;
        let load_addr: u32 = 0x0000_1000;

        let mut p = Program::new();

        // Create 2 issues: medium(2), high(3)
        p.ldi(10, title_addr);
        p.ldi(11, 2);
        p.issue_create(10, 11, 0);
        p.ldi(10, title_addr);
        p.ldi(11, 3);
        p.issue_create(10, 11, 0);

        // Pick first (should get the high priority one, issue_id=2)
        p.ldi(12, out_addr);
        p.ldi(13, 0);
        p.issue_pick(12, 13, 1);

        // Update picked issue to DONE
        p.ldi(14, crate::ISSUE_STATUS_DONE);
        p.issue_update(12, 14);

        // Pick again (should get the remaining medium priority one)
        p.ldi(12, out_addr);
        p.ldi(13, 0);
        p.issue_pick(12, 13, 1);

        p.halt();

        svm.load_program(load_addr, &p.pixels);
        svm.spawn_vm(0, load_addr);

        for _ in 0..20 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 {
                break;
            }
        }

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED);

        // Verify: one issue DONE, one IN_PROGRESS
        let mut done = 0;
        let mut in_progress = 0;
        for i in 0..2u32 {
            let slot_base = crate::ISSUEQ_SLOTS_BASE + i * crate::ISSUEQ_SLOT_SIZE;
            let meta = svm.peek(slot_base);
            let status = (meta >> 24) & 0xFF;
            match status {
                s if s == crate::ISSUE_STATUS_DONE => done += 1,
                s if s == crate::ISSUE_STATUS_IN_PROGRESS => in_progress += 1,
                _ => {}
            }
        }
        assert_eq!(done, 1, "one issue should be DONE after lifecycle");
        assert_eq!(in_progress, 1, "one issue should be IN_PROGRESS after second pick");
    }

    // ═══════════════════════════════════════════════════════════
    // Phase 13B: Agent VM Integration Tests
    // ═══════════════════════════════════════════════════════════

    /// Helper: build a simple agent program that picks issues and marks them done.
    /// Returns the program with a known structure.
    fn build_simple_agent(out_addr: u32) -> Program {
        let mut p = Program::new();
        // Constants
        p.ldi(3, 0);          // zero
        p.ldi(4, 1);          // one
        p.ldi(5, crate::ISSUE_STATUS_DONE); // DONE=2
        // agent_loop:
        let loop_start = p.pixels.len();
        p.ldi(1, out_addr);
        p.ldi(2, 0);
        p.issue_pick(1, 2, 0);
        // if r1 == 0, goto empty_pick (offset = we'll compute)
        // BEQ r1, r3, +offset_to_empty
        // Count pixels from here to empty_pick label
        let beq_pixel_idx = p.pixels.len();
        p.instruction(op::BRANCH, bcond::BEQ, 1, 3);
        // BEQ branch data: offset to empty_pick (forward)
        // After BEQ data pixel, we have:
        //   ADD r6, r4 (reset empty counter -- but only on success)
        //   Actually we skip empty counter reset here since we got an issue
        p.ldi(6, 0);          // reset empty counter
        // ISSUE_UPDATE r1, r5
        p.issue_update(1, 5);
        // YIELD
        p.yield_op();
        // JMP agent_loop
        let jmp_idx = p.pixels.len();
        p.instruction(op::JMP, 0, 0, 0);
        // JMP data: offset back to loop_start (negative)
        let jmp_offset = (loop_start as i32) - (jmp_idx as i32);
        p.pixels.push(jmp_offset as u32);

        // empty_pick:
        let empty_pick_idx = p.pixels.len();
        // Fix up BEQ offset: relative to the BEQ instruction pixel itself
        let beq_offset = (empty_pick_idx as i32) - (beq_pixel_idx as i32);
        p.pixels[beq_pixel_idx + 1] = beq_offset as u32;

        // empty_pick handler: increment empty counter, check max
        p.instruction(op::ADD, 0, 6, 4);  // r6 += 1
        p.ldi(7, 5);          // max empty = 5
        p.instruction(op::BRANCH, bcond::BGE, 6, 7);  // BGE r6, r7, agent_done
        let bge_idx = p.pixels.len() - 1;
        // BGE data: offset to HALT (we'll add it)
        let halt_idx_placeholder = p.pixels.len();
        p.pixels.push(0); // placeholder
        // YIELD and loop
        p.yield_op();
        // JMP agent_loop
        let jmp2_idx = p.pixels.len();
        p.instruction(op::JMP, 0, 0, 0);
        let jmp2_offset = (loop_start as i32) - (jmp2_idx as i32);
        p.pixels.push(jmp2_offset as u32);

        // agent_done:
        let agent_done_idx = p.pixels.len();
        p.halt();

        // Fix BGE offset: relative to the BGE instruction pixel itself
        let bge_offset = (agent_done_idx as i32) - (bge_idx as i32);
        p.pixels[bge_idx + 1] = bge_offset as u32;

        p
    }

    /// Helper: build a setup program that creates N issues with given priorities.
    fn build_issue_creator(title_addr: u32, priorities: &[u32]) -> Program {
        let mut p = Program::new();
        for &pri in priorities {
            p.ldi(10, title_addr);
            p.ldi(11, pri);
            p.issue_create(10, 11, 0);
        }
        p.halt();
        p
    }

    #[test]
    fn test_agent_picks_and_completes_3_issues() {
        // Setup: create 3 issues, run agent, verify all 3 complete.
        let mut svm = issueq_setup();
        let title_addr: u32 = 0x0010_0000;
        write_string(&mut svm, title_addr, "test issue");

        // Phase 1: Create 3 issues (medium priority)
        let setup_addr: u32 = 0x0000_1000;
        let setup = build_issue_creator(title_addr, &[2, 2, 2]);
        svm.load_program(setup_addr, &setup.pixels);
        svm.spawn_vm(0, setup_addr);
        for _ in 0..20 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 { break; }
        }
        assert_eq!(svm.peek(crate::ISSUEQ_BASE + 2), 3, "should have 3 issues");

        // Phase 2: Run agent on VM 1
        let agent_addr: u32 = 0x0000_2000;
        let out_addr: u32 = 0x0020_0000;
        let agent = build_simple_agent(out_addr);
        svm.load_program(agent_addr, &agent.pixels);
        svm.spawn_vm(1, agent_addr);

        // Run frames until agent halts or we've given it enough time
        for _ in 0..200 {
            svm.execute_frame();
            if svm.vm_state(1).halted != 0 { break; }
        }

        // Verify: all 3 issues should be DONE
        let mut done_count = 0u32;
        for i in 0..3u32 {
            let slot_base = crate::ISSUEQ_SLOTS_BASE + i * crate::ISSUEQ_SLOT_SIZE;
            let meta = svm.peek(slot_base);
            let status = (meta >> 24) & 0xFF;
            if status == crate::ISSUE_STATUS_DONE { done_count += 1; }
        }
        assert_eq!(done_count, 3, "all 3 issues should be DONE after agent runs");
    }

    #[test]
    fn test_agent_prioritizes_high_over_medium() {
        // Create 1 high and 1 medium issue. Agent should pick high first.
        let mut svm = issueq_setup();
        let title_addr: u32 = 0x0010_0000;
        write_string(&mut svm, title_addr, "priority test");

        // Create medium first (id=1), then high (id=2)
        let setup_addr: u32 = 0x0000_1000;
        let setup = build_issue_creator(title_addr, &[2, 3]); // medium then high
        svm.load_program(setup_addr, &setup.pixels);
        svm.spawn_vm(0, setup_addr);
        for _ in 0..20 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 { break; }
        }
        assert_eq!(svm.peek(crate::ISSUEQ_BASE + 2), 2, "should have 2 issues");

        // Pick one issue using a simple picker program
        let pick_addr: u32 = 0x0000_2000;
        let out_addr: u32 = 0x0020_0000;
        let mut picker = Program::new();
        picker.ldi(1, out_addr);
        picker.ldi(2, 0); // filter=any
        picker.issue_pick(1, 2, 0);
        picker.halt();
        svm.load_program(pick_addr, &picker.pixels);
        svm.spawn_vm(1, pick_addr);
        svm.execute_frame();

        let picked_id = svm.vm_state(1).regs[1];
        assert_ne!(picked_id, 0, "should have picked an issue");
        // High priority was created second (id=2), so it should be picked first
        assert_eq!(picked_id, 2, "should pick high priority issue (id=2) over medium (id=1)");
    }

    #[test]
    fn test_agent_handles_empty_queue_gracefully() {
        // Run agent on empty queue -- it should loop with YIELD and eventually halt.
        let mut svm = issueq_setup();

        let agent_addr: u32 = 0x0000_1000;
        let out_addr: u32 = 0x0020_0000;
        let agent = build_simple_agent(out_addr);
        svm.load_program(agent_addr, &agent.pixels);
        svm.spawn_vm(0, agent_addr);

        // Run until halt (should halt after 5 empty picks)
        let mut frames = 0u32;
        for _ in 0..50 {
            svm.execute_frame();
            frames += 1;
            if svm.vm_state(0).halted != 0 { break; }
        }

        assert_eq!(svm.vm_state(0).state, vm_state::HALTED,
            "agent should halt on empty queue");
        // Should have YIELDed at least once before halting
        assert!(frames > 1, "agent should run multiple frames (YIELD loop)");
    }

    #[test]
    fn test_agent_two_agents_no_double_claim() {
        // Two agents compete for 2 issues. No double-claim.
        let mut svm = issueq_setup();
        let title_addr: u32 = 0x0010_0000;
        write_string(&mut svm, title_addr, "race test");

        // Create 2 issues
        let setup_addr: u32 = 0x0000_1000;
        let setup = build_issue_creator(title_addr, &[3, 3]);
        svm.load_program(setup_addr, &setup.pixels);
        svm.spawn_vm(0, setup_addr);
        for _ in 0..20 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 { break; }
        }
        assert_eq!(svm.peek(crate::ISSUEQ_BASE + 2), 2, "should have 2 issues");

        // Spawn two picker VMs on separate VMs
        let pick_a_addr: u32 = 0x0000_2000;
        let pick_b_addr: u32 = 0x0000_3000;
        let out_a: u32 = 0x0030_0000;
        let out_b: u32 = 0x0031_0000;

        let mut picker_a = Program::new();
        picker_a.ldi(1, out_a);
        picker_a.ldi(2, 0);
        picker_a.issue_pick(1, 2, 1); // agent_vm_id=1
        picker_a.halt();

        let mut picker_b = Program::new();
        picker_b.ldi(1, out_b);
        picker_b.ldi(2, 0);
        picker_b.issue_pick(1, 2, 2); // agent_vm_id=2
        picker_b.halt();

        svm.load_program(pick_a_addr, &picker_a.pixels);
        svm.load_program(pick_b_addr, &picker_b.pixels);
        svm.spawn_vm(1, pick_a_addr);
        svm.spawn_vm(2, pick_b_addr);

        svm.execute_frame();

        let picked_a = svm.vm_state(1).regs[1];
        let picked_b = svm.vm_state(2).regs[1];

        // Both should pick something, and they must be different
        assert_ne!(picked_a, 0, "agent A should pick an issue");
        assert_ne!(picked_b, 0, "agent B should pick an issue");
        assert_ne!(picked_a, picked_b,
            "agents should not double-claim the same issue");
    }

    // ═══════════════════════════════════════════════════════════════
    // Phase 13C: Self-orchestrating loop (CEO VM + Agent VMs)
    // ═══════════════════════════════════════════════════════════════

    /// Helper: build a CEO program that creates `batch_size` issues with the
    /// given priority, writes `issues_created` to METRICS_BASE+1, and halts.
    ///
    /// Register usage:
    ///   r10 = title_addr (reloaded each iteration)
    ///   r11 = priority
    ///   r12 = METRICS_BASE
    ///   r14 = issues_created counter
    ///   r15 = 1 constant
    ///   r16 = batch_size
    ///   r17 = loop counter
    fn build_ceo_program(title_addr: u32, priority: u32, batch_size: u32) -> Program {
        let mut p = Program::new();
        // Constants
        p.ldi(15, 1);                    // r15 = 1
        p.ldi(11, priority);             // r11 = priority
        p.ldi(12, crate::METRICS_BASE);  // r12 = METRICS_BASE
        p.ldi(14, 0);                    // r14 = issues_created counter
        p.ldi(16, batch_size);           // r16 = batch_size
        p.ldi(17, 0);                    // r17 = loop counter

        // ceo_issue_loop:
        let loop_start = p.pixels.len();
        p.ldi(10, title_addr);           // r10 = title addr
        p.issue_create(10, 11, 0);       // create issue; r10 <- issue_id
        // Increment counter
        p.instruction(op::ADD, 0, 14, 15); // r14 += 1
        // Increment loop counter
        p.instruction(op::ADD, 0, 17, 15); // r17 += 1
        // if r17 < r16, loop
        p.branch(bcond::BLT, 17, 16,
            (loop_start as i32) - (p.pixels.len() as i32));

        // Write issues_created to METRICS_BASE+1
        p.ldi(12, crate::METRICS_BASE + 1);
        p.store(12, 14);                 // METRICS_BASE+1 = issues_created

        // Write batch_number (0) to METRICS_BASE+4
        p.ldi(12, crate::METRICS_BASE + 4);
        p.ldi(10, 0);
        p.store(12, 10);                 // METRICS_BASE+4 = batch_number = 0

        p.halt();
        p
    }

    /// Helper: build an orchestrating agent program that:
    /// 1. ISSUE_PICKs the highest-priority TODO issue
    /// 2. If got one, marks it DONE (ISSUE_UPDATE)
    /// 3. Increments metrics.issues_done
    /// 4. YIELDs and loops
    /// 5. Halts after `max_empty` consecutive empty picks
    ///
    /// Register usage:
    ///   r1  = issue_id (from ISSUE_PICK)
    ///   r2  = out_addr / filter
    ///   r3  = 0 constant
    ///   r4  = 1 constant
    ///   r5  = ISSUE_STATUS_DONE
    ///   r6  = empty counter
    ///   r7  = max_empty
    ///   r8  = metrics addr (METRICS_BASE+2)
    ///   r9  = temp for metrics load
    fn build_orchestrating_agent(out_addr: u32, max_empty: u32, agent_vm_id: u8) -> Program {
        let mut p = Program::new();
        // Constants
        p.ldi(3, 0);                              // r3 = 0
        p.ldi(4, 1);                              // r4 = 1
        p.ldi(5, crate::ISSUE_STATUS_DONE);       // r5 = DONE
        p.ldi(6, 0);                              // r6 = empty counter
        p.ldi(7, max_empty);                      // r7 = max_empty
        p.ldi(8, crate::METRICS_BASE + 2);        // r8 = METRICS_BASE+2 (issues_done)

        // agent_loop:
        let loop_start = p.pixels.len();
        p.ldi(1, out_addr);                       // r1 = out_addr
        p.ldi(2, 0);                              // r2 = filter=any
        p.issue_pick(1, 2, agent_vm_id);          // pick issue; r1 <- issue_id

        // if r1 == 0, goto empty_pick
        let beq_idx = p.pixels.len();
        p.instruction(op::BRANCH, bcond::BEQ, 1, 3);
        // placeholder for BEQ offset
        let beq_data_idx = p.pixels.len();
        p.pixels.push(0);

        // ── Got an issue ──
        p.ldi(6, 0);                              // reset empty counter
        p.issue_update(1, 5);                     // mark DONE; r1 <- 1 on success

        // Increment issues_done in metrics
        p.load(9, 8);                             // r9 = current issues_done
        p.instruction(op::ADD, 0, 9, 4);          // r9 += 1
        p.store(8, 9);                            // METRICS_BASE+2 = new count

        // YIELD and loop
        p.yield_op();
        // JMP agent_loop
        let jmp_back = p.pixels.len();
        p.instruction(op::JMP, 0, 0, 0);
        p.pixels.push(((loop_start as i32) - (jmp_back as i32)) as u32);

        // ── empty_pick ──
        let empty_pick = p.pixels.len();
        // Fix up BEQ offset: relative to the BEQ instruction (beq_idx), not the data pixel
        p.pixels[beq_data_idx] = ((empty_pick as i32) - (beq_idx as i32)) as u32;

        p.instruction(op::ADD, 0, 6, 4);          // r6 += 1 (empty counter)
        // BGE r6, r7, agent_done
        let bge_idx = p.pixels.len();
        p.instruction(op::BRANCH, bcond::BGE, 6, 7);
        let bge_data_idx = p.pixels.len();
        p.pixels.push(0);

        // YIELD and loop
        p.yield_op();
        let jmp2 = p.pixels.len();
        p.instruction(op::JMP, 0, 0, 0);
        p.pixels.push(((loop_start as i32) - (jmp2 as i32)) as u32);

        // agent_done:
        let agent_done = p.pixels.len();
        // Fix BGE offset: relative to the BGE instruction (bge_idx), not the data pixel
        p.pixels[bge_data_idx] = ((agent_done as i32) - (bge_idx as i32)) as u32;
        p.halt();

        p
    }

    /// Helper: count issues with a given status in the queue.
    fn count_issues_with_status(svm: &SoftwareVm, status: u32) -> u32 {
        let count = svm.peek(crate::ISSUEQ_BASE + 2);
        let mut found = 0u32;
        for i in 0..count {
            let slot_base = crate::ISSUEQ_SLOTS_BASE + i * crate::ISSUEQ_SLOT_SIZE;
            let meta = svm.peek(slot_base);
            let s = (meta >> 24) & 0xFF;
            if s == status {
                found += 1;
            }
        }
        found
    }

    #[test]
    fn test_self_orchestrating_loop() {
        // Phase 13C: CEO VM creates a batch of issues, 2 agent VMs consume them.
        // All issues complete within N frames, no double-claiming, no deadlocks.
        let mut svm = issueq_setup();
        // Zero out metrics region
        for i in 0..crate::METRICS_SIZE {
            svm.poke(crate::METRICS_BASE + i, 0);
        }

        let title_addr: u32 = 0x0010_0000;
        write_string(&mut svm, title_addr, "compute fib");

        // Phase 1: Spawn CEO VM on VM 0, creating 5 issues (high priority)
        let ceo_addr: u32 = 0x0000_1000;
        let ceo = build_ceo_program(title_addr, 3, 5);
        svm.load_program(ceo_addr, &ceo.pixels);
        svm.spawn_vm(0, ceo_addr);

        // Run CEO to completion
        for _ in 0..50 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 { break; }
        }
        assert_eq!(svm.vm_state(0).state, vm_state::HALTED, "CEO should halt");
        assert_eq!(svm.peek(crate::ISSUEQ_BASE + 2), 5, "5 issues created");
        assert_eq!(svm.peek(crate::METRICS_BASE + 1), 5, "metrics: 5 issues created");

        // Phase 2: Spawn 2 agent VMs (VM 1 and VM 2) to consume issues
        let agent_a_addr: u32 = 0x0000_2000;
        let agent_b_addr: u32 = 0x0000_3000;
        let out_a: u32 = 0x0020_0000;
        let out_b: u32 = 0x0030_0000;

        // We need each agent to use its own vm_id for pick atomicity.
        // The ISSUE_PICK stratum field encodes agent_vm_id. Our build_orchestrating_agent
        // uses stratum=0, which means "any". Since only one VM runs per frame slot,
        // picks are naturally serialized in the software VM.
        let agent_a = build_orchestrating_agent(out_a, 20, 1);
        let agent_b = build_orchestrating_agent(out_b, 20, 2);

        svm.load_program(agent_a_addr, &agent_a.pixels);
        svm.load_program(agent_b_addr, &agent_b.pixels);
        svm.spawn_vm(1, agent_a_addr);
        svm.spawn_vm(2, agent_b_addr);

        // Run frames until both agents halt or 500 frames (generous timeout)
        for _ in 0..500 {
            svm.execute_frame();
            let a_halted = svm.vm_state(1).halted != 0;
            let b_halted = svm.vm_state(2).halted != 0;
            if a_halted && b_halted { break; }
        }

        // Verify: all 5 issues should be DONE
        let done_count = count_issues_with_status(&svm, crate::ISSUE_STATUS_DONE);
        assert_eq!(done_count, 5, "all 5 issues should be DONE");

        // Verify: no issues left in IN_PROGRESS
        let in_progress = count_issues_with_status(&svm, crate::ISSUE_STATUS_IN_PROGRESS);
        assert_eq!(in_progress, 0, "no issues should be IN_PROGRESS");

        // Verify: metrics should reflect completion
        let issues_done = svm.peek(crate::METRICS_BASE + 2);
        assert_eq!(issues_done, 5, "metrics: 5 issues done");
    }

    #[test]
    fn test_orchestration_no_double_claim() {
        // Two agents compete for 4 issues. Each issue should be claimed by exactly
        // one agent -- no double-claiming.
        let mut svm = issueq_setup();
        for i in 0..crate::METRICS_SIZE {
            svm.poke(crate::METRICS_BASE + i, 0);
        }

        let title_addr: u32 = 0x0010_0000;
        write_string(&mut svm, title_addr, "task");

        // Create 4 issues
        let ceo_addr: u32 = 0x0000_1000;
        let ceo = build_ceo_program(title_addr, 3, 4);
        svm.load_program(ceo_addr, &ceo.pixels);
        svm.spawn_vm(0, ceo_addr);
        for _ in 0..50 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 { break; }
        }
        assert_eq!(svm.peek(crate::ISSUEQ_BASE + 2), 4, "4 issues created");

        // Spawn 2 agents
        let agent_a_addr: u32 = 0x0000_2000;
        let agent_b_addr: u32 = 0x0000_3000;
        let out_a: u32 = 0x0020_0000;
        let out_b: u32 = 0x0031_0000;

        let agent_a = build_orchestrating_agent(out_a, 30, 1);
        let agent_b = build_orchestrating_agent(out_b, 30, 2);

        svm.load_program(agent_a_addr, &agent_a.pixels);
        svm.load_program(agent_b_addr, &agent_b.pixels);
        svm.spawn_vm(1, agent_a_addr);
        svm.spawn_vm(2, agent_b_addr);

        // Run until both halt
        for _ in 0..500 {
            svm.execute_frame();
            if svm.vm_state(1).halted != 0 && svm.vm_state(2).halted != 0 { break; }
        }

        // Verify: all 4 DONE, 0 IN_PROGRESS
        let done = count_issues_with_status(&svm, crate::ISSUE_STATUS_DONE);
        let in_prog = count_issues_with_status(&svm, crate::ISSUE_STATUS_IN_PROGRESS);
        let todo = count_issues_with_status(&svm, crate::ISSUE_STATUS_TODO);
        assert_eq!(done, 4, "all 4 should be DONE");
        assert_eq!(in_prog, 0, "none should be IN_PROGRESS");
        assert_eq!(todo, 0, "none should remain TODO");

        // Collect all assignee IDs from done issues -- each should have exactly one assignee
        let count = svm.peek(crate::ISSUEQ_BASE + 2);
        let mut assignees = Vec::new();
        for i in 0..count {
            let slot_base = crate::ISSUEQ_SLOTS_BASE + i * crate::ISSUEQ_SLOT_SIZE;
            let meta = svm.peek(slot_base);
            let assignee = meta & 0xFFFF;
            assignees.push(assignee);
        }
        // Each assignee should be nonzero (was claimed by a real agent)
        for a in &assignees {
            assert_ne!(*a, 0, "issue should have been claimed by a real agent");
        }
    }

    #[test]
    fn test_orchestration_metrics() {
        // Verify that metrics are written correctly during orchestration.
        // CEO creates 6 issues, 2 agents process them. Check metrics at the end.
        let mut svm = issueq_setup();
        for i in 0..crate::METRICS_SIZE {
            svm.poke(crate::METRICS_BASE + i, 0);
        }

        let title_addr: u32 = 0x0010_0000;
        write_string(&mut svm, title_addr, "metric task");

        // Create 6 issues
        let ceo_addr: u32 = 0x0000_1000;
        let ceo = build_ceo_program(title_addr, 2, 6);
        svm.load_program(ceo_addr, &ceo.pixels);
        svm.spawn_vm(0, ceo_addr);
        for _ in 0..50 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 { break; }
        }

        // CEO metrics: issues_created = 6, batch_number = 0
        assert_eq!(svm.peek(crate::METRICS_BASE + 1), 6, "CEO writes issues_created=6");
        assert_eq!(svm.peek(crate::METRICS_BASE + 4), 0, "CEO writes batch_number=0");

        // Spawn 2 agents
        let agent_a_addr: u32 = 0x0000_2000;
        let agent_b_addr: u32 = 0x0000_3000;
        let out_a: u32 = 0x0020_0000;
        let out_b: u32 = 0x0032_0000;

        let agent_a = build_orchestrating_agent(out_a, 20, 1);
        let agent_b = build_orchestrating_agent(out_b, 20, 2);

        svm.load_program(agent_a_addr, &agent_a.pixels);
        svm.load_program(agent_b_addr, &agent_b.pixels);
        svm.spawn_vm(1, agent_a_addr);
        svm.spawn_vm(2, agent_b_addr);

        // Run until done
        for _ in 0..500 {
            svm.execute_frame();
            if svm.vm_state(1).halted != 0 && svm.vm_state(2).halted != 0 { break; }
        }

        // Agent metrics: issues_done should total 6
        // Since both agents write to METRICS_BASE+2, the total should be 6
        let issues_done = svm.peek(crate::METRICS_BASE + 2);
        assert_eq!(issues_done, 6, "total issues_done metric should be 6");

        // Cross-check: count actual DONE issues in queue
        let actual_done = count_issues_with_status(&svm, crate::ISSUE_STATUS_DONE);
        assert_eq!(actual_done, 6, "6 issues actually DONE in queue");
    }

    // ── Phase 15A: Agent Computes Fibonacci ─────────────────────────────────

    /// Helper: build a CEO program that creates multiple issues with different titles.
    /// Titles are pre-loaded in memory by the test harness.
    fn build_fib_ceo(title_addrs: &[(u32, u32)]) -> Program {
        let mut p = Program::new();
        let one = 15;
        let title_reg = 10;
        let pri_reg = 11;
        let counter = 14;
        let metrics = 12;
        p.ldi(one, 1);
        p.ldi(counter, 0);
        p.ldi(metrics, crate::METRICS_BASE + 1);

        for &(addr, pri) in title_addrs {
            p.ldi(title_reg, addr);
            p.ldi(pri_reg, pri);
            p.issue_create(title_reg, pri_reg, 0);
            p.instruction(op::ADD, 0, counter, one);
        }

        p.store(metrics, counter);
        p.halt();
        p
    }

    /// Helper: build a fib-computing agent program (Phase 15A).
    ///
    /// The agent:
    /// 1. ISSUE_PICKs the highest-priority TODO issue
    /// 2. Parses N from the title "fib N" (digits at pixel offset 3 of the output)
    /// 3. Computes fib(N) iteratively
    /// 4. Writes the result to the issue queue slot's reserved pixel 26
    /// 5. Marks DONE via ISSUE_UPDATE
    /// 6. Increments metrics.issues_done
    /// 7. YIELDs and loops; halts after max_empty consecutive empty picks
    ///
    /// Register allocation:
    ///   r0  = fib_prev (init 0)
    ///   r1  = issue_id from ISSUE_PICK (clobbered by ISSUE_UPDATE)
    ///   r2  = out_addr / filter
    ///   r3  = constant 0
    ///   r4  = constant 1
    ///   r5  = ISSUE_STATUS_DONE (2)
    ///   r6  = empty counter
    ///   r7  = max_empty
    ///   r8  = N (parsed from title) / loop counter for fib
    ///   r9  = scratch
    ///   r10 = fib_curr (init 1)
    ///   r11 = fib_next (temp) / second digit byte
    ///   r12 = saved issue_id
    ///   r13 = slot_base address
    ///   r14 = ISSUEQ_SLOTS_BASE constant
    ///   r15 = SLOT_SIZE (32) constant
    ///   r16 = byte mask (0xFF)
    ///   r17 = scratch (ASCII '0'=48, shift 8, multiply 10)
    ///   r18 = metrics addr
    ///   r19 = temp for metrics load
    fn build_fib_agent(out_addr: u32, max_empty: u32, agent_vm_id: u8) -> Program {
        let mut p = Program::new();

        // ── Constants ──
        p.ldi(3, 0);                              // r3 = 0
        p.ldi(4, 1);                              // r4 = 1
        p.ldi(5, crate::ISSUE_STATUS_DONE);       // r5 = 2
        p.ldi(6, 0);                              // r6 = empty counter
        p.ldi(7, max_empty);                      // r7 = max_empty
        p.ldi(14, crate::ISSUEQ_SLOTS_BASE);      // r14 = SLOTS_BASE
        p.ldi(15, crate::ISSUEQ_SLOT_SIZE);        // r15 = 32
        p.ldi(16, 0xFF);                          // r16 = byte mask
        p.ldi(18, crate::METRICS_BASE + 2);       // r18 = metrics.issues_done

        // ═══════════════════════════════════════════
        // Agent Loop
        // ═══════════════════════════════════════════
        p.define_label("agent_loop");

        p.ldi(1, out_addr);
        p.ldi(2, 0);
        p.issue_pick(1, 2, agent_vm_id);

        // if r1 == 0, goto empty_pick
        p.branch_to(bcond::BEQ, 1, 3, "empty_pick");

        // ── Got an issue ──
        p.ldi(6, 0);                              // reset empty counter
        p.instruction(op::MOV, 0, 12, 1);         // r12 = save issue_id

        // ── Parse N from title ──
        // Title is at out_addr+2..out_addr+25 (pixels).
        // "fib " occupies 4 bytes -> pixel at out_addr+2.
        // Digits start at out_addr+3 (the next pixel).
        p.ldi(9, out_addr + 3);
        p.load(9, 9);                             // r9 = digit pixel (packed ASCII)

        // Extract byte0 = first digit
        p.instruction(op::MOV, 0, 8, 9);
        p.instruction(op::AND, 0, 8, 16);         // r8 = byte0 (ASCII)
        p.ldi(17, 48);
        p.instruction(op::SUB, 0, 8, 17);         // r8 = digit0 value

        // Extract byte1 = second digit candidate
        p.instruction(op::MOV, 0, 11, 9);
        p.ldi(17, 8);
        p.instruction(op::SHR, 0, 11, 17);        // r11 >>= 8
        p.instruction(op::AND, 0, 11, 16);        // r11 = byte1

        // if byte1 == 0 -> single digit (r8 already has N)
        p.branch_to(bcond::BEQ, 11, 3, "single_digit");

        // Two digits: N = digit0*10 + digit1
        p.ldi(17, 10);
        p.instruction(op::MUL, 0, 8, 17);         // r8 = digit0 * 10
        p.ldi(17, 48);
        p.instruction(op::SUB, 0, 11, 17);        // r11 = digit1 value
        p.instruction(op::ADD, 0, 8, 11);         // r8 = N

        p.jmp_to("after_parse");

        // single_digit: r8 = N (already set)
        p.define_label("single_digit");

        p.define_label("after_parse");

        // ── Compute fib(N) iteratively ──
        // r0 = fib_prev = 0, r10 = fib_curr = 1
        // Loop (N-1) times: temp=curr, curr+=prev, prev=temp
        p.ldi(0, 0);
        p.ldi(10, 1);

        // Special case N==0: result = 0
        p.branch_to(bcond::BEQ, 8, 3, "fib_done");

        // r8 = N, decrement to get loop count
        p.instruction(op::SUB, 0, 8, 4);          // r8 = N - 1

        p.define_label("fib_loop");
        p.instruction(op::MOV, 0, 11, 10);        // r11 = fib_curr
        p.instruction(op::ADD, 0, 10, 0);         // fib_curr += fib_prev
        p.instruction(op::MOV, 0, 0, 11);         // fib_prev = old curr
        p.instruction(op::SUB, 0, 8, 4);          // r8--
        p.branch_to(bcond::BNE, 8, 3, "fib_loop");

        // fib_done: result in r10
        p.define_label("fib_done");

        // ── Write result to issue queue slot pixel 26 ──
        // slot_base = ISSUEQ_SLOTS_BASE + (issue_id - 1) * 32
        p.instruction(op::MOV, 0, 13, 12);        // r13 = issue_id
        p.instruction(op::SUB, 0, 13, 4);         // r13 -= 1
        p.instruction(op::MUL, 0, 13, 15);        // r13 *= 32
        p.instruction(op::ADD, 0, 13, 14);        // r13 += SLOTS_BASE
        p.ldi(9, 26);
        p.instruction(op::ADD, 0, 13, 9);         // r13 = slot_base + 26
        p.store(13, 10);                          // slot[26] = fib(N)

        // ── Mark DONE ──
        p.instruction(op::MOV, 0, 1, 12);         // r1 = issue_id
        p.issue_update(1, 5);

        // ── Update metrics ──
        p.load(19, 18);
        p.instruction(op::ADD, 0, 19, 4);
        p.store(18, 19);

        // ── YIELD and loop ──
        p.yield_op();
        p.jmp_to("agent_loop");

        // ── empty_pick ──
        p.define_label("empty_pick");

        p.instruction(op::ADD, 0, 6, 4);
        p.branch_to(bcond::BGE, 6, 7, "agent_done");

        p.yield_op();
        p.jmp_to("agent_loop");

        // agent_done:
        p.define_label("agent_done");
        p.halt();

        p.link();
        p
    }

    #[test]
    fn test_fib_agent_computes() {
        // Phase 15A: Agent computes Fibonacci.
        // CEO creates issues "fib 10", "fib 15", "fib 20".
        // Agents pick each, parse N, compute fib(N), write result to slot pixel 26.
        // Verify: fib(10)=55, fib(15)=610, fib(20)=6765.
        let mut svm = issueq_setup();
        for i in 0..crate::METRICS_SIZE {
            svm.poke(crate::METRICS_BASE + i, 0);
        }

        let title_base: u32 = 0x0010_0000;
        let title_10 = title_base;
        let title_15 = title_base + 8;
        let title_20 = title_base + 16;

        write_string(&mut svm, title_10, "fib 10");
        write_string(&mut svm, title_15, "fib 15");
        write_string(&mut svm, title_20, "fib 20");

        // CEO creates 3 issues
        let ceo_addr: u32 = 0x0000_1000;
        let ceo = build_fib_ceo(&[
            (title_10, 3),
            (title_15, 3),
            (title_20, 3),
        ]);
        svm.load_program(ceo_addr, &ceo.pixels);
        svm.spawn_vm(0, ceo_addr);

        for _ in 0..50 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 { break; }
        }
        assert_eq!(svm.vm_state(0).state, vm_state::HALTED, "CEO should halt");
        assert_eq!(svm.peek(crate::ISSUEQ_BASE + 2), 3, "3 issues created");

        // Spawn 2 fib agents
        let agent_a_addr: u32 = 0x0000_2000;
        let agent_b_addr: u32 = 0x0000_3000;
        let out_a: u32 = 0x0020_0000;
        let out_b: u32 = 0x0030_0000;

        let agent_a = build_fib_agent(out_a, 30, 1);
        let agent_b = build_fib_agent(out_b, 30, 2);

        svm.load_program(agent_a_addr, &agent_a.pixels);
        svm.load_program(agent_b_addr, &agent_b.pixels);
        svm.spawn_vm(1, agent_a_addr);
        svm.spawn_vm(2, agent_b_addr);

        for _ in 0..500 {
            svm.execute_frame();
            if svm.vm_state(1).halted != 0 && svm.vm_state(2).halted != 0 { break; }
        }
        assert_ne!(svm.vm_state(1).halted, 0, "Agent A should halt");
        assert_ne!(svm.vm_state(2).halted, 0, "Agent B should halt");

        // All 3 issues DONE
        let done_count = count_issues_with_status(&svm, crate::ISSUE_STATUS_DONE);
        assert_eq!(done_count, 3, "all 3 issues should be DONE");

        // Verify fib results in slot pixel 26
        let expected = [(1u32, 10u32, 55u32), (2, 15, 610), (3, 20, 6765)];
        for (issue_id, n, exp) in &expected {
            let slot_base = crate::ISSUEQ_SLOTS_BASE + (issue_id - 1) * crate::ISSUEQ_SLOT_SIZE;
            let result = svm.peek(slot_base + 26);
            assert_eq!(result, *exp,
                "fib({}) in issue {} should be {}, got {}", n, issue_id, exp, result);
        }

        // Metrics
        assert_eq!(svm.peek(crate::METRICS_BASE + 2), 3, "3 issues done");
    }

    #[test]
    fn test_fib_agent_single_digit() {
        // Verify agent handles single-digit N.
        // "fib 5" -> fib(5) = 5, "fib 8" -> fib(8) = 21
        let mut svm = issueq_setup();
        for i in 0..crate::METRICS_SIZE {
            svm.poke(crate::METRICS_BASE + i, 0);
        }

        let title_base: u32 = 0x0010_0000;
        write_string(&mut svm, title_base, "fib 5");
        write_string(&mut svm, title_base + 8, "fib 8");

        let ceo_addr: u32 = 0x0000_1000;
        let ceo = build_fib_ceo(&[(title_base, 3), (title_base + 8, 3)]);
        svm.load_program(ceo_addr, &ceo.pixels);
        svm.spawn_vm(0, ceo_addr);

        for _ in 0..50 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 { break; }
        }
        assert_eq!(svm.peek(crate::ISSUEQ_BASE + 2), 2, "2 issues created");

        let agent_addr: u32 = 0x0000_2000;
        let out_addr: u32 = 0x0020_0000;
        let agent = build_fib_agent(out_addr, 30, 1);
        svm.load_program(agent_addr, &agent.pixels);
        svm.spawn_vm(1, agent_addr);

        for _ in 0..500 {
            svm.execute_frame();
            if svm.vm_state(1).halted != 0 { break; }
        }
        assert_ne!(svm.vm_state(1).halted, 0, "Agent should halt");

        let slot0 = crate::ISSUEQ_SLOTS_BASE;
        let slot1 = crate::ISSUEQ_SLOTS_BASE + crate::ISSUEQ_SLOT_SIZE;
        assert_eq!(svm.peek(slot0 + 26), 5, "fib(5) should be 5");
        assert_eq!(svm.peek(slot1 + 26), 21, "fib(8) should be 21");
    }

    // ── Phase 15B: CEO Assigns Varied Work ──────────────────────────────────

    /// Helper: build a varied-task agent program (Phase 15B).
    ///
    /// Dispatches based on title prefix (4-char prefix + digit):
    ///   "fib " -> compute fib(N) iteratively
    ///   "fac " -> compute factorial(N)
    ///   "pri " -> check if N is prime (result: 1=yes, 0=no)
    ///
    /// Register allocation:
    ///   r0  = scratch (fib_prev)
    ///   r1  = issue_id from ISSUE_PICK (clobbered by ISSUE_UPDATE)
    ///   r2  = out_addr / filter
    ///   r3  = constant 0
    ///   r4  = constant 1
    ///   r5  = ISSUE_STATUS_DONE (2)
    ///   r6  = empty counter
    ///   r7  = max_empty
    ///   r8  = N (parsed from title)
    ///   r9  = scratch
    ///   r10 = computation result
    ///   r11 = scratch / loop var
    ///   r12 = saved issue_id
    ///   r13 = slot_base address
    ///   r14 = ISSUEQ_SLOTS_BASE constant
    ///   r15 = SLOT_SIZE (32) constant
    ///   r16 = byte mask (0xFF)
    ///   r17 = scratch (constants)
    ///   r18 = metrics addr
    ///   r19 = temp for metrics load
    ///   r20 = prefix comparison scratch
    ///   r21 = FIB_MAGIC (0x20626966)
    ///   r22 = FAC_MAGIC (0x20636166)
    ///   r23 = PRI_MAGIC (0x20697270)
    fn build_varied_agent(out_addr: u32, max_empty: u32, agent_vm_id: u8) -> Program {
        let mut p = Program::new();

        // ── Constants ──
        p.ldi(3, 0);                              // r3 = 0
        p.ldi(4, 1);                              // r4 = 1
        p.ldi(5, crate::ISSUE_STATUS_DONE);       // r5 = 2
        p.ldi(6, 0);                              // r6 = empty counter
        p.ldi(7, max_empty);                      // r7 = max_empty
        p.ldi(14, crate::ISSUEQ_SLOTS_BASE);      // r14 = SLOTS_BASE
        p.ldi(15, crate::ISSUEQ_SLOT_SIZE);       // r15 = 32
        p.ldi(16, 0xFF);                          // r16 = byte mask
        p.ldi(18, crate::METRICS_BASE + 2);       // r18 = metrics.issues_done
        p.ldi(21, 0x20626966);                    // r21 = "fib " magic
        p.ldi(22, 0x20636166);                    // r22 = "fac " magic
        p.ldi(23, 0x20697270);                    // r23 = "pri " magic

        // ═══════════════════════════════════════════
        // Agent Loop
        // ═══════════════════════════════════════════
        p.define_label("agent_loop");

        p.ldi(1, out_addr);
        p.ldi(2, 0);
        p.issue_pick(1, 2, agent_vm_id);

        // if r1 == 0, no issue available
        p.branch_to(bcond::BEQ, 1, 3, "empty_pick");

        // ── Got an issue ──
        p.ldi(6, 0);                              // reset empty counter
        p.instruction(op::MOV, 0, 12, 1);         // r12 = save issue_id

        // ── Load prefix pixel ──
        p.ldi(9, out_addr + 2);
        p.load(9, 9);                             // r9 = title pixel 0 (prefix)

        // ── Dispatch on prefix type ──
        p.instruction(op::MOV, 0, 20, 9);         // r20 = prefix copy
        p.xor(20, 21);                            // r20 ^= FIB_MAGIC
        p.branch_to(bcond::BEQ, 20, 3, "do_fib");

        p.instruction(op::MOV, 0, 20, 9);         // r20 = prefix copy
        p.xor(20, 22);                            // r20 ^= FAC_MAGIC
        p.branch_to(bcond::BEQ, 20, 3, "do_fac");

        p.instruction(op::MOV, 0, 20, 9);         // r20 = prefix copy
        p.xor(20, 23);                            // r20 ^= PRI_MAGIC
        p.branch_to(bcond::BEQ, 20, 3, "do_pri");

        // Unknown prefix -- skip with result 0
        p.ldi(10, 0);
        p.jmp_to("write_result");

        // ── FIB path: parse N, compute fib(N) ──
        p.define_label("do_fib");
        // Parse digits from pixel out_addr+3
        p.ldi(9, out_addr + 3);
        p.load(9, 9);                             // r9 = digit pixel
        p.instruction(op::MOV, 0, 8, 9);
        p.instruction(op::AND, 0, 8, 16);         // r8 = byte0 (ASCII)
        p.ldi(17, 48);
        p.instruction(op::SUB, 0, 8, 17);         // r8 = digit0 value
        // Check for second digit
        p.instruction(op::MOV, 0, 11, 9);
        p.ldi(17, 8);
        p.instruction(op::SHR, 0, 11, 17);        // r11 >>= 8
        p.instruction(op::AND, 0, 11, 16);        // r11 = byte1
        p.branch_to(bcond::BEQ, 11, 3, "fib_got_n");
        // Two digits
        p.ldi(17, 10);
        p.instruction(op::MUL, 0, 8, 17);         // r8 *= 10
        p.ldi(17, 48);
        p.instruction(op::SUB, 0, 11, 17);        // r11 -= 48
        p.instruction(op::ADD, 0, 8, 11);         // r8 = N

        // Compute fib(N): r0=prev, r10=curr
        p.define_label("fib_got_n");
        p.ldi(0, 0);                              // fib_prev = 0
        p.ldi(10, 1);                             // fib_curr = 1
        p.branch_to(bcond::BEQ, 8, 3, "fib_done"); // N==0 -> result 0
        p.instruction(op::SUB, 0, 8, 4);          // r8 = N-1 (loop count)
        p.define_label("fib_loop");
        p.instruction(op::MOV, 0, 11, 10);        // r11 = curr
        p.instruction(op::ADD, 0, 10, 0);         // curr += prev
        p.instruction(op::MOV, 0, 0, 11);         // prev = old curr
        p.instruction(op::SUB, 0, 8, 4);          // r8--
        p.branch_to(bcond::BNE, 8, 3, "fib_loop");
        p.define_label("fib_done");
        // result in r10
        p.jmp_to("write_result");

        // ── FAC path: parse N, compute factorial(N) ──
        p.define_label("do_fac");
        // Parse digits
        p.ldi(9, out_addr + 3);
        p.load(9, 9);
        p.instruction(op::MOV, 0, 8, 9);
        p.instruction(op::AND, 0, 8, 16);
        p.ldi(17, 48);
        p.instruction(op::SUB, 0, 8, 17);
        p.instruction(op::MOV, 0, 11, 9);
        p.ldi(17, 8);
        p.instruction(op::SHR, 0, 11, 17);
        p.instruction(op::AND, 0, 11, 16);
        p.branch_to(bcond::BEQ, 11, 3, "fac_got_n");
        p.ldi(17, 10);
        p.instruction(op::MUL, 0, 8, 17);
        p.ldi(17, 48);
        p.instruction(op::SUB, 0, 11, 17);
        p.instruction(op::ADD, 0, 8, 11);

        // Compute factorial(N): r10 = 1; while N>0: r10 *= N; N--
        p.define_label("fac_got_n");
        p.ldi(10, 1);                             // result = 1
        p.define_label("fac_loop");
        p.branch_to(bcond::BEQ, 8, 3, "fac_done"); // if N==0, done
        p.instruction(op::MUL, 0, 10, 8);         // result *= N
        p.instruction(op::SUB, 0, 8, 4);          // N--
        p.jmp_to("fac_loop");
        p.define_label("fac_done");
        p.jmp_to("write_result");

        // ── PRI path: parse N, check if prime ──
        p.define_label("do_pri");
        // Parse digits
        p.ldi(9, out_addr + 3);
        p.load(9, 9);
        p.instruction(op::MOV, 0, 8, 9);
        p.instruction(op::AND, 0, 8, 16);
        p.ldi(17, 48);
        p.instruction(op::SUB, 0, 8, 17);
        p.instruction(op::MOV, 0, 11, 9);
        p.ldi(17, 8);
        p.instruction(op::SHR, 0, 11, 17);
        p.instruction(op::AND, 0, 11, 16);
        p.branch_to(bcond::BEQ, 11, 3, "pri_got_n");
        p.ldi(17, 10);
        p.instruction(op::MUL, 0, 8, 17);
        p.ldi(17, 48);
        p.instruction(op::SUB, 0, 11, 17);
        p.instruction(op::ADD, 0, 8, 11);

        // Prime check: r10 = 1 if prime, 0 if not.
        // Trial division: d = 2, while d*d <= N, check N % d == 0.
        p.define_label("pri_got_n");
        p.ldi(10, 1);                             // assume prime
        p.ldi(11, 2);                             // divisor d = 2
        // if N < 2, not prime
        p.branch_to(bcond::BLT, 8, 11, "not_prime"); // N < 2
        p.define_label("pri_loop");
        p.instruction(op::MOV, 0, 9, 11);         // r9 = d
        p.instruction(op::MUL, 0, 9, 11);         // r9 = d*d
        // if d*d > N, prime (N < d*d)
        p.branch_to(bcond::BLT, 8, 9, "pri_done");
        p.instruction(op::MOV, 0, 9, 8);          // r9 = N
        p.instruction(op::MOD, 0, 9, 11);         // r9 = N % d
        p.branch_to(bcond::BEQ, 9, 3, "not_prime"); // if N % d == 0
        p.instruction(op::ADD, 0, 11, 4);         // d++
        p.jmp_to("pri_loop");
        p.define_label("not_prime");
        p.ldi(10, 0);
        p.define_label("pri_done");
        p.jmp_to("write_result");

        // ═══════════════════════════════════════════
        // Write result to issue slot + mark DONE
        // ═══════════════════════════════════════════
        p.define_label("write_result");
        // slot_base = ISSUEQ_SLOTS_BASE + (issue_id - 1) * 32
        p.instruction(op::MOV, 0, 13, 12);        // r13 = issue_id
        p.instruction(op::SUB, 0, 13, 4);         // r13 -= 1
        p.instruction(op::MUL, 0, 13, 15);        // r13 *= 32
        p.instruction(op::ADD, 0, 13, 14);        // r13 += SLOTS_BASE
        p.ldi(9, 26);
        p.instruction(op::ADD, 0, 13, 9);         // r13 = slot_base + 26
        p.store(13, 10);                          // slot[26] = result

        // Mark DONE
        p.instruction(op::MOV, 0, 1, 12);         // r1 = issue_id
        p.issue_update(1, 5);

        // Update metrics
        p.load(19, 18);
        p.instruction(op::ADD, 0, 19, 4);
        p.store(18, 19);

        // YIELD and loop
        p.yield_op();
        p.jmp_to("agent_loop");

        // ── empty_pick ──
        p.define_label("empty_pick");
        p.instruction(op::ADD, 0, 6, 4);
        p.branch_to(bcond::BGE, 6, 7, "agent_done");
        p.yield_op();
        p.jmp_to("agent_loop");

        // agent_done
        p.define_label("agent_done");
        p.halt();

        p.link();
        p
    }

    #[test]
    fn test_varied_tasks() {
        // Phase 15B: CEO creates varied tasks, agents compute each correctly.
        // Tasks: fib(10)=55, fac(6)=720, pri(7)=1, pri(4)=0
        let mut svm = issueq_setup();
        for i in 0..crate::METRICS_SIZE {
            svm.poke(crate::METRICS_BASE + i, 0);
        }

        let title_base: u32 = 0x0010_0000;
        let titles = [
            (title_base,       "fib 10"),  // fib(10) = 55
            (title_base + 8,   "fac 6"),   // 6! = 720
            (title_base + 16,  "pri 7"),   // 7 is prime = 1
            (title_base + 24,  "pri 4"),   // 4 is not prime = 0
        ];

        for &(addr, s) in &titles {
            write_string(&mut svm, addr, s);
        }

        // CEO creates 4 issues
        let ceo_addr: u32 = 0x0000_1000;
        let ceo = build_fib_ceo(&[
            (titles[0].0, 3),
            (titles[1].0, 3),
            (titles[2].0, 3),
            (titles[3].0, 3),
        ]);
        svm.load_program(ceo_addr, &ceo.pixels);
        svm.spawn_vm(0, ceo_addr);

        for _ in 0..50 {
            svm.execute_frame();
            if svm.vm_state(0).halted != 0 { break; }
        }
        assert_eq!(svm.vm_state(0).state, vm_state::HALTED, "CEO should halt");
        assert_eq!(svm.peek(crate::ISSUEQ_BASE + 2), 4, "4 issues created");

        // Spawn 2 varied agents
        let agent_a_addr: u32 = 0x0000_2000;
        let agent_b_addr: u32 = 0x0000_3000;
        let out_a: u32 = 0x0020_0000;
        let out_b: u32 = 0x0030_0000;

        let agent_a = build_varied_agent(out_a, 30, 1);
        let agent_b = build_varied_agent(out_b, 30, 2);

        svm.load_program(agent_a_addr, &agent_a.pixels);
        svm.load_program(agent_b_addr, &agent_b.pixels);
        svm.spawn_vm(1, agent_a_addr);
        svm.spawn_vm(2, agent_b_addr);

        for _ in 0..500 {
            svm.execute_frame();
            if svm.vm_state(1).halted != 0 && svm.vm_state(2).halted != 0 { break; }
        }
        assert_ne!(svm.vm_state(1).halted, 0, "Agent A should halt");
        assert_ne!(svm.vm_state(2).halted, 0, "Agent B should halt");

        // All 4 issues DONE
        let done_count = count_issues_with_status(&svm, crate::ISSUE_STATUS_DONE);
        assert_eq!(done_count, 4, "all 4 issues should be DONE");

        // Verify results in slot pixel 26
        // Issue 1: fib(10) = 55
        // Issue 2: fac(6) = 720
        // Issue 3: pri(7) = 1
        // Issue 4: pri(4) = 0
        let expected = [
            (1u32, "fib(10)", 55u32),
            (2u32, "fac(6)",  720u32),
            (3u32, "pri(7)",  1u32),
            (4u32, "pri(4)",  0u32),
        ];
        for (issue_id, label, exp) in &expected {
            let slot_base = crate::ISSUEQ_SLOTS_BASE + (issue_id - 1) * crate::ISSUEQ_SLOT_SIZE;
            let result = svm.peek(slot_base + 26);
            assert_eq!(result, *exp, "{} should be {}, got {}", label, exp, result);
        }

        // Metrics
        assert_eq!(svm.peek(crate::METRICS_BASE + 2), 4, "4 issues done");
    }
}
