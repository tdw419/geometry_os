// src/shaders/memory_fold.wgsl
// Phase 33: The Glass RAM - Memory Fold Compute Shader
// Visualizes process memory as self-reflective textures using Hilbert curve mapping
//
// This compute shader transforms linear memory pages into 2D texture representations,
// preserving locality through Hilbert curve mapping and enabling real-time memory
// visualization, leak detection, and pattern recognition.
//
// ============================================================================
// UNIFORMS AND STRUCTURES
// ============================================================================

struct MemoryFoldUniforms {
    // Memory region configuration
    base_address: u32,       // Base address of memory region
    page_size: u32,          // Size of each memory page (typically 4096)
    num_pages: u32,          // Number of pages to visualize
    texture_size: u32,       // Texture dimension (must be power of 2)
    
    // Hilbert curve configuration
    hilbert_order: u32,      // Hilbert curve order (texture_size = 2^order)
    
    // Visualization mode
    mode: u32,               // 0=Allocation, 1=Content, 2=Pattern, 3=LeakDetection
    
    // Color mapping
    brightness: f32,
    contrast: f32,
    saturation: f32,
    
    // Time-based effects
    time: f32,
    
    // Leak detection
    leak_threshold: f32,     // Threshold for leak detection
    growth_rate: f32,        // Current memory growth rate
    
    // Region highlighting
    highlight_region: u32,   // Region index to highlight (0 = none)
    highlight_color: vec4<f32>,
};

// Memory page data (read from storage buffer)
struct MemoryPage {
    address: u32,
    flags: u32,              // Bit flags: allocated=1, dirty=2, accessed=4, leaked=8
    non_zero_bytes: u32,     // Count of non-zero bytes
    hash: u32,               // Hash of page content
    pattern: u32,            // Pattern identifier
};

// Storage buffer for memory pages
@group(0) @binding(0)
var<storage, read> memory_pages: array<MemoryPage>;

// Output buffer for memory visualization (using storage buffer instead of texture)
@group(0) @binding(1)
var<storage, read_write> output_buffer: array<vec4<f32>>;

// Previous frame texture for leak detection
@group(0) @binding(2)
var previous_texture: texture_2d<f32>;

// Uniforms for configuration
@group(0) @binding(3)
var<uniform> uniforms: MemoryFoldUniforms;

// ============================================================================
// HILBERT CURVE MAPPING
// ============================================================================

// Convert Hilbert curve index to (x, y) coordinates
// Preserves locality: adjacent indices → adjacent pixels
fn hilbert_index_to_xy(index: u32, order: u32) -> vec2<u32> {
    var x: u32 = 0u;
    var y: u32 = 0u;
    var s: u32 = 1u;
    var idx: u32 = index;
    
    for (var i: u32 = 0u; i < order; i++) {
        let rx: u32 = 1u & (idx / 2u);
        let ry: u32 = 1u & (idx ^ rx);
        
        // Rotate/flip quadrant
        if (ry == 0u) {
            if (rx == 1u) {
                x = s - 1u - x;
                y = s - 1u - y;
            }
            // Swap x and y
            let temp: u32 = x;
            x = y;
            y = temp;
        }
        
        x = x + s * rx;
        y = y + s * ry;
        idx = idx / 4u;
        s = s * 2u;
    }
    
    return vec2<u32>(x, y);
}

// Convert (x, y) coordinates to Hilbert curve index
fn xy_to_hilbert_index(x: u32, y: u32, order: u32) -> u32 {
    var d: u32 = 0u;
    var s: u32 = 1u / 2u;
    var rx: u32 = 0u;
    var ry: u32 = 0u;
    var xx: u32 = x;
    var yy: u32 = y;
    
    for (var i: u32 = 0u; i < order; i++) {
        rx = 1u & (xx / s);
        ry = 1u & (yy / s);
        
        d = d + s * s * ((3u * rx) ^ ry);
        
        // Rotate/flip quadrant
        if (ry == 0u) {
            if (rx == 1u) {
                xx = s - 1u - xx;
                yy = s - 1u - yy;
            }
            // Swap x and y
            let temp: u32 = xx;
            xx = yy;
            yy = temp;
        }
        
        s = s * 2u;
    }
    
    return d;
}

// ============================================================================
// COLOR MAPPING FUNCTIONS
// ============================================================================

// Convert HSV to RGB
fn hsv_to_rgb(h: f32, s: f32, v: f32) -> vec3<f32> {
    let c: f32 = v * s;
    let x: f32 = c * (1.0 - abs((h / 60.0) % 2.0 - 1.0));
    let m: f32 = v - c;
    
    var r: f32;
    var g: f32;
    var b: f32;
    
    if (h < 60.0) {
        r = c;
        g = x;
        b = 0.0;
    } else if (h < 120.0) {
        r = x;
        g = c;
        b = 0.0;
    } else if (h < 180.0) {
        r = 0.0;
        g = c;
        b = x;
    } else if (h < 240.0) {
        r = 0.0;
        g = x;
        b = c;
    } else if (h < 300.0) {
        r = x;
        g = 0.0;
        b = c;
    } else {
        r = c;
        g = 0.0;
        b = x;
    }
    
    return vec3<f32>(r + m, g + m, b + m);
}

// Heatmap color gradient: blue -> cyan -> green -> yellow -> red
fn heatmap_color(value: f32) -> vec3<f32> {
    let clamped_value: f32 = clamp(value, 0.0, 1.0);
    
    if (clamped_value < 0.25) {
        // Blue to cyan
        let t: f32 = clamped_value / 0.25;
        return vec3<f32>(0.0, t, 1.0);
    } else if (clamped_value < 0.5) {
        // Cyan to green
        let t: f32 = (clamped_value - 0.25) / 0.25;
        return vec3<f32>(0.0, 1.0, 1.0 - t);
    } else if (clamped_value < 0.75) {
        // Green to yellow
        let t: f32 = (clamped_value - 0.5) / 0.25;
        return vec3<f32>(t, 1.0, 0.0);
    } else {
        // Yellow to red
        let t: f32 = (clamped_value - 0.75) / 0.25;
        return vec3<f32>(1.0, 1.0 - t, 0.0);
    }
}

// Apply brightness, contrast, and saturation
fn apply_color_correction(color: vec3<f32>, brightness: f32, contrast: f32, saturation: f32) -> vec3<f32> {
    // Brightness
    var result: vec3<f32> = color * brightness;
    
    // Contrast
    result = (result - 0.5) * contrast + 0.5;
    
    // Saturation
    let luminance: f32 = dot(result, vec3<f32>(0.299, 0.587, 0.114));
    result = mix(vec3<f32>(luminance), result, saturation);
    
    return clamp(result, vec3<f32>(0.0), vec3<f32>(1.0));
}

// ============================================================================
// MEMORY VISUALIZATION MODES
// ============================================================================

// Mode 0: Allocation visualization (allocated vs free)
fn visualize_allocation(page: MemoryPage, uniforms: MemoryFoldUniforms) -> vec4<f32> {
    var color: vec3<f32>;
    var alpha: f32;
    
    // Check if page is allocated
    let is_allocated: bool = (page.flags & 1u) != 0u;
    
    if (is_allocated) {
        // Allocated pages use hue based on hash for pattern differentiation
        let hue: f32 = f32(page.hash % 360u);
        let saturation: f32 = 0.7;
        let value: f32 = 0.8;
        color = hsv_to_rgb(hue, saturation, value);
        alpha = 1.0;
        
        // Check if leaked
        let is_leaked: bool = (page.flags & 8u) != 0u;
        if (is_leaked) {
            // Leaked pages have a red tint
            color = mix(color, vec3<f32>(1.0, 0.0, 0.0), 0.5);
        }
    } else {
        // Free pages are dark gray
        color = vec3<f32>(0.1, 0.1, 0.1);
        alpha = 0.3;
    }
    
    // Apply color correction
    color = apply_color_correction(color, uniforms.brightness, uniforms.contrast, uniforms.saturation);
    
    return vec4<f32>(color, alpha);
}

// Mode 1: Content visualization (heatmap based on non-zero bytes)
fn visualize_content(page: MemoryPage, uniforms: MemoryFoldUniforms) -> vec4<f32> {
    // Calculate fill ratio (non-zero bytes / page size)
    let fill_ratio: f32 = f32(page.non_zero_bytes) / f32(uniforms.page_size);
    
    // Use heatmap for fill ratio
    var color: vec3<f32> = heatmap_color(fill_ratio);
    var alpha: f32 = 0.3 + 0.7 * fill_ratio;
    
    // Check if page is dirty
    let is_dirty: bool = (page.flags & 2u) != 0u;
    if (is_dirty) {
        // Dirty pages have a slight yellow tint
        color = mix(color, vec3<f32>(1.0, 1.0, 0.0), 0.2);
    }
    
    // Apply color correction
    color = apply_color_correction(color, uniforms.brightness, uniforms.contrast, uniforms.saturation);
    
    return vec4<f32>(color, alpha);
}

// Mode 2: Pattern visualization (based on pattern identifier)
fn visualize_pattern(page: MemoryPage, uniforms: MemoryFoldUniforms) -> vec4<f32> {
    var color: vec3<f32>;
    var alpha: f32;
    
    // Check if page is allocated
    let is_allocated: bool = (page.flags & 1u) != 0u;
    
    if (is_allocated) {
        // Use pattern identifier for color
        let hue: f32 = f32((page.pattern * 137u) % 360u);  // Prime multiplier for distribution
        let saturation: f32 = 0.8;
        let value: f32 = 0.9;
        color = hsv_to_rgb(hue, saturation, value);
        alpha = 1.0;
    } else {
        // Free pages are dark
        color = vec3<f32>(0.05, 0.05, 0.05);
        alpha = 0.2;
    }
    
    // Apply color correction
    color = apply_color_correction(color, uniforms.brightness, uniforms.contrast, uniforms.saturation);
    
    return vec4<f32>(color, alpha);
}

// Mode 3: Leak detection visualization
fn visualize_leak_detection(page: MemoryPage, uniforms: MemoryFoldUniforms, tex_coords: vec2<u32>) -> vec4<f32> {
    var color: vec3<f32>;
    var alpha: f32;
    
    // Check if page is allocated
    let is_allocated: bool = (page.flags & 1u) != 0u;
    
    if (!is_allocated) {
        // Free pages are dark
        color = vec3<f32>(0.05, 0.05, 0.05);
        alpha = 0.2;
    } else {
        // Sample previous frame to detect changes
        let uv: vec2<f32> = vec2<f32>(
            f32(tex_coords.x) / f32(uniforms.texture_size),
            f32(tex_coords.y) / f32(uniforms.texture_size)
        );
        let previous_color: vec4<f32> = textureLoad(previous_texture, vec2<i32>(tex_coords), 0);
        
        // Check if page is marked as leaked
        let is_leaked: bool = (page.flags & 8u) != 0u;
        
        if (is_leaked) {
            // Leaked pages are bright red with pulsing
            let pulse: f32 = 0.5 + 0.5 * sin(uniforms.time * 3.0);
            color = vec3<f32>(1.0, 0.0, 0.0) * (0.8 + 0.2 * pulse);
            alpha = 1.0;
        } else {
            // Normal allocated pages
            // Check if page has changed (dirty)
            let is_dirty: bool = (page.flags & 2u) != 0u;
            
            if (is_dirty) {
                // Dirty pages are orange
                color = vec3<f32>(1.0, 0.6, 0.0);
            } else {
                // Clean pages are green
                color = vec3<f32>(0.0, 0.8, 0.0);
            }
            
            // Check if page was previously allocated
            let was_allocated: bool = previous_color.a > 0.5;
            if (was_allocated) {
                // Stable allocation - use blue tint
                color = mix(color, vec3<f32>(0.0, 0.5, 1.0), 0.3);
            }
            
            alpha = 0.8;
        }
    }
    
    // Apply color correction
    color = apply_color_correction(color, uniforms.brightness, uniforms.contrast, uniforms.saturation);
    
    return vec4<f32>(color, alpha);
}

// ============================================================================
// MAIN COMPUTE SHADER
// ============================================================================

@compute @workgroup_size(16, 16, 1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let x: u32 = global_id.x;
    let y: u32 = global_id.y;
    
    // Check if we're within texture bounds
    if (x >= uniforms.texture_size || y >= uniforms.texture_size) {
        return;
    }
    
    // Convert texture coordinates to Hilbert curve index
    let hilbert_index: u32 = xy_to_hilbert_index(x, y, uniforms.hilbert_order);
    
    // Check if this index corresponds to a valid memory page
    if (hilbert_index >= uniforms.num_pages) {
        // Out of bounds - set to transparent black
        let index = y * uniforms.texture_size + x;
        output_buffer[index] = vec4<f32>(0.0, 0.0, 0.0, 0.0);
        return;
    }
    
    // Get memory page data
    let page: MemoryPage = memory_pages[hilbert_index];
    
    // Visualize based on mode
    var color: vec4<f32>;
    
    if (uniforms.mode == 0u) {
        color = visualize_allocation(page, uniforms);
    } else if (uniforms.mode == 1u) {
        color = visualize_content(page, uniforms);
    } else if (uniforms.mode == 2u) {
        color = visualize_pattern(page, uniforms);
    } else {
        color = visualize_leak_detection(page, uniforms, vec2<u32>(x, y));
    }
    
    // Apply region highlighting if specified
    if (uniforms.highlight_region != 0u) {
        // Check if this page is in the highlighted region
        // This is a simplified check - in practice, you'd have region bounds
        if (hilbert_index == uniforms.highlight_region) {
            color = mix(color, uniforms.highlight_color, 0.5);
        }
    }
    
    // Store result in output buffer
    let index = y * uniforms.texture_size + x;
    output_buffer[index] = color;
}

// ============================================================================
// HELPER COMPUTE SHADERS
// ============================================================================

// Compute memory statistics
@compute @workgroup_size(256, 1, 1)
fn compute_statistics(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx: u32 = global_id.x;
    
    // Check if we're within bounds
    if (idx >= uniforms.num_pages) {
        return;
    }
    
    let page: MemoryPage = memory_pages[idx];
    
    // This would write to a statistics buffer
    // In practice, you'd use atomic operations to accumulate statistics
    // For now, this is a placeholder
}

// Detect memory leaks by comparing with previous frame
@compute @workgroup_size(256, 1, 1)
fn detect_leaks(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let idx: u32 = global_id.x;
    
    // Check if we're within bounds
    if (idx >= uniforms.num_pages) {
        return;
    }
    
    let page: MemoryPage = memory_pages[idx];
    
    // Check if page is allocated
    let is_allocated: bool = (page.flags & 1u) != 0u;
    
    if (is_allocated) {
        // Check if page has been accessed recently
        let is_accessed: bool = (page.flags & 4u) != 0u;
        
        if (!is_accessed) {
            // Page hasn't been accessed - potential leak
            // This would update a leak detection buffer
            // For now, this is a placeholder
        }
    }
}

// ============================================================================
// VERTEX SHADER FOR MEMORY TEXTURE RENDERING
// ============================================================================

struct MemoryVertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
    @location(1) tex_coords: vec2<f32>,
};

@vertex
fn vs_memory_quad(@builtin(vertex_index) vertex_index: u32) -> MemoryVertexOutput {
    var out: MemoryVertexOutput;
    
    // Get position based on vertex index
    var pos: vec2<f32>;
    var uv: vec2<f32>;
    
    if (vertex_index == 0u) {
        pos = vec2<f32>(-1.0, -1.0);
        uv = vec2<f32>(0.0, 1.0);
    } else if (vertex_index == 1u) {
        pos = vec2<f32>(1.0, -1.0);
        uv = vec2<f32>(1.0, 1.0);
    } else if (vertex_index == 2u) {
        pos = vec2<f32>(-1.0, 1.0);
        uv = vec2<f32>(0.0, 0.0);
    } else if (vertex_index == 3u) {
        pos = vec2<f32>(-1.0, 1.0);
        uv = vec2<f32>(0.0, 0.0);
    } else if (vertex_index == 4u) {
        pos = vec2<f32>(1.0, -1.0);
        uv = vec2<f32>(1.0, 1.0);
    } else {
        pos = vec2<f32>(1.0, 1.0);
        uv = vec2<f32>(1.0, 0.0);
    }
    
    out.position = vec4<f32>(pos, 0.0, 1.0);
    out.uv = uv;
    out.tex_coords = uv;
    
    return out;
}

// ============================================================================
// FRAGMENT SHADER FOR MEMORY TEXTURE RENDERING
// ============================================================================

@group(0) @binding(0)
var memory_texture: texture_2d<f32>;

@group(0) @binding(1)
var memory_sampler: sampler;

@fragment
fn fs_memory_display(in: MemoryVertexOutput) -> @location(0) vec4<f32> {
    // Sample memory texture
    let color: vec4<f32> = textureSample(memory_texture, memory_sampler, in.uv);
    
    // Apply subtle grid overlay
    let grid_size: f32 = 64.0;
    let grid_x: f32 = abs(fract(in.tex_coords.x * grid_size) - 0.5) * grid_size;
    let grid_y: f32 = abs(fract(in.tex_coords.y * grid_size) - 0.5) * grid_size;
    let line_x: f32 = smoothstep(0.5, 0.0, grid_x);
    let line_y: f32 = smoothstep(0.5, 0.0, grid_y);
    let grid_line: f32 = max(line_x, line_y);
    
    // Mix grid color
    let grid_color: vec3<f32> = vec3<f32>(0.3, 0.3, 0.3);
    let final_color: vec3<f32> = mix(color.rgb, grid_color, grid_line * 0.3);
    
    return vec4<f32>(final_color, color.a);
}
