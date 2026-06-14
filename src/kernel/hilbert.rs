// Using the optimized version from pixel.rs
pub fn d2xy(n: u32, mut d: u32) -> (u32, u32) {
    let mut x = 0;
    let mut y = 0;
    let mut s = 1;

    while s < n {
        let rx = 1 & (d / 2);
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
        d /= 4;
        s *= 2;
    }

    (x, y)
}
