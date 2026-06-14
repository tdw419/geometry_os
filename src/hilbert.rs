// Hilbert Curve - Maps 1D addresses to 2D pixel coordinates
//
// The RAM texture is 4096x4096 pixels. The Hilbert curve maps a linear address
// (0..16M) to (x,y) coordinates so that nearby addresses cluster visually.
// You can literally SEE where a program lives on the texture.

/// Convert Hilbert distance to (x, y) coordinates on a 4096x4096 grid.
/// Must match the WGSL implementation in glyph_vm_scheduler.wgsl exactly.
pub fn d2xy(mut d: u32) -> (u32, u32) {
    let mut x: u32 = 0;
    let mut y: u32 = 0;
    let mut s: u32 = 1;
    let n = 4096u32;

    while s < n {
        let rx = 1 & (d >> 1);
        let ry = 1 & (d ^ rx);

        if ry == 0 {
            if rx == 1 {
                x = s - 1 - x;
                y = s - 1 - y;
            }
            std::mem::swap(&mut x, &mut y);
        }

        x += s * rx;
        y += s * ry;
        d >>= 2;
        s <<= 1;
    }

    (x, y)
}

/// Convert (x, y) coordinates to Hilbert distance.
pub fn xy2d(x_in: u32, y_in: u32) -> u32 {
    let n = 4096u32;
    let mut x = x_in;
    let mut y = y_in;
    let mut d: u32 = 0;
    let mut s = n / 2;

    while s > 0 {
        let rx = if (x & s) > 0 { 1u32 } else { 0 };
        let ry = if (y & s) > 0 { 1u32 } else { 0 };
        d += s * s * ((3 * rx) ^ ry);

        let (nx, ny) = rot(s, x, y, rx, ry);
        x = nx;
        y = ny;
        s /= 2;
    }

    d
}

fn rot(s: u32, x: u32, y: u32, rx: u32, ry: u32) -> (u32, u32) {
    let mut x = x;
    let mut y = y;
    if ry == 0 {
        if rx == 1 {
            x = (s - 1).wrapping_sub(x);
            y = (s - 1).wrapping_sub(y);
        }
        std::mem::swap(&mut x, &mut y);
    }
    (x, y)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn roundtrip() {
        // d2xy then xy2d should give back the original distance
        for d in [0, 1, 2, 3, 4, 100, 1000, 10000, 1_000_000] {
            let (x, y) = d2xy(d);
            let d2 = xy2d(x, y);
            assert_eq!(
                d, d2,
                "roundtrip failed for d={d}: d2xy=({x},{y}), xy2d={d2}"
            );
        }
    }

    #[test]
    fn spatial_locality() {
        // Nearby addresses should map to nearby pixels
        let (x0, y0) = d2xy(100);
        let (x1, y1) = d2xy(101);
        let dist = ((x0 as i64 - x1 as i64).abs() + (y0 as i64 - y1 as i64).abs()) as u32;
        assert!(dist <= 2, "addresses 100,101 too far apart: dist={dist}");
    }
}
