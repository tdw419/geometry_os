#!/bin/bash
# Simple boot capture - saves output to /tmp/boot_output.txt

cd /home/jericho/projects/zion/projects/geometry_os/geometry_os/systems/infinite_map_rs

cat > /tmp/boot_capture.rs << 'EOF'
use infinite_map_rs::geoasm_materializer::CellState;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    println!("=== Creating GridRunner 512x256 ===");
    let mut runner = infinite_map_rs::spatial::grid_runner::GridRunner::new_with_grid(512, 256)
        .await
        .expect("GridRunner failed");

    let kernel_path = "/tmp/xv6_diag.kernel.bin";
    let kernel_data = std::fs::read(kernel_path)?;
    println!("Loaded {} bytes from {}", kernel_data.len(), kernel_path);

    runner.load_binary(&kernel_data)?;

    println!("=== Booting ===");
    
    let mut output = String::new();
    for tick in 0..500 {
        runner.tick().await?;
        
        if let Ok(new) = runner.poll_sbi_console().await {
            if !new.is_empty() {
                output.push_str(&new);
                
                // Highlight diagnostics
                if new.contains("[LK") || new.contains("panic") {
                    println!("! {}", new.trim());
                } else {
                    print!("{}", new);
                    std::io::stdout().flush().ok();
                }
            }
        }
    }

    std::fs::write("/tmp/boot_output.txt", &output)?;
    
    // Summary
    println!("\n\n=== SUMMARY ===");
    if let Some(lk_line) = output.lines().find(|l| l.contains("[LK")) {
        println!("Last [LK diagnostic:");
        println!("  {}", lk_line);
        
        // Extract RA
        if let Some(ra_start) = lk_line.find("ra=0x") {
            let ra_str = &lk_line[ra_start+4..ra_start+12];
            println!("\nReturn address: {}", ra_str);
            
            // Lookup
            let result = std::process::Command::new("grep")
                .args(&["-B1", &format!("^0x{}", ra_str)])
                .current_dir("/home/jericho/projects/zion/projects/geometry_os/geometry_os/conductor/tracks/xv6-rv32")
                .arg("kernel.sym")
                .output()?;
            
            if !result.stdout.is_empty() {
                println!("In kernel.sym:");
                println!("{}", String::from_utf8_lossy(&result.stdout));
            }
        }
    } else {
        println!("No [LK diagnostics captured");
    }

    Ok(())
}
EOF

rustc --edition 2021 /tmp/boot_capture.rs \
    -L target/release/deps \
    --extern infinite_map_rs=target/release/libinfinite_map_rs.rlib \
    --extern tokio=target/release/deps/libtokio-*.rlib \
    -o /tmp/boot_capture 2>&1 | grep -v "warning"

if [ $? -eq 0 ]; then
    /tmp/boot_capture 2>&1 | tee /tmp/boot_run.log
else
    echo "Compilation failed"
    exit 1
fi