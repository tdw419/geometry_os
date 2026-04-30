// gpu_lexer.rs -- GPU-Native Spatial Opcode Lexer for Geometry OS
//
// Scans a flat u32 array (VM RAM or canvas buffer) on the GPU to find
// instruction boundaries. Produces a dispatch buffer of (offset, width)
// pairs that downstream GPU workgroups can consume.
//
// Philosophy: "Pixels Move Pixels" -- the lexer IS a pixel scanner.
// Opcodes are encoded as the low byte of each u32 word in RAM. This
// shader classifies each candidate position and emits valid instruction
// starts into a compact dispatch buffer.
//
// Usage:
//   let lexer = pollster::block_on(GpuLexer::new())?;
//   let instructions = lexer.lex(&vm.ram, 0, ram_len)?;
//   for (offset, width) in &instructions {
//       println!("instruction at 0x{:04X}, {} words", offset, width);
//   }
//
// Buffer layout (must match WGSL):
//   dispatch_buf[0] = atomic instruction count (read after dispatch)
//   dispatch_buf[1..] = packed u32: bits[23:0]=offset, bits[31:24]=width

#[cfg(feature = "gpu")]
use anyhow::{Context, Result};

#[cfg(feature = "gpu")]
const GLYPH_LEXER_WGSL: &str = include_str!("glyph_lexer.wgsl");

/// Maximum number of instructions the dispatch buffer can hold.
/// Must match the WGSL constant MAX_INSTRUCTIONS.
#[cfg(feature = "gpu")]
pub const MAX_INSTRUCTIONS: usize = 8192;

/// A single lexed instruction: (bytecode offset, instruction width in u32 words).
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct LexedInstruction {
    pub offset: u32,
    pub width: u32,
}

impl std::fmt::Display for LexedInstruction {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "offset=0x{:04X} width={}", self.offset, self.width)
    }
}

/// GPU-accelerated spatial lexer for Geometry OS bytecode.
///
/// Dispatches a WGSL compute shader that scans the input array in parallel,
/// classifying each position as a valid instruction start or not. Valid
/// instructions are packed into a dispatch buffer via atomic operations.
#[cfg(feature = "gpu")]
pub struct GpuLexer {
    device: wgpu::Device,
    queue: wgpu::Queue,
    pipeline: wgpu::ComputePipeline,
}

#[cfg(feature = "gpu")]
impl GpuLexer {
    /// Create a new GPU lexer, initializing the WGPU adapter and compute pipeline.
    ///
    /// Reuses the same adapter/device pattern as `riscv::gpu::GpuExecutor`.
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
            .context("No GPU adapter found for glyph lexer")?;

        let info = adapter.get_info();
        eprintln!(
            "[gpu-lexer] Adapter: {} (backend: {:?})",
            info.name, info.backend
        );

        let (device, queue) = adapter
            .request_device(&wgpu::DeviceDescriptor {
                label: Some("Glyph Lexer"),
                required_features: wgpu::Features::empty(),
                required_limits: wgpu::Limits::default(),
                ..Default::default()
            })
            .await
            .context("Failed to get GPU device for glyph lexer")?;

        let shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Glyph Lexer Shader"),
            source: wgpu::ShaderSource::Wgsl(GLYPH_LEXER_WGSL.into()),
        });

        let pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Glyph Lexer Pipeline"),
            layout: None,
            module: &shader,
            entry_point: Some("main"),
            compilation_options: wgpu::PipelineCompilationOptions::default(),
            cache: None,
        });

        Ok(GpuLexer {
            device,
            queue,
            pipeline,
        })
    }

    /// Lex the given input array on the GPU.
    ///
    /// Scans `input[start..end]` for valid instruction boundaries.
    /// Returns a Vec of (offset, width) pairs for each instruction found.
    ///
    /// The `start` and `end` values are in u32 word offsets (byte_offset / 4).
    pub fn lex(&self, input: &[u32], start: u32, end: u32) -> Result<Vec<LexedInstruction>> {
        let input_len = input.len() as u32;
        let scan_start = start.min(input_len);
        let scan_end = end.min(input_len);
        let scan_count = scan_end.saturating_sub(scan_start);

        if scan_count == 0 {
            return Ok(Vec::new());
        }

        // ── Uniform params ───────────────────────────────────────
        // struct LexerParams { input_len, scan_start, scan_end, reserved }
        let params_data: [u32; 4] = [input_len, scan_start, scan_end, 0];
        let params_size = 16u64;

        let params_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Lexer Params"),
            size: params_size,
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

        // ── Input buffer ─────────────────────────────────────────
        let input_bytes: &[u8] =
            unsafe { std::slice::from_raw_parts(input.as_ptr() as *const u8, input.len() * 4) };
        let input_buffer_size = (input.len() as u64) * 4;

        let input_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Lexer Input"),
            size: input_buffer_size,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });
        self.queue.write_buffer(&input_buffer, 0, input_bytes);

        // ── Dispatch buffer (zeroed) ─────────────────────────────
        let dispatch_size = ((MAX_INSTRUCTIONS + 1) as u64) * 4;
        let dispatch_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Lexer Dispatch Buffer"),
            size: dispatch_size,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });
        // Zero-initialize the atomic counter at [0]
        self.queue.write_buffer(&dispatch_buffer, 0, &[0u8; 4]);

        // ── Bind group (3 bindings) ──────────────────────────────
        let bind_group_layout = self.pipeline.get_bind_group_layout(0);
        let bind_group = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Lexer Bind Group"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: input_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: dispatch_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: params_buffer.as_entire_binding(),
                },
            ],
        });

        // ── Dispatch ─────────────────────────────────────────────
        let workgroup_count = (scan_count + 63) / 64; // ceil(scan_count / 64)

        let mut encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("Lexer Dispatch"),
            });

        {
            let mut pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("Glyph Lexing"),
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

        // ── Read back dispatch buffer ────────────────────────────
        let read_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Lexer Read Back"),
            size: dispatch_size,
            usage: wgpu::BufferUsages::COPY_DST | wgpu::BufferUsages::MAP_READ,
            mapped_at_creation: false,
        });

        let mut encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("Lexer Copy Back"),
            });
        encoder.copy_buffer_to_buffer(&dispatch_buffer, 0, &read_buffer, 0, dispatch_size);
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
            .map_err(|e| anyhow::anyhow!("Lexer map failed: {:?}", e))?;

        // ── Decode results ───────────────────────────────────────
        let mut instructions = Vec::new();
        {
            let data = read_buffer.slice(..).get_mapped_range();
            let words: &[u32] =
                unsafe { std::slice::from_raw_parts(data.as_ptr() as *const u32, data.len() / 4) };

            let count = words[0].min(MAX_INSTRUCTIONS as u32) as usize;
            for i in 0..count {
                let packed = words[1 + i];
                let width = (packed >> 24) & 0xFF;
                let offset = packed & 0x00FFFFFF;
                instructions.push(LexedInstruction { offset, width });
            }
        }

        // Sort by offset for deterministic output (GPU dispatch order is undefined)
        instructions.sort_unstable_by_key(|i| i.offset);

        Ok(instructions)
    }

    /// Lex the full input array (convenience wrapper).
    pub fn lex_all(&self, input: &[u32]) -> Result<Vec<LexedInstruction>> {
        self.lex(input, 0, input.len() as u32)
    }
}

// ── CPU Reference Lexer (for testing without GPU) ───────────────

/// Instruction width table -- mirrors the WGSL opcode_width() function.
/// Returns 0 for unknown opcodes, 255 for variable-length.
fn cpu_opcode_width(op: u32) -> u32 {
    match op {
        // 1-word
        0x00 | 0x01 | 0x02 | 0x34 | 0x53 | 0x5A | 0x5F | 0x65 | 0x6E | 0x73 | 0x74 | 0x76
        | 0x91 | 0x9E | 0xB5 | 0xB6 | 0xBE => 1,

        // 2-word
        0x2A | 0x30 | 0x33 | 0x38 | 0x42 | 0x47 | 0x48 | 0x49 | 0x4D | 0x4E | 0x52 | 0x57
        | 0x59 | 0x5B | 0x5C | 0x5E | 0x66 | 0x69 | 0x6B | 0x6C | 0x6F | 0x77 | 0x78 | 0x7A
        | 0x7B | 0x7C | 0x7D | 0x82 | 0x83 | 0x84 | 0x85 | 0x87 | 0x90 | 0x93 | 0x94 | 0x98
        | 0x9B | 0xA0 | 0xA1 | 0xA2 | 0xA3 | 0xA5 | 0xA6 | 0xAC | 0xB0 | 0xB2 | 0xB3 | 0xB7
        | 0xBA => 2,

        // 3-word
        0x03 | 0x10 | 0x11 | 0x12 | 0x15 | 0x16 | 0x17 | 0x18 | 0x19 | 0x1A | 0x1B | 0x1C
        | 0x1D | 0x1E | 0x1F | 0x20 | 0x21 | 0x22 | 0x23 | 0x24 | 0x25 | 0x26 | 0x27 | 0x28
        | 0x29 | 0x2B | 0x31 | 0x32 | 0x35 | 0x36 | 0x4B | 0x50 | 0x51 | 0x54 | 0x5D | 0x63
        | 0x64 | 0x67 | 0x70 | 0x71 | 0x72 | 0x79 | 0x86 | 0x89 | 0x8A | 0x8D | 0x8E | 0x8F
        | 0x9A | 0x9F | 0xA4 | 0xA7 | 0xA9 | 0xB1 | 0xB4 | 0xB8 | 0xB9 | 0xBF => 3,

        // 4-word
        0x04 | 0x40 | 0x41 | 0x44 | 0x4F | 0x55 | 0x56 | 0x58 | 0x62 | 0x68 | 0x6A | 0x6D
        | 0x7E | 0x7F | 0x8B | 0x99 | 0x9C | 0x9D | 0xA8 | 0xAA | 0xAB | 0xAD | 0xBB | 0xBC
        | 0xBD => 4,

        // 5-word
        0x80 | 0x81 | 0x95 | 0x96 | 0x97 => 5,

        // 6-word
        0x37 | 0x43 | 0x45 | 0x4A | 0x88 | 0x8C | 0x92 | 0xD0 | 0xD1 => 6,

        // 3-word
        0xD3 => 3, // PATCHW addr_reg, val_reg

        // 4-word
        0xD2 => 4, // PATCH addr_reg, val_reg, mask_reg

        // 9-word
        0x4C => 9,

        // Variable-length
        0x13 | 0x14 | 0x75 => 255,

        _ => 0,
    }
}

/// CPU reference implementation for variable-length instruction width.
fn cpu_variable_width(input: &[u32], addr: usize, op: u32) -> Option<u32> {
    if addr + 3 >= input.len() {
        return None;
    }

    match op {
        0x13 => {
            // TEXTI: 4 header + char_count
            let count = input[addr + 3];
            if count > 256 {
                return None;
            }
            Some(4 + count)
        }
        0x14 => {
            // STRO: 3 header + char_count
            let count = input[addr + 2];
            if count > 256 {
                return None;
            }
            Some(3 + count)
        }
        0x75 => {
            // FORMULA: 4 header + dep_count (max 32)
            let count = input[addr + 3];
            if count > 32 {
                return None;
            }
            Some(4 + count)
        }
        _ => None,
    }
}

/// CPU reference lexer -- sequential scan that produces the same results
/// as the GPU shader. Used for testing and fallback.
pub fn cpu_lex(input: &[u32], start: usize, end: usize) -> Vec<LexedInstruction> {
    let input_len = input.len();
    let scan_start = start.min(input_len);
    let scan_end = end.min(input_len);
    let mut addr = scan_start;
    let mut instructions = Vec::new();

    while addr < scan_end {
        let op = input[addr] & 0xFF;
        let base_width = cpu_opcode_width(op);

        if base_width == 0 {
            // Unknown opcode -- skip (or treat as data)
            addr += 1;
            continue;
        }

        let width = if base_width == 255 {
            match cpu_variable_width(input, addr, op) {
                Some(w) => w,
                None => {
                    addr += 1;
                    continue;
                }
            }
        } else {
            base_width
        };

        if addr + width as usize > input_len {
            break;
        }

        instructions.push(LexedInstruction {
            offset: addr as u32,
            width,
        });

        addr += width as usize;
    }

    instructions
}

/// Lex the full input array on CPU (convenience wrapper).
pub fn cpu_lex_all(input: &[u32]) -> Vec<LexedInstruction> {
    cpu_lex(input, 0, input.len())
}

// ── Tests ───────────────────────────────────────────────────────

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_cpu_lex_empty() {
        let result = cpu_lex_all(&[]);
        assert!(result.is_empty());
    }

    #[test]
    fn test_cpu_lex_halt() {
        let input = vec![0x00];
        let result = cpu_lex_all(&input);
        assert_eq!(result.len(), 1);
        assert_eq!(
            result[0],
            LexedInstruction {
                offset: 0,
                width: 1
            }
        );
    }

    #[test]
    fn test_cpu_lex_ldi_add_halt() {
        // LDI r0, 42 | ADD r0, r1 | HALT
        let input = vec![0x10, 0, 42, 0x20, 0, 1, 0x00];
        let result = cpu_lex_all(&input);
        assert_eq!(result.len(), 3);
        assert_eq!(
            result[0],
            LexedInstruction {
                offset: 0,
                width: 3
            }
        ); // LDI
        assert_eq!(
            result[1],
            LexedInstruction {
                offset: 3,
                width: 3
            }
        ); // ADD
        assert_eq!(
            result[2],
            LexedInstruction {
                offset: 6,
                width: 1
            }
        ); // HALT
    }

    #[test]
    fn test_cpu_lex_store() {
        // STORE addr_reg, reg
        let input = vec![0x12, 5, 3];
        let result = cpu_lex_all(&input);
        assert_eq!(result.len(), 1);
        assert_eq!(
            result[0],
            LexedInstruction {
                offset: 0,
                width: 3
            }
        );
    }

    #[test]
    fn test_cpu_lex_jump() {
        // JMP addr | LDI r0, 10 | HALT
        let input = vec![0x30, 5, 0x10, 0, 10, 0x00];
        let result = cpu_lex_all(&input);
        assert_eq!(result.len(), 3);
        assert_eq!(
            result[0],
            LexedInstruction {
                offset: 0,
                width: 2
            }
        ); // JMP
        assert_eq!(
            result[1],
            LexedInstruction {
                offset: 2,
                width: 3
            }
        ); // LDI
        assert_eq!(
            result[2],
            LexedInstruction {
                offset: 5,
                width: 1
            }
        ); // HALT
    }

    #[test]
    fn test_cpu_lex_texti_variable() {
        // TEXTI 10, 20, "Hi"  =  0x13, 10, 20, 2, 0x48, 0x69
        let input = vec![0x13, 10, 20, 2, 0x48, 0x69];
        let result = cpu_lex_all(&input);
        assert_eq!(result.len(), 1);
        assert_eq!(
            result[0],
            LexedInstruction {
                offset: 0,
                width: 6
            }
        ); // 4 + 2 chars
    }

    #[test]
    fn test_cpu_lex_stro_variable() {
        // STRO r5, "AB"  =  0x14, 5, 2, 0x41, 0x42
        let input = vec![0x14, 5, 2, 0x41, 0x42];
        let result = cpu_lex_all(&input);
        assert_eq!(result.len(), 1);
        assert_eq!(
            result[0],
            LexedInstruction {
                offset: 0,
                width: 5
            }
        ); // 3 + 2 chars
    }

    #[test]
    fn test_cpu_lex_formula_variable() {
        // FORMULA 10, ADD, 3 deps  =  0x75, 10, 0, 3, 100, 200, 300
        let input = vec![0x75, 10, 0, 3, 100, 200, 300];
        let result = cpu_lex_all(&input);
        assert_eq!(result.len(), 1);
        assert_eq!(
            result[0],
            LexedInstruction {
                offset: 0,
                width: 7
            }
        ); // 4 + 3 deps
    }

    #[test]
    fn test_cpu_lex_unknown_opcode_skipped() {
        // 0xFE is unknown, 0xFF is unknown -- they should be skipped
        let input = vec![0xFE, 0xFF, 0x00]; // HALT at offset 2
        let result = cpu_lex_all(&input);
        // The unknown bytes get skipped individually, then HALT is found
        assert!(result.iter().any(|i| i.offset == 2 && i.width == 1));
    }

    #[test]
    fn test_cpu_lex_tilemap() {
        // TILEMAP = 9 words
        let input: Vec<u32> = (0..9).map(|i| if i == 0 { 0x4C } else { i }).collect();
        let result = cpu_lex_all(&input);
        assert_eq!(result.len(), 1);
        assert_eq!(
            result[0],
            LexedInstruction {
                offset: 0,
                width: 9
            }
        );
    }

    #[test]
    fn test_cpu_lex_pseti() {
        // PSETI = 4 words
        let input = vec![0x41, 100, 200, 0xFF0000];
        let result = cpu_lex_all(&input);
        assert_eq!(result.len(), 1);
        assert_eq!(
            result[0],
            LexedInstruction {
                offset: 0,
                width: 4
            }
        );
    }

    #[test]
    fn test_cpu_lex_hypervisor() {
        // HYPERVISOR = 3 words
        let input = vec![0x72, 1, 0];
        let result = cpu_lex_all(&input);
        assert_eq!(result.len(), 1);
        assert_eq!(
            result[0],
            LexedInstruction {
                offset: 0,
                width: 3
            }
        );
    }

    #[test]
    fn test_cpu_lex_hermes() {
        // HERMES = 4 words
        let input = vec![0xA8, 1, 2, 3];
        let result = cpu_lex_all(&input);
        assert_eq!(result.len(), 1);
        assert_eq!(
            result[0],
            LexedInstruction {
                offset: 0,
                width: 4
            }
        );
    }

    #[test]
    fn test_cpu_lex_with_range() {
        // LDI r0, 10 | LDI r1, 20 | HALT | NOP
        let input = vec![0x10, 0, 10, 0x10, 1, 20, 0x00, 0x01];
        let result = cpu_lex(&input, 3, 7); // scan from LDI r1,20 onwards (index 3 to 6)
        assert_eq!(result.len(), 2);
        assert_eq!(result[0].offset, 3); // LDI r1, 20
        assert_eq!(result[1].offset, 6); // HALT

        // Including NOP at index 7
        let result2 = cpu_lex(&input, 3, 8);
        assert_eq!(result2.len(), 3);
        assert_eq!(result2[2].offset, 7); // NOP
    }

    #[test]
    fn test_cpu_lex_realistic_program() {
        // A simple loop: LDI r0, 5 | loop: SUB r0, r1 | JNZ r0, loop | HALT
        let input = vec![
            0x10, 0, 5, // LDI r0, 5
            0x21, 0, 1, // SUB r0, r1
            0x32, 0, 3,    // JNZ r0, 3 (-> SUB at offset 3)
            0x00, // HALT
        ];
        let result = cpu_lex_all(&input);
        assert_eq!(result.len(), 4);
        assert_eq!(
            result[0],
            LexedInstruction {
                offset: 0,
                width: 3
            }
        ); // LDI
        assert_eq!(
            result[1],
            LexedInstruction {
                offset: 3,
                width: 3
            }
        ); // SUB
        assert_eq!(
            result[2],
            LexedInstruction {
                offset: 6,
                width: 3
            }
        ); // JNZ
        assert_eq!(
            result[3],
            LexedInstruction {
                offset: 9,
                width: 1
            }
        ); // HALT
    }

    #[test]
    fn test_cpu_lex_graphics_program() {
        // FILL 0xFF0000 | PSETI 10, 20, 0x00FF00 | FRAME | HALT
        let input = vec![
            0x42, 0xFF0000, // FILL
            0x41, 10, 20, 0x00FF00, // PSETI
            0x02,     // FRAME
            0x00,     // HALT
        ];
        let result = cpu_lex_all(&input);
        assert_eq!(result.len(), 4);
        assert_eq!(
            result[0],
            LexedInstruction {
                offset: 0,
                width: 2
            }
        ); // FILL
        assert_eq!(
            result[1],
            LexedInstruction {
                offset: 2,
                width: 4
            }
        ); // PSETI
        assert_eq!(
            result[2],
            LexedInstruction {
                offset: 6,
                width: 1
            }
        ); // FRAME
        assert_eq!(
            result[3],
            LexedInstruction {
                offset: 7,
                width: 1
            }
        ); // HALT
    }

    #[test]
    fn test_cpu_lex_with_data_padding() {
        // Some data words followed by valid code
        let input = vec![
            0xDEADBEEF, 0xCAFEBABE, // data (unknown opcodes, skipped)
            0x10, 0, 42,   // LDI r0, 42
            0x00, // HALT
        ];
        let result = cpu_lex_all(&input);
        // The deadbeef and cafebabe have unknown low bytes (0xEF, 0xBE)
        // so they get skipped individually
        assert!(result.iter().any(|i| i.offset == 2 && i.width == 3));
        assert!(result.iter().any(|i| i.offset == 5 && i.width == 1));
    }

    #[test]
    fn test_lexed_instruction_display() {
        let inst = LexedInstruction {
            offset: 0x1000,
            width: 3,
        };
        let s = format!("{}", inst);
        assert_eq!(s, "offset=0x1000 width=3");
    }

    #[test]
    fn test_cpu_lex_all_single_ops() {
        // Verify every 1-word opcode
        let one_word_ops: &[u32] = &[
            0x00, 0x01, 0x02, 0x34, 0x53, 0x5A, 0x5F, 0x65, 0x6E, 0x73, 0x74, 0x76, 0x91, 0x9E,
            0xB5, 0xB6, 0xBE,
        ];
        for &op in one_word_ops {
            let input = vec![op];
            let result = cpu_lex_all(&input);
            assert_eq!(
                result.len(),
                1,
                "Opcode 0x{:02X} should produce 1 instruction, got {}",
                op,
                result.len()
            );
            assert_eq!(
                result[0].width, 1,
                "Opcode 0x{:02X} should have width 1",
                op
            );
        }
    }

    #[test]
    fn test_cpu_lex_two_word_ops() {
        let two_word_ops: &[u32] = &[
            0x2A, 0x30, 0x33, 0x38, 0x42, 0x47, 0x48, 0x49, 0x4D, 0x4E, 0x52, 0x57, 0x59, 0x5B,
            0x5C, 0x5E, 0x66, 0x69, 0x6B, 0x6C, 0x6F, 0x77, 0x78, 0x7A, 0x7B, 0x7C, 0x7D, 0x82,
            0x83, 0x84, 0x85, 0x87, 0x90, 0x93, 0x94, 0x98, 0x9B, 0xA0, 0xA1, 0xA2, 0xA3, 0xA5,
            0xA6, 0xAC, 0xB0, 0xB2, 0xB3, 0xB7, 0xBA,
        ];
        for &op in two_word_ops {
            let input = vec![op, 0];
            let result = cpu_lex_all(&input);
            assert_eq!(
                result.len(),
                1,
                "Opcode 0x{:02X} should produce 1 instruction, got {}",
                op,
                result.len()
            );
            assert_eq!(
                result[0].width, 2,
                "Opcode 0x{:02X} should have width 2",
                op
            );
        }
    }

    // GPU integration test -- only runs with `cargo test --features gpu`
    #[cfg(feature = "gpu")]
    #[test]
    fn test_gpu_lex_simple_program() {
        let lexer = pollster::block_on(GpuLexer::new()).expect("GPU lexer init failed");

        // LDI r0, 42 | ADD r0, r1 | HALT
        let input = vec![0x10, 0, 42, 0x20, 0, 1, 0x00];
        let result = lexer.lex_all(&input).expect("GPU lex failed");

        assert_eq!(result.len(), 3, "Expected 3 instructions");
        assert_eq!(
            result[0],
            LexedInstruction {
                offset: 0,
                width: 3
            }
        );
        assert_eq!(
            result[1],
            LexedInstruction {
                offset: 3,
                width: 3
            }
        );
        assert_eq!(
            result[2],
            LexedInstruction {
                offset: 6,
                width: 1
            }
        );
    }

    #[cfg(feature = "gpu")]
    #[test]
    fn test_gpu_lex_vs_cpu() {
        let lexer = pollster::block_on(GpuLexer::new()).expect("GPU lexer init failed");

        // Build a complex program with many instruction types
        let input: Vec<u32> = vec![
            0x10, 0, 10, // LDI r0, 10
            0x10, 1, 20, // LDI r1, 20
            0x20, 0, 1, // ADD r0, r1
            0x42, 0xFF0000, // FILL
            0x41, 100, 200, 0x00FF00, // PSETI
            0x02,     // FRAME
            0x00,     // HALT
        ];

        let cpu_result = cpu_lex_all(&input);
        let gpu_result = lexer.lex_all(&input).expect("GPU lex failed");

        assert_eq!(
            cpu_result.len(),
            gpu_result.len(),
            "CPU/GPU instruction count mismatch"
        );

        for (cpu, gpu) in cpu_result.iter().zip(gpu_result.iter()) {
            assert_eq!(cpu.offset, gpu.offset, "Offset mismatch at index {:?}", cpu);
            assert_eq!(
                cpu.width, gpu.width,
                "Width mismatch at offset 0x{:04X}",
                cpu.offset
            );
        }

        eprintln!(
            "[PASS] GPU lexer matches CPU reference ({} instructions)",
            cpu_result.len()
        );
    }

    #[cfg(feature = "gpu")]
    #[test]
    fn test_gpu_lex_variable_length() {
        let lexer = pollster::block_on(GpuLexer::new()).expect("GPU lexer init failed");

        // TEXTI 10, 20, "Hi"  =  0x13, 10, 20, 2, 0x48, 0x69
        let input = vec![0x13, 10, 20, 2, 0x48, 0x69];
        let result = lexer.lex_all(&input).expect("GPU lex failed");

        assert_eq!(result.len(), 1);
        assert_eq!(
            result[0],
            LexedInstruction {
                offset: 0,
                width: 6
            }
        );
    }

    #[cfg(feature = "gpu")]
    #[test]
    fn test_gpu_lex_large_program() {
        let lexer = pollster::block_on(GpuLexer::new()).expect("GPU lexer init failed");

        // Build a large program: 100 LDI instructions followed by HALT
        let mut input = Vec::with_capacity(301);
        for i in 0..100 {
            input.push(0x10); // LDI
            input.push((i % 32) as u32); // reg
            input.push(i as u32); // imm
        }
        input.push(0x00); // HALT

        let cpu_result = cpu_lex_all(&input);
        let gpu_result = lexer.lex_all(&input).expect("GPU lex failed");

        assert_eq!(cpu_result.len(), 101); // 100 LDI + 1 HALT
        assert_eq!(cpu_result.len(), gpu_result.len());
    }
}
