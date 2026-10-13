// Test Phase 99: BEEP opcode
// BEEP_QUEUE at 0x3000-0x3107 (16 entries x 8 bytes)
// Head at 0x3080, Tail at 0x3084, Audio ready at 0x3108

use infinite_map_rs::RiscvExecutor;

#[tokio::test]
async fn test_beep_queue_basic() {
    println!("=== Phase 99 Test: BEEP Queue Basic ===");

    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
        backends: wgpu::Backends::all(),
        ..Default::default()
    });

    let adapter = instance
        .request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::HighPerformance,
            compatible_surface: None,
            force_fallback_adapter: false,
        })
        .await
        .expect("Failed to find adapter");

    let (device, queue) = adapter
        .request_device(
            &wgpu::DeviceDescriptor {
                label: Some("RiscvExecutor Device"),
                required_features: wgpu::Features::empty(),
                required_limits: wgpu::Limits::default(),
            },
            None,
        )
        .await
        .expect("Failed to create device");

    let mut executor = RiscvExecutor::new(
        std::sync::Arc::new(device),
        std::sync::Arc::new(queue),
    );

    // Hand-encoded program:
    // Initialize queue head/tail to 0:
    //   sw x0, 0x3080(x0): 0x0020A023
    //   sw x0, 0x3084(x0): 0x0041A023
    // Queue 3 beeps:
    //   li x1, 440: 0x1B800593
    //   li x2, 100: 0x06400613
    //   BEEP x1, x2 (opcode=0x7C): 0x00207CFB
    //   li x1, 880: 0x37000593
    //   li x2, 200: 0x0C800613
    //   BEEP x1, x2: 0x00207CFB
    //   li x1, 220: 0x0DC00593
    //   li x2, 150: 0x09600613
    //   BEEP x1, x2: 0x00207CFB
    // Read audio ready flag:
    //   lw x5, 0x3108(x0): 0x00622303
    //   sw x5, 0x2000(x0): 0x00A02023
    // halt: j halt: 0xFE00006F

    let program: Vec<u8> = vec![
        0x23, 0xA0, 0x20, 0x00, // sw x0, 0x3080(x0)
        0x23, 0xA0, 0x41, 0x00, // sw x0, 0x3084(x0)
        0x93, 0x05, 0x80, 0x1B, // li x1, 440
        0x13, 0x06, 0x40, 0x06, // li x2, 100
        0xFB, 0x7C, 0x20, 0x00, // BEEP x1, x2
        0x93, 0x05, 0x00, 0x37, // li x1, 880
        0x13, 0x06, 0x80, 0x0C, // li x2, 200
        0xFB, 0x7C, 0x20, 0x00, // BEEP x1, x2
        0x93, 0x05, 0xC0, 0x0D, // li x1, 220
        0x13, 0x06, 0x60, 0x09, // li x2, 150
        0xFB, 0x7C, 0x20, 0x00, // BEEP x1, x2
        0x03, 0x23, 0x62, 0x00, // lw x5, 0x3108(x0)
        0x23, 0x20, 0xA0, 0x00, // sw x5, 0x2000(x0)
        0x6F, 0x00, 0x00, 0xFE, // halt: j halt
    ];

    println!("Loading binary: {} bytes", program.len());
    executor
        .load_binary(&program, 0x1000)
        .expect("Failed to load binary");
    executor.set_pc(0x1000);

    // Execute
    println!("Executing for 100 frames...");
    for frame in 0..100 {
        executor.execute_frame();
        if frame % 10 == 0 {
            println!("Frame {}", frame);
        }
    }

    // Verify audio ready flag
    let ram = executor.read_ram(0x2000, 4);
    let audio_ready = u32::from_le_bytes(ram[0..4].try_into().unwrap());
    println!("Audio ready flag = {} (expected 1)", audio_ready);
    assert_eq!(audio_ready, 1, "Audio ready flag should be set");

    // Read BEEP_QUEUE entries
    println!("\nReading BEEP_QUEUE entries:");
    let queue_data = executor.read_ram(0x3000, 16 * 8); // 16 entries x 8 bytes
    for i in 0..16 {
        let freq = u32::from_le_bytes(queue_data[i * 8..i * 8 + 4].try_into().unwrap());
        let dur = u32::from_le_bytes(queue_data[i * 8 + 4..i * 8 + 8].try_into().unwrap());
        if freq != 0 || dur != 0 {
            println!("  Entry {}: freq={} Hz, dur={} ms", i, freq, dur);
        }
    }

    // Verify first 3 entries
    let freq0 = u32::from_le_bytes(queue_data[0..4].try_into().unwrap());
    let dur0 = u32::from_le_bytes(queue_data[4..8].try_into().unwrap());
    let freq1 = u32::from_le_bytes(queue_data[8..12].try_into().unwrap());
    let dur1 = u32::from_le_bytes(queue_data[12..16].try_into().unwrap());
    let freq2 = u32::from_le_bytes(queue_data[16..20].try_into().unwrap());
    let dur2 = u32::from_le_bytes(queue_data[20..24].try_into().unwrap());

    println!("\nVerifying queued tones:");
    println!("  Entry 0: {} Hz, {} ms (expected 440 Hz, 100 ms)", freq0, dur0);
    println!("  Entry 1: {} Hz, {} ms (expected 880 Hz, 200 ms)", freq1, dur1);
    println!("  Entry 2: {} Hz, {} ms (expected 220 Hz, 150 ms)", freq2, dur2);

    assert_eq!(freq0, 440, "First tone frequency should be 440 Hz");
    assert_eq!(dur0, 100, "First tone duration should be 100 ms");
    assert_eq!(freq1, 880, "Second tone frequency should be 880 Hz");
    assert_eq!(dur1, 200, "Second tone duration should be 200 ms");
    assert_eq!(freq2, 220, "Third tone frequency should be 220 Hz");
    assert_eq!(dur2, 150, "Third tone duration should be 150 ms");

    // Read head and tail pointers
    let head_ptr = executor.read_ram(0x3080, 4);
    let tail_ptr = executor.read_ram(0x3084, 4);
    let head = u32::from_le_bytes(head_ptr.try_into().unwrap());
    let tail = u32::from_le_bytes(tail_ptr.try_into().unwrap());
    println!(
        "\nQueue state: head={}, tail={} (expected head=3, tail=0)",
        head, tail
    );

    assert_eq!(head, 3, "Head should point to entry 3");
    assert_eq!(tail, 0, "Tail should still be at 0");

    println!("\n✓ BEEP queue test PASSED");
}