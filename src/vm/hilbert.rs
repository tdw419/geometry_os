//! hilbert.rs -- Hilbert Curve coordinate mapping for Geometry OS
//!
//! Implementation of d2xy (distance to x,y) and xy2d (x,y to distance)
//! for order-N Hilbert curves. Used for spatial locality in the Infinite Map.

pub fn d2xy(n: u64, mut d: u64) -> (u64, u64) {
    let mut x = 0;
    let mut y = 0;
    let mut t = d;
    let mut s = 1;
    while s < n {
        let rx = 1 & (t / 2);
        let ry = 1 & (t ^ rx);
        rot(s, &mut x, &mut y, rx, ry);
        x += s * rx;
        y += s * ry;
        t /= 4;
        s *= 2;
    }
    (x, y)
}

pub fn xy2d(n: u64, x: u64, y: u64) -> u64 {
    let mut rx;
    let mut ry;
    let mut d = 0;
    let mut s = n / 2;
    let mut tx = x;
    let mut ty = y;
    while s > 0 {
        rx = if (tx & s) > 0 { 1 } else { 0 };
        ry = if (ty & s) > 0 { 1 } else { 0 };
        d += s * s * ((3 * rx) ^ ry);
        rot(s, &mut tx, &mut ty, rx, ry);
        s /= 2;
    }
    d
}

// Keep u32 versions for compatibility with existing code
pub fn d2xy_u32(n: u32, d: u32) -> (u32, u32) {
    let (x, y) = d2xy(n as u64, d as u64);
    (x as u32, y as u32)
}

pub fn xy2d_u32(n: u32, x: u32, y: u32) -> u32 {
    xy2d(n as u64, x as u64, y as u64) as u32
}

fn rot(n: u64, x: &mut u64, y: &mut u64, rx: u64, ry: u64) {
    if ry == 0 {
        if rx == 1 {
            *x = (n - 1).wrapping_sub(*x);
            *y = (n - 1).wrapping_sub(*y);
        }
        // Swap x and y
        let t = *x;
        *x = *y;
        *y = t;
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_hilbert_roundtrip() {
        let n = 256;
        for d in 0..16 {
            let (x, y) = d2xy(n, d);
            let d_back = xy2d(n, x, y);
            assert_eq!(d, d_back, "Failed at d={}", d);
        }
    }
}
