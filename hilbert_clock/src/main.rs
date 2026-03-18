// Hilbert clock: Live ticking clock in Hilbert space
// Poke Hilbert coordinates directly into VRAM on port 8769

use std::{io, thread, time};

const HOST: &str = "127.0.0.1";
const PORT: u16 = 8769;

pub struct HilbertClock {
    time: u32,
}

impl HilbertClock {
    pub fn new() -> Self {
        Self { time: 0 }
    }

    fn poke(&self, addr: u32, val: u32) -> io::Result<()> {
        let url = format!("http://{}/poke?addr=0x{:x}", HOST, addr);
        let value = format!("0x{:x}", val);
        let resp = reqwest::blocking::Client::new().post(&url).body(value).send().map_err(|e| io::Error::new(io::ErrorKind::Other, e.to_string()))?;
        Ok(())
    }

    fn poke_glyph(&self, addr: u32, op: u8, g: u8, p1: u8, p2: u8) -> io::Result<()> {
        let val = (op as u32) | ((g as u32) << 8) | ((p1 as u32) << 16) | ((p2 as u32) << 24);
        self.poke(addr, val)
    }

    pub fn visualize(&self) -> io::Result<()> {
        let addr = (self.time & 0xFFFF) as u32;
        self.poke_glyph(addr, 0x69, 0, 222, 0)?;
        self.poke_glyph(addr, 0x69, 1, 222, 0)?;
        Ok(())
    }

    pub fn show_time(&self) -> io::Result<()> {
        let time_str = format!("{:02X}", self.time);
        let addr_base = 0x1100 as u32;
        for (i, &c) in time_str.as_bytes().iter().enumerate() {
            let addr = addr_base + i as u32;
            self.poke(addr, c as u32)?;
        }
        Ok(())
    }

    pub fn tick(&mut self) -> io::Result<()> {
        self.time = self.time.wrapping_add(1);
        self.visualize()?;
        self.show_time()?;
        println!("Clock ticked: {:X}", self.time);
        println!("Active glyph at VRAM address 0x{:04X}", self.time & 0xFFFF);
        println!("Time display: {}", self.time);
        Ok(())
    }
}

pub fn main() -> io::Result<()> {
    println!("Hilbert Clock");
    println!("Visualize: {}::{}", HOST, PORT);
    println!("Time display initialized");
    println!();
    
    let mut clock = HilbertClock::new();
    
    for _ in 0..5 {
        clock.tick()?;
        thread::sleep(time::Duration::from_millis(300));
    }
    
    Ok(())
}
