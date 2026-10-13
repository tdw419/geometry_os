use std::fs;
use std::io::Write;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let test_path = "/home/jericho/projects/zion/projects/geometry_os/geometry_os/conductor/tracks/xv6-rv32/mem_persistence_test.spatial";
    println!("Loading memory persistence test from: {}", test_path);

    let test_data = fs::read(test_path).expect("Failed to read test binary");

    // Parse grid size from binary header
    let grid_w =
        u32::from_le_bytes([test_data[0], test_data[1], test_data[2], test_data[3]]) as usize;
    let grid_h =
        u32::from_le_bytes([test_data[4], test_data[5], test_data[6], test_data[7]]) as usize;

    println!("Test size: {} bytes", test_data.len());
    println!("Grid from binary: {}x{}", grid_w, grid_h);

    // Use grid from binary, but fix grid_h if it's wrong
    let actual_grid_h = if grid_h == 0 { 256 } else { grid_h };
    println!("Using grid: {}x{}", grid_w, actual_grid_h);

    let mut runner = infinite_map_rs::spatial::grid_runner::GridRunner::new_with_grid(
        grid_w,
        actual_grid_h,
    )
    .await
    .expect("Failed to create GridRunner");

    // Patch the binary header if needed
    let load_data = if grid_h == 0 {
        let mut patched = test_data.clone();
        patched[4..8].copy_from_slice(&256u32.to_le_bytes());
        println!("Patched grid_h in binary header");
        patched
    } else {
        test_data
    };

    runner
        .load_binary(&load_data)
        .expect("Failed to load test binary");

    println!("=== Running memory persistence test ===");
    println!("\n=== Actual output: ===\n");

    let mut all_output = String::new();

    let tick_count = 2000;
    for tick in 0..tick_count {
        let _state = runner.tick().await.expect(&format!("Failed tick {}", tick));

        if let Ok(new_output) = runner.poll_sbi_console().await {
            if !new_output.is_empty() {
                all_output.push_str(&new_output);
                print!("{}", new_output);
                std::io::stdout().flush().unwrap();
            }
        }

        if all_output.contains("[T9]") {
            println!("\nTest completed at tick {}", tick);
            break;
        }

        if tick % 500 == 0 && tick > 0 {
            println!("[{}] {} ticks...", tick, tick);
        }
    }

    println!("\n=== Test completed ===");
    println!("Total console output: {} bytes", all_output.len());

    fs::write("/tmp/mem_persistence_test_output.txt", &all_output).expect("Failed to write output");

    let tests = parse_test_output(&all_output);

    println!("\n=== Test Results ===");
    for (id, value) in &tests {
        println!("  T{} = 0x{:08X}", id, value);
    }

    println!("\n=== Analysis ===");
    if tests.contains_key(&1) && tests[&1] == 7 {
        println!("  ✓ AMOSWAP returns correct old value (7)");
    } else {
        println!("  ✗ AMOSWAP failed: T1={:?}", tests.get(&1));
    }

    if tests.contains_key(&2) && tests[&2] == 1 {
        println!("  ✓ Memory persists after AMOSWAP");
    } else {
        println!("  ✗ Memory persistence failed: T2={:?}", tests.get(&2));
    }

    if tests.contains_key(&3) && tests[&3] == 1 {
        println!("  ✓ Adjacent store (lk->cpu) does NOT clobber lk->locked");
    } else {
        println!(
            "  ✗ STRUCT CLOBBER BUG: T3={:?} (expected 1)",
            tests.get(&3)
        );
    }

    if tests.contains_key(&5) && tests[&5] == 0xAAAA {
        println!("  ✓ FENCE does NOT drop memory writes");
    } else {
        println!("  ✗ FENCE BUG: T5={:?} (expected 0xAAAA)", tests.get(&5));
    }

    if tests.contains_key(&7) && tests[&7] == 1 {
        println!("  ✓ lk->locked is 1 in holding() after acquire");
    } else {
        println!("  ✗ ACQUIRE BUG: T7={:?} (expected 1)", tests.get(&7));
    }

    if tests.contains_key(&8) && tests[&8] == 0x800147E4 {
        println!("  ✓ lk->cpu is set correctly after acquire");
    } else {
        println!(
            "  ✗ lk->cpu BUG: T8={:?} (expected 0x800147E4)",
            tests.get(&8)
        );
    }

    if tests.contains_key(&9) && tests[&9] == 0 {
        println!("  ✓ lk->locked is 0 after release");
    } else {
        println!("  ✗ RELEASE BUG: T9={:?} (expected 0)", tests.get(&9));
    }

    Ok(())
}

fn parse_test_output(output: &str) -> std::collections::HashMap<u32, u32> {
    let mut results = std::collections::HashMap::new();

    for line in output.lines() {
        if line.starts_with("[T") {
            let parts: Vec<&str> = line.split_whitespace().collect();
            if parts.len() >= 2 {
                let test_id = parts[0]
                    .trim_start_matches("[T")
                    .trim_end_matches(']')
                    .parse::<u32>()
                    .unwrap_or(0);

                let value = u32::from_str_radix(parts[1].trim_start_matches("0x"), 16).unwrap_or(0);

                results.insert(test_id, value);
            }
        }
    }

    results
}