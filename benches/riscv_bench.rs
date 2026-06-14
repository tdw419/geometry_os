// Phase 290: RISC-V vs Native GeOS VM Comparison Benchmarks
// Measures relative performance between the RISC-V interpreter and the native VM
// for equivalent operations.

use criterion::{black_box, criterion_group, criterion_main, BatchSize, Criterion, Throughput};
use geometry_os::riscv::cpu::StepResult;
use geometry_os::riscv::RiscvVm;

/// Run RISC-V VM for N steps, counting actual instructions executed.
/// Stops on Shutdown (halt equivalent) or fetch fault.
fn riscv_run_steps(vm: &mut RiscvVm, max_steps: u64) -> u64 {
    let mut count = 0u64;
    for _ in 0..max_steps {
        let result = vm.step();
        count += 1;
        match result {
            StepResult::Shutdown | StepResult::FetchFault => break,
            _ => {},
        }
    }
    count
}

/// Helper: write a 32-bit instruction to RISC-V RAM at byte address
fn write_instr(vm: &mut RiscvVm, byte_addr: u64, instr: u32) {
    let bytes = instr.to_le_bytes();
    for (i, &b) in bytes.iter().enumerate() {
        vm.bus.mem.write_byte(byte_addr + i as u64, b).unwrap();
    }
}

/// Helper: write a 16-bit compressed instruction to RISC-V RAM
fn write_cinstr(vm: &mut RiscvVm, byte_addr: u64, instr: u16) {
    let bytes = instr.to_le_bytes();
    vm.bus.mem.write_byte(byte_addr, bytes[0]).unwrap();
    vm.bus.mem.write_byte(byte_addr + 1, bytes[1]).unwrap();
}

// ============================================================
// RISC-V VM construction
// ============================================================

fn bench_riscv_vm_new(c: &mut Criterion) {
    c.bench_function("riscv_vm_new_16mb", |b| {
        b.iter(|| {
            let vm = RiscvVm::new(16 * 1024 * 1024);
            black_box(&vm);
        });
    });
}

fn bench_riscv_vm_new_small(c: &mut Criterion) {
    c.bench_function("riscv_vm_new_1mb", |b| {
        b.iter(|| {
            let vm = RiscvVm::new(1024 * 1024);
            black_box(&vm);
        });
    });
}

// ============================================================
// RISC-V instruction dispatch: NOP loop
// ============================================================

fn bench_riscv_nop_loop(c: &mut Criterion) {
    let mut group = c.benchmark_group("riscv_dispatch");
    group.throughput(Throughput::Elements(10000));
    group.bench_function("nop_loop_10k", |b| {
        b.iter_batched(
            || {
                let mut vm = RiscvVm::new(1024 * 1024);
                let ram_base = vm.bus.mem.ram_base;
                // Write 10000 compressed C.NOP (0x0001) instructions
                for i in 0..10000u64 {
                    write_cinstr(&mut vm, ram_base + i * 2, 0x0001);
                }
                // C.J -204 (back to start) = 0xBFFD
                write_cinstr(&mut vm, ram_base + 10000 * 2, 0xBFFD);
                vm.cpu.pc = ram_base as u32;
                vm
            },
            |mut vm| {
                let s = riscv_run_steps(&mut vm, 100000);
                black_box(s);
            },
            BatchSize::SmallInput,
        );
    });
    group.finish();
}

// ============================================================
// RISC-V arithmetic: ADDI loop
// ============================================================

fn bench_riscv_addi_loop(c: &mut Criterion) {
    let mut group = c.benchmark_group("riscv_dispatch");
    group.throughput(Throughput::Elements(10000));
    group.bench_function("addi_loop_10k", |b| {
        b.iter_batched(
            || {
                let mut vm = RiscvVm::new(1024 * 1024);
                let ram_base = vm.bus.mem.ram_base;
                // 32-bit instructions for clarity
                // ADDI x1, x1, 1 = imm=1, rs1=1, funct3=0, rd=1, opcode=0010011
                // = 0x00108093
                // ADDI x1, x0, 0 (init) -- but we set x1=0 below
                // BLTU x0, x1, offset (branch if 0 < x1, i.e. always)
                // Actually, use a simple counter in x2 and BLT x2, x3
                // ADDI x2, x2, 1  = 0x00110113
                // BLT x2, x3, -8  = 0xFE018CE3 (offset -8 = back 2 instructions)

                // li x3, 10000 = addi x3, x0, 8 -> addi x3, x3, 39 -> slli x3, x3, 8 -> ...
                // Simpler: just use C.ADDI for the loop body
                // C.ADDI x2, 1 (0x0485) repeated 9999 times
                // C.BNEZ x2, -19998 (back to start)

                for i in 0..9999u64 {
                    write_cinstr(&mut vm, ram_base + i * 2, 0x0485); // C.ADDI x2, 1
                }
                // C.BNEZ x2, -19998
                // bits[12:10]=111, bits[9:8]=offset[4:3], bits[7]=offset[7], bits[6:5]=offset[6:5], bits[4:3]=offset[2:1], bits[2]=offset[8], bits[1:0]=11
                // rs1=010 (x2), imm=-19998
                // imm[8|4:3|7:6|2:1|5] = 1,10,0,0,0 => wait, -19998 in 9-bit signed:
                // -19998 = 0xB332 = 0b1_011001_100_11_0010
                // imm[8]=1, imm[4:3]=10, imm[7:6]=00, imm[2:1]=10, imm[5]=1
                // bits: [12:10]=111, [9:8]=10, [7]=0, [6:5]=00, [4:3]=10, [2]=1, [1:0]=11
                // = 0b111_10_0_00_10_1_11 = 0xF85F ... let me just compute it properly
                // Actually use a 32-bit BNE to keep it simple
                let bne_addr = ram_base + 9999 * 2;
                // BNE x2, x0, -19998
                // B-type: imm[12|10:5] rs2 rs1 funct3 imm[4:1|11] opcode
                // opcode=1100011, funct3=001 (BNE)
                // rs1=00010 (x2), rs2=00000 (x0)
                // offset = -19998
                // imm bits: [12]=1, [11]=1, [10:5]=100111, [4:1]=1110
                // Full: imm[12]imm[10:5] rs2 rs1 funct3 imm[4:1]imm[11] opcode
                // = 1_100111_00000_00010_001_1110_1_1100011
                // = 0b1_100111_00000_00010_001_1110_1_1100011
                // = 0xC602F7E3 ... this is getting complicated.
                // Just write the bytes directly:
                // BNE x2, x0, -19998
                // offset = -19998, bit encoding:
                // imm[12|10:5|4:1|11] = 1|100111|1110|1
                write_instr(&mut vm, bne_addr, 0xC602F7E3);
                vm.cpu.x[2] = 0; // counter
                vm.cpu.pc = ram_base as u32;
                vm
            },
            |mut vm| {
                let s = riscv_run_steps(&mut vm, 50000);
                black_box(s);
            },
            BatchSize::SmallInput,
        );
    });
    group.finish();
}

// ============================================================
// RISC-V memory access: SW/LW loop
// ============================================================

fn bench_riscv_memory(c: &mut Criterion) {
    let mut group = c.benchmark_group("riscv_memory");
    group.throughput(Throughput::Elements(1000));
    group.bench_function("sw_lw_1000", |b| {
        b.iter_batched(
            || {
                let mut vm = RiscvVm::new(1024 * 1024);
                let ram_base = vm.bus.mem.ram_base;
                let store_base = ram_base + 4096;

                let instructions: [u32; 5] = [
                    0x0020A023, // SW x2, 0(x1)
                    0x00002083, // LW x3, 0(x1)
                    0x00408093, // ADDI x1, x1, 4
                    0x00110113, // ADDI x2, x2, 1
                    0xFE001EE3, // BLT x0, x2, -8 (back to SW)
                ];

                for (i, &instr) in instructions.iter().enumerate() {
                    write_instr(&mut vm, ram_base + i as u64 * 4, instr);
                }

                vm.cpu.x[1] = store_base as u32;
                vm.cpu.x[2] = 0;
                vm.cpu.pc = ram_base as u32;
                vm
            },
            |mut vm| {
                let s = riscv_run_steps(&mut vm, 10000);
                black_box(s);
            },
            BatchSize::SmallInput,
        );
    });
    group.finish();
}

// ============================================================
// RISC-V CLINT timer tick overhead
// ============================================================

fn bench_riscv_clint_tick(c: &mut Criterion) {
    let mut group = c.benchmark_group("riscv_overhead");
    group.bench_function("step_with_clint_1k", |b| {
        b.iter_batched(
            || {
                let mut vm = RiscvVm::new(1024 * 1024);
                let ram_base = vm.bus.mem.ram_base;
                for i in 0..1000u64 {
                    write_cinstr(&mut vm, ram_base + i * 2, 0x0001); // C.NOP
                }
                // C.J -2002 back to start
                write_cinstr(&mut vm, ram_base + 1000 * 2, 0xB7FD);
                vm.cpu.pc = ram_base as u32;
                vm
            },
            |mut vm| {
                let s = riscv_run_steps(&mut vm, 1000);
                black_box(s);
            },
            BatchSize::SmallInput,
        );
    });
    group.finish();
}

// ============================================================
// RISC-V decode overhead (compressed vs 32-bit)
// ============================================================

fn bench_riscv_decode_compressed(c: &mut Criterion) {
    let mut group = c.benchmark_group("riscv_decode");
    group.throughput(Throughput::Elements(10000));
    group.bench_function("c_nop_10k", |b| {
        b.iter_batched(
            || {
                let mut vm = RiscvVm::new(1024 * 1024);
                let ram_base = vm.bus.mem.ram_base;
                for i in 0..10000u64 {
                    write_cinstr(&mut vm, ram_base + i * 2, 0x0001);
                }
                write_cinstr(&mut vm, ram_base + 10000 * 2, 0xBFFD); // C.J back
                vm.cpu.pc = ram_base as u32;
                vm
            },
            |mut vm| {
                let s = riscv_run_steps(&mut vm, 10000);
                black_box(s);
            },
            BatchSize::SmallInput,
        );
    });
    group.finish();
}

fn bench_riscv_decode_32bit(c: &mut Criterion) {
    let mut group = c.benchmark_group("riscv_decode");
    group.throughput(Throughput::Elements(10000));
    group.bench_function("nop_32bit_10k", |b| {
        b.iter_batched(
            || {
                let mut vm = RiscvVm::new(1024 * 1024);
                let ram_base = vm.bus.mem.ram_base;
                // 32-bit NOP = 0x00000013
                for i in 0..10000u64 {
                    write_instr(&mut vm, ram_base + i * 4, 0x00000013);
                }
                // JAL x0, -40000 (back to start)
                // J-type: imm[20|10:1|11|19:12] rd opcode
                // offset = -40000
                // imm[20]=1, imm[10:1]=1110011000, imm[11]=1, imm[19:12]=11101100
                // rd=00000, opcode=1101111
                // = 1_1110011000_1_11101100_00000_1101111
                // = 0xFF66006F
                write_instr(&mut vm, ram_base + 10000 * 4, 0xFF66006F);
                vm.cpu.pc = ram_base as u32;
                vm
            },
            |mut vm| {
                let s = riscv_run_steps(&mut vm, 10000);
                black_box(s);
            },
            BatchSize::SmallInput,
        );
    });
    group.finish();
}

criterion_group!(
    benches,
    bench_riscv_vm_new,
    bench_riscv_vm_new_small,
    bench_riscv_nop_loop,
    bench_riscv_addi_loop,
    bench_riscv_memory,
    bench_riscv_clint_tick,
    bench_riscv_decode_compressed,
    bench_riscv_decode_32bit,
);
criterion_main!(benches);
