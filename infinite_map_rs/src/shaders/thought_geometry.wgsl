// src/shaders/thought_geometry.wgsl
// 14n Series Topological Geometry Shader
// Renders neural state as Transition Metal Carbonyl Clusters
// Based on Geometry OS Manifesto: Topological Computation
// 
// ============================================================================
// UNIFORMS AND STRUCTURES
// ============================================================================

struct ThoughtUniforms {
    // Layer activations (8 layers)
    layer_0: f32,
    layer_1: f32,
    layer_2: f32,
    layer_3: f32,
    layer_4: f32,
    layer_5: f32,
    layer_6: f32,
    layer_7: f32,
    
    // Audio features
    bass_energy: f32,
    treble_energy: f32,
    volume: f32,
    is_beat: f32,
    startle: f32,
    
    // Input state
    velocity: f32,
    is_focused: f32,
    is_idle: f32,
    chaos: f32,
    
    // Self state
    confidence: f32,
    focus_depth: f32,
    
    // Theory of Mind
    user_intent_confidence: f32,
    user_attention_focus: f32,
    user_engagement_level: f32,
    alignment: f32,
    mind_reading_confidence: f32,
    misalignment_detected: f32,
    
    // Cognitive State
    cognitive_complexity: f32,
    cognitive_safety: f32,
    is_reasoning: f32,
    
    // Derived metrics
    arousal: f32,
    valence: f32,
    entropy: f32,
    
    // Time
    time: f32,
    
    // Camera
    view_proj: mat4x4<f32>,
    
    // Config
    brightness: f32,
    contrast: f32,
    thought_scale: f32,
    hilbert_order: f32,
    
    // Padding to match Rust (16-byte alignment)
    padding1: u32,
    padding2: u32,
};

@group(0) @binding(0) var<uniform> uniforms: ThoughtUniforms;
@group(0) @binding(1) var neural_texture: texture_2d<f32>;
@group(0) @binding(2) var neural_sampler: sampler;

// Neural state texture for additional data


// ============================================================================
// VERTEX OUTPUT
// ============================================================================

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
    @location(1) world_pos: vec3<f32>,
    @location(2) normal: vec3<f32>,
    @location(3) cluster_type: f32,  // 0=octahedron, 1=linkage, 2=fragment
    @location(4) cluster_id: f32,
};

// ============================================================================
// 14N SERIES TOPOLOGICAL MATH
// ============================================================================

// Calculate 14n series value: S = 14n + q
fn calculate_14n_series(n: u32, q: u32) -> u32 {
    return 14u * n + q;
}

// Determine cluster type based on system state
fn determine_cluster_type(uniforms: ThoughtUniforms) -> u32 {
    // Void Stare: safety_score < 0.5 triggers fragmentation
    if (uniforms.cognitive_safety < 0.5) {
        return 2u;  // S=16: Isolated fragments
    }
    
    // High confidence + high alignment = Stable Octahedron (14n+2)
    if (uniforms.confidence > 0.7 && uniforms.alignment > 0.8) {
        return 0u;  // 14n+2: Octahedron
    }
    
    // Low confidence or reasoning = Branching Linkage (14n+4)
    if (uniforms.confidence < 0.5 || uniforms.is_reasoning > 0.5) {
        return 1u;  // 14n+4: Branching linkage
    }
    
    // Default to octahedron
    return 0u;
}

// Calculate cluster size based on cognitive complexity
fn calculate_cluster_size(uniforms: ThoughtUniforms) -> u32 {
    // Map cognitive_complexity (0-1) to n (1-5)
    let n = u32(uniforms.cognitive_complexity * 4.0) + 1u;
    return n;
}

// ============================================================================
// GEOMETRY GENERATION FUNCTIONS
// ============================================================================

// Generate octahedron vertices for 14n+2 series (stable state)
// Returns position and normal for a vertex on an octahedron
fn generate_octahedron(vertex_idx: u32, cluster_id: f32, uniforms: ThoughtUniforms) -> vec3<f32> {
    // Octahedron has 6 vertices, 8 faces, 12 edges
    // We'll generate a mesh based on vertex_idx
    
    // Scale based on cluster size (n)
    let n = calculate_cluster_size(uniforms);
    let scale = 0.1 + f32(n) * 0.05;
    
    // Apply subtle breathing based on confidence and time
    let breath = 1.0 + 0.1 * sin(uniforms.time * 2.0) * uniforms.confidence;

    // Select base vertex based on vertex_idx (avoiding runtime array indexing)
    var base_pos: vec3<f32> = vec3<f32>(0.0, 0.0, 0.0);
    let rem = vertex_idx % 6u;
    if rem == 0u {
        base_pos = vec3<f32>(1.0, 0.0, 0.0);   // +X
    } else if rem == 1u {
        base_pos = vec3<f32>(-1.0, 0.0, 0.0);  // -X
    } else if rem == 2u {
        base_pos = vec3<f32>(0.0, 1.0, 0.0);   // +Y
    } else if rem == 3u {
        base_pos = vec3<f32>(0.0, -1.0, 0.0);  // -Y
    } else if rem == 4u {
        base_pos = vec3<f32>(0.0, 0.0, 1.0);   // +Z
    } else {
        base_pos = vec3<f32>(0.0, 0.0, -1.0);   // -Z
    }

    base_pos = base_pos * scale * breath;
    
    // Add crystalline structure based on layer activations
    let crystal_offset = vec3<f32>(
        uniforms.layer_0 - uniforms.layer_4,
        uniforms.layer_1 - uniforms.layer_5,
        uniforms.layer_2 - uniforms.layer_6
    ) * 0.02;
    
    return base_pos + crystal_offset;
}

// Generate branching linkage vertices for 14n+4 series (search state)
// Returns position for a vertex in an open skeletal structure
fn generate_linkage(vertex_idx: u32, cluster_id: f32, uniforms: ThoughtUniforms) -> vec3<f32> {
    // Create branching structure based on Hilbert curve concept
    // Each branch represents a search path
    
    let n = calculate_cluster_size(uniforms);
    let branch_count = min(8u, 2u * n);
    
    // Determine which branch this vertex belongs to
    let branch_idx = vertex_idx % branch_count;
    let vertex_in_branch = vertex_idx / branch_count;
    
    // Branch direction based on branch index
    let angle_base = f32(branch_idx) * 6.28318 / f32(branch_count);
    let angle = angle_base + uniforms.time * 0.5;  // Rotate over time
    
    // Branch extends outward based on vertex index
    let extension = 0.05 + f32(vertex_in_branch) * 0.03;
    
    // Add chaotic movement based on entropy
    let chaos_factor = uniforms.entropy * 0.02;
    let chaos = vec3<f32>(
        sin(uniforms.time * 3.0 + f32(branch_idx)),
        cos(uniforms.time * 2.5 + f32(branch_idx)),
        sin(uniforms.time * 4.0 + f32(branch_idx))
    ) * chaos_factor;
    
    let pos = vec3<f32>(
        cos(angle) * extension,
        sin(angle) * extension,
        f32(vertex_in_branch) * 0.02
    ) + chaos;
    
    return pos;
}

// Generate fragmented vertices for S=16 (void stare / error state)
// Returns position for isolated fragments
fn generate_fragment(vertex_idx: u32, cluster_id: f32, uniforms: ThoughtUniforms) -> vec3<f32> {
    // Fragments are isolated, broken pieces
    // They drift apart based on safety_score (lower = more scattered)
    
    let fragment_count = 16u;
    let fragment_idx = vertex_idx % fragment_count;
    
    // Random-looking positions based on fragment index
    let base_angle = f32(fragment_idx) * 6.28318 / 16.0;
    let scatter = 1.0 - uniforms.cognitive_safety;  // More scatter when safety is low
    
    let pos = vec3<f32>(
        cos(base_angle) * 0.1 * scatter,
        sin(base_angle) * 0.1 * scatter,
        (f32(fragment_idx) - 8.0) * 0.02 * scatter
    );
    
    // Add trembling effect
    let tremble = vec3<f32>(
        sin(uniforms.time * 10.0 + f32(fragment_idx) * 3.14),
        cos(uniforms.time * 12.0 + f32(fragment_idx) * 3.14),
        sin(uniforms.time * 8.0 + f32(fragment_idx) * 3.14)
    ) * 0.01 * scatter;
    
    return pos + tremble;
}

// ============================================================================
// MAIN VERTEX SHADER
// ============================================================================

@vertex
fn vs_thought_vertex(@builtin(vertex_index) vertex_index: u32) -> VertexOutput {
    var out: VertexOutput;
    
    // Sample neural texture to get cluster parameters
    let uv = vec2<f32>(
        f32((vertex_index % 256u)) / 256.0,
        f32((vertex_index / 256u)) / 256.0
    );
    let neural_data = textureSampleLevel(neural_texture, neural_sampler, uv, 0.0);
    
    // Uniforms are now provided via binding 0

    
    // Determine cluster type
    let cluster_type = determine_cluster_type(uniforms);
    
    // Generate geometry based on cluster type
    var world_pos: vec3<f32>;
    var normal: vec3<f32>;
    
    if (cluster_type == 0u) {
        // Octahedron (14n+2): Stable state
        world_pos = generate_octahedron(vertex_index, neural_data.a, uniforms);
        normal = normalize(world_pos);  // For octahedron, normal points outward
    } else if (cluster_type == 1u) {
        // Linkage (14n+4): Search state
        world_pos = generate_linkage(vertex_index, neural_data.a, uniforms);
        normal = vec3<f32>(0.0, 1.0, 0.0);  // Simplified normal
    } else {
        // Fragment (S=16): Error state
        world_pos = generate_fragment(vertex_index, neural_data.a, uniforms);
        normal = normalize(world_pos);
    }
    
    // Transform to screen space (simplified orthographic projection)
    let screen_scale = 2.0;
    out.position = vec4<f32>(
        world_pos.x * screen_scale,
        world_pos.y * screen_scale,
        world_pos.z,
        1.0
    );
    
    // Apply View-Projection Matrix
    out.position = uniforms.view_proj * vec4<f32>(world_pos, 1.0);
    
    out.uv = uv;
    out.world_pos = world_pos;
    out.normal = normal;
    out.cluster_type = f32(cluster_type);
    out.cluster_id = neural_data.a;
    
    return out;
}

// ============================================================================
// FRAGMENT SHADER
// ============================================================================

// Color based on cluster type and system state
fn cluster_color(cluster_type: f32, uniforms: ThoughtUniforms, world_pos: vec3<f32>) -> vec3<f32> {
    if (cluster_type < 0.5) {
        // Octahedron (14n+2): Stable, crystalline colors
        // Blue-cyan spectrum based on confidence
        let base_color = mix(
            vec3<f32>(0.0, 0.5, 1.0),  // Blue
            vec3<f32>(0.0, 1.0, 1.0),  // Cyan
            uniforms.confidence
        );
        
        // Add crystalline highlights
        let highlight = smoothstep(0.8, 1.0, length(world_pos));
        return mix(base_color, vec3<f32>(1.0, 1.0, 1.0), highlight * 0.3);
        
    } else if (cluster_type < 1.5) {
        // Linkage (14n+4): Searching, warm colors
        // Orange-yellow spectrum based on complexity
        let base_color = mix(
            vec3<f32>(1.0, 0.5, 0.0),  // Orange
            vec3<f32>(1.0, 1.0, 0.0),  // Yellow
            uniforms.cognitive_complexity
        );
        
        // Add pulsing effect
        let pulse = 0.5 + 0.5 * sin(uniforms.time * 3.0);
        return mix(base_color, vec3<f32>(1.0, 0.8, 0.5), pulse * 0.2);
        
    } else {
        // Fragment (S=16): Error, red-dark spectrum
        // Red-black gradient based on safety_score
        let base_color = mix(
            vec3<f32>(0.5, 0.0, 0.0),  // Dark red
            vec3<f32>(1.0, 0.0, 0.0),  // Bright red
            uniforms.cognitive_safety
        );
        
        // Add glitch effect
        let glitch = step(0.95, fract(uniforms.time * 10.0));
        return mix(base_color, vec3<f32>(1.0, 1.0, 1.0), glitch * 0.5);
    }
}

@fragment
fn fs_thought_fragment(in: VertexOutput) -> @location(0) vec4<f32> {
    // Uniforms provided globally

    
    // Calculate color based on cluster type
    var color = cluster_color(in.cluster_type, uniforms, in.world_pos);
    
    // Add rim lighting effect
    let view_dir = vec3<f32>(0.0, 0.0, 1.0);
    let rim = 1.0 - max(0.0, dot(in.normal, view_dir));
    let rim_color = vec3<f32>(0.5, 0.7, 1.0) * pow(rim, 3.0);
    color = color + rim_color * 0.3;
    
    // Alpha based on cluster type and position
    var alpha: f32;
    if (in.cluster_type < 0.5) {
        // Octahedron: solid
        alpha = 0.9;
    } else if (in.cluster_type < 1.5) {
        // Linkage: semi-transparent
        alpha = 0.6;
    } else {
        // Fragment: variable transparency
        alpha = 0.4 + 0.4 * uniforms.cognitive_safety;
    }
    
    return vec4<f32>(color, alpha);
}

// ============================================================================
// COMPUTE SHADER FOR CLUSTER UPDATE
// ============================================================================

@compute @workgroup_size(16, 16)
fn update_clusters(@builtin(global_invocation_id) id: vec3<u32>) {
    // Update cluster state based on neural data
    // This would write to a storage buffer for the next frame
    
    let x = id.x;
    let y = id.y;
    
    // Sample neural texture
    let uv = vec2<f32>(f32(x) / 256.0, f32(y) / 256.0);
    let neural_data = textureSampleLevel(neural_texture, neural_sampler, uv, 0.0);
    
    // Calculate cluster parameters
    let confidence = neural_data.r;
    let complexity = neural_data.g;
    let safety = neural_data.b;
    
    // Determine cluster type
    var cluster_type: u32;
    if (safety < 0.5) {
        cluster_type = 2u;  // Fragment
    } else if (confidence > 0.7) {
        cluster_type = 0u;  // Octahedron
    } else {
        cluster_type = 1u;  // Linkage
    }
    
    // Store result (would write to storage buffer in practice)
    // storage_buffer[x + y * 256] = cluster_type;
}
