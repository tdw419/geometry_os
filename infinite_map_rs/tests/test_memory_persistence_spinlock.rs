/// Memory persistence isolation test for spinlock bug
///
/// Tests three hypotheses:
/// 1. Struct Clobber: Does STORE_IND to lk->cpu overwrite adjacent lk->locked?
/// 2. FENCE Barrier: Does FENCE (mapped to NOP) drop pending memory writes?
/// 3. CSR Interrupt: Do CSR writes (CSRRW) disrupt memory state?
///
/// Output format:
///   [T1] 0xXXXXXXXX  - AMOSWAP returned old value
///   [T2] 0xXXXXXXXX  - Memory[0] after AMOSWAP
///   [T3] 0xXXXXXXXX  - lk->locked after adjacent store to lk->cpu
///   [T4] 0xXXXXXXXX  - lk->cpu value
///   [T5] 0xXXXXXXXX  - lk->locked after FENCE
///   [T6] 0xXXXXXXXX  - lk->locked after store to lk->cpu then fence
///   [T7] 0xXXXXXXXX  - lk->locked in holding() check after acquire
///   [T8] 0xXXXXXXXX  - lk->cpu in holding() check after acquire
///   [T9] 0xXXXXXXXX  - lk->locked after release

use infinite_map_rs::geoasm_materializer::CellState;
use std::fs;

#[tokio::test]
async fn test_memory_persistence_spinlock() {
    // Initialize GridRunner with larger grid
    let mut runner = infinite_map_rs::spatial::grid_runner::GridRunner::new_with_grid(512, 256)
        .await
        .expect("Failed to create GridRunner");

    // Load the memory persistence test binary
    let test_path = "/home/jericho/projects/zion/projects/geometry_os/geometry_os/conductor/tracks/xv6-rv32/mem_persistence_test.bin";
    println!("Loading memory persistence test from: {}", test_path);

    let test_data = fs::read(test_path)
        .expect("Failed to read test binary");

    println!("Test size: {} bytes", test_data.len());

    runner.load_binary(&test_data)
        .expect("Failed to load test binary");

    println!("=== Running memory persistence test ===");
    println!("Expected output:\n  [T1] 0x00000007  - AMOSWAP returns old value (7)\n  [T2] 0x00000001  - Memory[0] is now 1\n  [T3] 0x00000001  - lk->locked still 1 after adjacent store\n  [T4] 0xDEADBEEF  - lk->cpu is 0xDEADBEEF\n  [T5] 0x0000AAAA  - lk->locked after FENCE\n  [T6] 0x0000AAAA  - lk->locked after store+fence\n  [T7] 0x00000001  - lk->locked in holding() after acquire\n  [T8] 0x800147E4  - lk->cpu in holding() after acquire\n  [T9] 0x00000000  - lk->locked after release");
    println!("\n=== Actual output: ===\n");

    // Collect all console output
    let mut all_output = String::new();

    // Run for enough ticks to complete all tests
    let tick_count = 2000;
    for tick in 0..tick_count {
        // Execute one tick
        let _state = runner.tick().await
            .expect(&format!("Failed tick {}", tick));

        // Poll SBI console for new output
        if let Ok(new_output) = runner.poll_sbi_console().await {
            if !new_output.is_empty() {
                all_output.push_str(&new_output);
                print!("{}", new_output);
                std::io::stdout().flush().unwrap();
            }
        }

        // Stop if we see the last test marker
        if all_output.contains("[T9]") {
            println!("\nTest completed at tick {}", tick);
            break;
        }

        // Progress indicator
        if tick % 500 == 0 && tick > 0 {
            println!("[{}] {} ticks...", tick, tick);
        }
    }

    println!("\n=== Test completed ({} ticks) ===", tick_count);
    println!("Total console output: {} bytes", all_output.len());

    // Save output for analysis
    fs::write("/tmp/mem_persistence_test_output.txt", &all_output)
        .expect("Failed to write output");

    // Parse and verify results
    let tests = parse_test_output(&all_output);

    println!("\n=== Test Results ===");
    for (id, value) in &tests {
        println!("  T{} = 0x{:08X}", id, value);
    }

    // Critical assertions
    assert!(tests.contains_key(&1), "T1 (AMOSWAP result) missing");
    assert!(tests.contains_key(&2), "T2 (memory[0] after AMOSWAP) missing");
    assert!(tests.contains_key(&3), "T3 (lk->locked after adjacent store) missing");
    assert!(tests.contains_key(&7), "T7 (lk->locked in holding) missing");
    assert!(tests.contains_key(&8), "T8 (lk->cpu in holding) missing");
    assert!(tests.contains_key(&9), "T9 (lk->locked after release) missing");

    // Check AMOSWAP worked
    assert_eq!(tests[&1], 7, "T1: AMOSWAP should return old value 7");
    assert_eq!(tests[&2], 1, "T2: memory[0] should be 1 after AMOSWAP");

    // Check struct clobber
    assert_eq!(tests[&3], 1, "T3: lk->locked should NOT be clobbered by adjacent store to lk->cpu");

    // Check FENCE
    assert_eq!(tests[&5], 0xAAAA, "T5: lk->locked should persist through FENCE");

    // Check critical acquire/release sequence
    assert_eq!(tests[&7], 1, "T7: lk->locked should be 1 in holding() after acquire");
    assert_eq!(tests[&8], 0x800147E4, "T8: lk->cpu should be set correctly");
    assert_eq!(tests[&9], 0, "T9: lk->locked should be 0 after release");

    println!("\n=== All memory persistence tests passed! ===");
}

fn parse_test_output(output: &str) -> std::collections::HashMap<u32, u32> {
    let mut results = std::collections::HashMap::new();

    for line in output.lines() {
        if line.starts_with("[T") {
            // Parse "[T1] 0xXXXXXXXX"
            let parts: Vec<&str> = line.split_whitespace().collect();
            if parts.len() >= 2 {
                let test_id = parts[0]
                    .trim_start_matches("[T")
                    .trim_end_matches(']')
                    .parse::<u32>()
                    .unwrap_or(0);

                let value = u32::from_str_radix(
                    parts[1].trim_start_matches("0x"),
                    16
                ).unwrap_or(0);

                results.insert(test_id, value);
            }
        }
    }

    results
}