//! Film strip loader for the Geometry OS VM.
//!
//! A film strip is a tall PNG image where each frame is a 256x256 tile.
//! For N frames, the PNG is 256 pixels wide and 256*N pixels tall.
//! The loader slices it into tiles and loads them sequentially into
//! the substrate at a base address.

use crate::software_vm::SoftwareVm;
use crate::substrate::Substrate;
use crate::vm::VmState;

/// Each frame tile is 256x256 = 65536 pixels
pub const FRAME_TILE_SIZE: u32 = 256;
pub const FRAME_TILE_PIXELS: u32 = FRAME_TILE_SIZE * FRAME_TILE_SIZE;

/// A film strip: multiple frames of 256x256 pixel data.
pub struct FilmStrip {
    pub frame_width: u32,
    pub frames: Vec<Vec<u32>>,
}

impl FilmStrip {
    /// Create a FilmStrip from pre-built frame data.
    /// Each frame should contain exactly FRAME_TILE_PIXELS pixels.
    pub fn new(frames: Vec<Vec<u32>>) -> Self {
        Self {
            frame_width: FRAME_TILE_SIZE,
            frames,
        }
    }

    /// Load a film strip from a tall PNG image.
    /// The PNG should be `tile_size` pixels wide and `tile_size * N` pixels tall
    /// for N frames.
    pub fn from_png_bytes(data: &[u8], tile_size: u32) -> Result<Self, String> {
        let img = image::load_from_memory(data)
            .map_err(|e| format!("Failed to decode PNG: {}", e))?;
        let img = img.to_rgba8();
        let (width, height) = img.dimensions();

        if width != tile_size {
            return Err(format!(
                "PNG width {} != tile_size {}",
                width, tile_size
            ));
        }
        if height % tile_size != 0 {
            return Err(format!(
                "PNG height {} is not a multiple of tile_size {}",
                height, tile_size
            ));
        }

        let num_frames = height / tile_size;
        let mut frames = Vec::with_capacity(num_frames as usize);

        for frame_idx in 0..num_frames {
            let y_offset = frame_idx * tile_size;
            let mut frame_pixels = Vec::with_capacity((tile_size * tile_size) as usize);

            for y in 0..tile_size {
                for x in 0..tile_size {
                    let px = img.get_pixel(x, y_offset + y);
                    // Pack RGBA into u32 (little-endian: R | G<<8 | B<<16 | A<<24)
                    let word = (px[0] as u32)
                        | ((px[1] as u32) << 8)
                        | ((px[2] as u32) << 16)
                        | ((px[3] as u32) << 24);
                    frame_pixels.push(word);
                }
            }
            frames.push(frame_pixels);
        }

        Ok(Self {
            frame_width: tile_size,
            frames,
        })
    }

    /// Load from a PNG file on disk.
    pub fn from_png_file(path: &str, tile_size: u32) -> Result<Self, String> {
        let data = std::fs::read(path)
            .map_err(|e| format!("Failed to read {}: {}", path, e))?;
        Self::from_png_bytes(&data, tile_size)
    }

    /// Number of frames in this film strip.
    pub fn frame_count(&self) -> u32 {
        self.frames.len() as u32
    }

    /// Load all frames into a SoftwareVm's RAM starting at `base_addr`.
    /// Returns the total number of pixels loaded.
    pub fn load_into_software_vm(&self, svm: &mut SoftwareVm, base_addr: u32) -> u32 {
        let mut total = 0u32;
        for (i, frame) in self.frames.iter().enumerate() {
            let addr = base_addr + (i as u32) * FRAME_TILE_PIXELS;
            svm.load_program(addr, frame);
            total += frame.len() as u32;
        }
        total
    }

    /// Load all frames into a GPU Substrate starting at `base_addr`.
    pub fn load_into_substrate(&self, substrate: &Substrate, base_addr: u32) -> u32 {
        let mut total = 0u32;
        for (i, frame) in self.frames.iter().enumerate() {
            let addr = base_addr + (i as u32) * FRAME_TILE_PIXELS;
            substrate.load_program(addr, frame);
            total += frame.len() as u32;
        }
        total
    }

    /// Spawn a VM for film strip playback on a SoftwareVm.
    /// Sets up frame_ptr=0 and frame_count in the VmState.
    pub fn spawn_filmstrip_vm(&self, svm: &mut SoftwareVm, vm_id: u32, base_addr: u32) {
        svm.spawn_vm(vm_id, base_addr);
        let vm = svm.vm_state_mut(vm_id as usize);
        vm.attention_mask = 0; // frame_ptr = 0 (first frame)
        vm.frame_count = self.frame_count();
    }
}

/// Build a film strip from a flat pixel buffer containing N concatenated frames.
/// Each frame is exactly `FRAME_TILE_PIXELS` pixels. The buffer length must be a
/// multiple of `FRAME_TILE_PIXELS`.
pub fn filmstrip_from_flat_pixels(flat: &[u32]) -> Result<FilmStrip, String> {
    if flat.is_empty() {
        return Err("Empty pixel buffer".into());
    }
    if flat.len() % (FRAME_TILE_PIXELS as usize) != 0 {
        return Err(format!(
            "Flat pixel buffer length {} is not a multiple of FRAME_TILE_PIXELS {}",
            flat.len(),
            FRAME_TILE_PIXELS
        ));
    }
    let num_frames = flat.len() / (FRAME_TILE_PIXELS as usize);
    let mut frames = Vec::with_capacity(num_frames);
    for i in 0..num_frames {
        let start = i * (FRAME_TILE_PIXELS as usize);
        let end = start + (FRAME_TILE_PIXELS as usize);
        frames.push(flat[start..end].to_vec());
    }
    Ok(FilmStrip::new(frames))
}

/// Build a film strip from assembled program segments.
/// Each segment becomes one frame.
pub fn filmstrip_from_segments(segments: &[Vec<u32>]) -> FilmStrip {
    let mut frames = Vec::with_capacity(segments.len());
    for seg in segments {
        let mut frame = seg.clone();
        // Pad to FRAME_TILE_PIXELS if needed
        frame.resize(FRAME_TILE_PIXELS as usize, 0);
        frames.push(frame);
    }
    FilmStrip::new(frames)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::assembler::Program;

    /// Test that a 3-frame film strip auto-advances through HALT
    #[test]
    fn test_filmstrip_auto_advance() {
        // Frame 0: r0 = 10, HALT (auto-advances to frame 1)
        let mut f0 = Program::new();
        f0.ldi(0, 10);
        f0.halt(); // This triggers auto-advance since frame_count=3, frame_ptr=0

        // Frame 1: r0 += 20, HALT (auto-advances to frame 2)
        let mut f1 = Program::new();
        f1.ldi(1, 20);
        f1.add(0, 1);
        f1.halt(); // auto-advance since frame_ptr=1 < frame_count-1=2

        // Frame 2: r0 += 5, HALT (true halt -- last frame)
        let mut f2 = Program::new();
        f2.ldi(1, 5);
        f2.add(0, 1);
        f2.halt(); // true halt

        let strip = filmstrip_from_segments(&[f0.pixels, f1.pixels, f2.pixels]);
        assert_eq!(strip.frame_count(), 3);

        let mut svm = SoftwareVm::new();
        let base_addr: u32 = 0;
        strip.load_into_software_vm(&mut svm, base_addr);
        strip.spawn_filmstrip_vm(&mut svm, 0, base_addr);

        svm.execute_frame();

        let vm = svm.vm_state(0);
        assert_eq!(vm.state, 2, "VM should be HALTED after last frame"); // VM_HALTED=2
        assert_eq!(vm.regs[0], 35, "10 + 20 + 5 = 35");
        assert_eq!(vm.attention_mask, 2, "frame_ptr should be 2 (last frame)");
    }

    /// Test FRAME opcode jumps to specific frame
    #[test]
    fn test_frame_opcode_jump() {
        // Frame 0: r0 = 100, FRAME r1 (r1=2, jump to frame 2)
        let mut f0 = Program::new();
        f0.ldi(0, 100);
        f0.ldi(1, 2); // target frame
        f0.instruction(crate::assembler::op::FRAME, 0, 1, 0);

        // Frame 1: r0 += 999 (should be SKIPPED)
        let mut f1 = Program::new();
        f1.ldi(1, 999);
        f1.add(0, 1);
        f1.halt();

        // Frame 2: r0 += 1, HALT (true halt)
        let mut f2 = Program::new();
        f2.ldi(1, 1);
        f2.add(0, 1);
        f2.halt();

        let strip = filmstrip_from_segments(&[f0.pixels, f1.pixels, f2.pixels]);
        let mut svm = SoftwareVm::new();
        strip.load_into_software_vm(&mut svm, 0);
        strip.spawn_filmstrip_vm(&mut svm, 0, 0);

        svm.execute_frame();

        let vm = svm.vm_state(0);
        assert_eq!(vm.state, 2, "VM should be HALTED");
        assert_eq!(vm.regs[0], 101, "100 + 1 = 101 (frame 1 skipped)");
        assert_eq!(vm.attention_mask, 2, "frame_ptr should be 2");
    }

    /// Test that regular (non-filmstrip) HALT still works
    #[test]
    fn test_normal_halt_unchanged() {
        let mut p = Program::new();
        p.ldi(0, 42);
        p.halt();

        let mut svm = SoftwareVm::new();
        svm.load_program(0, &p.pixels);
        svm.spawn_vm(0, 0);
        // No filmstrip setup -- frame_count stays 0

        svm.execute_frame();

        let vm = svm.vm_state(0);
        assert_eq!(vm.state, 2, "Normal program should HALT");
        assert_eq!(vm.regs[0], 42);
    }
}
