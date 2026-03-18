// Hilbert clock: Live ticking clock in Hilbert space
// Poke Hilbert coordinates directly into VRAM on port 8769

use std::{collections::BTreeMap, io, net::TcpStream, str::FromStr};

const HOST: &str = "127.0.0.1";
const PORT: u16 = 8769;

pub struct HilbertClock {
    pixels: BTreeMap<u32, u32>,
    time: u32,
}

impl HilbertClock {
    pub fn new() -> Self {
        Self {
            pixels: BTreeMap::new(),
            time: 0,
        }
    }

    // Poke single glyph into VRAM: opcode, stratum, p1, p2
    fn poke_glyph(&self, addr: u32, op: u8, stratum: u8, p1: u8, p2: u8) -> io::Result<()> {
        let url = format!("http://{}/poke?addr=0x{:x}", HOST, addr);
        let body = format!("0x{:x}", op as u32 | ((stratum as u32) << 8) | ((p1 as u32) << 16) | ((p2 as u32) << 24));
        post(url, body.as_str())
    }

    // Poke single pixel value
    fn poke(&self, addr: u32, val: u32) -> io::Result<()> {
        let url = format!("http://{}/poke?addr=0x{:x}", HOST, addr);
        let value = format!("0x{:x}", val);
        post(url, &value)
    }

    pub fn tick(&mut self) -> io::Result<()> {
        // Increment time
        let next_time = self.time.wrapping_add(1);
        self.time = next_time;

        // Visualize current time position (green active glyph)
        self.poke_glyph((self.time & 0xFFFF) as u32,
            1551, // opcode
            16,   // stratum
            5,    // p1
            5     // p2
        )?
