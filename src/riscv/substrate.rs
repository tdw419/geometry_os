// riscv/substrate.rs -- Substrate Coprocessor MMIO Device (Phase W)
//
// Bridges the GPU Active Cellular Substrate into the RISC-V physical address space.
// A guest RISC-V program can use raw MMIO load/store to talk to the substrate.
//
// Memory map (at 0x4000_0000):
//   0x4000_0000 : SUB_X       -- cursor X coordinate (R/W)
//   0x4000_0004 : SUB_Y       -- cursor Y coordinate (R/W)
//   0x4000_0008 : SUB_CMD     -- command register (WO triggers execution)
//   0x4000_000C : SUB_ARG1    -- first argument (R/W)
//   0x4000_0010 : SUB_ARG2    -- second argument (R/W)
//   0x4000_0014 : SUB_STATUS  -- status register (RO)
//   0x4000_0018 : SUB_RESULT  -- result register (RO)
//   0x4000_001C : SUB_VERSION -- version/capabilities (RO, always 0x0001_0100 = 1.1.0)
//   0x4000_0020 : SUB_TICKS   -- total ticks executed (RO)
//
// Commands (write to SUB_CMD):
//   0x00 = NOP
//   0x01 = TICK(n)          -- advance substrate n ticks (ARG1=n, ARG2=flags)
//   0x02 = CIRCUIT_LOAD(id) -- load pre-built circuit (ARG1=id)
//   0x03 = CIRCUIT_WRITE(p, v) -- write value to circuit port (ARG1=port, ARG2=val)
//   0x04 = CIRCUIT_READ(p)  -- read value from circuit port (ARG1=port, result in SUB_RESULT)
//   0x05 = CIRCUIT_FIRE     -- inject PC pulse into command track
//   0x06 = DEFRAG           -- sync heatmap
//   0x07 = LEARN(decay, bump) -- apply plasticity rule (ARG1=decay*256, ARG2=bump)
//   0x08 = COPY(sx,sy,dx,dy,w,h) -- block transfer
//   0x09 = PATCH(x,y,color) -- surgical color update at (SUB_X, SUB_Y)
//
// Status values:
//   0x00 = Idle
//   0x01 = Busy
//   0x02 = Done
//   0xFF = Error (unknown command)

use std::cell::RefCell;
use std::rc::Rc;

/// MMIO base address for the Substrate Coprocessor.
pub const SUBSTRATE_BASE: u64 = 0x4000_0000;
/// Register stride (4 bytes per register).
const REG_SIZE: u64 = 4;
/// Number of registers (10 total to cover 0x20+).
const NUM_REGS: u64 = 10;
/// Total MMIO range size.
pub const SUBSTRATE_MMIO_SIZE: u64 = NUM_REGS * REG_SIZE;

/// Register offsets from SUBSTRATE_BASE.
const REG_X: u64 = 0x00;
const REG_Y: u64 = 0x04;
const REG_CMD: u64 = 0x08;
const REG_ARG1: u64 = 0x0C;
const REG_ARG2: u64 = 0x10;
const REG_STATUS: u64 = 0x14;
const REG_RESULT: u64 = 0x18;
const REG_VERSION: u64 = 0x1C;
const REG_TICKS_LO: u64 = 0x20;
const REG_TICKS_HI: u64 = 0x24;

/// Status codes.
const STATUS_IDLE: u32 = 0x00;
const STATUS_BUSY: u32 = 0x01;
const STATUS_DONE: u32 = 0x02;
const STATUS_ERROR: u32 = 0xFF;

/// Version/capabilities register value: 1.1.0
const VERSION: u32 = 0x0001_0100;

/// Callback type fired when substrate ticks complete.
/// Receives (ticks_count, total_ticks).
pub type TickCallback = Rc<RefCell<dyn FnMut(u32, u64)>>;

/// Substrate Coprocessor MMIO Device.
///
/// Owns the register file and (when GPU is available) the active substrate.
/// The register file always works; commands are no-ops without GPU.
pub struct SubstrateDevice {
    /// Cursor X coordinate.
    pub x: u32,
    /// Cursor Y coordinate.
    pub y: u32,
    /// Command register.
    pub cmd: u32,
    /// Argument 1.
    pub arg1: u32,
    /// Argument 2.
    pub arg2: u32,
    /// Status register.
    pub status: u32,
    /// Result register.
    pub result: u32,
    /// Total ticks executed (lifetime counter).
    pub total_ticks: u64,
    /// GPU-backed substrate (only with --features gpu).
    #[cfg(feature = "gpu")]
    pub active_substrate: Option<crate::kernel::active_substrate::ActiveSubstrate>,
    /// Optional callback fired after TICK completes.
    pub on_tick: Option<TickCallback>,
}

impl Default for SubstrateDevice {
    fn default() -> Self {
        Self::new()
    }
}

impl SubstrateDevice {
    /// Create a new substrate device (no GPU substrate attached).
    pub fn new() -> Self {
        Self {
            x: 0,
            y: 0,
            cmd: 0,
            arg1: 0,
            arg2: 0,
            status: STATUS_IDLE,
            result: 0,
            total_ticks: 0,
            #[cfg(feature = "gpu")]
            active_substrate: None,
            on_tick: None,
        }
    }

    /// Create a substrate device with a GPU-backed substrate.
    #[cfg(feature = "gpu")]
    pub fn with_substrate(sub: crate::kernel::active_substrate::ActiveSubstrate) -> Self {
        Self {
            active_substrate: Some(sub),
            ..Self::new()
        }
    }

    /// Check if a physical address falls within the substrate MMIO range.
    pub fn contains(addr: u64) -> bool {
        addr >= SUBSTRATE_BASE && addr < SUBSTRATE_BASE + SUBSTRATE_MMIO_SIZE
    }

    /// Read a 32-bit register.
    pub fn read(&self, addr: u64) -> Option<u32> {
        let offset = addr.checked_sub(SUBSTRATE_BASE)?;
        match offset {
            REG_X => Some(self.x),
            REG_Y => Some(self.y),
            REG_CMD => Some(0), // CMD is write-only, reads return 0
            REG_ARG1 => Some(self.arg1),
            REG_ARG2 => Some(self.arg2),
            REG_STATUS => Some(self.status),
            REG_RESULT => Some(self.result),
            REG_VERSION => Some(VERSION),
            REG_TICKS_LO => Some((self.total_ticks & 0xFFFFFFFF) as u32),
            REG_TICKS_HI => Some((self.total_ticks >> 32) as u32),
            _ => None,
        }
    }

    /// Write a 32-bit register. Writes to CMD trigger command execution.
    pub fn write(&mut self, addr: u64, val: u32) -> bool {
        let offset = match addr.checked_sub(SUBSTRATE_BASE) {
            Some(o) => o,
            None => return false,
        };
        match offset {
            REG_X => {
                self.x = val;
                true
            },
            REG_Y => {
                self.y = val;
                true
            },
            REG_CMD => {
                self.cmd = val;
                self.execute_command();
                true
            },
            REG_ARG1 => {
                self.arg1 = val;
                true
            },
            REG_ARG2 => {
                self.arg2 = val;
                true
            },
            REG_STATUS | REG_RESULT | REG_VERSION => {
                // Read-only registers, silently ignore writes
                true
            },
            _ => false,
        }
    }

    /// Execute the command in self.cmd.
    fn execute_command(&mut self) {
        match self.cmd {
            // NOP
            0x00 => {
                self.status = STATUS_DONE;
            },

            // TICK(n) -- advance substrate by n ticks
            0x01 => {
                let n = self.arg1.clamp(1, 1000);
                #[cfg(feature = "gpu")]
                if let Some(ref mut substrate) = self.active_substrate {
                    for i in 0..n {
                        substrate.update(self.total_ticks as u32 + i, 1.0);
                    }
                }

                self.total_ticks += n as u64;
                self.status = STATUS_DONE;

                if let Some(ref cb) = self.on_tick {
                    cb.borrow_mut()(n, self.total_ticks);
                }
            },

            // CIRCUIT_LOAD(id) -- load pre-built circuit template
            0x02 => {
                // CIRCUIT_LOAD(id) -- load pre-built circuit template
                #[cfg(feature = "gpu")]
                {
                    let id = self.arg1;
                    if let Some(ref mut substrate) = self.active_substrate {
                        match id {
                            1 => Self::load_fibonacci_circuit(substrate),
                            2 => Self::load_xor_circuit(substrate),
                            _ => {
                                self.status = STATUS_ERROR;
                                return;
                            },
                        }
                        self.status = STATUS_DONE;
                    }
                }
                #[cfg(not(feature = "gpu"))]
                {
                    self.status = STATUS_DONE;
                }
            },

            // CIRCUIT_WRITE(port, val)
            0x03 => {
                #[cfg(feature = "gpu")]
                {
                    let arg1 = self.arg1;
                    let arg2 = self.arg2;
                    if let Some(ref mut substrate) = self.active_substrate {
                        Self::write_circuit_port(substrate, arg1, arg2);
                        self.status = STATUS_DONE;
                    }
                }
                #[cfg(not(feature = "gpu"))]
                {
                    self.status = STATUS_DONE;
                }
            },

            // CIRCUIT_READ(port)
            0x04 => {
                #[cfg(feature = "gpu")]
                {
                    let port = self.arg1;
                    if let Some(ref mut substrate) = self.active_substrate {
                        let res = Self::read_circuit_port(substrate, port);
                        self.result = res;
                        self.status = STATUS_DONE;
                    }
                }
                #[cfg(not(feature = "gpu"))]
                {
                    self.result = 0;
                    self.status = STATUS_DONE;
                }
            },

            // CIRCUIT_FIRE -- inject PC pulse
            0x05 => {
                #[cfg(feature = "gpu")]
                {
                    if let Some(ref mut substrate) = self.active_substrate {
                        Self::fire_circuit(substrate);
                        self.status = STATUS_DONE;
                    }
                }
                #[cfg(not(feature = "gpu"))]
                {
                    self.status = STATUS_DONE;
                }
            },

            // DEFRAG -- sync heatmap
            0x06 => {
                self.status = STATUS_DONE;
            },

            // LEARN(decay, bump)
            0x07 => {
                #[cfg(feature = "gpu")]
                if let Some(ref mut substrate) = self.active_substrate {
                    let decay_rate = (self.arg1 as f32) / 256.0;
                    let bump_size = (self.arg2 & 0xFF) as u8;
                    substrate.apply_hebbian_learning_with_decay(decay_rate, bump_size);
                    self.status = STATUS_DONE;
                }
                #[cfg(not(feature = "gpu"))]
                {
                    self.status = STATUS_DONE;
                }
            },

            // COPY(sx, sy, dx, dy, w, h) -- block transfer
            0x08 => {
                #[cfg(feature = "gpu")]
                if let Some(ref mut substrate) = self.active_substrate {
                    let sx = (self.arg1 >> 24) & 0xFF;
                    let sy = (self.arg1 >> 16) & 0xFF;
                    let dx = (self.arg1 >> 8) & 0xFF;
                    let dy = self.arg1 & 0xFF;
                    let w = (self.arg2 >> 16) & 0xFFFF;
                    let h = self.arg2 & 0xFFFF;

                    let mut pixels = pollster::block_on(substrate.get_substrate());
                    for row in 0..h {
                        if sy + row >= 256 || dy + row >= 256 {
                            continue;
                        }
                        for col in 0..w {
                            if sx + col >= 256 || dx + col >= 256 {
                                continue;
                            }
                            let src = ((sy + row) * 256 + (sx + col)) as usize;
                            let dst = ((dy + row) * 256 + (dx + col)) as usize;
                            pixels[dst] = pixels[src];
                        }
                    }
                    substrate.set_substrate(&pixels);
                    self.status = STATUS_DONE;
                }
                #[cfg(not(feature = "gpu"))]
                {
                    self.status = STATUS_DONE;
                }
            },

            // PATCH(x, y, color) -- surgical color update at cursor
            0x09 => {
                #[cfg(feature = "gpu")]
                if let Some(ref mut substrate) = self.active_substrate {
                    let x = self.x;
                    let y = self.y;
                    let color = self.arg1;
                    let mut pixels = pollster::block_on(substrate.get_substrate());
                    let idx = (y * 256 + x) as usize;
                    if idx < pixels.len() {
                        pixels[idx] = (pixels[idx] & 0xFF000000) | (color & 0x00FFFFFF);
                        substrate.set_substrate(&pixels);
                    }
                    self.status = STATUS_DONE;
                }
                #[cfg(not(feature = "gpu"))]
                {
                    self.status = STATUS_DONE;
                }
            },

            _ => {
                self.status = STATUS_ERROR;
            },
        }
    }

    // --- Circuit loaders (mirrored from vm/ops_substrate.rs) ---

    #[cfg(feature = "gpu")]
    fn load_fibonacci_circuit(substrate: &mut crate::kernel::active_substrate::ActiveSubstrate) {
        let mut pixels = vec![0u32; 256 * 256];
        let hot = 0x00800000;

        fn draw_buffered_reg(pixels: &mut [u32], x: i32, y: i32, hot: u32) {
            let mut set = |dx: i32, dy: i32, tax: u32, p: u32| {
                pixels[((y + dy) as usize) * 256 + ((x + dx) as usize)] =
                    (tax << 28) | (p << 24) | hot;
            };
            set(0, 0, 1, 2);
            set(3, 0, 1, 2);
            set(3, 3, 1, 2);
            set(0, 3, 1, 2);
        }

        draw_buffered_reg(&mut pixels, 20, 50, hot);
        draw_buffered_reg(&mut pixels, 40, 50, hot);
        draw_buffered_reg(&mut pixels, 60, 50, hot);
        pixels[128 * 256 + 128] = (1u32 << 28) | (4u32 << 24) | hot;
        pixels[128 * 256 + 127] = (12u32 << 28) | (0u32 << 24) | hot;
        pixels[128 * 256 + 129] = (12u32 << 28) | (2u32 << 24) | hot;
        substrate.set_substrate(&pixels);
    }

    #[cfg(feature = "gpu")]
    fn load_xor_circuit(substrate: &mut crate::kernel::active_substrate::ActiveSubstrate) {
        let mut pixels = vec![0u32; 256 * 256];
        let hot = 0x00800000;
        let weight = 255u32;
        let threshold = 150u32;
        let neuron = (1u32 << 28) | (5u32 << 24) | threshold | hot;
        let synapse = |dir: u32| (14u32 << 28) | (dir << 24) | (weight << 16) | hot;
        let or_gate = (1u32 << 28) | (2u32 << 24) | hot; // LOGIC_OR (Type 2) acts as a Turner

        // Path A (origin 100, 100)
        for x in 101..104 {
            pixels[100 * 256 + x] = synapse(0);
        } // Right
        pixels[100 * 256 + 104] = neuron;
        // (100, 105) is EMPTY
        pixels[100 * 256 + 106] = synapse(0); // Right
        pixels[100 * 256 + 107] = or_gate; // Turner at corner

        // Path B (origin 106, 100)
        for x in 101..104 {
            pixels[106 * 256 + x] = synapse(0);
        } // Right
        pixels[106 * 256 + 104] = neuron;
        // (106, 105) is EMPTY
        pixels[106 * 256 + 106] = synapse(0); // Right
        pixels[106 * 256 + 107] = or_gate; // Turner at corner

        // Vertical Merges to XOR gate at (103, 107)
        // OR gate needs an EMPTY cell to fire into.
        // N1 OR is at (100, 107). (101, 107) is EMPTY. Wire D starts at (102, 107).
        pixels[102 * 256 + 107] = synapse(1); // Down from A

        // N2 OR is at (106, 107). (105, 107) is EMPTY. Wire U starts at (104, 107).
        pixels[104 * 256 + 107] = synapse(3); // Up from B

        // XOR Gate + Output Path
        pixels[103 * 256 + 107] = (1u32 << 28) | (0u32 << 24) | hot; // LOGIC_XOR
                                                                     // (108, 103) is EMPTY
        for x in 109..113 {
            pixels[103 * 256 + x] = synapse(0);
        } // Right to 112

        substrate.set_substrate(&pixels);
    }

    #[cfg(feature = "gpu")]
    fn write_circuit_port(
        substrate: &mut crate::kernel::active_substrate::ActiveSubstrate,
        port: u32,
        val: u32,
    ) {
        match port {
            0 => {
                substrate.inject_signal(100, 100, 12, 0, val);
                substrate.inject_signal(127, 128, 12, 0, val);
            },
            1 => {
                substrate.inject_signal(100, 106, 12, 0, val); // FIXED: Match Path B origin at (x=100, y=106)
                substrate.inject_signal(127, 128, 12, 0, val);
            },
            _ => {},
        }
    }

    #[cfg(feature = "gpu")]
    fn read_circuit_port(
        substrate: &mut crate::kernel::active_substrate::ActiveSubstrate,
        port: u32,
    ) -> u32 {
        match port {
            // Read output neuron
            0 => substrate.get_pixel(110, 161),
            // Read output directly from the active wire of the XOR circuit
            1 => substrate.get_pixel(112, 103),
            _ => 0,
        }
    }

    #[cfg(feature = "gpu")]
    fn fire_circuit(substrate: &mut crate::kernel::active_substrate::ActiveSubstrate) {
        // Inject a clock pulse into the command track at the center
        substrate.inject_signal(128, 128, 4, 0, 0x00FFFFFF);
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn substrate_contains_valid_range() {
        assert!(SubstrateDevice::contains(SUBSTRATE_BASE));
        assert!(SubstrateDevice::contains(SUBSTRATE_BASE + 0x1C)); // VERSION register
        assert!(SubstrateDevice::contains(SUBSTRATE_BASE + 0x20)); // TICKS_LO register
        assert!(!SubstrateDevice::contains(SUBSTRATE_BASE + 0x28)); // past end
        assert!(!SubstrateDevice::contains(SUBSTRATE_BASE - 4));
    }

    #[test]
    fn substrate_read_write_x_y() {
        let mut dev = SubstrateDevice::new();

        assert!(dev.write(SUBSTRATE_BASE + REG_X, 42));
        assert!(dev.write(SUBSTRATE_BASE + REG_Y, 99));

        assert_eq!(dev.read(SUBSTRATE_BASE + REG_X), Some(42));
        assert_eq!(dev.read(SUBSTRATE_BASE + REG_Y), Some(99));
    }

    #[test]
    fn substrate_read_write_args() {
        let mut dev = SubstrateDevice::new();

        assert!(dev.write(SUBSTRATE_BASE + REG_ARG1, 0xDEAD));
        assert!(dev.write(SUBSTRATE_BASE + REG_ARG2, 0xBEEF));

        assert_eq!(dev.read(SUBSTRATE_BASE + REG_ARG1), Some(0xDEAD));
        assert_eq!(dev.read(SUBSTRATE_BASE + REG_ARG2), Some(0xBEEF));
    }

    #[test]
    fn substrate_cmd_is_write_only() {
        let mut dev = SubstrateDevice::new();
        assert!(dev.write(SUBSTRATE_BASE + REG_CMD, 0x01));
        assert_eq!(dev.read(SUBSTRATE_BASE + REG_CMD), Some(0)); // always reads 0
    }

    #[test]
    fn substrate_status_result_read_only() {
        let mut dev = SubstrateDevice::new();
        // Writes to STATUS/RESULT/VERSION should not change values
        assert!(dev.write(SUBSTRATE_BASE + REG_STATUS, 0xFF));
        assert!(dev.write(SUBSTRATE_BASE + REG_RESULT, 0xFF));
        assert!(dev.write(SUBSTRATE_BASE + REG_VERSION, 0xFF));

        // STATUS is still IDLE (0) since we haven't executed a command
        assert_eq!(dev.read(SUBSTRATE_BASE + REG_STATUS), Some(STATUS_IDLE));
        assert_eq!(dev.read(SUBSTRATE_BASE + REG_RESULT), Some(0));
        assert_eq!(dev.read(SUBSTRATE_BASE + REG_VERSION), Some(VERSION));
    }

    #[test]
    fn substrate_nop_sets_done() {
        let mut dev = SubstrateDevice::new();
        assert!(dev.write(SUBSTRATE_BASE + REG_CMD, 0x00)); // NOP
        assert_eq!(dev.status, STATUS_DONE);
    }

    #[test]
    fn substrate_unknown_cmd_sets_error() {
        let mut dev = SubstrateDevice::new();
        assert!(dev.write(SUBSTRATE_BASE + REG_CMD, 0xFE));
        assert_eq!(dev.status, STATUS_ERROR);
    }

    #[test]
    fn substrate_tick_without_gpu() {
        let mut dev = SubstrateDevice::new();
        assert!(dev.write(SUBSTRATE_BASE + REG_ARG1, 5)); // n=5
        assert!(dev.write(SUBSTRATE_BASE + REG_CMD, 0x01)); // TICK
        assert_eq!(dev.status, STATUS_DONE);
        assert_eq!(dev.total_ticks, 5);
    }

    #[test]
    fn substrate_tick_accumulates() {
        let mut dev = SubstrateDevice::new();
        assert!(dev.write(SUBSTRATE_BASE + REG_ARG1, 3));
        assert!(dev.write(SUBSTRATE_BASE + REG_CMD, 0x01)); // TICK(3)
        assert!(dev.write(SUBSTRATE_BASE + REG_ARG1, 7));
        assert!(dev.write(SUBSTRATE_BASE + REG_CMD, 0x01)); // TICK(7)
        assert_eq!(dev.total_ticks, 10);
    }

    #[test]
    fn substrate_version_register() {
        let dev = SubstrateDevice::new();
        assert_eq!(dev.read(SUBSTRATE_BASE + REG_VERSION), Some(VERSION));
        assert_eq!(VERSION, 0x0001_0100); // 1.1.0
    }

    #[test]
    fn substrate_out_of_range_read() {
        let dev = SubstrateDevice::new();
        assert_eq!(dev.read(SUBSTRATE_BASE + 0x28), None); // past register range
    }

    #[test]
    fn substrate_out_of_range_write() {
        let mut dev = SubstrateDevice::new();
        assert!(!dev.write(SUBSTRATE_BASE + 0x20, 0xFF));
    }

    #[test]
    fn substrate_bus_integration() {
        // Simulate the bus routing pattern
        use crate::riscv::bus::Bus;

        let mut bus = Bus::new(0x8000_0000, 1024 * 1024);

        // Write X register
        assert!(bus.write_word(SUBSTRATE_BASE, 100).is_ok());
        // Write Y register
        assert!(bus.write_word(SUBSTRATE_BASE + 4, 200).is_ok());
        // Read back
        assert_eq!(bus.read_word(SUBSTRATE_BASE).unwrap(), 100);
        assert_eq!(bus.read_word(SUBSTRATE_BASE + 4).unwrap(), 200);
        // VERSION register
        assert_eq!(bus.read_word(SUBSTRATE_BASE + 0x1C).unwrap(), VERSION);
    }

    #[test]
    fn substrate_bus_tick_command() {
        use crate::riscv::bus::Bus;

        let mut bus = Bus::new(0x8000_0000, 1024 * 1024);

        // Write ARG1=10 (tick count)
        assert!(bus.write_word(SUBSTRATE_BASE + 0x0C, 10).is_ok());
        // Write CMD=1 (TICK)
        assert!(bus.write_word(SUBSTRATE_BASE + 0x08, 1).is_ok());
        // Read STATUS
        let status = bus.read_word(SUBSTRATE_BASE + 0x14).unwrap();
        assert_eq!(status, STATUS_DONE);
    }

    #[test]
    fn substrate_cpu_e2e_read_version() {
        // End-to-end: RISC-V CPU executes store/load to substrate MMIO.
        // Guest program:
        //   LUI x1, 0x40000        -> x1 = 0x4000_0000 (substrate base)
        //   LW  x2, 0x1C(x1)       -> x2 = VERSION register
        //   EBREAK
        use crate::riscv::cpu::StepResult;
        use crate::riscv::RiscvVm;

        let mut vm = RiscvVm::new(4096);
        let base = 0x8000_0000u64;

        // LUI x1, 0x40000  -> x1 = 0x4000_0000
        // encoding: imm[31:12]=0x40000, rd=1, opcode=0x37
        let lui = (0x40000u32 << 12) | (1u32 << 7) | 0x37;
        // LW x2, 0x1C(x1)  -> load word from 0x4000_001C (VERSION)
        // encoding: imm=0x1C, rs1=1, funct3=0b010, rd=2, opcode=0x03
        let lw = (0x1Cu32 << 20) | (1u32 << 15) | (0b010u32 << 12) | (2u32 << 7) | 0x03;
        // EBREAK
        let ebreak: u32 = 0x00100073;

        vm.bus.write_word(base, lui).unwrap();
        vm.bus.write_word(base + 4, lw).unwrap();
        vm.bus.write_word(base + 8, ebreak).unwrap();

        vm.cpu.pc = base as u32;
        for _ in 0..10 {
            match vm.step() {
                StepResult::Ebreak => break,
                _ => {},
            }
        }

        // x2 should hold VERSION = 0x0001_0100
        assert_eq!(
            vm.cpu.x[2], VERSION,
            "Guest should read substrate VERSION via MMIO"
        );
    }

    #[test]
    fn substrate_cpu_e2e_tick_and_status() {
        // End-to-end: RISC-V CPU writes ARG1, triggers TICK, reads STATUS.
        use crate::riscv::cpu::StepResult;
        use crate::riscv::RiscvVm;

        let mut vm = RiscvVm::new(4096);
        let base = 0x8000_0000u64;

        // LUI x1, 0x40000          -> x1 = 0x4000_0000
        let lui_x1 = (0x40000u32 << 12) | (1u32 << 7) | 0x37;
        // ADDI x3, x0, 5           -> x3 = 5 (tick count)
        let addi_5 = (5u32 << 20) | (0u32 << 15) | (0u32 << 12) | (3u32 << 7) | 0x13;
        // SW x3, 0x0C(x1)          -> store x3 to ARG1 (offset 0x0C)
        //   S-type: (rs2<<20)|(rs1<<15)|(funct3<<12)|(imm<<7)|opcode
        let sw_arg1 = (3u32 << 20) | (1u32 << 15) | (0b010u32 << 12) | (0x0Cu32 << 7) | 0x23;
        // ADDI x4, x0, 1           -> x4 = 1 (CMD_TICK)
        let addi_1 = (1u32 << 20) | (0u32 << 15) | (0u32 << 12) | (4u32 << 7) | 0x13;
        // SW x4, 0x08(x1)          -> store x4 to CMD (triggers TICK)
        let sw_cmd = (4u32 << 20) | (1u32 << 15) | (0b010u32 << 12) | (0x08u32 << 7) | 0x23;
        // LW x5, 0x14(x1)          -> load STATUS register (offset 0x14)
        let lw_status = (0x14u32 << 20) | (1u32 << 15) | (0b010u32 << 12) | (5u32 << 7) | 0x03;
        // EBREAK
        let ebreak: u32 = 0x00100073;

        let instrs = [lui_x1, addi_5, sw_arg1, addi_1, sw_cmd, lw_status, ebreak];
        for (i, &instr) in instrs.iter().enumerate() {
            vm.bus.write_word(base + (i as u64) * 4, instr).unwrap();
        }

        vm.cpu.pc = base as u32;
        for _ in 0..20 {
            match vm.step() {
                StepResult::Ebreak => break,
                _ => {},
            }
        }

        // x5 should hold STATUS_DONE = 0x02
        assert_eq!(
            vm.cpu.x[5], STATUS_DONE,
            "Guest should read STATUS_DONE after TICK"
        );
        // And total_ticks on the bus substrate should be 5
        assert_eq!(
            vm.bus.substrate.total_ticks, 5,
            "Substrate should have ticked 5 times"
        );
    }
}
