// Phase 4: Branch Instructions Benchmark
//
// Validates Phase 4 Branch implementation performance:
// - BEQ/BNE: Conditional branch performance (taken vs not taken)
// - BLT/BGE: Signed comparison branch performance
// - BLTU/BGEU: Unsigned comparison branch performance
// - JAL: Direct jump with link performance
// - JALR: Indirect jump with link performance
//
// Provides CPU baseline to compare against Phase 0.5 GPU benchmarks

use criterion::{black_box, criterion_group, criterion_main, BenchmarkId, Criterion, Throughput};

// Import test utilities
use infinite_map_rs::tests::riscv_test_programs::RiscvEncoder;

// ============================================
// Mock CPU Executor for Benchmarking
// ============================================

/// Mock RISC-V CPU executor for performance benchmarking
/// Matches WGSL behavior from src/shaders/riscv_executor.wgsl
struct MockCpuExecutor {
    /// General purpose registers x0-x31
    registers: [u32; 32],
    /// Program counter
    pc: u32,
    /// Instruction memory (indexed by PC >> 2)
    instructions: Vec<u32>,
    /// Halt flag
    halted: bool,
}

impl MockCpuExecutor {
    /// Create a new mock CPU executor
    fn new() -> Self {
        Self {
            registers: [0u32; 32],
            pc: 0,
            instructions: Vec::new(),
            halted: false,
        }
    }

    /// Load a program into instruction memory
    fn load_program(&mut self, code: &[u32]) {
        self.instructions = code.to_vec();
        self.pc = 0;
        self.halted = false;
    }

    /// Read a register value (x0 is always 0)
    #[inline]
    fn get_reg(&self, reg: u32) -> u32 {
        if reg == 0 {
            0
        } else if reg < 32 {
            self.registers[reg as usize]
        } else {
            0
        }
    }

    /// Set a register value (x0 is read-only)
    #[inline]
    fn set_reg(&mut self, reg: u32, val: u32) {
        if reg != 0 && reg < 32 {
            self.registers[reg as usize] = val;
        }
    }

    /// Fetch instruction from memory
    #[inline]
    fn fetch(&self, addr: u32) -> u32 {
        let idx = (addr >> 2) as usize;
        if idx < self.instructions.len() {
            self.instructions[idx]
        } else {
            0
        }
    }

    /// Decode B-type immediate (branch offset)
    #[inline]
    fn decode_imm_b(inst: u32) -> i32 {
        let imm_lo = ((inst >> 8) & 0xF) as i32; // imm[4:1]
        let imm_hi = ((inst >> 25) & 0x3F) as i32; // imm[10:5]
        let imm_11 = ((inst >> 7) & 0x1) as i32; // imm[11]
        let imm_12 = ((inst >> 31) & 0x1) as i32; // imm[12]

        let mut imm = (imm_lo << 1) | (imm_hi << 5) | (imm_11 << 11) | (imm_12 << 12);
        // Sign extend
        if (imm & 0x1000) != 0 {
            imm |= 0xFFFFE000u32 as i32;
        }
        imm
    }

    /// Decode J-type immediate (jump offset)
    #[inline]
    fn decode_imm_j(inst: u32) -> i32 {
        let imm_lo = ((inst >> 21) & 0x3FF) as i32; // imm[10:1]
        let imm_11 = ((inst >> 20) & 0x1) as i32; // imm[11]
        let imm_hi = ((inst >> 12) & 0xFF) as i32; // imm[19:12]
        let imm_20 = ((inst >> 31) & 0x1) as i32; // imm[20]

        let mut imm = (imm_lo << 1) | (imm_11 << 11) | (imm_hi << 12) | (imm_20 << 20);
        // Sign extend
        if (imm & 0x100000) != 0 {
            imm |= 0xFFE00000u32 as i32;
        }
        imm
    }

    /// Decode I-type immediate
    #[inline]
    fn decode_imm_i(inst: u32) -> i32 {
        let imm = ((inst >> 20) & 0xFFF) as i32;
        if (imm & 0x800) != 0 {
            imm | 0xFFFFF000u32 as i32
        } else {
            imm
        }
    }

    /// Decode instruction fields
    #[inline]
    fn decode_opcode(inst: u32) -> u32 {
        inst & 0x7F
    }

    #[inline]
    fn decode_rd(inst: u32) -> u32 {
        (inst >> 7) & 0x1F
    }

    #[inline]
    fn decode_funct3(inst: u32) -> u32 {
        (inst >> 12) & 0x7
    }

    #[inline]
    fn decode_rs1(inst: u32) -> u32 {
        (inst >> 15) & 0x1F
    }

    #[inline]
    fn decode_rs2(inst: u32) -> u32 {
        (inst >> 20) & 0x1F
    }

    /// Execute a single instruction (optimized for benchmarking)
    #[inline]
    fn execute_instruction(&mut self) -> bool {
        if self.halted {
            return false;
        }

        let inst = self.fetch(self.pc);
        let opcode = Self::decode_opcode(inst);
        let old_pc = self.pc;

        // Execute based on opcode
        match opcode {
            // JAL: Jump and Link
            0x6F => {
                let rd = Self::decode_rd(inst);
                let offset = Self::decode_imm_j(inst);
                // Link: return address = old_pc + 4
                self.set_reg(rd, old_pc.wrapping_add(4));
                // Jump: pc = pc + offset (handle signed offset)
                self.pc = (old_pc as i32).wrapping_add(offset) as u32;
            }

            // JALR: Jump and Link Register
            0x67 => {
                let rd = Self::decode_rd(inst);
                let rs1 = Self::decode_rs1(inst);
                let imm = Self::decode_imm_i(inst);
                // Link: return address = old_pc + 4
                self.set_reg(rd, old_pc.wrapping_add(4));
                // Jump: target = (rs1 + imm) & 0xFFFFFFFE (clear LSB)
                let rs1_val = self.get_reg(rs1) as i32;
                let target = (rs1_val.wrapping_add(imm) as u32) & 0xFFFFFFFE;
                self.pc = target;
            }

            // BRANCH: Branch instructions
            0x63 => {
                let rs1 = Self::decode_rs1(inst);
                let rs2 = Self::decode_rs2(inst);
                let funct3 = Self::decode_funct3(inst);
                let offset = Self::decode_imm_b(inst);

                let rs1_val = self.get_reg(rs1);
                let rs2_val = self.get_reg(rs2);

                let take_branch = match funct3 {
                    // BEQ: branch if rs1 == rs2
                    0x0 => rs1_val == rs2_val,
                    // BNE: branch if rs1 != rs2
                    0x1 => rs1_val != rs2_val,
                    // BLT: branch if (rs1 as i32) < (rs2 as i32) [signed]
                    0x4 => (rs1_val as i32) < (rs2_val as i32),
                    // BGE: branch if (rs1 as i32) >= (rs2 as i32) [signed]
                    0x5 => (rs1_val as i32) >= (rs2_val as i32),
                    // BLTU: branch if rs1 < rs2 [unsigned]
                    0x6 => rs1_val < rs2_val,
                    // BGEU: branch if rs1 >= rs2 [unsigned]
                    0x7 => rs1_val >= rs2_val,
                    _ => false,
                };

                if take_branch {
                    self.pc = (old_pc as i32).wrapping_add(offset) as u32;
                } else {
                    self.pc = old_pc.wrapping_add(4);
                }
            }

            // OP-IMM: Add immediate
            0x13 => {
                let rd = Self::decode_rd(inst);
                let rs1 = Self::decode_rs1(inst);
                let funct3 = Self::decode_funct3(inst);
                let imm = Self::decode_imm_i(inst);

                let rs1_val = self.get_reg(rs1);

                match funct3 {
                    // ADDI: add immediate
                    0x0 => {
                        let result = rs1_val.wrapping_add(imm as u32);
                        self.set_reg(rd, result);
                    }
                    _ => {}
                }
                self.pc = old_pc.wrapping_add(4);
            }

            // LUI: Load Upper Immediate
            0x37 => {
                let rd = Self::decode_rd(inst);
                let imm = ((inst >> 12) & 0xFFFFF) as u32;
                self.set_reg(rd, imm);
                self.pc = old_pc.wrapping_add(4);
            }

            // Other opcodes - just advance PC
            _ => {
                self.pc = old_pc.wrapping_add(4);
            }
        }

        true
    }

    /// Execute N instructions
    #[inline]
    fn execute_n(&mut self, n: usize) -> usize {
        let mut count = 0;
        while count < n && !self.halted {
            if !self.execute_instruction() {
                break;
            }
            count += 1;
        }
        count
    }

    /// Reset CPU state
    fn reset(&mut self) {
        self.registers = [0u32; 32];
        self.pc = 0;
        self.halted = false;
    }
}

impl Default for MockCpuExecutor {
    fn default() -> Self {
        Self::new()
    }
}

// ============================================
// Benchmark 1: BEQ Taken
// ============================================

fn bench_beq_taken(c: &mut Criterion) {
    let mut group = c.benchmark_group("branch_beq_taken");

    for size in [100u32, 1000, 10000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &n| {
            // Create BEQ instruction sequence (branch will be taken)
            let mut encoder = RiscvEncoder::new();
            for _ in 0..n {
                encoder.addi(1, 0, 5); // x1 = 5
                encoder.addi(2, 0, 5); // x2 = 5 (equal, branch taken)
                encoder.beq(1, 2, 0); // beq x1, x2, 0 (taken)
                encoder.addi(3, 0, 1); // x3 = 1 (not executed)
            }
            let code = encoder.finalize();
            let instructions: Vec<u32> = code
                .chunks(4)
                .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
                .collect();

            b.iter(|| {
                let mut cpu = MockCpuExecutor::new();
                cpu.load_program(&instructions);
                black_box(cpu.execute_n(instructions.len()));
            });
        });
    }

    group.finish();
}

// ============================================
// Benchmark 2: BEQ Not Taken
// ============================================

fn bench_beq_not_taken(c: &mut Criterion) {
    let mut group = c.benchmark_group("branch_beq_not_taken");

    for size in [100u32, 1000, 10000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &n| {
            // Create BEQ instruction sequence (branch will not be taken)
            let mut encoder = RiscvEncoder::new();
            for _ in 0..n {
                encoder.addi(1, 0, 5); // x1 = 5
                encoder.addi(2, 0, 3); // x2 = 3 (not equal, branch not taken)
                encoder.beq(1, 2, 0); // beq x1, x2, 0 (not taken)
                encoder.addi(3, 0, 1); // x3 = 1 (executed)
            }
            let code = encoder.finalize();
            let instructions: Vec<u32> = code
                .chunks(4)
                .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
                .collect();

            b.iter(|| {
                let mut cpu = MockCpuExecutor::new();
                cpu.load_program(&instructions);
                black_box(cpu.execute_n(instructions.len()));
            });
        });
    }

    group.finish();
}

// ============================================
// Benchmark 3: BNE Taken
// ============================================

fn bench_bne_taken(c: &mut Criterion) {
    let mut group = c.benchmark_group("branch_bne_taken");

    for size in [100u32, 1000, 10000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &n| {
            // Create BNE instruction sequence (branch will be taken)
            let mut encoder = RiscvEncoder::new();
            for _ in 0..n {
                encoder.addi(1, 0, 5); // x1 = 5
                encoder.addi(2, 0, 3); // x2 = 3 (not equal, branch taken)
                encoder.bne(1, 2, 0); // bne x1, x2, 0 (taken)
                encoder.addi(3, 0, 1); // x3 = 1 (not executed)
            }
            let code = encoder.finalize();
            let instructions: Vec<u32> = code
                .chunks(4)
                .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
                .collect();

            b.iter(|| {
                let mut cpu = MockCpuExecutor::new();
                cpu.load_program(&instructions);
                black_box(cpu.execute_n(instructions.len()));
            });
        });
    }

    group.finish();
}

// ============================================
// Benchmark 4: BLT Signed
// ============================================

fn bench_blt_signed(c: &mut Criterion) {
    let mut group = c.benchmark_group("branch_blt_signed");

    for size in [100u32, 1000, 10000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &n| {
            // Create BLT instruction sequence (signed comparison)
            let mut encoder = RiscvEncoder::new();
            for _ in 0..n {
                encoder.addi(1, 0, -5); // x1 = -5 (0xFFFFFFFB)
                encoder.addi(2, 0, 3); // x2 = 3
                encoder.blt(1, 2, 0); // blt x1, x2, 0 (taken: -5 < 3)
                encoder.addi(3, 0, 1); // x3 = 1 (not executed)
            }
            let code = encoder.finalize();
            let instructions: Vec<u32> = code
                .chunks(4)
                .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
                .collect();

            b.iter(|| {
                let mut cpu = MockCpuExecutor::new();
                cpu.load_program(&instructions);
                black_box(cpu.execute_n(instructions.len()));
            });
        });
    }

    group.finish();
}

// ============================================
// Benchmark 5: BGE Signed
// ============================================

fn bench_bge_signed(c: &mut Criterion) {
    let mut group = c.benchmark_group("branch_bge_signed");

    for size in [100u32, 1000, 10000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &n| {
            // Create BGE instruction sequence (signed comparison)
            let mut encoder = RiscvEncoder::new();
            for _ in 0..n {
                encoder.addi(1, 0, 5); // x1 = 5
                encoder.addi(2, 0, 3); // x2 = 3
                encoder.bge(1, 2, 0); // bge x1, x2, 0 (taken: 5 >= 3)
                encoder.addi(3, 0, 1); // x3 = 1 (not executed)
            }
            let code = encoder.finalize();
            let instructions: Vec<u32> = code
                .chunks(4)
                .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
                .collect();

            b.iter(|| {
                let mut cpu = MockCpuExecutor::new();
                cpu.load_program(&instructions);
                black_box(cpu.execute_n(instructions.len()));
            });
        });
    }

    group.finish();
}

// ============================================
// Benchmark 6: BLTU Unsigned
// ============================================

fn bench_bltu_unsigned(c: &mut Criterion) {
    let mut group = c.benchmark_group("branch_bltu_unsigned");

    for size in [100u32, 1000, 10000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &n| {
            // Create BLTU instruction sequence (unsigned comparison)
            let mut encoder = RiscvEncoder::new();
            for _ in 0..n {
                encoder.addi(1, 0, 3); // x1 = 3
                encoder.addi(2, 0, 5); // x2 = 5
                encoder.bltu(1, 2, 0); // bltu x1, x2, 0 (taken: 3 < 5)
                encoder.addi(3, 0, 1); // x3 = 1 (not executed)
            }
            let code = encoder.finalize();
            let instructions: Vec<u32> = code
                .chunks(4)
                .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
                .collect();

            b.iter(|| {
                let mut cpu = MockCpuExecutor::new();
                cpu.load_program(&instructions);
                black_box(cpu.execute_n(instructions.len()));
            });
        });
    }

    group.finish();
}

// ============================================
// Benchmark 7: JAL with Link
// ============================================

fn bench_jal_link(c: &mut Criterion) {
    let mut group = c.benchmark_group("branch_jal_link");

    for size in [100u32, 1000, 10000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &n| {
            // Create JAL instruction sequence (jump and link)
            let mut encoder = RiscvEncoder::new();
            for i in 0..n {
                encoder.addi(1, 0, i as i32); // Set x1
                                              // Jump forward 1 instruction, link return address to x2
                encoder.jal(2, 4); // jal x2, 4 (skip addi)
                encoder.addi(3, 0, 1); // x3 = 1 (skipped)
                encoder.addi(1, 1, 1); // x1 = x1 + 1 (land here)
            }
            let code = encoder.finalize();
            let instructions: Vec<u32> = code
                .chunks(4)
                .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
                .collect();

            b.iter(|| {
                let mut cpu = MockCpuExecutor::new();
                cpu.load_program(&instructions);
                black_box(cpu.execute_n(instructions.len()));
            });
        });
    }

    group.finish();
}

// ============================================
// Benchmark 8: JALR with Link
// ============================================

fn bench_jalr_link(c: &mut Criterion) {
    let mut group = c.benchmark_group("branch_jalr_link");

    for size in [100u32, 1000, 10000].iter() {
        group.throughput(Throughput::Elements(*size as u64));
        group.bench_with_input(BenchmarkId::from_parameter(size), size, |b, &n| {
            // Create JALR instruction sequence (jump and link register)
            let mut encoder = RiscvEncoder::new();
            for i in 0..n {
                encoder.addi(1, 0, 8); // x1 = 8 (target address)
                encoder.addi(2, 0, i as i32); // Set x2
                                              // Jump to x1, link return address to x3
                encoder.jalr(3, 1, 0); // jalr x3, x1, 0
                encoder.addi(4, 0, 1); // x4 = 1 (skipped)
                encoder.addi(5, 0, 1); // x5 = 1 (skipped)
                encoder.addi(2, 2, 1); // x2 = x2 + 1 (land here)
            }
            let code = encoder.finalize();
            let instructions: Vec<u32> = code
                .chunks(4)
                .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
                .collect();

            b.iter(|| {
                let mut cpu = MockCpuExecutor::new();
                cpu.load_program(&instructions);
                black_box(cpu.execute_n(instructions.len()));
            });
        });
    }

    group.finish();
}

// ============================================
// Comparison: Taken vs Not Taken
// ============================================

fn bench_taken_vs_not_taken(c: &mut Criterion) {
    let mut group = c.benchmark_group("branch_prediction");

    // BEQ taken
    group.bench_function("beq_taken_1k", |b| {
        let mut encoder = RiscvEncoder::new();
        for _ in 0..1000 {
            encoder.addi(1, 0, 5);
            encoder.addi(2, 0, 5);
            encoder.beq(1, 2, 0);
        }
        let code = encoder.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        b.iter(|| {
            let mut cpu = MockCpuExecutor::new();
            cpu.load_program(&instructions);
            black_box(cpu.execute_n(instructions.len()));
        });
    });

    // BEQ not taken
    group.bench_function("beq_not_taken_1k", |b| {
        let mut encoder = RiscvEncoder::new();
        for _ in 0..1000 {
            encoder.addi(1, 0, 5);
            encoder.addi(2, 0, 3);
            encoder.beq(1, 2, 0);
            encoder.addi(3, 0, 1);
        }
        let code = encoder.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        b.iter(|| {
            let mut cpu = MockCpuExecutor::new();
            cpu.load_program(&instructions);
            black_box(cpu.execute_n(instructions.len()));
        });
    });

    // JAL direct jump
    group.bench_function("jal_1k", |b| {
        let mut encoder = RiscvEncoder::new();
        for _ in 0..1000 {
            encoder.jal(1, 4);
            encoder.addi(2, 0, 1);
            encoder.addi(1, 1, 1);
        }
        let code = encoder.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        b.iter(|| {
            let mut cpu = MockCpuExecutor::new();
            cpu.load_program(&instructions);
            black_box(cpu.execute_n(instructions.len()));
        });
    });

    // JALR indirect jump
    group.bench_function("jalr_1k", |b| {
        let mut encoder = RiscvEncoder::new();
        for _ in 0..1000 {
            encoder.addi(1, 0, 8);
            encoder.jalr(2, 1, 0);
            encoder.addi(3, 0, 1);
            encoder.addi(4, 0, 1);
            encoder.addi(2, 2, 1);
        }
        let code = encoder.finalize();
        let instructions: Vec<u32> = code
            .chunks(4)
            .map(|c| u32::from_le_bytes([c[0], c[1], c[2], c[3]]))
            .collect();

        b.iter(|| {
            let mut cpu = MockCpuExecutor::new();
            cpu.load_program(&instructions);
            black_box(cpu.execute_n(instructions.len()));
        });
    });

    group.finish();
}

// ============================================
// Criterion Configuration
// ============================================

criterion_group!(
    benches,
    bench_beq_taken,
    bench_beq_not_taken,
    bench_bne_taken,
    bench_blt_signed,
    bench_bge_signed,
    bench_bltu_unsigned,
    bench_jal_link,
    bench_jalr_link,
    bench_taken_vs_not_taken
);

criterion_main!(benches);
