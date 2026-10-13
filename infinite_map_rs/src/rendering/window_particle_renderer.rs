//! WindowParticle Renderer
//!
//! Renders WindowParticles using the Glyph Stratum for window chrome.
//! "The UI is the computer" - window chrome reflects VM state via color coding.
//!
//! Features:
//! - Z-layer-aware rendering (background → modal → top)
//! - Geometry OS aesthetic (border/background color mapping)
//! - World-space positioning via Camera transform
//! - Title rendering with glyph text
//! - Resize handles and decorations

use wgpu::util::DeviceExt;
use crate::window_particle::{WindowParticle, ZLayer};
use crate::camera::Camera;
use crate::glyph_atlas::{GlyphAtlas, GlyphInfo, GlyphKey};

/// Vertex for window chrome quads
#[repr(C)]
#[derive(Copy, Clone, Debug, bytemuck::Pod, bytemuck::Zeroable)]
pub struct WindowChromeVertex {
    pub position: [f32; 2],
    pub uv: [f32; 2],
}

/// Instance data for each window particle
#[repr(C)]
#[derive(Copy, Clone, Debug, bytemuck::Pod, bytemuck::Zeroable)]
pub struct WindowParticleInstance {
    /// World-space position (x, y)
    pub world_pos: [f32; 2],
    /// Window size (width, height)
    pub size: [f32; 2],
    /// Border color (RGBA) - reflects VM state
    pub border_color: [f32; 4],
    /// Background color (RGBA)
    pub background_color: [f32; 4],
    /// Z-layer for render ordering
    pub z_layer: u32,
    /// Window particle ID
    pub particle_id: u32,
}

/// Renderer for WindowParticles with Geometry OS aesthetic
pub struct WindowParticleRenderer {
    pipeline: wgpu::RenderPipeline,
    vertex_buffer: wgpu::Buffer,
    instance_buffer: wgpu::Buffer,
    bind_group: wgpu::BindGroup,
    uniform_buffer: wgpu::Buffer,
    max_particles: usize,
    /// Title renderer for window titles
    title_renderer: WindowTitleRenderer,
}

/// Window title renderer using glyph atlas
pub struct WindowTitleRenderer {
    pipeline: wgpu::RenderPipeline,
    vertex_buffer: wgpu::Buffer,
    bind_group: wgpu::BindGroup,
    uniform_buffer: wgpu::Buffer,
    glyph_metrics_buffer: wgpu::Buffer,
    glyph_atlas: GlyphAtlas,
    title_texture: wgpu::Texture,
    title_texture_view: wgpu::TextureView,
    title_sampler: wgpu::Sampler,
    max_titles: usize,
}

impl WindowParticleRenderer {
    /// Create a new WindowParticleRenderer
    ///
    /// # Arguments
    ///
    /// * `device` - WebGPU device for GPU operations
    /// * `surface_format` - Output texture format
    /// * `max_particles` - Maximum number of particles to render
    pub fn new(
        device: &wgpu::Device,
        surface_format: wgpu::TextureFormat,
        max_particles: usize,
    ) -> Self {
        let shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("WindowParticle Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("../../shaders/window_particle.wgsl").into()),
        });

        // Create bind group layout for uniforms (camera transform, screen size)
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("WindowParticle Bind Group Layout"),
            entries: &[
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::VERTEX | wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        // Create uniform buffer for camera transform and screen size
        // Layout: [camera_x, camera_y, camera_zoom, screen_width, screen_height, 0.0, 0.0, 0.0]
        let uniforms: [f32; 8] = [0.0, 0.0, 1.0, 1920.0, 1080.0, 0.0, 0.0, 0.0];
        let uniform_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("WindowParticle Uniform Buffer"),
            contents: bytemuck::cast_slice(&uniforms),
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
        });

        let bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("WindowParticle Bind Group"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: uniform_buffer.as_entire_binding(),
                },
            ],
        });

        let pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("WindowParticle Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        // Create vertex buffer for a unit quad with UVs for window chrome
        let vertices: &[WindowChromeVertex] = &[
            // Main window quad
            WindowChromeVertex { position: [0.0, 0.0], uv: [0.0, 0.0] },
            WindowChromeVertex { position: [1.0, 0.0], uv: [1.0, 0.0] },
            WindowChromeVertex { position: [0.0, 1.0], uv: [0.0, 1.0] },
            WindowChromeVertex { position: [1.0, 1.0], uv: [1.0, 1.0] },
        ];

        let vertex_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("WindowParticle Vertex Buffer"),
            contents: bytemuck::cast_slice(vertices),
            usage: wgpu::BufferUsages::VERTEX,
        });

        // Create instance buffer for up to max_particles windows
        let instance_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("WindowParticle Instance Buffer"),
            size: (max_particles * std::mem::size_of::<WindowParticleInstance>()) as u64,
            usage: wgpu::BufferUsages::VERTEX | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let pipeline = device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("WindowParticle Render Pipeline"),
            layout: Some(&pipeline_layout),
            vertex: wgpu::VertexState {
                module: &shader,
                entry_point: "vs_main",
                buffers: &[
                    // Vertex buffer (unit quad)
                    wgpu::VertexBufferLayout {
                        array_stride: std::mem::size_of::<WindowChromeVertex>() as wgpu::BufferAddress,
                        step_mode: wgpu::VertexStepMode::Vertex,
                        attributes: &wgpu::vertex_attr_array![
                            0 => Float32x2,  // position
                            1 => Float32x2,  // uv
                        ],
                    },
                    // Instance buffer (window particle data)
                    wgpu::VertexBufferLayout {
                        array_stride: std::mem::size_of::<WindowParticleInstance>() as wgpu::BufferAddress,
                        step_mode: wgpu::VertexStepMode::Instance,
                        attributes: &wgpu::vertex_attr_array![
                            2 => Float32x2,  // world_pos
                            3 => Float32x2,  // size
                            4 => Float32x4,  // border_color
                            5 => Float32x4,  // background_color
                            6 => Uint32,     // z_layer
                            7 => Uint32,     // particle_id
                        ],
                    },
                ],
            },
            fragment: Some(wgpu::FragmentState {
                module: &shader,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format: surface_format,
                    blend: Some(wgpu::BlendState::ALPHA_BLENDING),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            primitive: wgpu::PrimitiveState {
                topology: wgpu::PrimitiveTopology::TriangleStrip,
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

        let title_renderer = WindowTitleRenderer::new(device, surface_format, max_particles);

        Self {
            pipeline,
            vertex_buffer,
            instance_buffer,
            bind_group,
            uniform_buffer,
            max_particles,
            title_renderer,
        }
    }

    /// Update window particle instances from SpatialLayoutManager
    ///
    /// This should be called each frame with the current list of particles.
    /// Particles are sorted by Z-layer to ensure correct render ordering.
    pub fn update_particles(
        &self,
        queue: &wgpu::Queue,
        particles: &[&WindowParticle],
    ) {
        // Sort particles by Z-layer (background → modal → top)
        let mut sorted: Vec<_> = particles.iter().collect();
        sorted.sort_by(|a, b| {
            a.z_layer
                .cmp(&b.z_layer)
                .then_with(|| a.id.cmp(&b.id))
        });

        // Convert to GPU instances
        let instances: Vec<WindowParticleInstance> = sorted
            .iter()
            .take(self.max_particles)
            .map(|p| WindowParticleInstance {
                world_pos: [p.position.x, p.position.y],
                size: [p.size.x, p.size.y],
                border_color: p.particle_type.border_color(),
                background_color: p.particle_type.background_color(),
                z_layer: p.z_layer as u32,
                particle_id: p.id as u32,
            })
            .collect();

        // Pad to max_particles with empty instances
        let mut padded = instances;
        while padded.len() < self.max_particles {
            padded.push(WindowParticleInstance {
                world_pos: [0.0, 0.0],
                size: [0.0, 0.0],
                border_color: [0.0, 0.0, 0.0, 0.0],
                background_color: [0.0, 0.0, 0.0, 0.0],
                z_layer: 0,
                particle_id: 0xFFFF_FFFF,
            });
        }

        queue.write_buffer(&self.instance_buffer, 0, bytemuck::cast_slice(&padded));
    }

    /// Update camera transform and screen size
    pub fn update_camera(
        &self,
        queue: &wgpu::Queue,
        camera: &Camera,
        screen_width: f32,
        screen_height: f32,
    ) {
        let uniforms: [f32; 8] = [
            camera.x,
            camera.y,
            camera.zoom,
            screen_width,
            screen_height,
            0.0,
            0.0,
            0.0,
        ];
        queue.write_buffer(&self.uniform_buffer, 0, bytemuck::cast_slice(&uniforms));
    }

    /// Render the window particles
    ///
    /// Call this within your render pass. The particles are rendered
    /// in Z-layer order, with geometry OS aesthetic (color-coded chrome).
    pub fn render<'a>(
        &'a self,
        render_pass: &mut wgpu::RenderPass<'a>,
        instance_count: u32,
    ) {
        render_pass.set_pipeline(&self.pipeline);
        render_pass.set_bind_group(0, &self.bind_group, &[]);
        render_pass.set_vertex_buffer(0, self.vertex_buffer.slice(..));
        render_pass.set_vertex_buffer(1, self.instance_buffer.slice(..));
        render_pass.draw(0..4, 0..instance_count);
    }
}

impl WindowTitleRenderer {
    /// Create a new WindowTitleRenderer
    pub fn new(
        device: &wgpu::Device,
        surface_format: wgpu::TextureFormat,
        max_titles: usize,
    ) -> Self {
        let shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Window Title Shader"),
            source: wgpu::ShaderSource::Wgsl(
                include_str!("../../shaders/window_title.wgsl").into(),
            ),
        });

        // Create bind group layout
        let bind_group_layout = device.create_bind_group_layout(
            &wgpu::BindGroupLayoutDescriptor {
                label: Some("Window Title Bind Group Layout"),
                entries: &[
                    wgpu::BindGroupLayoutEntry {
                        binding: 0,
                        visibility: wgpu::ShaderStages::VERTEX,
                        ty: wgpu::BindingType::Buffer {
                            ty: wgpu::BufferBindingType::Uniform,
                            has_dynamic_offset: false,
                            min_binding_size: None,
                        },
                        count: None,
                    },
                    wgpu::BindGroupLayoutEntry {
                        binding: 1,
                        visibility: wgpu::ShaderStages::FRAGMENT,
                        ty: wgpu::BindingType::Texture {
                            sample_type: wgpu::TextureSampleType::Float {
                                filterable: true,
                            },
                            view_dimension: wgpu::TextureViewDimension::D2,
                            multisampled: false,
                        },
                        count: None,
                    },
                    wgpu::BindGroupLayoutEntry {
                        binding: 2,
                        visibility: wgpu::ShaderStages::FRAGMENT,
                        ty: wgpu::BindingType::Sampler(
                            wgpu::SamplerBindingType::Filtering,
                        ),
                        count: None,
                    },
                    wgpu::BindGroupLayoutEntry {
                        binding: 3,
                        visibility: wgpu::ShaderStages::VERTEX,
                        ty: wgpu::BindingType::Buffer {
                            ty: wgpu::BufferBindingType::Storage {
                                read_only: true,
                            },
                            has_dynamic_offset: false,
                            min_binding_size: None,
                        },
                        count: None,
                    },
                ],
            },
        );

        // Create uniform buffer
        let uniform_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Window Title Uniform Buffer"),
            contents: bytemuck::cast_slice(&[0.0f32; 8]),
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
        });

        // Create glyph atlas texture (will be populated with rendered glyphs)
        let title_texture = device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Window Title Glyph Atlas"),
            size: wgpu::Extent3d {
                width: 1024,
                height: 1024,
                depth_or_array_layers: 1,
            },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::R8Unorm,
            usage: wgpu::TextureUsages::TEXTURE_BINDING
                | wgpu::TextureUsages::COPY_DST,
            view_formats: &[],
        });

        let title_texture_view =
            title_texture.create_view(&wgpu::TextureViewDescriptor::default());

        let title_sampler = device.create_sampler(&wgpu::SamplerDescriptor {
            address_mode_u: wgpu::AddressMode::ClampToEdge,
            address_mode_v: wgpu::AddressMode::ClampToEdge,
            mag_filter: wgpu::FilterMode::Linear,
            min_filter: wgpu::FilterMode::Linear,
            ..Default::default()
        });

        // Create glyph metrics buffer (placeholder for now)
        let glyph_metrics_buffer = device.create_buffer_init(
            &wgpu::util::BufferInitDescriptor {
                label: Some("Glyph Metrics Buffer"),
                contents: bytemuck::cast_slice(&[0u8; 1024]),
                usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            },
        );

        let bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Window Title Bind Group"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: uniform_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::TextureView(&title_texture_view),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: wgpu::BindingResource::Sampler(&title_sampler),
                },
                wgpu::BindGroupEntry {
                    binding: 3,
                    resource: glyph_metrics_buffer.as_entire_binding(),
                },
            ],
        });

        let pipeline_layout = device.create_pipeline_layout(
            &wgpu::PipelineLayoutDescriptor {
                label: Some("Window Title Pipeline Layout"),
                bind_group_layouts: &[&bind_group_layout],
                push_constant_ranges: &[],
            },
        );

        let pipeline = device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("Window Title Render Pipeline"),
            layout: Some(&pipeline_layout),
            vertex: wgpu::VertexState {
                module: &shader,
                entry_point: "vs_main",
                buffers: &[wgpu::VertexBufferLayout {
                    array_stride: std::mem::size_of::<TitleVertex>() as wgpu::BufferAddress,
                    step_mode: wgpu::VertexStepMode::Vertex,
                    attributes: &wgpu::vertex_attr_array![
                        0 => Float32x2,
                        1 => Uint32,
                        2 => Float32,
                        3 => Float32,
                        4 => Float32,
                        5 => Float32x4,
                        6 => Float32,
                    ],
                }],
            },
            fragment: Some(wgpu::FragmentState {
                module: &shader,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format: surface_format,
                    blend: Some(wgpu::BlendState::ALPHA_BLENDING),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            primitive: wgpu::PrimitiveState::default(),
            depth_stencil: None,
            multisample: wgpu::MultisampleState::default(),
            multiview: None,
        });

        // Create vertex buffer for quads
        let vertex_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Window Title Vertex Buffer"),
            size: (max_titles * 6 * std::mem::size_of::<TitleVertex>()) as u64,
            usage: wgpu::BufferUsages::VERTEX | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        Self {
            pipeline,
            vertex_buffer,
            bind_group,
            uniform_buffer,
            glyph_metrics_buffer,
            glyph_atlas: GlyphAtlas::new(1024, 1024),
            title_texture,
            title_texture_view,
            title_sampler,
            max_titles,
        }
    }

    /// Update camera transform and screen size
    pub fn update_camera(
        &self,
        queue: &wgpu::Queue,
        camera: &Camera,
        screen_width: f32,
        screen_height: f32,
    ) {
        let uniforms: [f32; 8] = [
            camera.x,
            camera.y,
            camera.zoom,
            screen_width,
            screen_height,
            0.0,
            0.0,
            0.0,
        ];
        queue.write_buffer(&self.uniform_buffer, 0, bytemuck::cast_slice(&uniforms));
    }

    /// Update titles from particles
    pub fn update_titles(
        &mut self,
        queue: &wgpu::Queue,
        particles: &[&WindowParticle],
    ) -> u32 {
        let mut vertices: Vec<TitleVertex> = Vec::new();
        let mut metrics_array = vec![GlyphMetrics::default(); 256];
        let mut current_atlas_x = 0;
        let mut current_atlas_y = 0;
        let mut max_row_height = 0;
        
        let mut char_to_index: std::collections::HashMap<char, u32> = std::collections::HashMap::new();
        let mut next_char_index = 0u32;
        
        // Ensure atlas is cleared or just keep track in a simple way
        // (A real packing algorithm would be more sophisticated, this is simple shelf packing)
        let font_size = 16.0;

        for particle in particles {
            let title = &particle.title;
            let mut char_offset_x = 0.0;
            
            // Adjust to align with the visual title bar
            let world_x = particle.position.x;
            let world_y = particle.position.y - 30.0 + 10.0; // 30 is title height, 10 is padding
            let color = [1.0, 1.0, 1.0, 1.0]; // White text
            
            for c in title.chars() {
                let char_index = *char_to_index.entry(c).or_insert_with(|| {
                    let idx = next_char_index;
                    next_char_index += 1;
                    idx
                });
                
                if (char_index as usize) < metrics_array.len() {
                    // Try to render the glyph if not already done
                    let key = GlyphKey::new(c, font_size);
                    if let Some(glyph) = self.glyph_atlas.render_glyph(&key) {
                        // Pack into atlas if not packed
                        if current_atlas_x + glyph.width > 1024 {
                            current_atlas_x = 0;
                            current_atlas_y += max_row_height;
                            max_row_height = 0;
                        }
                        
                        if current_atlas_y + glyph.height <= 1024 {
                            // Copy pixels to texture
                            if glyph.width > 0 && glyph.height > 0 {
                                queue.write_texture(
                                    wgpu::ImageCopyTexture {
                                        texture: &self.title_texture,
                                        mip_level: 0,
                                        origin: wgpu::Origin3d {
                                            x: current_atlas_x,
                                            y: current_atlas_y,
                                            z: 0,
                                        },
                                        aspect: wgpu::TextureAspect::All,
                                    },
                                    &glyph.pixels,
                                    wgpu::ImageDataLayout {
                                        offset: 0,
                                        bytes_per_row: Some(glyph.width),
                                        rows_per_image: Some(glyph.height),
                                    },
                                    wgpu::Extent3d {
                                        width: glyph.width,
                                        height: glyph.height,
                                        depth_or_array_layers: 1,
                                    },
                                );
                            }
                            
                            // Fill metrics
                            let metrics = &mut metrics_array[char_index as usize];
                            metrics.uv_min_x = current_atlas_x as f32 / 1024.0;
                            metrics.uv_min_y = current_atlas_y as f32 / 1024.0;
                            metrics.uv_max_x = (current_atlas_x + glyph.width) as f32 / 1024.0;
                            metrics.uv_max_y = (current_atlas_y + glyph.height) as f32 / 1024.0;
                            metrics.width = glyph.width as f32;
                            metrics.height = glyph.height as f32;
                            metrics.bearing_x = glyph.bearing_x;
                            metrics.bearing_y = glyph.bearing_y;
                            metrics.advance = glyph.advance_x;
                            
                            current_atlas_x += glyph.width + 1; // 1px padding
                            max_row_height = max_row_height.max(glyph.height + 1);
                        }
                    }
                }
                
                let advance = metrics_array[char_index as usize].advance;
                
                // Add 6 vertices for 2 triangles forming a quad
                let pos_uvs = [
                    [0.0, 0.0],
                    [1.0, 0.0],
                    [0.0, 1.0],
                    [0.0, 1.0],
                    [1.0, 0.0],
                    [1.0, 1.0],
                ];
                
                for pos in pos_uvs {
                    vertices.push(TitleVertex {
                        position: pos,
                        char_index,
                        world_x,
                        world_y,
                        char_offset_x,
                        color,
                        size: font_size,
                    });
                }
                
                char_offset_x += advance;
            }
        }
        
        if !vertices.is_empty() {
            queue.write_buffer(&self.glyph_metrics_buffer, 0, bytemuck::cast_slice(&metrics_array));
            queue.write_buffer(&self.vertex_buffer, 0, bytemuck::cast_slice(&vertices));
        }
        
        vertices.len() as u32
    }

    /// Render window titles
    pub fn render<'a>(
        &'a self,
        render_pass: &mut wgpu::RenderPass<'a>,
        title_count: u32,
    ) {
        render_pass.set_pipeline(&self.pipeline);
        render_pass.set_bind_group(0, &self.bind_group, &[]);
        render_pass.set_vertex_buffer(0, self.vertex_buffer.slice(..));
        render_pass.draw(0..6, 0..title_count);
    }
}

/// Vertex data for title rendering
#[repr(C)]
#[derive(Copy, Clone, Debug, bytemuck::Pod, bytemuck::Zeroable)]
struct TitleVertex {
    position: [f32; 2],
    char_index: u32,
    world_x: f32,
    world_y: f32,
    char_offset_x: f32,
    color: [f32; 4],
    size: f32,
}

#[repr(C)]
#[derive(Copy, Clone, Debug, bytemuck::Pod, bytemuck::Zeroable, Default)]
struct GlyphMetrics {
    uv_min_x: f32,
    uv_min_y: f32,
    uv_max_x: f32,
    uv_max_y: f32,
    width: f32,
    height: f32,
    bearing_x: f32,
    bearing_y: f32,
    advance: f32,
    _pad0: f32,
    _pad1: f32,
    _pad2: f32,
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_instance_layout_size() {
        // Ensure instance data layout matches shader expectations
        assert_eq!(
            std::mem::size_of::<WindowParticleInstance>(),
            std::mem::size_of::<[f32; 2]>() * 2  // world_pos, size
                + std::mem::size_of::<[f32; 4]>() * 2  // border_color, background_color
                + std::mem::size_of::<u32>() * 2 // z_layer, particle_id
        );
    }
}