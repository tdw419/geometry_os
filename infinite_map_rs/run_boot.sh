#!/bin/bash
# Boot xv6 kernel with diagnostics

cd /home/jericho/projects/zion/projects/geometry_os/geometry_os/systems/infinite_map_rs

cat > /tmp/quick_boot.rs << 'EOF'
use infinite_map_rs::spatial::grid_runner::GridRunner;
use std::io::Write;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    println!("Creating GridRunner 512x256...");
    let mut runner = GridRunner::new_with_grid(512, 256)
        .await
        .expect("GridRunner failed");

    let kernel_path = "/tmp/xv6_diag.kernel.bin";
    let kernel_data = std::fs::read(kernel_path)?;
    println!("Loaded {} bytes", kernel_data.len());

    runner.load_binary(&kernel_data)?;

    println!("=== Booting ===");
    
    let mut output = String::new();
    for tick in 0..500 {
        runner.tick().await?;
        
        if let Ok(new) = runner.poll_sbi_console().await {
            if !new.is_empty() {
                output.push_str(&new);
                
                // Print with highlighting
                if new.contains("[LK") || new.contains("panic") {
                    print!("! {}", new.trim());
                } else {
                    print!("{}", new);
                }
                std::io::stdout().flush()?;
            }
        }
    }

    // Extract and analyze spinlock failures
    println!("\n\n=== SPINLOCK DIAGNOSTIC ===");
    
    for line in output.lines() {
        if line.contains("[LK") {
            println!("  {}", line);
            
            // Decode RA
            if let Some(ra_start) = line.find("ra=0x") {
                let ra_str = &line[ra_start+4..ra_start+12];
                
                // Lookup in kernel.sym
                let result = std::process::Command::new("sh")
                    .arg("-c")
                    .arg(&format!("grep -E '^{}' kernel.sym", ra_str))
                    .current_dir("/home/jericho/projects/zion/projects/geometry_os/geometry_os/conductor/tracks/xv6-rv32")
                    .output()?;
                
                if !result.stdout.is_empty() {
                    println!("    -> {}", String::from_utf8_lossy(&result.stdout).trim());
                }
            }
        }
    }

    std::fs::write("/tmp/boot_diagnostic.txt", &output)?;
    println!("Output saved to /tmp/boot_diagnostic.txt");

    Ok(())
}
EOF

cargo run --release --quiet --example empty 2>/dev/null  # Warm up

rustc --edition 2021 /tmp/quick_boot.rs \
    -L target/release/deps \
    --extern infinite_map_rs=target/release/libinfinite_map_rs.rlib \
    --extern tokio=target/release/deps/libtokio-*.rlib \
    -o /tmp/quick_boot 2>&1 | grep -v "warning" || true

if [ -f /tmp/quick_boot ]; then
    /tmp/quick_boot 2>&1 | tee /tmp/quick_boot_run.txt
else
    echo "Failed to compile"
    exit 1
fi