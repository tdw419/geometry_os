//! Simple PC tracing test to understand execution flow

use infinite_map_rs::riscv_executor::RiscvExecutor;

#[tokio::test]
async fn test_pc_trace_simple() {
    if std::env::var("NO_GPU").is_ok() {
        println!("Skipping test - NO_GPU set");
        return;
    }

    let device = wgpu_test::gpu().await;
    let queue = device.queue();

    let executor = RiscvExecutor::new(device.clone(), queue.clone());

    // Simple program: addi x1, x0, 100; addi x2, x0, 200; EBREAK
    let program: Vec<u8> = vec![
        0x93, 0x00, 0x40, 0x06, // addi x1, x0, 100
        0x13, 0x01, 0x80, 0x0C, // addi x2, x0, 200
        0x73, 0x00, 0x10, 0x00, // EBREAK - halt
    ];

    println!("Loading binary: {} bytes", program.len());
    executor.load_binary(&program, 0x1000).expect("Failed to load binary");
    executor.set_pc(0x1000);

    println!("Initial PC: 0x{:04X}", executor.get_pc());

    // Execute frame by frame, tracing PC
    for frame in 0..10 {
        executor.execute_frame().await;
        let pc = executor.get_pc();
        println!(
            "Frame {}: PC = 0x{:04X}, Running = {}",
            frame,
            pc,
            executor.is_running()
        );

        if !executor.is_running() {
            println!("Halted at frame {}", frame);
            break;
        }
    }

    // Check results
    let x1 = executor.get_reg(1);
    let x2 = executor.get_reg(2);

    println!("x1 = {} (expected 100)", x1);
    println!("x2 = {} (expected 200)", x2);

    assert_eq!(x1, 100, "x1 should be 100");
    assert_eq!(x2, 200, "x2 should be 200");

    println!("✓ PC trace test PASSED");
}