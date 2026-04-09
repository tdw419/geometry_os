// ═══════════════════════════════════════════════════════════════════════
// GEOMETRY OS VIRTUAL MACHINE
//
// Pixel-composition execution model:
// - Memory is a flat array of u32 pixels (colors).
// - The VM reads the first pixel of an instruction to get the opcode.
// - It then reads the next (width-1) pixels as arguments.
// - PC advances by width.
//
// Example: ADD r0, r1
//   ram[pc+0] = 0x41 ('A') → opcode ADD (width 3)
//   ram[pc+1] = 0x30 ('0') → arg: r0
//   ram[pc+2] = 0x31 ('1') → arg: r1
//   pc += 3
//
// The pixel values ARE the argument values. Register indices, immediate
// values, addresses -- all are just the color value of the argument pixel.
// ═══════════════════════════════════════════════════════════════════════

use crate::opcodes;
use crate::opcodes::op;

const NUM_REGS: usize = 32;
const STACK_SIZE: usize = 256;
pub const MAX_CYCLES: u32 = 4096;

/// A child VM spawned by Q (SPAWN) or Z (SPATIAL_SPAWN).
#[derive(Debug, Clone)]
pub struct ChildVm {
    pub start_addr: u32,
    pub arg: u32,
}

/// The VM.
#[derive(Debug)]
pub struct Vm {
    pub ram: Vec<u32>,
    pub regs: [u32; NUM_REGS],
    pub pc: u32,
    pub stack: Vec<u32>,
    pub halted: bool,
    pub yielded: bool,
    pub children: Vec<ChildVm>,
    pub screen: Vec<u32>, // 256x256
}

impl Vm {
    pub fn new(ram_size: usize) -> Self {
        Self {
            ram: vec![0; ram_size],
            regs: [0; NUM_REGS],
            pc: 0,
            stack: Vec::with_capacity(STACK_SIZE),
            halted: false,
            yielded: false,
            children: Vec::new(),
            screen: vec![0; 256 * 256],
        }
    }

    /// Load pixels into RAM at a given offset.
    pub fn load(&mut self, offset: usize, pixels: &[u32]) {
        let end = offset + pixels.len();
        if end > self.ram.len() {
            self.ram.resize(end, 0);
        }
        self.ram[offset..end].copy_from_slice(pixels);
    }

    /// Load a program starting at address 0.
    pub fn load_program(&mut self, pixels: &[u32]) {
        self.load(0, pixels);
        self.pc = 0;
        self.halted = false;
        self.yielded = false;
    }

    pub fn poke(&mut self, addr: usize, value: u32) {
        if addr >= self.ram.len() {
            self.ram.resize(addr + 1, 0);
        }
        self.ram[addr] = value;
    }

    pub fn peek(&self, addr: usize) -> u32 {
        self.ram.get(addr).copied().unwrap_or(0)
    }

    /// Run until halted, yielded, or MAX_CYCLES. Returns cycles executed.
    pub fn run(&mut self) -> u32 {
        let mut cycles = 0u32;
        self.yielded = false;
        self.children.clear();

        while !self.halted && !self.yielded && cycles < MAX_CYCLES {
            self.step();
            cycles += 1;
        }
        cycles
    }

    /// Execute one instruction at the current PC.
    pub fn step(&mut self) {
        if self.halted {
            return;
        }

        let pc = self.pc as usize;
        if pc >= self.ram.len() {
            self.halted = true;
            return;
        }

        let opcode = (self.ram[pc] & 0xFF) as u8;
        let w = opcodes::width(opcode);

        // Collect argument pixels
        let args = self.read_args(pc, w);

        // Execute
        let new_pc = self.execute(opcode, &args);

        // Advance PC: if execute returned None, advance by instruction width
        self.pc = new_pc.unwrap_or_else(|| (self.pc as usize + w) as u32);
    }

    /// Read (width - 1) argument pixels after the opcode pixel.
    fn read_args(&self, pc: usize, width: usize) -> Vec<u32> {
        let mut args = Vec::with_capacity(width.saturating_sub(1));
        for i in 1..width {
            let addr = pc + i;
            args.push(self.peek(addr));
        }
        args
    }

    /// Execute an opcode with its argument pixels. Returns Some(new_pc) if a jump occurred.
    fn execute(&mut self, opcode: u8, args: &[u32]) -> Option<u32> {
        match opcode {
            // ── N (0x4E): NOP ─────────────────────
            op::NOP => None,

            // ── H (0x48): HALT ────────────────────
            op::HALT => {
                self.halted = true;
                None
            },

            // ── Y (0x59): YIELD ───────────────────
            op::YIELD => {
                self.yielded = true;
                None
            },

            // ── R (0x52): RET ─────────────────────
            op::RET => {
                match self.stack.pop() {
                    Some(addr) => Some(addr),
                    None => {
                        self.halted = true;
                        None
                    }
                }
            },

            // ── I (0x49): LDI dst, value ──────────
            // width 3: args[0]=dst_reg, args[1]=immediate_value
            op::LDI => {
                let dst = args[0] as usize;
                let val = args[1];
                if dst < NUM_REGS {
                    self.regs[dst] = val;
                }
                None
            },

            // ── M (0x4D): MOV dst, src ────────────
            op::MOV => {
                let dst = args[0] as usize;
                let src = args[1] as usize;
                if dst < NUM_REGS && src < NUM_REGS {
                    self.regs[dst] = self.regs[src];
                }
                None
            },

            // ── L (0x4C): LOAD dst, addr ──────────
            // args[0]=dst_reg, args[1]=addr_reg → load from ram[regs[addr_reg]]
            op::LOAD => {
                let dst = args[0] as usize;
                let addr_reg = args[1] as usize;
                if dst < NUM_REGS && addr_reg < NUM_REGS {
                    let src_addr = self.regs[addr_reg] as usize;
                    self.regs[dst] = self.peek(src_addr);
                }
                None
            },

            // ── S (0x53): STORE addr, src ──────────
            op::STORE => {
                let addr_reg = args[0] as usize;
                let src = args[1] as usize;
                if addr_reg < NUM_REGS && src < NUM_REGS {
                    let dst_addr = self.regs[addr_reg] as usize;
                    self.poke(dst_addr, self.regs[src]);
                }
                None
            },

            // ── A (0x41): ADD dst, src ────────────
            op::ADD => {
                let dst = args[0] as usize;
                let src = args[1] as usize;
                if dst < NUM_REGS && src < NUM_REGS {
                    self.regs[dst] = self.regs[dst].wrapping_add(self.regs[src]);
                }
                None
            },

            // ── U (0x55): SUB dst, src ────────────
            op::SUB => {
                let dst = args[0] as usize;
                let src = args[1] as usize;
                if dst < NUM_REGS && src < NUM_REGS {
                    self.regs[dst] = self.regs[dst].wrapping_sub(self.regs[src]);
                }
                None
            },

            // ── m (0x6D): MUL dst, src ────────────
            op::MUL => {
                let dst = args[0] as usize;
                let src = args[1] as usize;
                if dst < NUM_REGS && src < NUM_REGS {
                    self.regs[dst] = self.regs[dst].wrapping_mul(self.regs[src]);
                }
                None
            },

            // ── D (0x44): DIV dst, src ────────────
            op::DIV => {
                let dst = args[0] as usize;
                let src = args[1] as usize;
                if dst < NUM_REGS && src < NUM_REGS {
                    let divisor = self.regs[src];
                    if divisor != 0 {
                        self.regs[dst] /= divisor;
                    } else {
                        self.regs[dst] = 0;
                    }
                }
                None
            },

            // ── b (0x62): MOD dst, src ────────────
            op::MOD => {
                let dst = args[0] as usize;
                let src = args[1] as usize;
                if dst < NUM_REGS && src < NUM_REGS {
                    let divisor = self.regs[src];
                    if divisor != 0 {
                        self.regs[dst] %= divisor;
                    } else {
                        self.regs[dst] = 0;
                    }
                }
                None
            },

            // ── O (0x4F): OR dst, src ─────────────
            op::OR => {
                let dst = args[0] as usize;
                let src = args[1] as usize;
                if dst < NUM_REGS && src < NUM_REGS {
                    self.regs[dst] |= self.regs[src];
                }
                None
            },

            // ── a (0x61): AND dst, src ────────────
            op::AND => {
                let dst = args[0] as usize;
                let src = args[1] as usize;
                if dst < NUM_REGS && src < NUM_REGS {
                    self.regs[dst] &= self.regs[src];
                }
                None
            },

            // ── X (0x58): XOR dst, src ────────────
            op::XOR => {
                let dst = args[0] as usize;
                let src = args[1] as usize;
                if dst < NUM_REGS && src < NUM_REGS {
                    self.regs[dst] ^= self.regs[src];
                }
                None
            },

            // ── n (0x6E): NOT dst ─────────────────
            op::NOT => {
                let dst = args[0] as usize;
                if dst < NUM_REGS {
                    self.regs[dst] = !self.regs[dst];
                }
                None
            },

            // ── K (0x4B): SHL dst, amount ─────────
            op::SHL => {
                let dst = args[0] as usize;
                let amt_reg = args[1] as usize;
                if dst < NUM_REGS && amt_reg < NUM_REGS {
                    self.regs[dst] <<= self.regs[amt_reg];
                }
                None
            },

            // ── k (0x6B): SHR dst, amount ─────────
            op::SHR => {
                let dst = args[0] as usize;
                let amt_reg = args[1] as usize;
                if dst < NUM_REGS && amt_reg < NUM_REGS {
                    self.regs[dst] >>= self.regs[amt_reg];
                }
                None
            },

            // ── J (0x4A): JMP addr ────────────────
            // args[0] = absolute address
            op::JMP => {
                Some(args[0])
            },

            // ── B (0x42): BRANCH cond, addr ───────
            // width 3: args[0]=condition_pixel, args[1]=target_addr
            // condition_pixel low byte = condition code (0=BEQ, 1=BNE, etc.)
            //           high bytes encode r1, r2 register indices
            op::BRANCH => {
                let cond_pixel = args[0];
                let target = args[1];
                let cond = (cond_pixel & 0xFF) as u8;
                let r1 = ((cond_pixel >> 16) & 0xFF) as usize;
                let r2 = ((cond_pixel >> 24) & 0xFF) as usize;

                if r1 >= NUM_REGS || r2 >= NUM_REGS {
                    return None;
                }

                let a = self.regs[r1];
                let b = self.regs[r2];

                let taken = match cond {
                    0 => a == b,                    // BEQ
                    1 => a != b,                    // BNE
                    2 => (a as i32) < (b as i32),   // BLT
                    3 => (a as i32) >= (b as i32),  // BGE
                    4 => a < b,                     // BLTU
                    5 => a >= b,                    // BGEU
                    _ => false,
                };

                if taken {
                    Some(target)
                } else {
                    None
                }
            },

            // ── C (0x43): CALL addr ───────────────
            op::CALL => {
                let target = args[0];
                let w = opcodes::width(op::CALL) as u32;
                self.stack.push(self.pc + w);
                Some(target)
            },

            // ── E (0x45): EXEC addr, arg ──────────
            // Jump to address in register. arg pixel is unused for now.
            op::EXEC => {
                let addr_reg = args[0] as usize;
                if addr_reg < NUM_REGS {
                    Some(self.regs[addr_reg])
                } else {
                    None
                }
            },

            // ── Q (0x51): SPAWN addr, arg ─────────
            op::SPAWN => {
                let addr_reg = args[0] as usize;
                let arg_reg = args[1] as usize;
                if addr_reg < NUM_REGS && arg_reg < NUM_REGS {
                    self.children.push(ChildVm {
                        start_addr: self.regs[addr_reg],
                        arg: self.regs[arg_reg],
                    });
                }
                None
            },

            // ── Z (0x5A): SPATIAL_SPAWN x, y, addr
            op::SPATIAL_SPAWN => {
                let x_reg = args[0] as usize;
                let y_reg = args[1] as usize;
                let addr_reg = args[2] as usize;
                if x_reg < NUM_REGS && y_reg < NUM_REGS && addr_reg < NUM_REGS {
                    self.children.push(ChildVm {
                        start_addr: self.regs[addr_reg],
                        arg: self.regs[x_reg],
                    });
                }
                None
            },

            // ── P (0x50): PSET x, y, color ────────
            // args are register indices
            op::PSET => {
                let x_reg = args[0] as usize;
                let y_reg = args[1] as usize;
                let c_reg = args[2] as usize;
                if x_reg < NUM_REGS && y_reg < NUM_REGS && c_reg < NUM_REGS {
                    let x = self.regs[x_reg] as usize;
                    let y = self.regs[y_reg] as usize;
                    let color = self.regs[c_reg];
                    if x < 256 && y < 256 {
                        self.screen[y * 256 + x] = color;
                    }
                }
                None
            },

            // ── g (0x67): PGET dst, x, y ──────────
            op::PGET => {
                let dst = args[0] as usize;
                let x_reg = args[1] as usize;
                let y_reg = args[2] as usize;
                if dst < NUM_REGS && x_reg < NUM_REGS && y_reg < NUM_REGS {
                    let x = self.regs[x_reg] as usize;
                    let y = self.regs[y_reg] as usize;
                    self.regs[dst] = if x < 256 && y < 256 {
                        self.screen[y * 256 + x]
                    } else {
                        0
                    };
                }
                None
            },

            // ── F (0x46): RECTF x, y, w, h ────────
            op::RECTF => {
                let x_reg = args[0] as usize;
                let y_reg = args[1] as usize;
                let w_val = args[2];
                let h_val = args[3];
                if x_reg < NUM_REGS && y_reg < NUM_REGS {
                    let x0 = self.regs[x_reg] as usize;
                    let y0 = self.regs[y_reg] as usize;
                    let color = self.regs[0]; // r0 as color temp
                    for dy in 0..h_val as usize {
                        for dx in 0..w_val as usize {
                            let px = x0 + dx;
                            let py = y0 + dy;
                            if px < 256 && py < 256 {
                                self.screen[py * 256 + px] = color;
                            }
                        }
                    }
                }
                None
            },

            // ── V (0x56): LINE x1, y1, x2, y2 ────
            op::LINE => {
                let x1_reg = args[0] as usize;
                let y1_reg = args[1] as usize;
                let x2_val = args[2] as i32;
                let y2_val = args[3] as i32;
                if x1_reg < NUM_REGS && y1_reg < NUM_REGS {
                    let x0 = self.regs[x1_reg] as i32;
                    let y0 = self.regs[y1_reg] as i32;
                    let color = self.regs[0];
                    let dx = (x2_val - x0).abs();
                    let dy = -(y2_val - y0).abs();
                    let sx = if x0 < x2_val { 1 } else { -1 };
                    let sy = if y0 < y2_val { 1 } else { -1 };
                    let mut err = dx + dy;
                    let mut cx = x0;
                    let mut cy = y0;
                    loop {
                        if cx >= 0 && cx < 256 && cy >= 0 && cy < 256 {
                            self.screen[(cy as usize) * 256 + (cx as usize)] = color;
                        }
                        if cx == x2_val && cy == y2_val { break; }
                        let e2 = 2 * err;
                        if e2 >= dy { err += dy; cx += sx; }
                        if e2 <= dx { err += dx; cy += sy; }
                    }
                }
                None
            },

            // ── G (0x47): CIRCLEF cx, cy, r ───────
            op::CIRCLEF => {
                let cx_reg = args[0] as usize;
                let cy_reg = args[1] as usize;
                let r = args[2] as i32;
                if cx_reg < NUM_REGS && cy_reg < NUM_REGS {
                    let cx = self.regs[cx_reg] as i32;
                    let cy = self.regs[cy_reg] as i32;
                    let color = self.regs[0];
                    for dy in -r..=r {
                        for dx in -r..=r {
                            if dx * dx + dy * dy <= r * r {
                                let px = cx + dx;
                                let py = cy + dy;
                                if px >= 0 && px < 256 && py >= 0 && py < 256 {
                                    self.screen[(py as usize) * 256 + (px as usize)] = color;
                                }
                            }
                        }
                    }
                }
                None
            },

            // ── W (0x57): BLIT dst, src, count ────
            op::BLIT => {
                let dst_reg = args[0] as usize;
                let src_reg = args[1] as usize;
                let count = args[2] as usize;
                if dst_reg < NUM_REGS && src_reg < NUM_REGS {
                    let dst = self.regs[dst_reg] as usize;
                    let src = self.regs[src_reg] as usize;
                    for i in 0..count {
                        self.poke(dst + i, self.peek(src + i));
                    }
                }
                None
            },

            // ── T (0x54): TEXT x, y, str_addr ─────
            // Stub: just a NOP for now, text rendering needs font data.
            op::TEXT => None,

            // ── d (0x64): LDB dst, addr ───────────
            op::LDB => {
                let dst = args[0] as usize;
                let addr_reg = args[1] as usize;
                if dst < NUM_REGS && addr_reg < NUM_REGS {
                    let byte_addr = self.regs[addr_reg] as usize;
                    let pixel_idx = byte_addr / 4;
                    let byte_off = byte_addr % 4;
                    let pixel = self.peek(pixel_idx);
                    self.regs[dst] = (pixel >> (byte_off * 8)) & 0xFF;
                }
                None
            },

            // ── s (0x73): STB addr, src ───────────
            op::STB => {
                let addr_reg = args[0] as usize;
                let src = args[1] as usize;
                if addr_reg < NUM_REGS && src < NUM_REGS {
                    let byte_addr = self.regs[addr_reg] as usize;
                    let pixel_idx = byte_addr / 4;
                    let byte_off = byte_addr % 4;
                    let byte_val = self.regs[src] & 0xFF;
                    let mut pixel = self.peek(pixel_idx);
                    let mask = !(0xFFu32 << (byte_off * 8));
                    pixel = (pixel & mask) | (byte_val << (byte_off * 8));
                    self.poke(pixel_idx, pixel);
                }
                None
            },

            // ── p (0x70): PUSH value ──────────────
            op::PUSH => {
                let val_reg = args[0] as usize;
                if val_reg < NUM_REGS {
                    self.stack.push(self.regs[val_reg]);
                }
                None
            },

            // ── r (0x72): POP dst ─────────────────
            op::POP => {
                let dst = args[0] as usize;
                if dst < NUM_REGS {
                    if let Some(val) = self.stack.pop() {
                        self.regs[dst] = val;
                    }
                }
                None
            },

            // ── i (0x69): INT vector ──────────────
            // Stub: interrupt handling not yet implemented.
            op::INT => None,

            // ── Unknown: skip 1 pixel ─────────────
            _ => None,
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Helper: build pixels from bytes (each byte = one pixel)
    fn pixels(bytes: &[u8]) -> Vec<u32> {
        bytes.iter().map(|&b| b as u32).collect()
    }

    #[test]
    fn halt_stops_immediately() {
        // H = 0x48
        let mut vm = Vm::new(64);
        vm.load_program(&pixels(&[op::HALT]));
        vm.run();
        assert!(vm.halted);
        assert_eq!(vm.pc, 1);
    }

    #[test]
    fn nop_advances_pc() {
        // N = 0x4E
        let mut vm = Vm::new(64);
        vm.load_program(&pixels(&[op::NOP, op::NOP, op::HALT]));
        vm.run();
        assert!(vm.halted);
        assert_eq!(vm.pc, 3);
    }

    #[test]
    fn ldi_loads_value_into_register() {
        // I <0> <*> = LDI r0, 42  (width 3)
        // Using raw register index 0 and value 42 (0x2A = '*')
        let mut vm = Vm::new(64);
        vm.load_program(&[op::LDI as u32, 0, 42, op::HALT as u32]);
        vm.run();
        assert!(vm.halted);
        assert_eq!(vm.regs[0], 42);
    }

    #[test]
    fn add_two_registers() {
        // I0\x05 = LDI r0, 5
        // I1\x03 = LDI r1, 3
        // A01    = ADD r0, r1  (width 3)
        // H      = HALT
        let mut vm = Vm::new(64);
        vm.load_program(&[
            op::LDI as u32, 0, 5,
            op::LDI as u32, 1, 3,
            op::ADD as u32, 0, 1,
            op::HALT as u32,
        ]);
        vm.run();
        assert!(vm.halted);
        assert_eq!(vm.regs[0], 8);
        assert_eq!(vm.regs[1], 3);
    }

    #[test]
    fn store_and_load_roundtrip() {
        // I0<99> = LDI r0, 99
        // I1<10> = LDI r1, 10  (address = pixel 10)
        // S10    = STORE [r1], r0
        // I2<0>  = LDI r2, 0
        // L21    = LOAD r2, [r1]
        // H
        let mut vm = Vm::new(64);
        vm.load_program(&[
            op::LDI as u32, 0, 99,
            op::LDI as u32, 1, 10,
            op::STORE as u32, 1, 0,
            op::LDI as u32, 2, 0,
            op::LOAD as u32, 2, 1,
            op::HALT as u32,
        ]);
        vm.run();
        assert_eq!(vm.regs[2], 99);
    }

    #[test]
    fn call_and_ret() {
        // Pixel layout:
        // 0: H(0x48)                    -- will be overwritten by call target
        // 1: H(0x48)                    -- will be overwritten by call target
        // 2: H(0x48)                    -- will be overwritten by call target
        // 3: H(0x48)                    -- will be overwritten by call target
        //
        // Actual program:
        // 0: C<10>   = CALL addr 10     (width 2)
        // 2: H       = HALT
        //
        // Subroutine at pixel 10:
        // 10: I0<7>  = LDI r0, 7
        // 13: R      = RET
        let mut vm = Vm::new(32);
        vm.poke(0, op::CALL as u32);
        vm.poke(1, 10);
        vm.poke(2, op::HALT as u32);
        // subroutine
        vm.poke(10, op::LDI as u32);
        vm.poke(11, 0);
        vm.poke(12, 7);
        vm.poke(13, op::RET as u32);
        vm.pc = 0;
        vm.run();
        assert!(vm.halted);
        assert_eq!(vm.regs[0], 7);
    }

    #[test]
    fn spawn_creates_child() {
        let mut vm = Vm::new(64);
        vm.load_program(&[
            op::LDI as u32, 0, 20, // LDI r0, 20
            op::LDI as u32, 1, 42, // LDI r1, 42
            op::SPAWN as u32, 0, 1, // SPAWN r0, r1
            op::HALT as u32,
        ]);
        vm.run();
        assert_eq!(vm.children.len(), 1);
        assert_eq!(vm.children[0].start_addr, 20);
        assert_eq!(vm.children[0].arg, 42);
    }

    #[test]
    fn composition_model_works() {
        // The core promise: type "I0*" and you've written LDI r0, 42.
        // '*' has ASCII value 0x2A = 42.
        // That value IS the argument pixel.
        let star = '*' as u32;
        assert_eq!(star, 42);

        let mut vm = Vm::new(64);
        vm.load_program(&[op::LDI as u32, 0, star, op::HALT as u32]);
        vm.run();
        assert_eq!(vm.regs[0], 42);
    }
}
