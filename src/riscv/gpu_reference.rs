// riscv/gpu_reference.rs -- Reference RISC-V Interpreter for GPU Tile Verification
//
// Minimal RV32I base integer instruction set interpreter.
// Used to verify GPU execution by running the same code on CPU and comparing results.
// Mirrors the WGSL compute shader's instruction set exactly.
//
// This module is always compiled (no gpu feature required) so that
// verification can be used in any test context.

use super::gpu::{RAM_WORDS, STATUS_ERROR, STATUS_HALTED, STATUS_RUNNING};

/// Reference RISC-V VM for verification against GPU execution.
///
/// Implements a minimal subset of RV32I: LUI, AUIPC, JAL, JALR, Branch,
/// Load, Store, OP-IMM, OP, SYSTEM (ECALL/EBREAK). Also includes M extension
/// (MUL, MULH). Designed to produce identical results to the WGSL shader.
#[allow(dead_code)]
pub struct ReferenceVm {
    pub regs: [u32; 32],
    pub pc: u32,
    pub ram: Vec<u32>,
    pub status: u32,
    pub instruction_count: u32,
    pub uart_output: Vec<u8>,
}

impl ReferenceVm {
    /// Create a new reference VM with the given RAM contents.
    pub fn new(ram: Vec<u32>) -> Self {
        ReferenceVm {
            regs: [0; 32],
            pc: 0,
            ram,
            status: STATUS_RUNNING,
            instruction_count: 0,
            uart_output: Vec::new(),
        }
    }

    fn read_reg(&self, reg: u32) -> u32 {
        if reg == 0 {
            0
        } else {
            self.regs[reg as usize]
        }
    }

    fn write_reg(&mut self, reg: u32, val: u32) {
        if reg != 0 {
            self.regs[reg as usize] = val;
        }
    }

    fn read_ram(&self, addr: u32) -> u32 {
        let word_addr = (addr / 4) as usize;
        if word_addr < self.ram.len() {
            self.ram[word_addr]
        } else {
            0
        }
    }

    fn write_ram(&mut self, addr: u32, val: u32) {
        // UART MMIO intercept (match WGSL behavior)
        if addr >= 0x10000000 && addr < 0x10000200 {
            self.uart_output.push((val & 0xFF) as u8);
            return;
        }
        let word_addr = (addr / 4) as usize;
        if word_addr < self.ram.len() {
            self.ram[word_addr] = val;
        }
    }

    /// Execute one instruction. Returns false if the VM is no longer running.
    pub fn step(&mut self) -> bool {
        if self.status != STATUS_RUNNING {
            return false;
        }

        let inst = self.read_ram(self.pc);
        let opcode = inst & 0x7F;
        let rd = (inst >> 7) & 0x1F;
        let funct3 = (inst >> 12) & 0x7;
        let rs1 = (inst >> 15) & 0x1F;
        let rs2 = (inst >> 20) & 0x1F;
        let funct7 = (inst >> 25) & 0x7F;

        let imm_i: i32 = (((inst as i32) >> 20) as u32) as i32;
        let imm_s: i32 = ((((inst >> 7) & 0x1F) | ((inst >> 25) << 5)) as i32) << 20 >> 20;
        let imm_b: i32 = (((((inst >> 7) & 0x1) << 11)
            | (((inst >> 8) & 0xF) << 1)
            | (((inst >> 25) & 0x3F) << 5)
            | ((inst >> 31) << 12)) as i32)
            << 19
            >> 19;
        let imm_u = inst & 0xFFFFF000;
        let imm_j: i32 = (((((inst >> 12) & 0xFF) << 12)
            | (((inst >> 20) & 0x1) << 11)
            | (((inst >> 21) & 0x3FF) << 1)
            | ((inst >> 31) << 20)) as i32)
            << 11
            >> 11;

        let next_pc = self.pc.wrapping_add(4);
        let mut pc_jumped = false;

        match opcode {
            0x37 => {
                // LUI
                self.write_reg(rd, imm_u);
            }
            0x17 => {
                // AUIPC
                self.write_reg(rd, self.pc.wrapping_add(imm_u));
            }
            0x6F => {
                // JAL
                self.write_reg(rd, next_pc);
                self.pc = self.pc.wrapping_add(imm_j as u32);
                pc_jumped = true;
            }
            0x67 => {
                // JALR
                let target = (self.read_reg(rs1).wrapping_add(imm_i as u32)) & !1;
                self.write_reg(rd, next_pc);
                self.pc = target;
                pc_jumped = true;
            }
            0x63 => {
                // BRANCH
                let val1 = self.read_reg(rs1);
                let val2 = self.read_reg(rs2);
                let take = match funct3 {
                    0 => val1 == val2,                   // BEQ
                    1 => val1 != val2,                   // BNE
                    4 => (val1 as i32) < (val2 as i32),  // BLT
                    5 => (val1 as i32) >= (val2 as i32), // BGE
                    6 => val1 < val2,                    // BLTU
                    7 => val1 >= val2,                   // BGEU
                    _ => false,
                };
                if take {
                    self.pc = self.pc.wrapping_add(imm_b as u32);
                    pc_jumped = true;
                }
            }
            0x03 => {
                // LOAD (LW only, matching WGSL)
                let addr = self.read_reg(rs1).wrapping_add(imm_i as u32);
                let val = self.read_ram(addr);
                self.write_reg(rd, val);
            }
            0x23 => {
                // STORE (SW only, matching WGSL)
                let addr = self.read_reg(rs1).wrapping_add(imm_s as u32);
                let val = self.read_reg(rs2);
                self.write_ram(addr, val);
            }
            0x13 => {
                // OP-IMM
                let val1 = self.read_reg(rs1);
                let shamt = rs2; // imm[4:0]
                let result = match funct3 {
                    0 => val1.wrapping_add(imm_i as u32), // ADDI
                    1 => val1 << shamt,                   // SLLI
                    2 => {
                        if (val1 as i32) < imm_i {
                            1
                        } else {
                            0
                        }
                    } // SLTI
                    3 => {
                        if val1 < (imm_i as u32) {
                            1
                        } else {
                            0
                        }
                    } // SLTIU
                    4 => val1 ^ (imm_i as u32),           // XORI
                    5 => {
                        if (inst >> 30) & 1 == 1 {
                            ((val1 as i32) >> shamt) as u32 // SRAI
                        } else {
                            val1 >> shamt // SRLI
                        }
                    }
                    6 => val1 | (imm_i as u32), // ORI
                    7 => val1 & (imm_i as u32), // ANDI
                    _ => 0,
                };
                self.write_reg(rd, result);
            }
            0x33 => {
                // OP
                let val1 = self.read_reg(rs1);
                let val2 = self.read_reg(rs2);
                let alt = (inst >> 30) & 1 == 1;
                let mul = funct7 == 0x01;

                let result = if mul {
                    match funct3 {
                        0 => (val1 as i32).wrapping_mul(val2 as i32) as u32, // MUL
                        1 => (((val1 as i64) * (val2 as i64)) >> 32) as u32, // MULH
                        _ => 0,
                    }
                } else {
                    match funct3 {
                        0 => {
                            if alt {
                                val1.wrapping_sub(val2)
                            } else {
                                val1.wrapping_add(val2)
                            }
                        } // ADD/SUB
                        1 => val1 << (val2 & 0x1F), // SLL
                        2 => {
                            if (val1 as i32) < (val2 as i32) {
                                1
                            } else {
                                0
                            }
                        } // SLT
                        3 => {
                            if val1 < val2 {
                                1
                            } else {
                                0
                            }
                        } // SLTU
                        4 => val1 ^ val2,           // XOR
                        5 => {
                            if alt {
                                ((val1 as i32) >> (val2 & 0x1F)) as u32
                            } else {
                                val1 >> (val2 & 0x1F)
                            }
                        } // SRL/SRA
                        6 => val1 | val2,           // OR
                        7 => val1 & val2,           // AND
                        _ => 0,
                    }
                };
                self.write_reg(rd, result);
            }
            0x73 => {
                // SYSTEM
                if inst == 0x00000073 {
                    // ECALL - halt
                    self.status |= STATUS_HALTED;
                } else if inst == 0x00100073 {
                    // EBREAK - halt with error
                    self.status |= STATUS_HALTED | STATUS_ERROR;
                }
            }
            _ => {
                // Unknown instruction - halt with error (match WGSL)
                self.status |= STATUS_HALTED | STATUS_ERROR;
            }
        }

        if !pc_jumped {
            self.pc = next_pc;
        }

        self.instruction_count += 1;
        self.status == STATUS_RUNNING
    }

    /// Run up to `max_steps` instructions.
    pub fn run(&mut self, max_steps: u32) {
        for _ in 0..max_steps {
            if !self.step() {
                break;
            }
        }
        // Clear running bit when done
        self.status &= !STATUS_RUNNING;
    }

    /// Get the tile state as a u32 array compatible with the GPU tile layout.
    /// Useful for comparing GPU vs reference results.
    pub fn to_tile_state(&self) -> Vec<u32> {
        let mut buf = vec![0u32; super::gpu::TILE_STATE_WORDS];
        buf[0..32].copy_from_slice(&self.regs);
        buf[32] = self.pc;
        buf[33] = self.status;
        buf[34] = self.instruction_count;
        // UART output
        let uart_len = self.uart_output.len().min(super::gpu::UART_BUF_WORDS);
        buf[37] = uart_len as u32;
        for i in 0..uart_len {
            buf[super::gpu::STATE_HEADER_WORDS + i] = self.uart_output[i] as u32;
        }
        // RAM
        let ram_base = super::gpu::STATE_HEADER_WORDS + super::gpu::UART_BUF_WORDS;
        for (i, &word) in self.ram.iter().enumerate() {
            if i < RAM_WORDS {
                buf[ram_base + i] = word;
            }
        }
        buf
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_reference_vm_new() {
        let ram = vec![0u32; RAM_WORDS];
        let vm = ReferenceVm::new(ram);
        assert_eq!(vm.pc, 0);
        assert_eq!(vm.status, STATUS_RUNNING);
        assert_eq!(vm.instruction_count, 0);
        assert!(vm.regs.iter().all(|&r| r == 0));
    }

    #[test]
    fn test_reference_addi() {
        // ADDI x1, x0, 42
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x02A00093; // ADDI x1, x0, 42
        ram[1] = 0x00000073; // ECALL (halt)

        let mut vm = ReferenceVm::new(ram);
        vm.run(100);

        assert_eq!(vm.regs[1], 42);
        assert_ne!(vm.status & STATUS_HALTED, 0);
    }

    #[test]
    fn test_reference_lui_addi() {
        // LUI x1, 0x10000   -> x1 = 0x10000000 (UART base)
        // ADDI x2, x0, 0x41 -> x2 = 'A'
        // SW x2, 0(x1)      -> write to UART
        // ECALL              -> halt
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x100000B7;
        ram[1] = 0x04100113;
        ram[2] = 0x00208023;
        ram[3] = 0x00000073;

        let mut vm = ReferenceVm::new(ram);
        vm.run(100);

        assert_eq!(vm.uart_output, vec![b'A']);
        assert_ne!(vm.status & STATUS_HALTED, 0);
    }

    #[test]
    fn test_reference_fibonacci() {
        // Use the gpu_loader cartridge builder
        let cartridge = super::super::gpu_loader::build_fibonacci_cartridge();
        let mut ram = vec![0u32; RAM_WORDS];
        for (i, &word) in cartridge.iter().enumerate() {
            if i < RAM_WORDS {
                ram[i] = word;
            }
        }

        let mut vm = ReferenceVm::new(ram);
        vm.run(1000);

        assert!(vm.instruction_count > 0);
        assert_ne!(vm.status & STATUS_HALTED, 0);
        assert_eq!(vm.status & STATUS_ERROR, 0);

        let uart_str = String::from_utf8_lossy(&vm.uart_output).to_string();
        assert!(
            uart_str.contains('5'),
            "Fibonacci(10)=55 should contain '5', got: {}",
            uart_str
        );
    }

    #[test]
    fn test_reference_counter() {
        let cartridge = super::super::gpu_loader::build_counter_cartridge(5);
        let mut ram = vec![0u32; RAM_WORDS];
        for (i, &word) in cartridge.iter().enumerate() {
            if i < RAM_WORDS {
                ram[i] = word;
            }
        }

        let mut vm = ReferenceVm::new(ram);
        vm.run(1000);

        assert!(vm.instruction_count > 0);
        assert_ne!(vm.status & STATUS_HALTED, 0);
        assert_eq!(vm.status & STATUS_ERROR, 0);

        // Counter writes 0,1,2,3,4 to UART then halts
        assert_eq!(vm.uart_output.len(), 5);
    }

    #[test]
    fn test_reference_to_tile_state() {
        let cartridge = super::super::gpu_loader::build_counter_cartridge(3);
        let mut ram = vec![0u32; RAM_WORDS];
        for (i, &word) in cartridge.iter().enumerate() {
            if i < RAM_WORDS {
                ram[i] = word;
            }
        }

        let mut vm = ReferenceVm::new(ram);
        vm.run(1000);

        let state = vm.to_tile_state();
        assert_eq!(state.len(), super::super::gpu::TILE_STATE_WORDS);
        assert_eq!(state[32], vm.pc);
        assert_eq!(state[33], vm.status);
        assert_eq!(state[34], vm.instruction_count);
    }

    // ============================================================
    // OP-IMM: SLLI, SLTI, SLTIU, XORI, SRLI, SRAI, ORI, ANDI
    // ============================================================

    #[test]
    fn test_reference_slli() {
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x00800093; // ADDI x1, x0, 8
        ram[1] = 0x00409113; // SLLI x2, x1, 4 -> x2 = 8 << 4 = 128
        ram[2] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[2], 128);
    }

    #[test]
    fn test_reference_xori() {
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x0FF04093; // XORI x1, x0, 0xFF -> x1 = 0xFF
        ram[1] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[1], 0xFF);
    }

    #[test]
    fn test_reference_ori() {
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x0F006093; // ORI x1, x0, 0xF0 -> x1 = 0xF0
        ram[1] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[1], 0xF0);
    }

    #[test]
    fn test_reference_andi() {
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x0FF00093; // ADDI x1, x0, 0xFF -> x1 = 0xFF
        ram[1] = 0x00F0F113; // ANDI x2, x1, 0x0F -> x2 = 0x0F
        ram[2] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[2], 0x0F);
    }

    #[test]
    fn test_reference_srli() {
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x01000093; // ADDI x1, x0, 16
        ram[1] = 0x0020D113; // SRLI x2, x1, 2 -> x2 = 4
        ram[2] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[1], 16);
        assert_eq!(vm.regs[2], 4);
    }

    #[test]
    fn test_reference_srai() {
        // SRAI preserves sign: -8 >> 1 = -4
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0xFF800093; // ADDI x1, x0, -8
        ram[1] = 0x4010D113; // SRAI x2, x1, 1 (funct7=0x20, shamt=1)
        ram[2] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[2], 0xFFFF_FFFC); // -8 >> 1 = -4
    }

    #[test]
    fn test_reference_slti() {
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x00502093; // SLTI x1, x0, 5 -> x1 = 1 (0 < 5 signed)
        ram[1] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[1], 1);
    }

    #[test]
    fn test_reference_sltiu() {
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x00003093; // SLTIU x1, x0, 0 -> x1 = 0 (0 < 0 unsigned is false)
        ram[1] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[1], 0);
    }

    // ============================================================
    // LUI and AUIPC
    // ============================================================

    #[test]
    fn test_reference_lui() {
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x123450B7; // LUI x1, 0x12345 -> x1 = 0x12345000
        ram[1] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[1], 0x12345000);
    }

    #[test]
    fn test_reference_auipc() {
        // AUIPC x1, 0 -> x1 = PC = 0
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x00000097; // AUIPC x1, 0
        ram[1] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[1], 0); // PC was 0 at execution
    }

    #[test]
    fn test_reference_auipc_nonzero() {
        // AUIPC x1, 1 -> x1 = PC + 0x1000 = 0x1000
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x00001097; // AUIPC x1, 1
        ram[1] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[1], 0x1000);
    }

    // ============================================================
    // JAL and JALR
    // ============================================================

    #[test]
    fn test_reference_jal() {
        // JAL x1, +8 (skip next instruction, return addr = PC+4 = 4)
        // ADDI x2, x0, 99 (should be skipped)
        // ADDI x3, x0, 42 (should execute)
        // ECALL
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x008000EF; // JAL x1, +8
        ram[1] = 0x06300113; // ADDI x2, x0, 99 (skipped)
        ram[2] = 0x02A00193; // ADDI x3, x0, 42
        ram[3] = 0x00000073; // ECALL
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[1], 4); // return address
        assert_eq!(vm.regs[2], 0); // skipped
        assert_eq!(vm.regs[3], 42); // executed
    }

    #[test]
    fn test_reference_jalr() {
        // LUI x1, 1 -> x1 = 0x1000
        // ADDI x1, x1, -256 -> x1 = 0xF00 (byte addr = word 960, within RAM_WORDS=992)
        // JALR x2, x1, 0 -> jump to 0xF00, x2 = return addr = 12
        // ADDI x3, x0, 99 (skipped)
        // At word 960 (addr 0xF00): ADDI x3, x0, 77
        // ECALL
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x000010B7; // LUI x1, 1 -> x1 = 0x1000
        ram[1] = 0xF0008093; // ADDI x1, x1, -256 -> x1 = 0xF00
        ram[2] = 0x00008167; // JALR x2, x1, 0 -> jump to 0xF00
        ram[3] = 0x06300193; // ADDI x3, x0, 99 (skipped)
        ram[960] = 0x04D00193; // ADDI x3, x0, 77
        ram[961] = 0x00000073; // ECALL
        let mut vm = ReferenceVm::new(ram);
        vm.run(1000);
        assert_eq!(vm.regs[2], 12); // return address (pc after JALR = 3*4 = 12)
        assert_eq!(vm.regs[3], 77); // from 0xF00
    }

    // ============================================================
    // BRANCH: BEQ, BNE, BLT, BGE
    // ============================================================

    #[test]
    fn test_reference_beq_taken() {
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x00500093; // ADDI x1, x0, 5
        ram[1] = 0x00500113; // ADDI x2, x0, 5
        ram[2] = 0x00208463; // BEQ x1, x2, +8 (taken: skip to ram[4])
        ram[3] = 0x06300193; // ADDI x3, x0, 99 (skipped)
        ram[4] = 0x02A00213; // ADDI x4, x0, 42
        ram[5] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[3], 0); // skipped
        assert_eq!(vm.regs[4], 42);
    }

    #[test]
    fn test_reference_beq_not_taken() {
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x00500093; // ADDI x1, x0, 5
        ram[1] = 0x00300113; // ADDI x2, x0, 3
        ram[2] = 0x00208463; // BEQ x1, x2, +8 (not taken)
        ram[3] = 0x02A00193; // ADDI x3, x0, 42 (executed)
        ram[4] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[3], 42);
    }

    #[test]
    fn test_reference_bne_taken() {
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x00500093; // ADDI x1, x0, 5
        ram[1] = 0x00300113; // ADDI x2, x0, 3
        ram[2] = 0x00209463; // BNE x1, x2, +8 (taken)
        ram[3] = 0x06300193; // ADDI x3, x0, 99 (skipped)
        ram[4] = 0x02A00213; // ADDI x4, x0, 42
        ram[5] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[3], 0);
        assert_eq!(vm.regs[4], 42);
    }

    #[test]
    fn test_reference_blt_taken() {
        // BLT: signed comparison: -1 < 0 is true
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0xFFF00093; // ADDI x1, x0, -1
        ram[1] = 0x0000C463; // BLT x1, x0, +8 (taken: -1 < 0 signed)
        ram[2] = 0x06300193; // ADDI x3, x0, 99 (skipped)
        ram[3] = 0x02A00213; // ADDI x4, x0, 42
        ram[4] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[3], 0);
        assert_eq!(vm.regs[4], 42);
    }

    #[test]
    fn test_reference_bge_taken() {
        // BGE: 5 >= 3 is true
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x00500093; // ADDI x1, x0, 5
        ram[1] = 0x00300113; // ADDI x2, x0, 3
        ram[2] = 0x0020D463; // BGE x1, x2, +8 (taken: 5 >= 3 signed)
        ram[3] = 0x06300193; // ADDI x3, x0, 99 (skipped)
        ram[4] = 0x02A00213; // ADDI x4, x0, 42
        ram[5] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[3], 0);
        assert_eq!(vm.regs[4], 42);
    }

    // ============================================================
    // LOAD (LW) and STORE (SW)
    // ============================================================

    #[test]
    fn test_reference_lw_sw() {
        // ADDI x1, x0, 42
        // SW x1, 124(x0) -> store 42 at byte addr 124 (word 31, past code)
        // LW x2, 124(x0) -> load from word 31
        // ECALL
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x02A00093; // ADDI x1, x0, 42
        ram[1] = 0x06102E23; // SW x1, 124(x0)
        ram[2] = 0x07C02103; // LW x2, 124(x0)
        ram[3] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[1], 42);
        assert_eq!(vm.regs[2], 42);
    }

    // ============================================================
    // OP: ADD, SUB, MUL, AND, OR, XOR, SLL, SRL
    // ============================================================

    #[test]
    fn test_reference_add() {
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x00500093; // ADDI x1, x0, 5
        ram[1] = 0x00300113; // ADDI x2, x0, 3
        ram[2] = 0x002081B3; // ADD x3, x1, x2
        ram[3] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[3], 8);
    }

    #[test]
    fn test_reference_sub() {
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x00500093; // ADDI x1, x0, 5
        ram[1] = 0x00300113; // ADDI x2, x0, 3
        ram[2] = 0x402081B3; // SUB x3, x1, x2
        ram[3] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[3], 2);
    }

    #[test]
    fn test_reference_mul() {
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x00700093; // ADDI x1, x0, 7
        ram[1] = 0x00600113; // ADDI x2, x0, 6
        ram[2] = 0x022081B3; // MUL x3, x1, x2 (funct7=1)
        ram[3] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[3], 42);
    }

    #[test]
    fn test_reference_and_or_xor() {
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x0FF00093; // ADDI x1, x0, 0xFF
        ram[1] = 0x00F00113; // ADDI x2, x0, 0x0F
        ram[2] = 0x0020F333; // AND x6, x1, x2 -> 0xFF & 0x0F = 0x0F
        ram[3] = 0x0020E2B3; // OR  x5, x1, x2 -> 0xFF | 0x0F = 0xFF
        ram[4] = 0x002043B3; // XOR x7, x0, x2 -> 0 ^ 0x0F = 0x0F
        ram[5] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[6], 0x0F);
        assert_eq!(vm.regs[5], 0xFF);
        assert_eq!(vm.regs[7], 0x0F);
    }

    #[test]
    fn test_reference_sll_srl() {
        // x1 = 8, shift left by 0 (x0) -> 8, shift left by 8 (x1) -> 2048
        // shift right by 0 -> 8, shift right by 8 -> 0
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x00800093; // ADDI x1, x0, 8
        ram[1] = 0x00009133; // SLL x2, x1, x0 -> 8
        ram[2] = 0x001091B3; // SLL x3, x1, x1 -> 8 << 8 = 2048
        ram[3] = 0x0000D233; // SRL x4, x1, x0 -> 8
        ram[4] = 0x0010D2B3; // SRL x5, x1, x1 -> 8 >> 8 = 0
        ram[5] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[2], 8);
        assert_eq!(vm.regs[3], 2048);
        assert_eq!(vm.regs[4], 8);
        assert_eq!(vm.regs[5], 0);
    }

    // ============================================================
    // x0 hardwired to zero
    // ============================================================

    #[test]
    fn test_reference_x0_always_zero() {
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x02A00013; // ADDI x0, x0, 42 -> x0 should still be 0
        ram[1] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.regs[0], 0);
    }

    // ============================================================
    // SYSTEM: EBREAK (halt with error)
    // ============================================================

    #[test]
    fn test_reference_ebreak() {
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x00100073; // EBREAK
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_ne!(vm.status & STATUS_HALTED, 0);
        assert_ne!(vm.status & STATUS_ERROR, 0);
    }

    // ============================================================
    // Unknown instruction
    // ============================================================

    #[test]
    fn test_reference_unknown_instruction() {
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x0F0F0F0F; // garbage opcode (opcode=0x0F, not valid)
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_ne!(vm.status & STATUS_ERROR, 0);
    }

    // ============================================================
    // Instruction count and max_steps
    // ============================================================

    #[test]
    fn test_reference_max_steps_limits() {
        // Infinite loop: JAL x0, 0 (jump to self)
        let mut vm = ReferenceVm::new(vec![0x0000006F; RAM_WORDS]); // JAL x0, 0
        vm.run(10);
        assert_eq!(vm.instruction_count, 10);
        // run() always clears STATUS_RUNNING, so check HALTED is not set
        assert_eq!(vm.status & STATUS_HALTED, 0);
    }

    // ============================================================
    // Run clears STATUS_RUNNING
    // ============================================================

    #[test]
    fn test_reference_run_clears_running() {
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x00000073; // ECALL
        let mut vm = ReferenceVm::new(ram);
        assert_ne!(vm.status & STATUS_RUNNING, 0);
        vm.run(100);
        assert_eq!(vm.status & STATUS_RUNNING, 0);
    }

    // ============================================================
    // UART MMIO: write to 0x10000000 intercepts to uart_output
    // ============================================================

    #[test]
    fn test_reference_uart_mmio_write() {
        let mut ram = vec![0u32; RAM_WORDS];
        ram[0] = 0x100000B7; // LUI x1, 0x10000 -> x1 = 0x10000000
        ram[1] = 0x04100113; // ADDI x2, x0, 0x41 ('A')
        ram[2] = 0x0020A023; // SW x2, 0(x1) -> write 'A' to UART
        ram[3] = 0x04200113; // ADDI x2, x0, 0x42 ('B')
        ram[4] = 0x0020A023; // SW x2, 0(x1) -> write 'B' to UART
        ram[5] = 0x00000073;
        let mut vm = ReferenceVm::new(ram);
        vm.run(100);
        assert_eq!(vm.uart_output, vec![b'A', b'B']);
    }
}
