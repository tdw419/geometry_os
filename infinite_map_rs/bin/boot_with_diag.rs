use std::fs;
use std::io::Write;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let test_path = "/tmp/xv6_full_boot.spatial";
    println!("Loading xv6 kernel from: {}", test_path);

    let test_data = fs::read(test_path).expect("Failed to read test binary");

    let grid_w = 512;
    let grid_h = 256;
    println!("Using grid: {}x{}", grid_w, grid_h);

    let mut runner =
        infinite_map_rs::spatial::grid_runner::GridRunner::new_with_grid(grid_w, grid_h)
            .await
            .expect("Failed to create GridRunner");

    runner
        .load_binary(&test_data)
        .expect("Failed to load test binary");

    println!("=== Booting xv6 with spinlock diagnostics ===\n");

    let mut all_output = String::new();

    for tick in 0..300 {
        let _state = runner.tick().await.expect(&format!("Failed tick {}", tick));

        if let Ok(new_output) = runner.poll_sbi_console().await {
            if !new_output.is_empty() {
                all_output.push_str(&new_output);
                print!("{}", new_output);
                std::io::stdout().flush().unwrap();
            }
        }

        if all_output.contains("[LK ") || all_output.contains("panic:") {
            println!("\nDiagnostic output detected at tick {}", tick);
            break;
        }

        if tick % 100 == 0 && tick > 0 {
            println!("\n[{}] {} ticks...\n", tick, tick);
        }
    }

    println!("\n=== Completed ===");
    println!("Total output: {} bytes", all_output.len());
    fs::write("/tmp/xv6_spinlock_diag.txt", &all_output).expect("Failed to write output");

    Ok(())
}