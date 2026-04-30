// gpu_patcher.rs -- GPU-Native Spatial Instruction Patcher for Geometry OS
//
// Applies patches to a bytecode buffer on the GPU. Patches are (address, value, mask)
// triples that selectively overwrite words in RAM. This enables self-modifying code
// at the pixel level: "Pixels Move Pixels."
//
// Two patch modes:
//   PatchMode::Mask:  ram[addr] = (ram[addr] & ~mask) | (val & mask)  -- selective bits
//   PatchMode::Write: ram[addr] = val                                    -- full word overwrite
//
// Usage:
//   let patcher = pollster::block_on(GpuPatcher::new())?;
//   let mut ram = vm.ram.clone();
//   let patches = vec![
//       Patch { addr: 42, val: 0x10, mask: 0xFF, mode: PatchMode::Write },
//       Patch { addr: 100, val: 0xFF, mask: 0x00FF0000, mode: PatchMode::Mask },
//   ];
//   patcher.apply(&mut ram, &patches)?;
//
// Buffer layout (must match WGSL):
//   patch_buf[0] = patch count (u32)
//   patch_buf[1 + 3*i + 0] = address
//   patch_buf[1 + 3*i + 1] = value
//   patch_buf[1 + 3*i + 2] = packed: bits[0]=mode, bits[31:1]=mask

#[cfg(feature = "gpu")]
use anyhow::{Context, Result};

#[cfg(feature = "gpu")]
const GLYPH_PATCHER_WGSL: &str = include_str!("glyph_patcher.wgsl");

/// Maximum number of patches per dispatch.
/// Must match the WGSL constant MAX_PATCHES.
#[cfg(feature = "gpu")]
pub const MAX_PATCHES: usize = 4096;

/// Patch mode: selective mask or full overwrite.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum PatchMode {
    /// Selective bitwise patch: new = (old & ~mask) | (val & mask)
    Mask,
    /// Full word overwrite: new = val
    Write,
}

/// A single patch operation.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct Patch {
    /// Target address in the bytecode buffer (u32 word index).
    pub addr: u32,
    /// Value to write.
    pub val: u32,
    /// Bitmask for selective patching (ignored in Write mode).
    pub mask: u32,
    /// Patch mode.
    pub mode: PatchMode,
}

impl std::fmt::Display for Patch {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self.mode {
            PatchMode::Write => write!(f, "PATCHW addr=0x{:04X} val=0x{:08X}", self.addr, self.val),
            PatchMode::Mask => write!(
                f,
                "PATCH addr=0x{:04X} val=0x{:08X} mask=0x{:08X}",
                self.addr, self.val, self.mask
            ),
        }
    }
}

/// GPU-accelerated spatial patcher for Geometry OS bytecode.
///
/// Dispatches a WGSL compute shader that applies patches in parallel.
/// Each patch modifies a single u32 word in the bytecode buffer.
#[cfg(feature = "gpu")]
pub struct GpuPatcher {
    device: wgpu::Device,
    queue: wgpu::Queue,
    pipeline: wgpu::ComputePipeline,
}

#[cfg(feature = "gpu")]
impl GpuPatcher {
    /// Create a new GPU patcher, initializing the WGPU adapter and compute pipeline.
    pub async fn new() -> Result<Self> {
        let instance = wgpu::Instance::new(&wgpu::InstanceDescriptor {
            backends: wgpu::Backends::all(),
            ..Default::default()
        });

        let adapter = instance
            .request_adapter(&wgpu::RequestAdapterOptions {
                power_preference: wgpu::PowerPreference::HighPerformance,
                compatible_surface: None,
                force_fallback_adapter: false,
            })
            .await
            .context("No GPU adapter found for glyph patcher")?;

        let info = adapter.get_info();
        eprintln!(
            "[gpu-patcher] Adapter: {} (backend: {:?})",
            info.name, info.backend
        );

        let (device, queue) = adapter
            .request_device(&wgpu::DeviceDescriptor {
                label: Some("Glyph Patcher"),
                required_features: wgpu::Features::empty(),
                required_limits: wgpu::Limits::default(),
                ..Default::default()
            })
            .await
            .context("Failed to get GPU device for glyph patcher")?;

        let shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Glyph Patcher Shader"),
            source: wgpu::ShaderSource::Wgsl(GLYPH_PATCHER_WGSL.into()),
        });

        let pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Glyph Patcher Pipeline"),
            layout: None,
            module: &shader,
            entry_point: Some("main"),
            compilation_options: wgpu::PipelineCompilationOptions::default(),
            cache: None,
        });

        Ok(GpuPatcher {
            device,
            queue,
            pipeline,
        })
    }

    /// Apply patches to the bytecode buffer on the GPU.
    ///
    /// Modifies `bytecode` in-place based on the list of patches.
    pub fn apply(&self, bytecode: &mut [u32], patches: &[Patch]) -> Result<()> {
        if patches.is_empty() {
            return Ok(());
        }

        let patch_count = patches.len().min(MAX_PATCHES) as u32;

        // ── Params ────────────────────────────────────────────
        let params_data: [u32; 4] = [bytecode.len() as u32, 0, 0, 0];
        let params_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Patcher Params"),
            size: 16,
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: true,
        });
        params_buffer
            .slice(..)
            .get_mapped_range_mut()
            .copy_from_slice(unsafe {
                std::slice::from_raw_parts(params_data.as_ptr() as *const u8, 16)
            });
        params_buffer.unmap();

        // ── Bytecode buffer (read-write) ─────────────────────
        let bc_bytes: &[u8] = unsafe {
            std::slice::from_raw_parts(bytecode.as_ptr() as *const u8, bytecode.len() * 4)
        };
        let bc_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Patcher Bytecode"),
            size: (bytecode.len() as u64) * 4,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });
        self.queue.write_buffer(&bc_buffer, 0, bc_bytes);

        // ── Patch buffer ──────────────────────────────────────
        // Layout: [count, addr0, val0, mode_mask0, addr1, val1, mode_mask1, ...]
        let patch_data_len = 1 + (patch_count as usize) * 3;
        let mut patch_data = vec![0u32; patch_data_len];
        patch_data[0] = patch_count;
        for (i, patch) in patches.iter().enumerate().take(patch_count as usize) {
            let base = 1 + i * 3;
            patch_data[base + 0] = patch.addr;
            patch_data[base + 1] = patch.val;
            let mode_bit = if patch.mode == PatchMode::Write {
                1u32
            } else {
                0u32
            };
            patch_data[base + 2] = (patch.mask << 1) | mode_bit;
        }

        let patch_bytes: &[u8] = unsafe {
            std::slice::from_raw_parts(patch_data.as_ptr() as *const u8, patch_data.len() * 4)
        };
        let patch_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Patcher Patches"),
            size: (patch_data.len() as u64) * 4,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });
        self.queue.write_buffer(&patch_buffer, 0, patch_bytes);

        // ── Bind group ────────────────────────────────────────
        let bind_group_layout = self.pipeline.get_bind_group_layout(0);
        let bind_group = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Patcher Bind Group"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: bc_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: patch_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: params_buffer.as_entire_binding(),
                },
            ],
        });

        // ── Dispatch ──────────────────────────────────────────
        let workgroup_count = (patch_count + 63) / 64;

        let mut encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("Patcher Dispatch"),
            });

        {
            let mut pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("Glyph Patching"),
                timestamp_writes: None,
            });
            pass.set_pipeline(&self.pipeline);
            pass.set_bind_group(0, &bind_group, &[]);
            pass.dispatch_workgroups(workgroup_count, 1, 1);
        }

        self.queue.submit(Some(encoder.finish()));
        let _ = self.device.poll(wgpu::PollType::Wait {
            submission_index: None,
            timeout: None,
        });

        // ── Read back modified bytecode ───────────────────────
        let read_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Patcher Read Back"),
            size: (bytecode.len() as u64) * 4,
            usage: wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::MAP_READ,
            mapped_at_creation: false,
        });

        let mut encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("Patcher Copy Back"),
            });
        encoder.copy_buffer_to_buffer(&bc_buffer, 0, &read_buffer, 0, (bytecode.len() as u64) * 4);
        self.queue.submit(Some(encoder.finish()));

        let (tx, rx) = std::sync::mpsc::channel();
        read_buffer
            .slice(..)
            .map_async(wgpu::MapMode::Read, move |result| {
                let _ = tx.send(result);
            });
        let _ = self.device.poll(wgpu::PollType::Wait {
            submission_index: None,
            timeout: None,
        });
        rx.recv()?
            .map_err(|e| anyhow::anyhow!("Patcher map failed: {:?}", e))?;

        let data = read_buffer.slice(..).get_mapped_range();
        let words: &[u32] =
            unsafe { std::slice::from_raw_parts(data.as_ptr() as *const u32, data.len() / 4) };
        bytecode.copy_from_slice(words);

        Ok(())
    }
}

// ── CPU Reference Patcher (for testing without GPU) ─────────────

/// Apply a single patch to a bytecode buffer on the CPU.
pub fn cpu_apply_patch(bytecode: &mut [u32], patch: &Patch) {
    if patch.addr as usize >= bytecode.len() {
        return;
    }

    match patch.mode {
        PatchMode::Write => {
            bytecode[patch.addr as usize] = patch.val;
        }
        PatchMode::Mask => {
            let old = bytecode[patch.addr as usize];
            bytecode[patch.addr as usize] = (old & !patch.mask) | (patch.val & patch.mask);
        }
    }
}

/// Apply multiple patches to a bytecode buffer on the CPU.
pub fn cpu_apply_patches(bytecode: &mut [u32], patches: &[Patch]) {
    for patch in patches {
        cpu_apply_patch(bytecode, patch);
    }
}

// ── Tests ───────────────────────────────────────────────────────

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_patch_write_single() {
        let mut buf = vec![0x00000000, 0x11111111, 0x22222222];
        cpu_apply_patch(
            &mut buf,
            &Patch {
                addr: 1,
                val: 0xDEADBEEF,
                mask: 0,
                mode: PatchMode::Write,
            },
        );
        assert_eq!(buf[0], 0x00000000);
        assert_eq!(buf[1], 0xDEADBEEF);
        assert_eq!(buf[2], 0x22222222);
    }

    #[test]
    fn test_patch_mask_low_byte() {
        // Replace low byte: old=0x12345678, mask=0xFF, val=0xAB -> 0x123456AB
        let mut buf = vec![0x12345678];
        cpu_apply_patch(
            &mut buf,
            &Patch {
                addr: 0,
                val: 0xAB,
                mask: 0x000000FF,
                mode: PatchMode::Mask,
            },
        );
        assert_eq!(buf[0], 0x123456AB);
    }

    #[test]
    fn test_patch_mask_high_byte() {
        // Replace high byte: old=0x12345678, mask=0xFF000000, val=0xFF000000 -> 0xFF345678
        let mut buf = vec![0x12345678];
        cpu_apply_patch(
            &mut buf,
            &Patch {
                addr: 0,
                val: 0xFF000000,
                mask: 0xFF000000,
                mode: PatchMode::Mask,
            },
        );
        assert_eq!(buf[0], 0xFF345678);
    }

    #[test]
    fn test_patch_mask_multiple_bits() {
        // Replace bits 8-15 and 24-31
        // old = 0x12345678, mask = 0xFF00FF00, val = 0xAB00CD00
        // result = (0x12345678 & ~0xFF00FF00) | (0xAB00CD00 & 0xFF00FF00)
        //        = (0x00345600 & 0x00FF00FF)   | (0xAB00CD00 & 0xFF00FF00)
        // Wait, ~0xFF00FF00 = 0x00FF00FF
        // result = (0x12345678 & 0x00FF00FF) | (0xAB00CD00 & 0xFF00FF00)
        //        = 0x00340078 | 0xAB00CD00
        //        = 0xAB34CD78
        let mut buf = vec![0x12345678];
        cpu_apply_patch(
            &mut buf,
            &Patch {
                addr: 0,
                val: 0xAB00CD00,
                mask: 0xFF00FF00,
                mode: PatchMode::Mask,
            },
        );
        assert_eq!(buf[0], 0xAB34CD78);
    }

    #[test]
    fn test_patch_out_of_bounds_ignored() {
        let mut buf = vec![0x11111111];
        cpu_apply_patch(
            &mut buf,
            &Patch {
                addr: 999,
                val: 0xDEADBEEF,
                mask: 0,
                mode: PatchMode::Write,
            },
        );
        assert_eq!(buf[0], 0x11111111); // unchanged
    }

    #[test]
    fn test_patch_mask_zero_mask_no_change() {
        let mut buf = vec![0x12345678];
        cpu_apply_patch(
            &mut buf,
            &Patch {
                addr: 0,
                val: 0xDEADBEEF,
                mask: 0x00000000,
                mode: PatchMode::Mask,
            },
        );
        assert_eq!(buf[0], 0x12345678); // no bits selected, no change
    }

    #[test]
    fn test_patch_mask_full_mask_equals_write() {
        let mut buf_a = vec![0x12345678];
        let mut buf_b = vec![0x12345678];

        cpu_apply_patch(
            &mut buf_a,
            &Patch {
                addr: 0,
                val: 0xDEADBEEF,
                mask: 0xFFFFFFFF,
                mode: PatchMode::Mask,
            },
        );
        cpu_apply_patch(
            &mut buf_b,
            &Patch {
                addr: 0,
                val: 0xDEADBEEF,
                mask: 0,
                mode: PatchMode::Write,
            },
        );

        assert_eq!(buf_a[0], buf_b[0]);
        assert_eq!(buf_a[0], 0xDEADBEEF);
    }

    #[test]
    fn test_multiple_patches_sequential() {
        let mut buf = vec![0x00, 0x00, 0x00, 0x00, 0x00, 0x00];
        let patches = vec![
            Patch {
                addr: 0,
                val: 0x10,
                mask: 0,
                mode: PatchMode::Write,
            },
            Patch {
                addr: 1,
                val: 0x00,
                mask: 0,
                mode: PatchMode::Write,
            },
            Patch {
                addr: 2,
                val: 42,
                mask: 0,
                mode: PatchMode::Write,
            },
            Patch {
                addr: 3,
                val: 0x20,
                mask: 0,
                mode: PatchMode::Write,
            },
            Patch {
                addr: 4,
                val: 0x00,
                mask: 0,
                mode: PatchMode::Write,
            },
            Patch {
                addr: 5,
                val: 0x01,
                mask: 0,
                mode: PatchMode::Write,
            },
        ];
        cpu_apply_patches(&mut buf, &patches);
        // Should have: LDI r0, 42 | ADD r0, r1
        assert_eq!(buf[0], 0x10); // LDI
        assert_eq!(buf[1], 0x00); // r0
        assert_eq!(buf[2], 42); // imm
        assert_eq!(buf[3], 0x20); // ADD
        assert_eq!(buf[4], 0x00); // r0
        assert_eq!(buf[5], 0x01); // r1
    }

    #[test]
    fn test_patch_display_write() {
        let p = Patch {
            addr: 0x100,
            val: 0xDEADBEEF,
            mask: 0,
            mode: PatchMode::Write,
        };
        assert_eq!(format!("{}", p), "PATCHW addr=0x0100 val=0xDEADBEEF");
    }

    #[test]
    fn test_patch_display_mask() {
        let p = Patch {
            addr: 0x42,
            val: 0xFF000000,
            mask: 0xFF000000,
            mode: PatchMode::Mask,
        };
        assert_eq!(
            format!("{}", p),
            "PATCH addr=0x0042 val=0xFF000000 mask=0xFF000000"
        );
    }

    #[test]
    fn test_self_modifying_code_scenario() {
        // Simulate a program that patches its own LDI immediate:
        // Initial: LDI r0, 10 | ADD r1, r2 | HALT
        // Patch:   Change the immediate from 10 to 99
        let mut buf = vec![0x10, 0, 10, 0x20, 0, 1, 0x00];
        assert_eq!(buf[2], 10);

        // Patch the immediate at offset 2 to 99
        cpu_apply_patch(
            &mut buf,
            &Patch {
                addr: 2,
                val: 99,
                mask: 0,
                mode: PatchMode::Write,
            },
        );

        assert_eq!(buf[2], 99);
        // The rest should be unchanged
        assert_eq!(buf[0], 0x10);
        assert_eq!(buf[3], 0x20);
    }

    #[test]
    fn test_patch_opcode_byte_only() {
        // Change opcode from LDI (0x10) to SUB (0x21) by masking only low byte
        // LDI r0, 42 = 0x10, 0, 42
        let mut buf = vec![0x10, 0x00, 0x2A];
        cpu_apply_patch(
            &mut buf,
            &Patch {
                addr: 0,
                val: 0x21,
                mask: 0x000000FF,
                mode: PatchMode::Mask,
            },
        );
        // Should become SUB r0, 42 = 0x21, 0, 42
        assert_eq!(buf[0], 0x21);
        assert_eq!(buf[1], 0x00);
        assert_eq!(buf[2], 0x2A);
    }

    #[test]
    fn test_empty_patches_no_change() {
        let mut buf = vec![0x11111111, 0x22222222];
        let original = buf.clone();
        cpu_apply_patches(&mut buf, &[]);
        assert_eq!(buf, original);
    }

    #[test]
    fn test_patch_then_lex() {
        // Build a program, patch it, then verify the lexer sees the patched version
        use crate::vm::gpu_lexer::cpu_lex_all;

        // Initial: NOP | NOP | HALT
        let mut buf = vec![0x01, 0x01, 0x00];
        let lex1 = cpu_lex_all(&buf);
        assert_eq!(lex1.len(), 3);

        // Patch offset 0 from NOP (0x01) to LDI (0x10)
        cpu_apply_patch(
            &mut buf,
            &Patch {
                addr: 0,
                val: 0x10,
                mask: 0x000000FF,
                mode: PatchMode::Mask,
            },
        );

        // Now the lexer should see: LDI(0x10) + operand + operand | HALT
        // But we only patched one byte, so the instruction stream is now:
        // 0x10, 0x01, 0x00 which the lexer reads as LDI r1, 1 (3 words) then end
        let lex2 = cpu_lex_all(&buf);
        assert_eq!(lex2.len(), 1);
        assert_eq!(lex2[0].offset, 0);
        assert_eq!(lex2[0].width, 3); // LDI is 3 words
    }

    // GPU integration test -- only runs with `cargo test --features gpu`
    #[cfg(feature = "gpu")]
    #[test]
    fn test_gpu_patcher_write() {
        let patcher = pollster::block_on(GpuPatcher::new()).expect("GPU patcher init failed");
        let mut buf = vec![0x00000000, 0x11111111, 0x22222222];
        let patches = vec![Patch {
            addr: 1,
            val: 0xDEADBEEF,
            mask: 0,
            mode: PatchMode::Write,
        }];
        patcher.apply(&mut buf, &patches).expect("GPU patch failed");
        assert_eq!(buf[0], 0x00000000);
        assert_eq!(buf[1], 0xDEADBEEF);
        assert_eq!(buf[2], 0x22222222);
    }

    #[cfg(feature = "gpu")]
    #[test]
    fn test_gpu_patcher_mask() {
        let patcher = pollster::block_on(GpuPatcher::new()).expect("GPU patcher init failed");
        let mut buf = vec![0x12345678];
        let patches = vec![Patch {
            addr: 0,
            val: 0xAB000000,
            mask: 0xFF000000,
            mode: PatchMode::Mask,
        }];
        patcher.apply(&mut buf, &patches).expect("GPU patch failed");
        assert_eq!(buf[0], 0xAB345678);
    }

    #[cfg(feature = "gpu")]
    #[test]
    fn test_gpu_patcher_vs_cpu() {
        let patcher = pollster::block_on(GpuPatcher::new()).expect("GPU patcher init failed");

        let mut cpu_buf = vec![0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07];
        let mut gpu_buf = cpu_buf.clone();

        let patches = vec![
            Patch {
                addr: 0,
                val: 0x10,
                mask: 0,
                mode: PatchMode::Write,
            },
            Patch {
                addr: 2,
                val: 99,
                mask: 0,
                mode: PatchMode::Write,
            },
            Patch {
                addr: 5,
                val: 0xFF,
                mask: 0x000000FF,
                mode: PatchMode::Mask,
            },
        ];

        cpu_apply_patches(&mut cpu_buf, &patches);
        patcher
            .apply(&mut gpu_buf, &patches)
            .expect("GPU patch failed");

        assert_eq!(cpu_buf, gpu_buf, "CPU/GPU patcher mismatch");
        eprintln!("[PASS] GPU patcher matches CPU reference");
    }

    #[cfg(feature = "gpu")]
    #[test]
    fn test_gpu_patcher_many_patches() {
        let patcher = pollster::block_on(GpuPatcher::new()).expect("GPU patcher init failed");

        let mut buf = vec![0u32; 1024];
        let mut patches = Vec::new();
        for i in 0..512 {
            patches.push(Patch {
                addr: i * 2,
                val: i as u32,
                mask: 0,
                mode: PatchMode::Write,
            });
        }

        patcher.apply(&mut buf, &patches).expect("GPU patch failed");

        // Verify every even-indexed word was written
        for i in 0..512 {
            assert_eq!(buf[i * 2], i as u32, "Mismatch at index {}", i * 2);
        }
        // Odd indices should still be 0
        for i in 0..1024 {
            if i % 2 == 1 {
                assert_eq!(buf[i], 0, "Odd index {} should be 0", i);
            }
        }
    }
}
