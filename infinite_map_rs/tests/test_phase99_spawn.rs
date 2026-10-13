// Test Phase 99: SPAWN opcode
// SPAWN_TABLE at 0x3200-0x33FF (8 child VMs x 16 bytes)
// Each entry: status (4B), entry_point (4B), return_pc (4B), _pad (4B)

use infinite_map_rs::RiscvExecutor;

#[tokio::test]
async fn test_spawn_basic() {
    println!("=== Phase 99 Test: SPAWN Basic ===");

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
    // Spawn 4 child VMs:
    //   li x1, 0x5000: 0x05050593
    //   SPAWN x1 (opcode=0x7B): 0x00007BF3
    //   li x1, 0x6000: 0x06050593
    //   SPAWN x1: 0x00007BF3
    //   li x1, 0x7000: 0x07050593
    //   SPAWN x1: 0x00007BF3
    //   li x1, 0x8000: 0x08050593
    //   SPAWN x1: 0x00007BF3
    // Copy SPAWN_TABLE entries to 0x2000 for verification:
    //   lw x5, 0x3200(x0): 0x00122303
    //   sw x5, 0x2000(x0): 0x00A02023
    //   lw x5, 0x3204(x0): 0x00122A03
    //   sw x5, 0x2004(x0): 0x00A02223
    //   lw x5, 0x3208(x0): 0x0012A303
    //   sw x5, 0x2008(x0): 0x00A02423
    //   lw x5, 0x3210(x0): 0x0022A303
    //   sw x5, 0x2010(x0): 0x00A02823
    //   lw x5, 0x3214(x0): 0x0022AA03
    //   sw x5, 0x2014(x0): 0x00A02A23
    //   lw x5, 0x3218(x0): 0x0022B303
    //   sw x5, 0x2018(x0): 0x00A02C23
    //   lw x5, 0x3220(x0): 0x0032A303
    //   sw x5, 0x2020(x0): 0x00A03023
    //   lw x5, 0x3224(x0): 0x0032AA03
    //   sw x5, 0x2024(x0): 0x00A03223
    //   lw x5, 0x3228(x0): 0x0032B303
    //   sw x5, 0x2028(x0): 0x00A03423
    //   lw x5, 0x3230(x0): 0x0042A303
    //   sw x5, 0x2030(x0): 0x00A03823
    //   lw x5, 0x3234(x0): 0x0042AA03
    //   sw x5, 0x2034(x0): 0x00A03A23
    //   lw x5, 0x3238(x0): 0x0042B303
    //   sw x5, 0x2038(x0): 0x00A03C23
    // halt: j halt: 0xFE00006F

    let program: Vec<u8> = vec![
        0x93, 0x05, 0x50, 0x05, // li x1, 0x5000
        0xF3, 0x7B, 0x00, 0x00, // SPAWN x1
        0x93, 0x05, 0x50, 0x06, // li x1, 0x6000
        0xF3, 0x7B, 0x00, 0x00, // SPAWN x1
        0x93, 0x05, 0x50, 0x07, // li x1, 0x7000
        0xF3, 0x7B, 0x00, 0x00, // SPAWN x1
        0x93, 0x05, 0x50, 0x08, // li x1, 0x8000
        0xF3, 0x7B, 0x00, 0x00, // SPAWN x1
        0x03, 0x23, 0x12, 0x00, // lw x5, 0x3200(x0)
        0x23, 0x20, 0xA0, 0x00, // sw x5, 0x2000(x0)
        0x03, 0x2A, 0x12, 0x00, // lw x5, 0x3204(x0)
        0x23, 0x22, 0xA0, 0x00, // sw x5, 0x2004(x0)
        0x03, 0xA3, 0x12, 0x00, // lw x5, 0x3208(x0)
        0x23, 0x24, 0xA0, 0x00, // sw x5, 0x2008(x0)
        0x03, 0xA3, 0x22, 0x00, // lw x5, 0x3210(x0)
        0x23, 0x28, 0xA0, 0x00, // sw x5, 0x2010(x0)
        0x03, 0xAA, 0x22, 0x00, // lw x5, 0x3214(x0)
        0x23, 0x2A, 0xA0, 0x00, // sw x5, 0x2014(x0)
        0x03, 0xB3, 0x22, 0x00, // lw x5, 0x3218(x0)
        0x23, 0x2C, 0xA0, 0x00, // sw x5, 0x2018(x0)
        0x03, 0xA3, 0x32, 0x00, // lw x5, 0x3220(x0)
        0x23, 0x30, 0xA0, 0x00, // sw x5, 0x2020(x0)
        0x03, 0xAA, 0x32, 0x00, // lw x5, 0x3224(x0)
        0x23, 0x32, 0xA0, 0x00, // sw x5, 0x2024(x0)
        0x03, 0xB3, 0x32, 0x00, // lw x5, 0x3228(x0)
        0x23, 0x34, 0xA0, 0x00, // sw x5, 0x2028(x0)
        0x03, 0xA3, 0x42, 0x00, // lw x5, 0x3230(x0)
        0x23, 0x38, 0xA0, 0x00, // sw x5, 0x2030(x0)
        0x03, 0xAA, 0x42, 0x00, // lw x5, 0x3234(x0)
        0x23, 0x3A, 0xA0, 0x00, // sw x5, 0x2034(x0)
        0x03, 0xB3, 0x42, 0x00, // lw x5, 0x3238(x0)
        0x23, 0x3C, 0xA0, 0x00, // sw x5, 0x2038(x0)
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

    // Read SPAWN_TABLE entries from verification area
    let verify_data = executor.read_ram(0x2000, 64); // 4 entries x 16 bytes

    println!("\nVerifying SPAWN_TABLE entries:");

    // Entry 0: status=1, entry_point=0x5000, return_pc=0x100C (approx)
    let status0 = u32::from_le_bytes(verify_data[0..4].try_into().unwrap());
    let entry0 = u32::from_le_bytes(verify_data[4..8].try_into().unwrap());
    let ret0 = u32::from_le_bytes(verify_data[8..12].try_into().unwrap());
    println!(
        "  Entry 0: status={}, entry_point=0x{:04X}, return_pc=0x{:04X}",
        status0, entry0, ret0
    );

    // Entry 1: status=1, entry_point=0x6000, return_pc=0x1014 (approx)
    let status1 = u32::from_le_bytes(verify_data[16..20].try_into().unwrap());
    let entry1 = u32::from_le_bytes(verify_data[20..24].try_into().unwrap());
    let ret1 = u32::from_le_bytes(verify_data[24..28].try_into().unwrap());
    println!(
        "  Entry 1: status={}, entry_point=0x{:04X}, return_pc=0x{:04X}",
        status1, entry1, ret1
    );

    // Entry 2: status=1, entry_point=0x7000, return_pc=0x101C (approx)
    let status2 = u32::from_le_bytes(verify_data[32..36].try_into().unwrap());
    let entry2 = u32::from_le_bytes(verify_data[36..40].try_into().unwrap());
    let ret2 = u32::from_le_bytes(verify_data[40..44].try_into().unwrap());
    println!(
        "  Entry 2: status={}, entry_point=0x{:04X}, return_pc=0x{:04X}",
        status2, entry2, ret2
    );

    // Entry 3: status=1, entry_point=0x8000, return_pc=0x1024 (approx)
    let status3 = u32::from_le_bytes(verify_data[48..52].try_into().unwrap());
    let entry3 = u32::from_le_bytes(verify_data[52..56].try_into().unwrap());
    let ret3 = u32::from_le_bytes(verify_data[56..60].try_into().unwrap());
    println!(
        "  Entry 3: status={}, entry_point=0x{:04X}, return_pc=0x{:04X}",
        status3, entry3, ret3
    );

    // Verify entries
    assert_eq!(status0, 1, "Entry 0 status should be 1 (running)");
    assert_eq!(entry0, 0x5000, "Entry 0 entry_point should be 0x5000");
    assert_eq!(status1, 1, "Entry 1 status should be 1 (running)");
    assert_eq!(entry1, 0x6000, "Entry 1 entry_point should be 0x6000");
    assert_eq!(status2, 1, "Entry 2 status should be 1 (running)");
    assert_eq!(entry2, 0x7000, "Entry 2 entry_point should be 0x7000");
    assert_eq!(status3, 1, "Entry 3 status should be 1 (running)");
    assert_eq!(entry3, 0x8000, "Entry 3 entry_point should be 0x8000");

    // Verify return PCs are valid (should be > 0x1000)
    assert!(ret0 > 0x1000, "Entry 0 return_pc should be valid");
    assert!(ret1 > 0x1000, "Entry 1 return_pc should be valid");
    assert!(ret2 > 0x1000, "Entry 2 return_pc should be valid");
    assert!(ret3 > 0x1000, "Entry 3 return_pc should be valid");

    // Return PCs should be sequential (8 bytes apart for li+SPAWN)
    assert_eq!(
        ret1 - ret0,
        8,
        "Return PCs should be 8 bytes apart (li + SPAWN)"
    );

    println!("\n✓ SPAWN test PASSED");
}