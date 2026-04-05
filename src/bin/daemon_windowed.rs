// pmp-windowed: Windowed runtime for Geometry OS
// Live 4096x4096 texture display (GEO-52)
//
// Renders the GPU substrate as a fullscreen quad via winit + wgpu.
// The compute VM dispatches frames at ~30fps while the render pipeline
// displays the Hilbert-curve-addressed texture in real-time.
//
// Usage: cargo run --bin pmp-windowed [-- /path/to/program.gasm]

use pixels_move_pixels::assembler;
use pixels_move_pixels::font_atlas;
use pixels_move_pixels::software_vm::SoftwareVm;
use pixels_move_pixels::substrate::RegionAllocator;
use pixels_move_pixels::vm::{vm_state, GlyphVm};
use pixels_move_pixels::{gasm, MAX_VMS};

use std::env;
use std::sync::Arc;
use winit::{
    event::{Event, WindowEvent},
    event_loop::{ControlFlow, EventLoop},
    window::WindowBuilder,
};

// ── Display shader ──
// Samples the Rgba8Uint RAM texture and converts to Bgra8Unorm surface.
// Applies a false-color mapping so non-zero pixels are visible.

const DISPLAY_SHADER: &str = r"
@group(0) @binding(0) var tex: texture_2d<u32>;
@group(0) @binding(1) var samp: sampler;

struct VertexOutput {
    @builtin(position) pos: vec4f,
    @location(0) uv: vec2f,
};

@vertex
fn vs_main(@builtin(vertex_index) vi: u32) -> VertexOutput {
    // Fullscreen quad: two triangles covering clip space
    var positions = array<vec2f, 6>(
        vec2f(-1.0, -1.0), vec2f(1.0, -1.0), vec2f(-1.0, 1.0),
        vec2f(-1.0, 1.0),  vec2f(1.0, -1.0), vec2f(1.0, 1.0),
    );
    var uvs = array<vec2f, 6>(
        vec2f(0.0, 1.0), vec2f(1.0, 1.0), vec2f(0.0, 0.0),
        vec2f(0.0, 0.0), vec2f(1.0, 1.0), vec2f(1.0, 0.0),
    );
    var out: VertexOutput;
    out.pos = vec4f(positions[vi], 0.0, 1.0);
    out.uv = uvs[vi];
    return out;
}

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4f {
    let texel = textureGather(0, tex, samp, in.uv);
    // texel is vec4<u32> -- each component is one RGBA8 channel of one pixel
    // Actually textureGather on u32 texture is tricky; use textureLoad instead

    // Compute pixel coordinates from UV
    let dims = textureDimensions(tex);
    let coords = vec2u(in.uv * vec2f(dims));
    let clamped = min(coords, dims - vec2u(1u));
    let rgba = textureLoad(tex, clamped, 0);

    // rgba is vec4<u32>: R, G, B, A as u8 values packed into u32
    let r = f32(rgba.r) / 255.0;
    let g = f32(rgba.g) / 255.0;
    let b = f32(rgba.b) / 255.0;
    let a = f32(rgba.a) / 255.0;

    // False-color: amplify dark regions, highlight non-zero pixels
    let brightness = max(max(r, g), max(b, a / 255.0));
    let color = select(
        vec3f(0.02, 0.02, 0.04), // background: near-black blue
        vec3f(r * 2.0, g * 2.0, b * 2.0), // brighten data pixels
        brightness > 0.01,
    );

    return vec4f(color, 1.0);
}
";

// ── Main ──

fn main() {
    // Initialize logger
    env_logger::init();

    // Parse CLI args: optional .gasm file to load
    let args: Vec<String> = env::args().collect();
    let gasm_file = args.get(1).map(|s| s.as_str());

    // Create winit event loop and window
    let event_loop = EventLoop::new().expect("Failed to create event loop");
    let window = Arc::new(
        WindowBuilder::new()
            .with_title("Geometry OS — pmp-windowed")
            .with_inner_size(winit::dpi::LogicalSize::new(1024, 1024))
            .with_resizable(true)
            .build(&event_loop)
            .expect("Failed to create window"),
    );

    eprintln!("[pmp-windowed] Creating GPU device with surface...");

    // Create wgpu instance + surface from window
    let instance = wgpu::Instance::default();
    let surface = instance
        .create_surface(Arc::clone(&window))
        .expect("Failed to create surface");

    let adapter = pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions {
        power_preference: wgpu::PowerPreference::HighPerformance,
        compatible_surface: Some(&surface),
        force_fallback_adapter: false,
    }))
    .expect("No GPU adapter found compatible with surface.");

    let desc = wgpu::DeviceDescriptor {
        label: Some("Pixels Move Pixels (Windowed)"),
        required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
        required_limits: wgpu::Limits::default(),
    };
    let (device, queue) =
        GlyphVm::request_device_with_retry(&adapter, &desc);

    // Configure surface
    let surface_caps = surface.get_capabilities(&adapter);
    let surface_format = surface_caps
        .formats
        .iter()
        .find(|f| f.is_srgb())
        .copied()
        .unwrap_or(surface_caps.formats[0]);

    let window_size = window.inner_size();
    let mut config = wgpu::SurfaceConfiguration {
        usage: wgpu::TextureUsages::RENDER_ATTACHMENT,
        format: surface_format,
        width: window_size.width,
        height: window_size.height,
        present_mode: wgpu::PresentMode::Fifo, // VSync
        alpha_mode: surface_caps.alpha_modes[0],
        view_formats: vec![],
        desired_maximum_frame_latency: 2,
    };
    surface.configure(&device, &config);

    eprintln!("[pmp-windowed] Surface configured: {}x{} {:?}", config.width, config.height, surface_format);

    // Initialize the GlyphVm using the same device+queue
    let mut vm = GlyphVm::from_device_queue(device, queue);

    // Load font atlas
    eprintln!("[pmp-windowed] Loading font atlas...");
    font_atlas::load_into_substrate(vm.substrate());

    // Build bold atlas
    let atlas_program = assembler::bold_atlas_builder();
    let mut svm = SoftwareVm::new();
    svm.load_font_atlas();
    svm.load_program(0x1000, &atlas_program.pixels);
    svm.spawn_vm(0, 0x1000);
    for _ in 0..2000 {
        if svm.vm_state(0).halted != 0 {
            break;
        }
        svm.execute_frame();
    }
    let derived_base: u32 = 0x00F10000;
    for addr in derived_base..(derived_base + 128 * 8) {
        vm.substrate().poke(addr, svm.peek(addr));
    }
    eprintln!("[pmp-windowed] Font atlas loaded.");

    // Load optional program
    let mut allocator = RegionAllocator::new();
    let mut frame_count: u32 = 0;

    if let Some(path) = gasm_file {
        let source = std::fs::read_to_string(path)
            .unwrap_or_else(|e| panic!("Failed to read {}: {}", path, e));
        let program = gasm::assemble(&source)
            .unwrap_or_else(|e| panic!("Assembly error: {}", e));
        let addr = allocator
            .allocate_region(program.pixels.len() as u32)
            .expect("No contiguous free region");
        vm.substrate().load_program(addr, &program.pixels);
        vm.spawn_vm(0, addr);
        eprintln!(
            "[pmp-windowed] Loaded {} pixels at {:#X}",
            program.pixels.len(),
            addr
        );
    } else {
        // No program loaded — spawn a simple NOP sled so the VM is alive
        eprintln!("[pmp-windowed] No program specified. Use: pmp-windowed <file.gasm>");
        eprintln!("[pmp-windowed] Running empty substrate (watch the Hilbert void).");
    }

    // ── Create render pipeline ──
    // The RAM texture is Rgba8Uint. We need a separate bind group to sample it
    // in the fragment shader. The compute bind group can't be reused because it
    // uses storage texture access.

    let display_shader = vm.device().create_shader_module(wgpu::ShaderModuleDescriptor {
        label: Some("Display Shader"),
        source: wgpu::ShaderSource::Wgsl(DISPLAY_SHADER.into()),
    });

    let display_bind_group_layout =
        vm.device()
            .create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
                label: Some("Display Bind Layout"),
                entries: &[
                    // Binding 0: RAM texture (sampled)
                    wgpu::BindGroupLayoutEntry {
                        binding: 0,
                        visibility: wgpu::ShaderStages::FRAGMENT,
                        ty: wgpu::BindingType::Texture {
                            sample_type: wgpu::TextureSampleType::Uint,
                            view_dimension: wgpu::TextureViewDimension::D2,
                            multisampled: false,
                        },
                        count: None,
                    },
                    // Binding 1: Sampler
                    wgpu::BindGroupLayoutEntry {
                        binding: 1,
                        visibility: wgpu::ShaderStages::FRAGMENT,
                        ty: wgpu::BindingType::Sampler(
                            wgpu::SamplerBindingType::NonFiltering,
                        ),
                        count: None,
                    },
                ],
            });

    let render_pipeline_layout =
        vm.device()
            .create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
                label: Some("Display Pipeline Layout"),
                bind_group_layouts: &[&display_bind_group_layout],
                push_constant_ranges: &[],
            });

    let render_pipeline =
        vm.device()
            .create_render_pipeline(&wgpu::RenderPipelineDescriptor {
                label: Some("Display Pipeline"),
                layout: Some(&render_pipeline_layout),
                vertex: wgpu::VertexState {
                    module: &display_shader,
                    entry_point: "vs_main",
                    buffers: &[],
                },
                fragment: Some(wgpu::FragmentState {
                    module: &display_shader,
                    entry_point: "fs_main",
                    targets: &[Some(wgpu::ColorTargetState {
                        format: surface_format,
                        blend: Some(wgpu::BlendState::REPLACE),
                        write_mask: wgpu::ColorWrites::ALL,
                    })],
                }),
                primitive: wgpu::PrimitiveState {
                    topology: wgpu::PrimitiveTopology::TriangleList,
                    strip_index_format: None,
                    front_face: wgpu::FrontFace::Ccw,
                    cull_mode: None,
                    polygon_mode: wgpu::PolygonMode::Fill,
                    unclipped_depth: false,
                    conservative: false,
                },
                depth_stencil: None,
                multisample: wgpu::MultisampleState {
                    count: 1,
                    mask: !0,
                    alpha_to_coverage_enabled: false,
                },
                multiview: None,
            });

    // Create texture view and sampler for the RAM texture
    let ram_view = vm
        .ram_texture()
        .create_view(&wgpu::TextureViewDescriptor::default());

    let sampler = vm.device().create_sampler(&wgpu::SamplerDescriptor {
        label: Some("Display Sampler"),
        address_mode_u: wgpu::AddressMode::ClampToEdge,
        address_mode_v: wgpu::AddressMode::ClampToEdge,
        address_mode_w: wgpu::AddressMode::ClampToEdge,
        mag_filter: wgpu::FilterMode::Nearest,
        min_filter: wgpu::FilterMode::Nearest,
        mipmap_filter: wgpu::FilterMode::Nearest,
        ..Default::default()
    });

    let display_bind_group = vm.device().create_bind_group(&wgpu::BindGroupDescriptor {
        label: Some("Display Bind Group"),
        layout: &display_bind_group_layout,
        entries: &[
            wgpu::BindGroupEntry {
                binding: 0,
                resource: wgpu::BindingResource::TextureView(&ram_view),
            },
            wgpu::BindGroupEntry {
                binding: 1,
                resource: wgpu::BindingResource::Sampler(&sampler),
            },
        ],
    });

    eprintln!("[pmp-windowed] Render pipeline ready. Starting event loop.");

    // ── Frame timing ──
    let target_frame_time = std::time::Duration::from_secs_f64(1.0 / 30.0);
    let mut last_frame_time = std::time::Instant::now();

    // ── Event loop ──
    event_loop.run(move |event, elwt| {
        match event {
            Event::WindowEvent { event, .. } => match event {
                WindowEvent::CloseRequested => {
                    eprintln!("[pmp-windowed] Window closed. Shutting down.");
                    elwt.exit();
                }
                WindowEvent::Resized(physical_size) => {
                    if physical_size.width > 0 && physical_size.height > 0 {
                        config.width = physical_size.width;
                        config.height = physical_size.height;
                        surface.configure(vm.device(), &config);
                    }
                }
                _ => {}
            },
            Event::AboutToWait => {
                // Frame pacing: dispatch compute at ~30fps
                let now = std::time::Instant::now();
                let elapsed = now.duration_since(last_frame_time);
                if elapsed < target_frame_time {
                    // Not time yet — set a wake-up timer
                    let remaining = target_frame_time - elapsed;
                    elwt.set_control_flow(ControlFlow::WaitUntil(
                        now + remaining,
                    ));
                    return;
                }
                last_frame_time = now;

                // ── Dispatch one compute frame ──
                vm.execute_frame();
                frame_count += 1;

                // Count active VMs
                let active_vms: usize = (0..MAX_VMS)
                    .map(|i| {
                        let s = vm.vm_state(i as usize);
                        if s.state == vm_state::RUNNING || s.state == vm_state::WAITING {
                            1
                        } else {
                            0
                        }
                    })
                    .sum();

                // Total cycles across all VMs
                let total_cycles: u32 = (0..MAX_VMS)
                    .map(|i| vm.vm_state(i as usize).cycles)
                    .sum();

                // Update window title
                window.set_title(&format!(
                    "Geometry OS — frame:{} VMs:{} cycles:{}",
                    frame_count, active_vms, total_cycles
                ));

                // ── Render the texture to the surface ──
                let output = match surface.get_current_texture() {
                    Ok(o) => o,
                    Err(_) => {
                        // Surface lost; reconfigure
                        surface.configure(vm.device(), &config);
                        return;
                    }
                };
                let view = output
                    .texture
                    .create_view(&wgpu::TextureViewDescriptor::default());

                let mut encoder = vm
                    .device()
                    .create_command_encoder(&wgpu::CommandEncoderDescriptor {
                        label: Some("Display Render"),
                    });

                {
                    let mut render_pass =
                        encoder.begin_render_pass(&wgpu::RenderPassDescriptor {
                            label: Some("Display Pass"),
                            color_attachments: &[Some(
                                wgpu::RenderPassColorAttachment {
                                    view: &view,
                                    resolve_target: None,
                                    ops: wgpu::Operations {
                                        load: wgpu::LoadOp::Clear(
                                            wgpu::Color {
                                                r: 0.01,
                                                g: 0.01,
                                                b: 0.02,
                                                a: 1.0,
                                            },
                                        ),
                                        store: wgpu::StoreOp::Store,
                                    },
                                },
                            )],
                            depth_stencil_attachment: None,
                            timestamp_writes: None,
                            occlusion_query_set: None,
                        });

                    render_pass.set_pipeline(&render_pipeline);
                    render_pass.set_bind_group(0, &display_bind_group, &[]);
                    render_pass.draw(0..6, 0..1); // fullscreen quad
                }

                vm.queue().submit(std::iter::once(encoder.finish()));
                output.present();

                elwt.set_control_flow(ControlFlow::Poll);
            }
            _ => {}
        }
    }).expect("Event loop error");
}
