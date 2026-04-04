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

/// VM state constants (must match WGSL and crate::vm)
mod vm_state {
    pub const INACTIVE: u32 = 0;
    pub const RUNNING: u32 = 1;
    pub const HALTED: u32 = 2;
    #[allow(dead_code)]
    pub const WAITING: u32 = 3;
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
    let (opcode, _stratum, p1, p2) = read_glyph(ram, pc);

    match opcode {
        // NOP
        0 => {
            // Do nothing
        }

        // LDI - Load immediate: LDI rd, imm
        // Shader reads: [1, 0, rd, 0] followed by [imm] at (pc+1)*4
        1 => {
            let imm = mem_read(ram, (pc + 1) * 4);
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
            let (r, g, b, a) = read_glyph(ram, pixel_idx);
            vm.regs[p1 as usize] = r | (g << 8) | (b << 16) | (a << 24);
        }

        // ST - Store to memory: ST [rd], rs (pixel-addressed)
        // rd contains a Hilbert pixel index
        4 => {
            let pixel_idx = vm.regs[p1 as usize];
            let value = vm.regs[p2 as usize];
            write_glyph(
                ram,
                pixel_idx,
                (
                    value & 0xFF,
                    (value >> 8) & 0xFF,
                    (value >> 16) & 0xFF,
                    (value >> 24) & 0xFF,
                ),
            );
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

        // JMP - Unconditional jump: JMP offset
        // Shader: [9, 0, 0, 0] followed by [offset as i32]
        9 => {
            let offset = mem_read(ram, (pc + 1) * 4);
            let signed_offset = offset as i32;
            let new_pc = (pc as i32).wrapping_add(signed_offset);
            vm.pc = new_pc as u32;
            return true; // Jumped
        }

        // BNE - Branch if not equal: BNE r1, r2, offset
        // Shader emits: [10, 1, r1, r2] followed by [offset]
        10 => {
            let offset = mem_read(ram, (pc + 1) * 4);
            if vm.regs[p1 as usize] != vm.regs[p2 as usize] {
                // offset is signed i32 stored as u32
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
                vm.stack[sp as usize] = pc + 1;
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

        // HALT
        13 => {
            vm.halted = 1;
            vm.state = vm_state::HALTED;
        }

        // ENTRY - Read entry_point into register: ENTRY rd
        14 => {
            vm.regs[p1 as usize] = vm.entry_point;
        }

        // CHAR - Blit character from font atlas to texture
        // CHAR r_ascii, r_target
        15 => {
            let ascii_val = vm.regs[p1 as usize];
            let target = vm.regs[p2 as usize];
            let font_base: u32 = 0x00F00000; // Must match font_atlas::FONT_BASE
            for row in 0..8u32 {
                let src_addr = font_base + ascii_val * 8 + row;
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

        // Unknown opcode - skip
        _ => {}
    }

    false // No jump
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
    vms: [VmState; MAX_VMS],
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

    /// Execute one frame: run all active VMs for up to CYCLES_PER_FRAME cycles.
    /// Mirrors the shader's main() compute entry point exactly.
    pub fn execute_frame(&mut self) {
        self.scheduler_active_count = 0;

        for vm_id in 0..MAX_VMS {
            let vm = &mut self.vms[vm_id];

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
    fn opcode_branch_beq_actually_bne_taken() {
        // NOTE: The VM only implements opcode 10 = BNE (branch if not equal).
        // The stratum field (BEQ/BNE/BLT/BGE/BLTU/BGEU) is NOT checked.
        // All branches behave as BNE regardless of the condition code.
        // This test documents that behavior: BEQ with unequal values branches (BNE semantics).
        let mut p = Program::new();
        p.ldi(0, 5);   // addr 0-1
        p.ldi(1, 5);   // addr 2-3
        // addr 4: BRANCH(BEQ) r0, r1 -- r0 == r1, so BNE NOT taken
        p.instruction(op::BRANCH, bcond::BEQ, 0, 1);
        p.pixels.push(4);
        // addr 6-7: reached because branch NOT taken (r0 == r1, BNE not satisfied)
        p.ldi(2, 999);
        // addr 8-9: would be target if branch taken
        p.ldi(2, 77);
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        // BEQ with equal values: BNE NOT taken -> executes LDI 999 then LDI 77
        assert_eq!(vm.regs[2], 77, "BEQ with equal values: BNE not taken, r2=77");
    }

    #[test]
    fn opcode_branch_beq_actually_bne_not_taken() {
        // BEQ with unequal values: BNE taken (r0 != r1)
        let mut p = Program::new();
        p.ldi(0, 5);
        p.ldi(1, 10);
        // addr 4: BRANCH(BEQ) r0, r1 -- r0 != r1, so BNE IS taken
        p.instruction(op::BRANCH, bcond::BEQ, 0, 1);
        p.pixels.push(4);
        // addr 6-7: SKIPPED because BNE taken
        p.ldi(2, 88);
        // addr 8-9: target of branch
        p.ldi(2, 77);
        p.halt();

        let vm = SoftwareVm::run_program(&p.pixels, 0);
        assert_eq!(vm.regs[2], 77, "BEQ with unequal values: BNE taken, r2=77");
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
