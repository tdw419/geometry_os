/**
 * Geometry OS: Phase 20 - Track 3
 * Fracture Healing Shader
 *
 * Visual shader for animating the healing of system fractures.
 * Creates particle effects that "heal" visual anomalies detected by Ouroboros.
 *
 * Healing Stages:
 * 1. Detection: Red fracture lines appear
 * 2. Analysis: Blue particles analyze the fracture
 * 3. Healing: Green particles reconstruct the area
 * 4. Completion: Fade out with golden sparkles
 */

struct VertexInput {
    @location(0) position: vec2<f32>,
    @location(1) tex_coords: vec2<f32>,
    @location(2) instance_data: vec4<f32>, // x,y: position, z: age, w: type
};

struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) tex_coords: vec2<f32>,
    @location(1) color: vec4<f32>,
    @location(2) healing_progress: f32,
};

struct Uniforms {
    time: f32,
    resolution: vec2<f32>,
    fracture_center: vec2<f32>,
    healing_stage: f32, // 0.0=detection, 1.0=healing, 2.0=complete
    particle_count: f32,
};

@group(0) @binding(0) var<uniform> uniforms: Uniforms;

@vertex
fn vs_main(input: VertexInput) -> VertexOutput {
    var output: VertexOutput;

    // Instance data: position offset, age, particle type
    let instance_pos = input.instance_data.xy;
    let particle_age = input.instance_data.z;
    let particle_type = input.instance_data.w;

    // Calculate particle position with healing animation
    var particle_pos = instance_pos;

    // Healing animation based on stage and age
    if (uniforms.healing_stage < 1.0) {
        // Detection phase: particles spiral inward
        let spiral_angle = particle_age * 6.28 + uniforms.time * 2.0;
        let spiral_radius = (1.0 - particle_age) * 100.0;
        particle_pos = particle_pos + vec2<f32>(
            cos(spiral_angle) * spiral_radius,
            sin(spiral_angle) * spiral_radius
        );
    } else if (uniforms.healing_stage < 2.0) {
        // Healing phase: particles converge and reconstruct
        let heal_progress = (uniforms.healing_stage - 1.0);
        let convergence = mix(particle_pos, vec2<f32>(0.0, 0.0), heal_progress);
        let reconstruction_wave = sin(particle_age * 3.14 + uniforms.time * 4.0) * 20.0 * (1.0 - heal_progress);
        particle_pos = convergence + vec2<f32>(reconstruction_wave, 0.0);
    } else {
        // Completion phase: golden sparkles fade out
        let sparkle_offset = vec2<f32>(
            sin(particle_age * 10.0 + uniforms.time * 6.0) * 30.0,
            cos(particle_age * 8.0 + uniforms.time * 5.0) * 30.0
        ) * (3.0 - uniforms.healing_stage);
        particle_pos = particle_pos + sparkle_offset;
    }

    // Transform to screen space
    let screen_pos = (input.position + particle_pos - uniforms.fracture_center) / uniforms.resolution * 2.0;
    output.position = vec4<f32>(screen_pos, 0.0, 1.0);

    output.tex_coords = input.tex_coords;
    output.healing_progress = uniforms.healing_stage;

    // Color based on particle type and healing stage
    if (particle_type < 0.5) {
        // Analysis particles (blue)
        output.color = vec4<f32>(0.2, 0.6, 1.0, particle_age);
    } else if (particle_type < 1.5) {
        // Healing particles (green)
        let heal_intensity = min(uniforms.healing_stage, 1.0);
        output.color = vec4<f32>(0.2, 1.0, 0.4, particle_age * heal_intensity);
    } else {
        // Completion sparkles (gold)
        let completion_progress = max(uniforms.healing_stage - 2.0, 0.0);
        output.color = vec4<f32>(1.0, 0.8, 0.2, particle_age * (1.0 - completion_progress));
    }

    return output;
}

@fragment
fn fs_main(input: VertexOutput) -> @location(0) vec4<f32> {
    // Create particle glow effect
    let dist_from_center = length(input.tex_coords - vec2<f32>(0.5, 0.5));
    let glow = 1.0 - smoothstep(0.0, 0.5, dist_from_center);

    // Add healing stage effects
    var final_color = input.color;

    if (input.healing_progress < 1.0) {
        // Detection: pulsing red fracture lines
        let fracture_pattern = sin(input.tex_coords.x * 50.0 + uniforms.time * 3.0) *
                              sin(input.tex_coords.y * 50.0 + uniforms.time * 3.0);
        final_color = mix(final_color, vec4<f32>(1.0, 0.2, 0.2, 0.8), fracture_pattern * 0.3);
    } else if (input.healing_progress < 2.0) {
        // Healing: reconstruction waves
        let wave = sin(length(input.tex_coords - vec2<f32>(0.5, 0.5)) * 20.0 - uniforms.time * 5.0);
        final_color = mix(final_color, vec4<f32>(0.2, 1.0, 0.4, 0.6), wave * 0.4);
    } else {
        // Completion: golden aura
        let aura = exp(-dist_from_center * 4.0);
        final_color = mix(final_color, vec4<f32>(1.0, 0.9, 0.3, 0.9), aura);
    }

    return final_color * glow;
}