use anyhow::{Context, Result};
use geometry_os_kernel::gpu_dev_daemon::{DaemonClient, PeekRequest, PokeRequest};
use std::time::Duration;

const WIDTH: u32 = 4096;
const HEIGHT: u32 = 4096;

#[tokio::main]
async fn main() -> Result<()> {
    // Connect to GPU dev daemon
    let client = DaemonClient::new("http://localhost:8769")
        .await
        .context("Failed to connect to gpu_dev_daemon")?;

    println!("[+] Connected to GPU Dev Daemon at :8769");
    println!("[+] Starting Hilbert Clock...");
    println!("[+] This clock visualizes the Hilbert curve mapping time to Hilbert space");
    println!();

    // Pattern for the clock face (glowing spiral)
    let mut pattern_buffer = vec![0u32; (WIDTH * HEIGHT) as usize];

    // Generate Hilbert clock pattern by poking spatial regions
    let stride: usize = WIDTH as usize;
    
    for y in 0..HEIGHT {
        for x in 0..WIDTH {
            let idx = ((y as u32) * WIDTH + x) as usize;
            
            // Create clock hand position based on Hilbert coordinates
            let hilbert_addr: u32 = match x % 512 {
                0..=255 => 0x8000 + ((x as u32) / 512) * WIDTH + (y as u32),
                _ => 0x10000 + ((x as u32) / 512) * WIDTH + (y as u32),
            };
            
            // Clock color based on position
            let color = if x > WIDTH / 2 {
                // Right hemisphere - rotating hand
                let t = ((x + y) as u32) % 256;
                let r = ((t >> 4) & 0x3F) as u8;
                let g = (((t >> 2) & 0x3F) * 2) as u8;
                let b = ((t & 0x0F) * 8) as u8;
                u32::from_le_bytes([b, g, r, 0xFF])
            } else {
                // Left hemisphere - counter-rotating
                let t = ((x * 3 + y * 7) as u32) % 256;
                let r = ((t >> 2) & 0x3F) as u8;
                let g = (((t >> 6) & 0x0F) * 8) as u8;
                let b = ((t & 0x03) * 0x8) as u8;
                u32::from_le_bytes([b, g, r, 0xFF])
            };
            
            // Poke this into Hilbert space
            let request = PokeRequest {
                addr: format!("0x{:08X}", hilbert_addr),
                value: format!("0x{:08X}", color),
            };
            
            if let Err(e) = client.poke(&request).await {
                log::warn!("Poke failed at {:04x}:{:04x}: {:?}", x, y, e);
            }
        }
    }

    println!(");");

    println!('[+']');

    println!('[+'] CPU');

    println!('[+] Hilbert Clock is now running at :8769/peek?size=4096");

    // Keep daemon alive
    let interval = tokio::time::interval(Duration::from_millis(100));
    loop {
        tokio::select! {
            _ = interval.tick() => {
                // Periodically add new pixels to the clock
                for x in 0..256 {
                    let idx = (x as u32 * (WIDTH as u32 / 256)) % (WIDTH * HEIGHT);
                    let color = u32::from_le_bytes([255, 128, 128, 255]);
                    let addr = format!("0x{:08X}", idx);
                    let value = format!("0x{:08X}", color);
                    let _ = client.poke(&PokeRequest {
                        addr,
                        value,
                    }).await;
                }
            }
            else => {
                // Continue running
            }
        }
    }
}
