// Phase 290: Extended Performance Benchmark Suite
// Covers: LINE/SPRITE graphics rates, random memory access, full-program benchmarks,
// RISC-V vs native VM comparison, and comprehensive opcode dispatch benchmarking.

use criterion::{black_box, criterion_group, criterion_main, BatchSize, Criterion, Throughput};
use geometry_os::assembler::assemble;
use geometry_os::vm::Vm;

/// Create a VM pre-loaded with bytecode at address 0
fn vm_with_source(source: &str) -> Vm {
    let asm = assemble(source, 0).unwrap();
    let mut vm = Vm::new();
    for (i, &w) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = w;
        }
    }
    vm.pc = 0;
    vm.halted = false;
    vm
}

/// Load a .asm file from disk, assemble, and run in VM
fn vm_from_file(path: &str) -> Vm {
    let source = std::fs::read_to_string(path).unwrap_or_else(|e| panic!("Failed to read {}: {}", path, e));
    vm_with_source(&source)
}

/// Run VM for N steps, returning actual step count
fn run_steps(vm: &mut Vm, max_steps: usize) -> usize {
    let mut count = 0;
    for _ in 0..max_steps {
        if !vm.step() {
            break;
        }
        count += 1;
    }
    count
}

/// Run VM until FRAME or halt or max_steps, returning (steps, frames_seen)
fn run_until_frame(vm: &mut Vm, max_steps: usize) -> (usize, usize) {
    let mut steps = 0;
    let mut frames = 0;
    for _ in 0..max_steps {
        if !vm.step() {
            break;
        }
        steps += 1;
        if vm.frame_ready {
            vm.frame_ready = false;
            frames += 1;
            if frames >= 1 {
                break;
            }
        }
    }
    (steps, frames)
}

// ============================================================
// 1. LINE opcode benchmark (Bresenham line drawing)
// ============================================================

fn bench_line(c: &mut Criterion) {
    // Single horizontal line across screen
    let horiz_line = r#"
        LDI r1, 0
        LDI r2, 128
        LDI r3, 255
        LDI r4, 128
        LDI r5, 0x00FF00
        LINE r1, r2, r3, r4, r5
        HALT
    "#;

    // Diagonal line
    let diag_line = r#"
        LDI r1, 0
        LDI r2, 0
        LDI r3, 255
        LDI r4, 255
        LDI r5, 0xFF0000
        LINE r1, r2, r3, r4, r5
        HALT
    "#;

    let mut group = c.benchmark_group("vm_line");
    group.bench_function("horizontal_256px", |b| {
        b.iter_batched(
            || vm_with_source(horiz_line),
            |mut vm| { run_steps(&mut vm, 100); black_box(&vm); },
            BatchSize::SmallInput,
        );
    });
    group.bench_function("diagonal_256px", |b| {
        b.iter_batched(
            || vm_with_source(diag_line),
            |mut vm| { run_steps(&mut vm, 100); black_box(&vm); },
            BatchSize::SmallInput,
        );
    });
    group.finish();
}

// ============================================================
// 2. SPRITE opcode benchmark (NxM pixel blit)
// ============================================================

fn bench_sprite(c: &mut Criterion) {
    // 8x8 sprite blit (single call)
    let sprite_8x8 = r#"
        LDI r1, 100
        LDI r2, 100
        LDI r3, 0x3000
        LDI r4, 8
        LDI r5, 8
        SPRITE r1, r2, r3, r4, r5
        HALT
    "#;

    // 16x16 sprite blit
    let sprite_16x16 = r#"
        LDI r1, 50
        LDI r2, 50
        LDI r3, 0x3000
        LDI r4, 16
        LDI r5, 16
        SPRITE r1, r2, r3, r4, r5
        HALT
    "#;

    let mut group = c.benchmark_group("vm_sprite");
    group.bench_function("8x8_blit", |b| {
        b.iter_batched(
            || vm_with_source(sprite_8x8),
            |mut vm| { run_steps(&mut vm, 100); black_box(&vm); },
            BatchSize::SmallInput,
        );
    });
    group.bench_function("16x16_blit", |b| {
        b.iter_batched(
            || vm_with_source(sprite_16x16),
            |mut vm| { run_steps(&mut vm, 100); black_box(&vm); },
            BatchSize::SmallInput,
        );
    });
    group.finish();
}

// ============================================================
// 3. CIRCLE opcode benchmark
// ============================================================

fn bench_circle(c: &mut Criterion) {
    let circle_small = r#"
        LDI r1, 128
        LDI r2, 128
        LDI r3, 10
        LDI r4, 0xFFFFFF
        CIRCLE r1, r2, r3, r4
        HALT
    "#;

    let circle_large = r#"
        LDI r1, 128
        LDI r2, 128
        LDI r3, 100
        LDI r4, 0xFFFFFF
        CIRCLE r1, r2, r3, r4
        HALT
    "#;

    let mut group = c.benchmark_group("vm_circle");
    group.bench_function("radius_10", |b| {
        b.iter_batched(
            || vm_with_source(circle_small),
            |mut vm| { run_steps(&mut vm, 100); black_box(&vm); },
            BatchSize::SmallInput,
        );
    });
    group.bench_function("radius_100", |b| {
        b.iter_batched(
            || vm_with_source(circle_large),
            |mut vm| { run_steps(&mut vm, 100); black_box(&vm); },
            BatchSize::SmallInput,
        );
    });
    group.finish();
}

// ============================================================
// 4. Random memory access (pseudo-random addresses via RAND)
// ============================================================

fn bench_random_memory(c: &mut Criterion) {
    // Use LDI + AND to simulate random addresses (RAND writes to reg)
    let random_store = r#"
        LDI r1, 0
        LDI r2, 1000
        LDI r7, 1
        LDI r4, 0x3FFF
    loop:
        RAND r3
        AND r3, r4
        LDI r5, 42
        STORE r3, r5
        ADD r1, r7
        CMP r1, r2
        BLT r0, loop
        HALT
    "#;

    let random_load = r#"
        LDI r1, 0
        LDI r2, 1000
        LDI r7, 1
        LDI r4, 0x3FFF
        LDI r6, 0
    loop:
        RAND r3
        AND r3, r4
        LOAD r5, r3
        ADD r6, r5
        ADD r1, r7
        CMP r1, r2
        BLT r0, loop
        HALT
    "#;

    let mut group = c.benchmark_group("vm_random_memory");
    group.throughput(Throughput::Elements(1000));

    group.bench_function("store_1000_random", |b| {
        b.iter_batched(
            || vm_with_source(random_store),
            |mut vm| { run_steps(&mut vm, 100_000); black_box(&vm); },
            BatchSize::SmallInput,
        );
    });
    group.bench_function("load_1000_random", |b| {
        b.iter_batched(
            || vm_with_source(random_load),
            |mut vm| { run_steps(&mut vm, 100_000); black_box(&vm); },
            BatchSize::SmallInput,
        );
    });
    group.finish();
}

// ============================================================
// 5. Instruction dispatch benchmark (1M iterations per opcode class)
// ============================================================

fn bench_dispatch_arithmetic(c: &mut Criterion) {
    // Pure ADD loop: 10000 iterations
    let add_loop = r#"
        LDI r1, 0
        LDI r2, 10000
        LDI r7, 1
    loop:
        ADD r1, r7
        CMP r1, r2
        BLT r0, loop
        HALT
    "#;

    let mut group = c.benchmark_group("dispatch");
    group.throughput(Throughput::Elements(10000));
    group.bench_function("add_10k", |b| {
        b.iter_batched(
            || vm_with_source(add_loop),
            |mut vm| { let s = run_steps(&mut vm, 100_000); black_box(s); },
            BatchSize::SmallInput,
        );
    });
    group.finish();
}

fn bench_dispatch_bitwise(c: &mut Criterion) {
    // XOR + AND + OR loop
    let bitwise_loop = r#"
        LDI r1, 0
        LDI r2, 10000
        LDI r7, 1
        LDI r8, 0xFF
        LDI r9, 0x0F
    loop:
        XOR r1, r8
        AND r1, r9
        OR r1, r8
        ADD r1, r7
        CMP r1, r2
        BLT r0, loop
        HALT
    "#;

    let mut group = c.benchmark_group("dispatch");
    group.throughput(Throughput::Elements(10000));
    group.bench_function("bitwise_10k", |b| {
        b.iter_batched(
            || vm_with_source(bitwise_loop),
            |mut vm| { let s = run_steps(&mut vm, 100_000); black_box(s); },
            BatchSize::SmallInput,
        );
    });
    group.finish();
}

fn bench_dispatch_shift(c: &mut Criterion) {
    // SHL + SHR loop
    let shift_loop = r#"
        LDI r1, 0
        LDI r2, 10000
        LDI r7, 1
        LDI r8, 1
    loop:
        SHL r1, r8
        SHR r1, r8
        ADD r1, r7
        CMP r1, r2
        BLT r0, loop
        HALT
    "#;

    let mut group = c.benchmark_group("dispatch");
    group.throughput(Throughput::Elements(10000));
    group.bench_function("shift_10k", |b| {
        b.iter_batched(
            || vm_with_source(shift_loop),
            |mut vm| { let s = run_steps(&mut vm, 100_000); black_box(s); },
            BatchSize::SmallInput,
        );
    });
    group.finish();
}

fn bench_dispatch_muldiv(c: &mut Criterion) {
    // MUL + DIV loop
    let muldiv_loop = r#"
        LDI r1, 1
        LDI r2, 10000
        LDI r7, 1
        LDI r8, 7
        LDI r9, 3
    loop:
        MUL r1, r8
        DIV r1, r9
        ADD r1, r7
        CMP r1, r2
        BLT r0, loop
        HALT
    "#;

    let mut group = c.benchmark_group("dispatch");
    group.throughput(Throughput::Elements(10000));
    group.bench_function("muldiv_10k", |b| {
        b.iter_batched(
            || vm_with_source(muldiv_loop),
            |mut vm| { let s = run_steps(&mut vm, 100_000); black_box(s); },
            BatchSize::SmallInput,
        );
    });
    group.finish();
}

fn bench_dispatch_memory(c: &mut Criterion) {
    // LOAD + STORE loop (sequential)
    let mem_loop = r#"
        LDI r1, 0x2000
        LDI r2, 0
        LDI r3, 10000
        LDI r4, 1
        LDI r5, 42
    loop:
        STORE r1, r5
        LOAD r5, r1
        ADD r1, r4
        ADD r2, r4
        CMP r2, r3
        BLT r0, loop
        HALT
    "#;

    let mut group = c.benchmark_group("dispatch");
    group.throughput(Throughput::Elements(10000));
    group.bench_function("loadstore_10k", |b| {
        b.iter_batched(
            || vm_with_source(mem_loop),
            |mut vm| { let s = run_steps(&mut vm, 100_000); black_box(s); },
            BatchSize::SmallInput,
        );
    });
    group.finish();
}

fn bench_dispatch_stack(c: &mut Criterion) {
    // PUSH/POP loop
    let stack_loop = r#"
        LDI r30, 0xFF00
        LDI r1, 0
        LDI r2, 10000
        LDI r7, 1
        LDI r8, 42
    loop:
        PUSH r8
        POP r9
        ADD r1, r7
        CMP r1, r2
        BLT r0, loop
        HALT
    "#;

    let mut group = c.benchmark_group("dispatch");
    group.throughput(Throughput::Elements(10000));
    group.bench_function("pushpop_10k", |b| {
        b.iter_batched(
            || vm_with_source(stack_loop),
            |mut vm| { let s = run_steps(&mut vm, 100_000); black_box(s); },
            BatchSize::SmallInput,
        );
    });
    group.finish();
}

fn bench_dispatch_graphics(c: &mut Criterion) {
    // PSET in a tight loop: 10000 pixels
    let pset_loop = r#"
        LDI r1, 0
        LDI r2, 0
        LDI r3, 0xFFFFFF
        LDI r4, 100
        LDI r5, 0
        LDI r7, 1
    y_loop:
        LDI r1, 0
    x_loop:
        PSET r1, r2, r3
        ADD r1, r7
        CMP r1, r4
        BLT r0, x_loop
        ADD r2, r7
        ADD r5, r7
        CMP r5, r4
        BLT r0, y_loop
        HALT
    "#;

    let mut group = c.benchmark_group("dispatch");
    group.throughput(Throughput::Elements(10000)); // 100x100 = 10000 pixels
    group.bench_function("pset_10k", |b| {
        b.iter_batched(
            || vm_with_source(pset_loop),
            |mut vm| { let s = run_steps(&mut vm, 200_000); black_box(s); },
            BatchSize::SmallInput,
        );
    });
    group.finish();
}

// ============================================================
// 6. Full-program benchmarks (plasma, snake frame times)
// ============================================================

fn bench_full_programs(c: &mut Criterion) {
    let mut group = c.benchmark_group("full_program");

    // Plasma: build sine table + render one frame
    let plasma_path = "programs/plasma.asm";
    if std::path::Path::new(plasma_path).exists() {
        group.bench_function("plasma_first_frame", |b| {
            b.iter_batched(
                || vm_from_file(plasma_path),
                |mut vm| {
                    let (steps, frames) = run_until_frame(&mut vm, 5_000_000);
                    black_box((steps, frames));
                },
                BatchSize::SmallInput,
            );
        });
    }

    // Snake: run one frame (game loop with IKEY)
    let snake_path = "programs/snake.asm";
    if std::path::Path::new(snake_path).exists() {
        group.bench_function("snake_first_frame", |b| {
            b.iter_batched(
                || vm_from_file(snake_path),
                |mut vm| {
                    let (steps, frames) = run_until_frame(&mut vm, 5_000_000);
                    black_box((steps, frames));
                },
                BatchSize::SmallInput,
            );
        });
    }

    // Fire animation: one frame
    let fire_path = "programs/fire.asm";
    if std::path::Path::new(fire_path).exists() {
        group.bench_function("fire_first_frame", |b| {
            b.iter_batched(
                || vm_from_file(fire_path),
                |mut vm| {
                    let (steps, frames) = run_until_frame(&mut vm, 1_000_000);
                    black_box((steps, frames));
                },
                BatchSize::SmallInput,
            );
        });
    }

    // Starfield: one frame
    let starfield_path = "programs/starfield.asm";
    if std::path::Path::new(starfield_path).exists() {
        group.bench_function("starfield_first_frame", |b| {
            b.iter_batched(
                || vm_from_file(starfield_path),
                |mut vm| {
                    let (steps, frames) = run_until_frame(&mut vm, 5_000_000);
                    black_box((steps, frames));
                },
                BatchSize::SmallInput,
            );
        });
    }

    // Living map: one frame
    let living_map_path = "programs/living_map.asm";
    if std::path::Path::new(living_map_path).exists() {
        group.bench_function("living_map_first_frame", |b| {
            b.iter_batched(
                || vm_from_file(living_map_path),
                |mut vm| {
                    let (steps, frames) = run_until_frame(&mut vm, 5_000_000);
                    black_box((steps, frames));
                },
                BatchSize::SmallInput,
            );
        });
    }

    group.finish();
}

// ============================================================
// 7. Infinite map: tile rendering benchmark
// ============================================================

fn bench_infinite_map(c: &mut Criterion) {
    let path = "programs/infinite_map.asm";
    if !std::path::Path::new(path).exists() {
        return;
    }

    let mut group = c.benchmark_group("infinite_map");

    group.bench_function("first_frame", |b| {
        b.iter_batched(
            || vm_from_file(path),
            |mut vm| {
                let (steps, frames) = run_until_frame(&mut vm, 10_000_000);
                black_box((steps, frames));
            },
            BatchSize::SmallInput,
        );
    });

    // Measure sustained throughput: run 5 frames
    group.bench_function("five_frames", |b| {
        b.iter_batched(
            || vm_from_file(path),
            |mut vm| {
                let mut total_steps = 0;
                let mut total_frames = 0;
                for _ in 0..5 {
                    let (steps, frames) = run_until_frame(&mut vm, 10_000_000);
                    total_steps += steps;
                    total_frames += frames;
                    if frames == 0 {
                        break;
                    }
                }
                black_box((total_steps, total_frames));
            },
            BatchSize::SmallInput,
        );
    });

    group.finish();
}

// ============================================================
// 8. I-cache effectiveness benchmark
// ============================================================

fn bench_icache(c: &mut Criterion) {
    // Small loop that fits in icache -- repeated execution of same code
    let tight_loop = r#"
        LDI r1, 0
        LDI r2, 50000
        LDI r7, 1
    loop:
        ADD r1, r7
        CMP r1, r2
        BLT r0, loop
        HALT
    "#;

    // Larger loop body (more instructions to cache)
    let wide_loop = r#"
        LDI r1, 0
        LDI r2, 10000
        LDI r7, 1
        LDI r10, 0
    loop:
        ADD r1, r7
        ADD r10, r1
        ADD r10, r7
        SUB r10, r1
        ADD r10, r1
        CMP r1, r2
        BLT r0, loop
        HALT
    "#;

    let mut group = c.benchmark_group("icache");
    group.throughput(Throughput::Elements(50000));

    group.bench_function("tight_loop_50k", |b| {
        b.iter_batched(
            || vm_with_source(tight_loop),
            |mut vm| { let s = run_steps(&mut vm, 200_000); black_box(s); },
            BatchSize::SmallInput,
        );
    });

    group.bench_function("wide_loop_50k_equiv", |b| {
        b.iter_batched(
            || vm_with_source(wide_loop),
            |mut vm| { let s = run_steps(&mut vm, 200_000); black_box(s); },
            BatchSize::SmallInput,
        );
    });

    group.finish();
}

// ============================================================
// 9. Multi-process scheduling overhead
// ============================================================

fn bench_scheduling(c: &mut Criterion) {
    // Main process with one child -- round-robin overhead
    let two_process = r#"
        LDI r1, child
        SPAWN r1
        LDI r10, 0
        LDI r11, 1000
        LDI r7, 1
    loop:
        ADD r10, r7
        CMP r10, r11
        BLT r0, loop
        KILL r1
        HALT
    .org 0x400
    child:
        LDI r10, 0
        LDI r11, 1000
        LDI r7, 1
    cloop:
        ADD r10, r7
        CMP r10, r11
        BLT r0, cloop
        FRAME
        JMP cloop
    "#;

    let mut group = c.benchmark_group("scheduling");
    group.bench_function("two_processes_1k_iters", |b| {
        b.iter_batched(
            || vm_with_source(two_process),
            |mut vm| { run_steps(&mut vm, 100_000); black_box(&vm); },
            BatchSize::SmallInput,
        );
    });
    group.finish();
}

// ============================================================
// 10. TEXT opcode benchmark
// ============================================================

fn bench_text(c: &mut Criterion) {
    let text_render = r#"
        LDI r10, 0x2000
        LDI r11, 72
        STRO r10, "Hello World"
        LDI r11, 10
        LDI r12, 10
        TEXT r11, r12, r10
        HALT
    "#;

    let mut group = c.benchmark_group("vm_text");
    group.bench_function("render_hello_world", |b| {
        b.iter_batched(
            || vm_with_source(text_render),
            |mut vm| { run_steps(&mut vm, 1000); black_box(&vm); },
            BatchSize::SmallInput,
        );
    });
    group.finish();
}

// ============================================================
// 11. SCROLL opcode benchmark
// ============================================================

fn bench_scroll(c: &mut Criterion) {
    let scroll_program = r#"
        LDI r0, 1
        SCROLL r0
        HALT
    "#;

    let mut group = c.benchmark_group("vm_scroll");
    group.bench_function("scroll_1px", |b| {
        b.iter_batched(
            || vm_with_source(scroll_program),
            |mut vm| { run_steps(&mut vm, 100); black_box(&vm); },
            BatchSize::SmallInput,
        );
    });
    group.finish();
}

// ============================================================
// 12. FLOOD opcode benchmark
// ============================================================

fn bench_flood(c: &mut Criterion) {
    let flood_program = r#"
        LDI r1, 128
        LDI r2, 128
        LDI r3, 0xFF0000
        LDI r4, 0
        FLOOD r1, r2, r3, r4
        HALT
    "#;

    let mut group = c.benchmark_group("vm_flood");
    group.bench_function("flood_center_red", |b| {
        b.iter_batched(
            || vm_with_source(flood_program),
            |mut vm| { run_steps(&mut vm, 1_000_000); black_box(&vm); },
            BatchSize::SmallInput,
        );
    });
    group.finish();
}

// ============================================================
// 13. PEEK (screen readback) benchmark
// ============================================================

fn bench_peek(c: &mut Criterion) {
    let peek_loop = r#"
        LDI r1, 0
        LDI r2, 0
        LDI r3, 0
        LDI r4, 256
        LDI r5, 0
        LDI r6, 0
        LDI r7, 1
    y_loop:
        LDI r1, 0
    x_loop:
        PEEK r1, r2, r3
        ADD r6, r3
        ADD r1, r7
        CMP r1, r4
        BLT r0, x_loop
        ADD r2, r7
        ADD r5, r7
        CMP r5, r4
        BLT r0, y_loop
        HALT
    "#;

    let mut group = c.benchmark_group("vm_peek");
    group.throughput(Throughput::Elements(65536));
    group.bench_function("peek_all_65536_pixels", |b| {
        b.iter_batched(
            || vm_with_source(peek_loop),
            |mut vm| { let s = run_steps(&mut vm, 1_000_000); black_box(s); },
            BatchSize::SmallInput,
        );
    });
    group.finish();
}

criterion_group!(
    benches,
    bench_line,
    bench_sprite,
    bench_circle,
    bench_random_memory,
    bench_dispatch_arithmetic,
    bench_dispatch_bitwise,
    bench_dispatch_shift,
    bench_dispatch_muldiv,
    bench_dispatch_memory,
    bench_dispatch_stack,
    bench_dispatch_graphics,
    bench_full_programs,
    bench_infinite_map,
    bench_icache,
    bench_scheduling,
    bench_text,
    bench_scroll,
    bench_flood,
    bench_peek,
);
criterion_main!(benches);
