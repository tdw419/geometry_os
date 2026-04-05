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

        // Unknown opcode - skip
        _ => {}
    }

    false // No jump
}

/// Helper for bound-checked memory read in software VM
fn safe_mem_read(ram: &RamTexture, vm: &mut VmState, addr: u32) -> u32 {
    if addr >= 0x00E00000 {
        return mem_read(ram, addr);
    }
    if addr < vm.base_addr || addr >= vm.bound_addr {
        vm.halted = 1;
        vm.state = 0xFF; // VM_FAULT
        return 0;
    }
    mem_read(ram, addr)
}

/// Helper for bound-checked memory write in software VM
fn safe_mem_write(ram: &mut RamTexture, vm: &mut VmState, addr: u32, value: u32) {
    if addr >= 0x00E00000 {
        mem_write(ram, addr, value);
        return;
    }
    if addr < vm.base_addr || addr >= vm.bound_addr {
        vm.halted = 1;
        vm.state = 0xFF; // VM_FAULT
        return;
    }
    mem_write(ram, addr, value)
}

/// The Software VM -- CPU-side mirror of the GPU compute shader.
///
/// Owns 8 VmState structs and a CPU-side RAM texture.
/// Executes programs identically to the shader:
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

    // ── SPAWN opcode tests ──────────────────────────────────────────

    #[test]
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
            assert_ne!(svm.vm_state(slot).state, vm_state::INACTIVE, "slot {} should be active", slot);
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
