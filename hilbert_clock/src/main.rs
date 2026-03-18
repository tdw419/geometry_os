const WIDTH: u32 = 256;
const HEIGHT: u32 = 256;

/// Compute 2D coordinates from 1D index using Hilbert curve
/// Spatial locality preserved for GPU cache efficiency
fn hilbert_to_xy(index: u32) -> (usize, usize) {
    let mut x: u32 = 0;
    let mut y: u32 = 0;

    for level in 0..=7u32 {
        let quadrant_mask = (1u64 << (level * 2)) as u32;
        let quadrant_size = (1u64 << level) as u32;

        let quadrant = index & quadrant_mask;
        let (hx, hy) = hilbert_quadrant(quadrant, level as usize);

        x += hx * (quadrant_size as u32);
        y += hy * (quadrant_size as u32);
    }

    ((x.min(WIDTH - 1)) as usize, (y.min(HEIGHT - 1)) as usize)
}

fn hilbert_quadrant(index: u32, level: usize) -> (u32, u32) {
    if level == 0 {
        return if index < 2 { (0, 0) } else { (0, 1) };
    }

    let r = 1u64 << (level - 1);
    let n = index % 4;
    let (tx, ty) = hilbert_quadrant(index / 4, level - 1);

    match n {
        0 => (tx, ty),
        1 => {
            let new_x = (r as u32).wrapping_sub(tx.wrapping_add(1)).wrapping_sub(1);
            (new_x, ty)
        },
        2 => {
            let new_y = (r as u32).wrapping_sub(ty.wrapping_add(1)).wrapping_sub(1);
            (tx, new_y)
        },
        _ => {
            let new_x = (r as u32).wrapping_sub(tx.wrapping_add(1)).wrapping_sub(1);
            let new_y = (r as u32).wrapping_sub(ty.wrapping_add(1)).wrapping_sub(1);
            (new_x, new_y)
        },
    }
}

const VRAM_SIZE: usize = WIDTH as usize * HEIGHT as usize;

fn main() {
    println!("Hilbert Clock - Spatial locality visualization");
    println!("Size: {}x{}", WIDTH, HEIGHT);
    println!("Press Ctrl+C to stop");
    println!();

    let mut index = 0u32;

    loop {
        let mut rts_data = vec![0u8; VRAM_SIZE];

        for i in 0..=(index as u32) {
            let (x, y) = hilbert_to_xy(i);
            let addr = y as usize * WIDTH as usize + x as usize;
            // RGBA red pixel
            rts_data[addr] = 0xFF;
            rts_data[addr + 1] = 0;
            rts_data[addr + 2] = 0;
            rts_data[addr + 3] = 0xFF;
        }

        let filename = format!("hilbert.{:05}.rts", index);
        std::fs::write(&filename, &rts_data).expect("Write failed");
        println!("index={}", index);

        std::thread::sleep(std::time::Duration::from_secs(10));
        index += 1;
    }
}
