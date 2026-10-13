#!/bin/bash
# Capture boot output with spinlock RA tracing

cd /home/jericho/projects/zion/projects/geometry_os/geometry_os/systems/infinite_map_rs

cat > /tmp/spinlock_capture.rs << 'EOF'
use infinite_map_rs::spatial::grid_runner::GridRunner;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    println!("Creating GridRunner 512x256...");
    let mut runner = GridRunner::new_with_grid(512, 256)
        .await
        .expect("Failed GridRunner");

    let kernel_path = "/tmp/xv6_diag.kernel.bin";
    println!("Loading from {}", kernel_path);

    let kernel_data = std::fs::read(kernel_path)?;
    println!("Kernel size: {} bytes", kernel_data.len());

    runner.load_binary(&kernel_data)?;

    println!("=== Booting with spinlock diagnostics ===");
    println!("Watching for [LK ...] output...\n");

    let mut all_output = String::new();
    for tick in 0..500 {
        let _state = runner.tick().await?;

        if let Ok(new_output) = runner.poll_sbi_console().await {
            if !new_output.is_empty() {
                all_output.push_str(&new_output);
                
                // Print and highlight spinlock diagnostics
                if new_output.contains("[LK") {
                    println!(">>> {}", new_output.trim());
                } else if new_output.contains("panic") || new_output.contains("release") {
                    println!("!!! {}", new_output.trim());
                } else {
                    print!("{}", new_output);
                }
                std::io::stdout().flush().ok();
            }
        }

        if tick % 100 == 0 && tick > 0 {
            println!("\n[Tick {}]", tick);
        }
    }

    // Extract and analyze spinlock failures
    println!("\n=== Spinlock Diagnostic Summary ===");
    
    if all_output.contains("[LK") {
        for line in all_output.lines() {
            if line.contains("[LK") {
                println!("  {}", line);
            }
        }
    } else {
        println!("  No [LK diagnostics found");
    }

    // Decode return addresses
    for line in all_output.lines() {
        if let Some(ra_pos) = line.find("ra=0x") {
            let ra_str = &line[ra_pos+4..ra_pos+12];  // 8 hex digits
            if let Ok(ra) = u32::from_str_radix(ra_str, 16) {
                println!("\n  Return address 0x{:08X}:", ra);
                // Look up in kernel.sym
                let result = std::process::Command::new("sh")
                    .arg("-c")
                    .arg(&format!("cd /home/jericho/projects/zion/projects/geometry_os/geometry_os/conductor/tracks/xv6-rv32 && grep -B1 '0x{:08X}' kernel.sym", ra))
                    .output()?;
                
                if !result.stdout.is_empty() {
                    let sym = String::from_utf8_lossy(&result.stdout);
                    for sym_line in sym.lines() {
                        if sym_line.trim().len() > 0 {
                            println!("    -> {}", sym_line.trim());
                        }
                    }
                } else {
                    println!("    -> (not in kernel.sym, may be in .text)");
                }
            }
        }
    }

    std::fs::write("/tmp/spinlock_debug_output.txt", &all_output)?;
    println!("\nFull output saved to /tmp/spinlock_debug_output.txt");

    Ok(())
}
EOF

rustc --edition 2021 /tmp/spinlock_capture.rs \
    -L target/release/deps \
    --extern infinite_map_rs=target/release/libinfinite_map_rs.rlib \
    --extern tokio=target/release/deps/libtokio-*.rlib \
    -o /tmp/spinlock_capture 2>&1

if [ $? -eq 0 ]; then
    echo "Running spinlock capture..."
    /tmp/spinlock_capture 2>&1 | tee /tmp/spinlock_capture_run.txt
else
    echo "Compilation failed"
fi