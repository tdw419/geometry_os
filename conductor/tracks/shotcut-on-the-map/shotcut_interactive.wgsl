// Auto-generated WGSL Shader from UI Transmuter
// Source: screenshots/shotcut_gui_test.png
// Widgets: 217


fn sdBox(p: vec2f, b: vec2f) -> f32 {
    let d = abs(p) - b;
    return length(max(d, vec2f(0.0))) + min(max(d.x, d.y), 0.0);
}

fn sdRoundedBox(p: vec2f, b: vec2f, r: vec4f) -> f32 {
    let q = abs(p) - b + r.x;
    return min(max(q.x, q.y), 0.0) + length(max(q, vec2f(0.0))) - r.x;
}

fn sdLine(p: vec2f, a: vec2f, b: vec2f) -> f32 {
    let pa = p - a;
    let ba = b - a;
    let h = clamp(dot(pa, ba) / dot(ba, ba), 0.0, 1.0);
    return length(pa - ba * h);
}


fn is_hovered(widget_center: vec2f, threshold: f32) -> bool {
    return distance(widget_center, ui.mouse / ui.resolution) < threshold;
}

fn is_focused(widget_index: i32) -> bool {
    return i32(ui.focused_widget) == widget_index;
}

fn is_pressed(hover: bool) -> bool {
    return hover && ui.mouse_pressed > 0.5;
}


struct Uniforms {
    time: f32,
    mouse_pressed: f32,
    mouse: vec2f,
    resolution: vec2f,
    focused_widget: f32,
    pad: f32,
};

@group(0) @binding(0) var<uniform> ui: Uniforms;


@fragment
fn fragment_main(@builtin(position) frag_coord: vec4f) -> @location(0) vec4f {
    let uv = frag_coord.xy / ui.resolution;

    var color = vec4f(0.05, 0.05, 0.08, 1.0); // Deep background

    // unknown widget at index 0
    let unknown_0_center = vec2f(0.065918, 0.012370);
    let unknown_0_half = vec2f(0.042480, 0.009766);
    let unknown_0_uv = uv - unknown_0_center;
    let unknown_0_d = sdBox(unknown_0_uv, unknown_0_half);
    let unknown_0_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_0_d);
    if (unknown_0_alpha > 0.0) {
        let unknown_0_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_0_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_0_color = select(unknown_0_base, unknown_0_base + vec4f(0.08), unknown_0_hover);
        color = mix(color, unknown_0_color, unknown_0_alpha);
    }

    // unknown widget at index 1
    let unknown_1_center = vec2f(0.179199, 0.012370);
    let unknown_1_half = vec2f(0.085449, 0.009766);
    let unknown_1_uv = uv - unknown_1_center;
    let unknown_1_d = sdBox(unknown_1_uv, unknown_1_half);
    let unknown_1_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_1_d);
    if (unknown_1_alpha > 0.0) {
        let unknown_1_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_1_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_1_color = select(unknown_1_base, unknown_1_base + vec4f(0.08), unknown_1_hover);
        color = mix(color, unknown_1_color, unknown_1_alpha);
    }

    // unknown widget at index 2
    let unknown_2_center = vec2f(0.296387, 0.012370);
    let unknown_2_half = vec2f(0.116699, 0.009766);
    let unknown_2_uv = uv - unknown_2_center;
    let unknown_2_d = sdBox(unknown_2_uv, unknown_2_half);
    let unknown_2_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_2_d);
    if (unknown_2_alpha > 0.0) {
        let unknown_2_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_2_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_2_color = select(unknown_2_base, unknown_2_base + vec4f(0.08), unknown_2_hover);
        color = mix(color, unknown_2_color, unknown_2_alpha);
    }

    // unknown widget at index 3
    let unknown_3_center = vec2f(0.395508, 0.012370);
    let unknown_3_half = vec2f(0.151367, 0.009766);
    let unknown_3_uv = uv - unknown_3_center;
    let unknown_3_d = sdBox(unknown_3_uv, unknown_3_half);
    let unknown_3_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_3_d);
    if (unknown_3_alpha > 0.0) {
        let unknown_3_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_3_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_3_color = select(unknown_3_base, unknown_3_base + vec4f(0.08), unknown_3_hover);
        color = mix(color, unknown_3_color, unknown_3_alpha);
    }

    // unknown widget at index 4
    let unknown_4_center = vec2f(0.508301, 0.012370);
    let unknown_4_half = vec2f(0.194824, 0.009766);
    let unknown_4_uv = uv - unknown_4_center;
    let unknown_4_d = sdBox(unknown_4_uv, unknown_4_half);
    let unknown_4_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_4_d);
    if (unknown_4_alpha > 0.0) {
        let unknown_4_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_4_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_4_color = select(unknown_4_base, unknown_4_base + vec4f(0.08), unknown_4_hover);
        color = mix(color, unknown_4_color, unknown_4_alpha);
    }

    // unknown widget at index 5
    let unknown_5_center = vec2f(0.610840, 0.020833);
    let unknown_5_half = vec2f(0.209473, 0.007812);
    let unknown_5_uv = uv - unknown_5_center;
    let unknown_5_d = sdBox(unknown_5_uv, unknown_5_half);
    let unknown_5_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_5_d);
    if (unknown_5_alpha > 0.0) {
        let unknown_5_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_5_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_5_color = select(unknown_5_base, unknown_5_base + vec4f(0.08), unknown_5_hover);
        color = mix(color, unknown_5_color, unknown_5_alpha);
    }

    // unknown widget at index 6
    let unknown_6_center = vec2f(0.065918, 0.043620);
    let unknown_6_half = vec2f(0.042480, 0.020182);
    let unknown_6_uv = uv - unknown_6_center;
    let unknown_6_d = sdBox(unknown_6_uv, unknown_6_half);
    let unknown_6_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_6_d);
    if (unknown_6_alpha > 0.0) {
        let unknown_6_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_6_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_6_color = select(unknown_6_base, unknown_6_base + vec4f(0.08), unknown_6_hover);
        color = mix(color, unknown_6_color, unknown_6_alpha);
    }

    // unknown widget at index 7
    let unknown_7_center = vec2f(0.167480, 0.043620);
    let unknown_7_half = vec2f(0.073730, 0.020182);
    let unknown_7_uv = uv - unknown_7_center;
    let unknown_7_d = sdBox(unknown_7_uv, unknown_7_half);
    let unknown_7_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_7_d);
    if (unknown_7_alpha > 0.0) {
        let unknown_7_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_7_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_7_color = select(unknown_7_base, unknown_7_base + vec4f(0.08), unknown_7_hover);
        color = mix(color, unknown_7_color, unknown_7_alpha);
    }

    // unknown widget at index 8
    let unknown_8_center = vec2f(0.249512, 0.041667);
    let unknown_8_half = vec2f(0.093262, 0.018229);
    let unknown_8_uv = uv - unknown_8_center;
    let unknown_8_d = sdBox(unknown_8_uv, unknown_8_half);
    let unknown_8_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_8_d);
    if (unknown_8_alpha > 0.0) {
        let unknown_8_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_8_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_8_color = select(unknown_8_base, unknown_8_base + vec4f(0.08), unknown_8_hover);
        color = mix(color, unknown_8_color, unknown_8_alpha);
    }

    // unknown widget at index 9
    let unknown_9_center = vec2f(0.298340, 0.052083);
    let unknown_9_half = vec2f(0.100098, 0.018229);
    let unknown_9_uv = uv - unknown_9_center;
    let unknown_9_d = sdBox(unknown_9_uv, unknown_9_half);
    let unknown_9_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_9_d);
    if (unknown_9_alpha > 0.0) {
        let unknown_9_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_9_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_9_color = select(unknown_9_base, unknown_9_base + vec4f(0.08), unknown_9_hover);
        color = mix(color, unknown_9_color, unknown_9_alpha);
    }

    // unknown widget at index 10
    let unknown_10_center = vec2f(0.065918, 0.074870);
    let unknown_10_half = vec2f(0.042480, 0.030599);
    let unknown_10_uv = uv - unknown_10_center;
    let unknown_10_d = sdBox(unknown_10_uv, unknown_10_half);
    let unknown_10_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_10_d);
    if (unknown_10_alpha > 0.0) {
        let unknown_10_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_10_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_10_color = select(unknown_10_base, unknown_10_base + vec4f(0.08), unknown_10_hover);
        color = mix(color, unknown_10_color, unknown_10_alpha);
    }

    // unknown widget at index 11
    let unknown_11_center = vec2f(0.171387, 0.072917);
    let unknown_11_half = vec2f(0.077637, 0.028646);
    let unknown_11_uv = uv - unknown_11_center;
    let unknown_11_d = sdBox(unknown_11_uv, unknown_11_half);
    let unknown_11_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_11_d);
    if (unknown_11_alpha > 0.0) {
        let unknown_11_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_11_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_11_color = select(unknown_11_base, unknown_11_base + vec4f(0.08), unknown_11_hover);
        color = mix(color, unknown_11_color, unknown_11_alpha);
    }

    // unknown widget at index 12
    let unknown_12_center = vec2f(0.258301, 0.072917);
    let unknown_12_half = vec2f(0.093262, 0.028646);
    let unknown_12_uv = uv - unknown_12_center;
    let unknown_12_d = sdBox(unknown_12_uv, unknown_12_half);
    let unknown_12_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_12_d);
    if (unknown_12_alpha > 0.0) {
        let unknown_12_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_12_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_12_color = select(unknown_12_base, unknown_12_base + vec4f(0.08), unknown_12_hover);
        color = mix(color, unknown_12_color, unknown_12_alpha);
    }

    // unknown widget at index 13
    let unknown_13_center = vec2f(0.308105, 0.076823);
    let unknown_13_half = vec2f(0.112793, 0.028646);
    let unknown_13_uv = uv - unknown_13_center;
    let unknown_13_d = sdBox(unknown_13_uv, unknown_13_half);
    let unknown_13_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_13_d);
    if (unknown_13_alpha > 0.0) {
        let unknown_13_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_13_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_13_color = select(unknown_13_base, unknown_13_base + vec4f(0.08), unknown_13_hover);
        color = mix(color, unknown_13_color, unknown_13_alpha);
    }

    // unknown widget at index 14
    let unknown_14_center = vec2f(0.356934, 0.083333);
    let unknown_14_half = vec2f(0.119629, 0.028646);
    let unknown_14_uv = uv - unknown_14_center;
    let unknown_14_d = sdBox(unknown_14_uv, unknown_14_half);
    let unknown_14_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_14_d);
    if (unknown_14_alpha > 0.0) {
        let unknown_14_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_14_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_14_color = select(unknown_14_base, unknown_14_base + vec4f(0.08), unknown_14_hover);
        color = mix(color, unknown_14_color, unknown_14_alpha);
    }

    // unknown widget at index 15
    let unknown_15_center = vec2f(0.062012, 0.106120);
    let unknown_15_half = vec2f(0.038574, 0.041016);
    let unknown_15_uv = uv - unknown_15_center;
    let unknown_15_d = sdBox(unknown_15_uv, unknown_15_half);
    let unknown_15_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_15_d);
    if (unknown_15_alpha > 0.0) {
        let unknown_15_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_15_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_15_color = select(unknown_15_base, unknown_15_base + vec4f(0.08), unknown_15_hover);
        color = mix(color, unknown_15_color, unknown_15_alpha);
    }

    // unknown widget at index 16
    let unknown_16_center = vec2f(0.159668, 0.104167);
    let unknown_16_half = vec2f(0.073730, 0.039062);
    let unknown_16_uv = uv - unknown_16_center;
    let unknown_16_d = sdBox(unknown_16_uv, unknown_16_half);
    let unknown_16_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_16_d);
    if (unknown_16_alpha > 0.0) {
        let unknown_16_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_16_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_16_color = select(unknown_16_base, unknown_16_base + vec4f(0.08), unknown_16_hover);
        color = mix(color, unknown_16_color, unknown_16_alpha);
    }

    // unknown widget at index 17
    let unknown_17_center = vec2f(0.261230, 0.104167);
    let unknown_17_half = vec2f(0.104980, 0.039062);
    let unknown_17_uv = uv - unknown_17_center;
    let unknown_17_d = sdBox(unknown_17_uv, unknown_17_half);
    let unknown_17_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_17_d);
    if (unknown_17_alpha > 0.0) {
        let unknown_17_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_17_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_17_color = select(unknown_17_base, unknown_17_base + vec4f(0.08), unknown_17_hover);
        color = mix(color, unknown_17_color, unknown_17_alpha);
    }

    // unknown widget at index 18
    let unknown_18_center = vec2f(0.333496, 0.114583);
    let unknown_18_half = vec2f(0.111816, 0.039062);
    let unknown_18_uv = uv - unknown_18_center;
    let unknown_18_d = sdBox(unknown_18_uv, unknown_18_half);
    let unknown_18_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_18_d);
    if (unknown_18_alpha > 0.0) {
        let unknown_18_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_18_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_18_color = select(unknown_18_base, unknown_18_base + vec4f(0.08), unknown_18_hover);
        color = mix(color, unknown_18_color, unknown_18_alpha);
    }

    // unknown widget at index 19
    let unknown_19_center = vec2f(0.062012, 0.137370);
    let unknown_19_half = vec2f(0.038574, 0.051432);
    let unknown_19_uv = uv - unknown_19_center;
    let unknown_19_d = sdBox(unknown_19_uv, unknown_19_half);
    let unknown_19_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_19_d);
    if (unknown_19_alpha > 0.0) {
        let unknown_19_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_19_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_19_color = select(unknown_19_base, unknown_19_base + vec4f(0.08), unknown_19_hover);
        color = mix(color, unknown_19_color, unknown_19_alpha);
    }

    // unknown widget at index 20
    let unknown_20_center = vec2f(0.155762, 0.135417);
    let unknown_20_half = vec2f(0.069824, 0.049479);
    let unknown_20_uv = uv - unknown_20_center;
    let unknown_20_d = sdBox(unknown_20_uv, unknown_20_half);
    let unknown_20_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_20_d);
    if (unknown_20_alpha > 0.0) {
        let unknown_20_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_20_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_20_color = select(unknown_20_base, unknown_20_base + vec4f(0.08), unknown_20_hover);
        color = mix(color, unknown_20_color, unknown_20_alpha);
    }

    // unknown widget at index 21
    let unknown_21_center = vec2f(0.235840, 0.145833);
    let unknown_21_half = vec2f(0.084473, 0.049479);
    let unknown_21_uv = uv - unknown_21_center;
    let unknown_21_d = sdBox(unknown_21_uv, unknown_21_half);
    let unknown_21_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_21_d);
    if (unknown_21_alpha > 0.0) {
        let unknown_21_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_21_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_21_color = select(unknown_21_base, unknown_21_base + vec4f(0.08), unknown_21_hover);
        color = mix(color, unknown_21_color, unknown_21_alpha);
    }

    // unknown widget at index 22
    let unknown_22_center = vec2f(0.062012, 0.168620);
    let unknown_22_half = vec2f(0.038574, 0.061849);
    let unknown_22_uv = uv - unknown_22_center;
    let unknown_22_d = sdBox(unknown_22_uv, unknown_22_half);
    let unknown_22_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_22_d);
    if (unknown_22_alpha > 0.0) {
        let unknown_22_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_22_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_22_color = select(unknown_22_base, unknown_22_base + vec4f(0.08), unknown_22_hover);
        color = mix(color, unknown_22_color, unknown_22_alpha);
    }

    // unknown widget at index 23
    let unknown_23_center = vec2f(0.151855, 0.168620);
    let unknown_23_half = vec2f(0.065918, 0.061849);
    let unknown_23_uv = uv - unknown_23_center;
    let unknown_23_d = sdBox(unknown_23_uv, unknown_23_half);
    let unknown_23_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_23_d);
    if (unknown_23_alpha > 0.0) {
        let unknown_23_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_23_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_23_color = select(unknown_23_base, unknown_23_base + vec4f(0.08), unknown_23_hover);
        color = mix(color, unknown_23_color, unknown_23_alpha);
    }

    // unknown widget at index 24
    let unknown_24_center = vec2f(0.229980, 0.166667);
    let unknown_24_half = vec2f(0.089355, 0.059896);
    let unknown_24_uv = uv - unknown_24_center;
    let unknown_24_d = sdBox(unknown_24_uv, unknown_24_half);
    let unknown_24_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_24_d);
    if (unknown_24_alpha > 0.0) {
        let unknown_24_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_24_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_24_color = select(unknown_24_base, unknown_24_base + vec4f(0.08), unknown_24_hover);
        color = mix(color, unknown_24_color, unknown_24_alpha);
    }

    // unknown widget at index 25
    let unknown_25_center = vec2f(0.300293, 0.168620);
    let unknown_25_half = vec2f(0.112793, 0.061849);
    let unknown_25_uv = uv - unknown_25_center;
    let unknown_25_d = sdBox(unknown_25_uv, unknown_25_half);
    let unknown_25_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_25_d);
    if (unknown_25_alpha > 0.0) {
        let unknown_25_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_25_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_25_color = select(unknown_25_base, unknown_25_base + vec4f(0.08), unknown_25_hover);
        color = mix(color, unknown_25_color, unknown_25_alpha);
    }

    // unknown widget at index 26
    let unknown_26_center = vec2f(0.362793, 0.166667);
    let unknown_26_half = vec2f(0.128418, 0.059896);
    let unknown_26_uv = uv - unknown_26_center;
    let unknown_26_d = sdBox(unknown_26_uv, unknown_26_half);
    let unknown_26_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_26_d);
    if (unknown_26_alpha > 0.0) {
        let unknown_26_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_26_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_26_color = select(unknown_26_base, unknown_26_base + vec4f(0.08), unknown_26_hover);
        color = mix(color, unknown_26_color, unknown_26_alpha);
    }

    // unknown widget at index 27
    let unknown_27_center = vec2f(0.429199, 0.166667);
    let unknown_27_half = vec2f(0.163574, 0.059896);
    let unknown_27_uv = uv - unknown_27_center;
    let unknown_27_d = sdBox(unknown_27_uv, unknown_27_half);
    let unknown_27_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_27_d);
    if (unknown_27_alpha > 0.0) {
        let unknown_27_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_27_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_27_color = select(unknown_27_base, unknown_27_base + vec4f(0.08), unknown_27_hover);
        color = mix(color, unknown_27_color, unknown_27_alpha);
    }

    // unknown widget at index 28
    let unknown_28_center = vec2f(0.522949, 0.166667);
    let unknown_28_half = vec2f(0.187012, 0.059896);
    let unknown_28_uv = uv - unknown_28_center;
    let unknown_28_d = sdBox(unknown_28_uv, unknown_28_half);
    let unknown_28_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_28_d);
    if (unknown_28_alpha > 0.0) {
        let unknown_28_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_28_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_28_color = select(unknown_28_base, unknown_28_base + vec4f(0.08), unknown_28_hover);
        color = mix(color, unknown_28_color, unknown_28_alpha);
    }

    // unknown widget at index 29
    let unknown_29_center = vec2f(0.594727, 0.166667);
    let unknown_29_half = vec2f(0.209961, 0.059896);
    let unknown_29_uv = uv - unknown_29_center;
    let unknown_29_d = sdBox(unknown_29_uv, unknown_29_half);
    let unknown_29_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_29_d);
    if (unknown_29_alpha > 0.0) {
        let unknown_29_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_29_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_29_color = select(unknown_29_base, unknown_29_base + vec4f(0.08), unknown_29_hover);
        color = mix(color, unknown_29_color, unknown_29_alpha);
    }

    // unknown widget at index 30
    let unknown_30_center = vec2f(0.657715, 0.177083);
    let unknown_30_half = vec2f(0.225098, 0.059896);
    let unknown_30_uv = uv - unknown_30_center;
    let unknown_30_d = sdBox(unknown_30_uv, unknown_30_half);
    let unknown_30_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_30_d);
    if (unknown_30_alpha > 0.0) {
        let unknown_30_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_30_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_30_color = select(unknown_30_base, unknown_30_base + vec4f(0.08), unknown_30_hover);
        color = mix(color, unknown_30_color, unknown_30_alpha);
    }

    // unknown widget at index 31
    let unknown_31_center = vec2f(0.065918, 0.199870);
    let unknown_31_half = vec2f(0.042480, 0.072266);
    let unknown_31_uv = uv - unknown_31_center;
    let unknown_31_d = sdBox(unknown_31_uv, unknown_31_half);
    let unknown_31_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_31_d);
    if (unknown_31_alpha > 0.0) {
        let unknown_31_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_31_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_31_color = select(unknown_31_base, unknown_31_base + vec4f(0.08), unknown_31_hover);
        color = mix(color, unknown_31_color, unknown_31_alpha);
    }

    // unknown widget at index 32
    let unknown_32_center = vec2f(0.161133, 0.197917);
    let unknown_32_half = vec2f(0.065430, 0.070312);
    let unknown_32_uv = uv - unknown_32_center;
    let unknown_32_d = sdBox(unknown_32_uv, unknown_32_half);
    let unknown_32_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_32_d);
    if (unknown_32_alpha > 0.0) {
        let unknown_32_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_32_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_32_color = select(unknown_32_base, unknown_32_base + vec4f(0.08), unknown_32_hover);
        color = mix(color, unknown_32_color, unknown_32_alpha);
    }

    // unknown widget at index 33
    let unknown_33_center = vec2f(0.254395, 0.199870);
    let unknown_33_half = vec2f(0.112793, 0.072266);
    let unknown_33_uv = uv - unknown_33_center;
    let unknown_33_d = sdBox(unknown_33_uv, unknown_33_half);
    let unknown_33_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_33_d);
    if (unknown_33_alpha > 0.0) {
        let unknown_33_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_33_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_33_color = select(unknown_33_base, unknown_33_base + vec4f(0.08), unknown_33_hover);
        color = mix(color, unknown_33_color, unknown_33_alpha);
    }

    // label widget at index 34
    let label_34_center = vec2f(0.037598, 0.229167);
    let label_34_half = vec2f(0.037598, 0.080729);
    let label_34_uv = uv - label_34_center;
    let label_34_d = sdBox(label_34_uv, label_34_half);
    let label_34_alpha = 1.0 - smoothstep(0.0, 0.003, label_34_d);
    if (label_34_alpha > 0.0) {
        let label_34_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let label_34_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var label_34_color = select(label_34_base, label_34_base + vec4f(0.08), label_34_hover);
        color = mix(color, label_34_color, label_34_alpha);
    }

    // unknown widget at index 35
    let unknown_35_center = vec2f(0.150879, 0.229818);
    let unknown_35_half = vec2f(0.064941, 0.081380);
    let unknown_35_uv = uv - unknown_35_center;
    let unknown_35_d = sdBox(unknown_35_uv, unknown_35_half);
    let unknown_35_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_35_d);
    if (unknown_35_alpha > 0.0) {
        let unknown_35_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_35_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_35_color = select(unknown_35_base, unknown_35_base + vec4f(0.08), unknown_35_hover);
        color = mix(color, unknown_35_color, unknown_35_alpha);
    }

    // unknown widget at index 36
    let unknown_36_center = vec2f(0.253418, 0.229167);
    let unknown_36_half = vec2f(0.112793, 0.080729);
    let unknown_36_uv = uv - unknown_36_center;
    let unknown_36_d = sdBox(unknown_36_uv, unknown_36_half);
    let unknown_36_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_36_d);
    if (unknown_36_alpha > 0.0) {
        let unknown_36_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_36_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_36_color = select(unknown_36_base, unknown_36_base + vec4f(0.08), unknown_36_hover);
        color = mix(color, unknown_36_color, unknown_36_alpha);
    }

    // unknown widget at index 37
    let unknown_37_center = vec2f(0.374512, 0.219401);
    let unknown_37_half = vec2f(0.139160, 0.081380);
    let unknown_37_uv = uv - unknown_37_center;
    let unknown_37_d = sdBox(unknown_37_uv, unknown_37_half);
    let unknown_37_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_37_d);
    if (unknown_37_alpha > 0.0) {
        let unknown_37_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_37_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_37_color = select(unknown_37_base, unknown_37_base + vec4f(0.08), unknown_37_hover);
        color = mix(color, unknown_37_color, unknown_37_alpha);
    }

    // unknown widget at index 38
    let unknown_38_center = vec2f(0.487793, 0.229167);
    let unknown_38_half = vec2f(0.198730, 0.080729);
    let unknown_38_uv = uv - unknown_38_center;
    let unknown_38_d = sdBox(unknown_38_uv, unknown_38_half);
    let unknown_38_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_38_d);
    if (unknown_38_alpha > 0.0) {
        let unknown_38_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_38_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_38_color = select(unknown_38_base, unknown_38_base + vec4f(0.08), unknown_38_hover);
        color = mix(color, unknown_38_color, unknown_38_alpha);
    }

    // unknown widget at index 39
    let unknown_39_center = vec2f(0.632324, 0.229167);
    let unknown_39_half = vec2f(0.226074, 0.080729);
    let unknown_39_uv = uv - unknown_39_center;
    let unknown_39_d = sdBox(unknown_39_uv, unknown_39_half);
    let unknown_39_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_39_d);
    if (unknown_39_alpha > 0.0) {
        let unknown_39_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_39_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_39_color = select(unknown_39_base, unknown_39_base + vec4f(0.08), unknown_39_hover);
        color = mix(color, unknown_39_color, unknown_39_alpha);
    }

    // label widget at index 40
    let label_40_center = vec2f(0.037598, 0.260417);
    let label_40_half = vec2f(0.037598, 0.091146);
    let label_40_uv = uv - label_40_center;
    let label_40_d = sdBox(label_40_uv, label_40_half);
    let label_40_alpha = 1.0 - smoothstep(0.0, 0.003, label_40_d);
    if (label_40_alpha > 0.0) {
        let label_40_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let label_40_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var label_40_color = select(label_40_base, label_40_base + vec4f(0.08), label_40_hover);
        color = mix(color, label_40_color, label_40_alpha);
    }

    // unknown widget at index 41
    let unknown_41_center = vec2f(0.167480, 0.262370);
    let unknown_41_half = vec2f(0.081543, 0.093099);
    let unknown_41_uv = uv - unknown_41_center;
    let unknown_41_d = sdBox(unknown_41_uv, unknown_41_half);
    let unknown_41_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_41_d);
    if (unknown_41_alpha > 0.0) {
        let unknown_41_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_41_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_41_color = select(unknown_41_base, unknown_41_base + vec4f(0.08), unknown_41_hover);
        color = mix(color, unknown_41_color, unknown_41_alpha);
    }

    // unknown widget at index 42
    let unknown_42_center = vec2f(0.285156, 0.262370);
    let unknown_42_half = vec2f(0.112305, 0.093099);
    let unknown_42_uv = uv - unknown_42_center;
    let unknown_42_d = sdBox(unknown_42_uv, unknown_42_half);
    let unknown_42_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_42_d);
    if (unknown_42_alpha > 0.0) {
        let unknown_42_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_42_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_42_color = select(unknown_42_base, unknown_42_base + vec4f(0.08), unknown_42_hover);
        color = mix(color, unknown_42_color, unknown_42_alpha);
    }

    // unknown widget at index 43
    let unknown_43_center = vec2f(0.034668, 0.291667);
    let unknown_43_half = vec2f(0.034668, 0.101562);
    let unknown_43_uv = uv - unknown_43_center;
    let unknown_43_d = sdBox(unknown_43_uv, unknown_43_half);
    let unknown_43_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_43_d);
    if (unknown_43_alpha > 0.0) {
        let unknown_43_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_43_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_43_color = select(unknown_43_base, unknown_43_base + vec4f(0.08), unknown_43_hover);
        color = mix(color, unknown_43_color, unknown_43_alpha);
    }

    // unknown widget at index 44
    let unknown_44_center = vec2f(0.144043, 0.293620);
    let unknown_44_half = vec2f(0.065918, 0.103516);
    let unknown_44_uv = uv - unknown_44_center;
    let unknown_44_d = sdBox(unknown_44_uv, unknown_44_half);
    let unknown_44_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_44_d);
    if (unknown_44_alpha > 0.0) {
        let unknown_44_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_44_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_44_color = select(unknown_44_base, unknown_44_base + vec4f(0.08), unknown_44_hover);
        color = mix(color, unknown_44_color, unknown_44_alpha);
    }

    // unknown widget at index 45
    let unknown_45_center = vec2f(0.249512, 0.293620);
    let unknown_45_half = vec2f(0.108887, 0.103516);
    let unknown_45_uv = uv - unknown_45_center;
    let unknown_45_d = sdBox(unknown_45_uv, unknown_45_half);
    let unknown_45_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_45_d);
    if (unknown_45_alpha > 0.0) {
        let unknown_45_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_45_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_45_color = select(unknown_45_base, unknown_45_base + vec4f(0.08), unknown_45_hover);
        color = mix(color, unknown_45_color, unknown_45_alpha);
    }

    // unknown widget at index 46
    let unknown_46_center = vec2f(0.371582, 0.291667);
    let unknown_46_half = vec2f(0.144043, 0.101562);
    let unknown_46_uv = uv - unknown_46_center;
    let unknown_46_d = sdBox(unknown_46_uv, unknown_46_half);
    let unknown_46_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_46_d);
    if (unknown_46_alpha > 0.0) {
        let unknown_46_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_46_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_46_color = select(unknown_46_base, unknown_46_base + vec4f(0.08), unknown_46_hover);
        color = mix(color, unknown_46_color, unknown_46_alpha);
    }

    // unknown widget at index 47
    let unknown_47_center = vec2f(0.479980, 0.291667);
    let unknown_47_half = vec2f(0.183105, 0.101562);
    let unknown_47_uv = uv - unknown_47_center;
    let unknown_47_d = sdBox(unknown_47_uv, unknown_47_half);
    let unknown_47_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_47_d);
    if (unknown_47_alpha > 0.0) {
        let unknown_47_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_47_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_47_color = select(unknown_47_base, unknown_47_base + vec4f(0.08), unknown_47_hover);
        color = mix(color, unknown_47_color, unknown_47_alpha);
    }

    // unknown widget at index 48
    let unknown_48_center = vec2f(0.578613, 0.291667);
    let unknown_48_half = vec2f(0.202637, 0.101562);
    let unknown_48_uv = uv - unknown_48_center;
    let unknown_48_d = sdBox(unknown_48_uv, unknown_48_half);
    let unknown_48_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_48_d);
    if (unknown_48_alpha > 0.0) {
        let unknown_48_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_48_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_48_color = select(unknown_48_base, unknown_48_base + vec4f(0.08), unknown_48_hover);
        color = mix(color, unknown_48_color, unknown_48_alpha);
    }

    // unknown widget at index 49
    let unknown_49_center = vec2f(0.646973, 0.293620);
    let unknown_49_half = vec2f(0.232910, 0.103516);
    let unknown_49_uv = uv - unknown_49_center;
    let unknown_49_d = sdBox(unknown_49_uv, unknown_49_half);
    let unknown_49_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_49_d);
    if (unknown_49_alpha > 0.0) {
        let unknown_49_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_49_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_49_color = select(unknown_49_base, unknown_49_base + vec4f(0.08), unknown_49_hover);
        color = mix(color, unknown_49_color, unknown_49_alpha);
    }

    // unknown widget at index 50
    let unknown_50_center = vec2f(0.733887, 0.291667);
    let unknown_50_half = vec2f(0.257324, 0.101562);
    let unknown_50_uv = uv - unknown_50_center;
    let unknown_50_d = sdBox(unknown_50_uv, unknown_50_half);
    let unknown_50_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_50_d);
    if (unknown_50_alpha > 0.0) {
        let unknown_50_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_50_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_50_color = select(unknown_50_base, unknown_50_base + vec4f(0.08), unknown_50_hover);
        color = mix(color, unknown_50_color, unknown_50_alpha);
    }

    // unknown widget at index 51
    let unknown_51_center = vec2f(0.812012, 0.291667);
    let unknown_51_half = vec2f(0.287598, 0.101562);
    let unknown_51_uv = uv - unknown_51_center;
    let unknown_51_d = sdBox(unknown_51_uv, unknown_51_half);
    let unknown_51_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_51_d);
    if (unknown_51_alpha > 0.0) {
        let unknown_51_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_51_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_51_color = select(unknown_51_base, unknown_51_base + vec4f(0.08), unknown_51_hover);
        color = mix(color, unknown_51_color, unknown_51_alpha);
    }

    // label widget at index 52
    let label_52_center = vec2f(0.037598, 0.322917);
    let label_52_half = vec2f(0.037598, 0.111979);
    let label_52_uv = uv - label_52_center;
    let label_52_d = sdBox(label_52_uv, label_52_half);
    let label_52_alpha = 1.0 - smoothstep(0.0, 0.003, label_52_d);
    if (label_52_alpha > 0.0) {
        let label_52_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let label_52_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var label_52_color = select(label_52_base, label_52_base + vec4f(0.08), label_52_hover);
        color = mix(color, label_52_color, label_52_alpha);
    }

    // unknown widget at index 53
    let unknown_53_center = vec2f(0.155762, 0.322917);
    let unknown_53_half = vec2f(0.069824, 0.111979);
    let unknown_53_uv = uv - unknown_53_center;
    let unknown_53_d = sdBox(unknown_53_uv, unknown_53_half);
    let unknown_53_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_53_d);
    if (unknown_53_alpha > 0.0) {
        let unknown_53_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_53_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_53_color = select(unknown_53_base, unknown_53_base + vec4f(0.08), unknown_53_hover);
        color = mix(color, unknown_53_color, unknown_53_alpha);
    }

    // unknown widget at index 54
    let unknown_54_center = vec2f(0.276855, 0.324870);
    let unknown_54_half = vec2f(0.128418, 0.113932);
    let unknown_54_uv = uv - unknown_54_center;
    let unknown_54_d = sdBox(unknown_54_uv, unknown_54_half);
    let unknown_54_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_54_d);
    if (unknown_54_alpha > 0.0) {
        let unknown_54_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_54_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_54_color = select(unknown_54_base, unknown_54_base + vec4f(0.08), unknown_54_hover);
        color = mix(color, unknown_54_color, unknown_54_alpha);
    }

    // unknown widget at index 55
    let unknown_55_center = vec2f(0.407715, 0.322917);
    let unknown_55_half = vec2f(0.140137, 0.111979);
    let unknown_55_uv = uv - unknown_55_center;
    let unknown_55_d = sdBox(unknown_55_uv, unknown_55_half);
    let unknown_55_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_55_d);
    if (unknown_55_alpha > 0.0) {
        let unknown_55_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_55_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_55_color = select(unknown_55_base, unknown_55_base + vec4f(0.08), unknown_55_hover);
        color = mix(color, unknown_55_color, unknown_55_alpha);
    }

    // unknown widget at index 56
    let unknown_56_center = vec2f(0.444824, 0.322917);
    let unknown_56_half = vec2f(0.155762, 0.111979);
    let unknown_56_uv = uv - unknown_56_center;
    let unknown_56_d = sdBox(unknown_56_uv, unknown_56_half);
    let unknown_56_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_56_d);
    if (unknown_56_alpha > 0.0) {
        let unknown_56_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_56_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_56_color = select(unknown_56_base, unknown_56_base + vec4f(0.08), unknown_56_hover);
        color = mix(color, unknown_56_color, unknown_56_alpha);
    }

    // unknown widget at index 57
    let unknown_57_center = vec2f(0.491699, 0.322917);
    let unknown_57_half = vec2f(0.171387, 0.111979);
    let unknown_57_uv = uv - unknown_57_center;
    let unknown_57_d = sdBox(unknown_57_uv, unknown_57_half);
    let unknown_57_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_57_d);
    if (unknown_57_alpha > 0.0) {
        let unknown_57_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_57_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_57_color = select(unknown_57_base, unknown_57_base + vec4f(0.08), unknown_57_hover);
        color = mix(color, unknown_57_color, unknown_57_alpha);
    }

    // unknown widget at index 58
    let unknown_58_center = vec2f(0.550293, 0.324870);
    let unknown_58_half = vec2f(0.198730, 0.113932);
    let unknown_58_uv = uv - unknown_58_center;
    let unknown_58_d = sdBox(unknown_58_uv, unknown_58_half);
    let unknown_58_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_58_d);
    if (unknown_58_alpha > 0.0) {
        let unknown_58_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_58_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_58_color = select(unknown_58_base, unknown_58_base + vec4f(0.08), unknown_58_hover);
        color = mix(color, unknown_58_color, unknown_58_alpha);
    }

    // menu widget at index 59
    let menu_59_center = vec2f(0.625488, 0.322917);
    let menu_59_half = vec2f(0.218262, 0.111979);
    let menu_59_uv = uv - menu_59_center;
    let menu_59_d = sdBox(menu_59_uv, menu_59_half);
    let menu_59_alpha = 1.0 - smoothstep(0.0, 0.003, menu_59_d);
    if (menu_59_alpha > 0.0) {
        let menu_59_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let menu_59_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var menu_59_color = select(menu_59_base, menu_59_base + vec4f(0.08), menu_59_hover);
        // Pressed state for clickable widget
        if (menu_59_hover && ui.mouse_pressed > 0.5) { menu_59_color -= vec4f(0.05); }
        color = mix(color, menu_59_color, menu_59_alpha);
    }

    // unknown widget at index 60
    let unknown_60_center = vec2f(0.677246, 0.322917);
    let unknown_60_half = vec2f(0.229980, 0.111979);
    let unknown_60_uv = uv - unknown_60_center;
    let unknown_60_d = sdBox(unknown_60_uv, unknown_60_half);
    let unknown_60_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_60_d);
    if (unknown_60_alpha > 0.0) {
        let unknown_60_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_60_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_60_color = select(unknown_60_base, unknown_60_base + vec4f(0.08), unknown_60_hover);
        color = mix(color, unknown_60_color, unknown_60_alpha);
    }

    // unknown widget at index 61
    let unknown_61_center = vec2f(0.725098, 0.322917);
    let unknown_61_half = vec2f(0.256348, 0.111979);
    let unknown_61_uv = uv - unknown_61_center;
    let unknown_61_d = sdBox(unknown_61_uv, unknown_61_half);
    let unknown_61_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_61_d);
    if (unknown_61_alpha > 0.0) {
        let unknown_61_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_61_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_61_color = select(unknown_61_base, unknown_61_base + vec4f(0.08), unknown_61_hover);
        color = mix(color, unknown_61_color, unknown_61_alpha);
    }

    // unknown widget at index 62
    let unknown_62_center = vec2f(0.029785, 0.354167);
    let unknown_62_half = vec2f(0.029785, 0.122396);
    let unknown_62_uv = uv - unknown_62_center;
    let unknown_62_d = sdBox(unknown_62_uv, unknown_62_half);
    let unknown_62_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_62_d);
    if (unknown_62_alpha > 0.0) {
        let unknown_62_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_62_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_62_color = select(unknown_62_base, unknown_62_base + vec4f(0.08), unknown_62_hover);
        color = mix(color, unknown_62_color, unknown_62_alpha);
    }

    // unknown widget at index 63
    let unknown_63_center = vec2f(0.088867, 0.348958);
    let unknown_63_half = vec2f(0.032227, 0.128906);
    let unknown_63_uv = uv - unknown_63_center;
    let unknown_63_d = sdBox(unknown_63_uv, unknown_63_half);
    let unknown_63_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_63_d);
    if (unknown_63_alpha > 0.0) {
        let unknown_63_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_63_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_63_color = select(unknown_63_base, unknown_63_base + vec4f(0.08), unknown_63_hover);
        color = mix(color, unknown_63_color, unknown_63_alpha);
    }

    // label widget at index 64
    let label_64_center = vec2f(0.037598, 0.385417);
    let label_64_half = vec2f(0.037598, 0.132812);
    let label_64_uv = uv - label_64_center;
    let label_64_d = sdBox(label_64_uv, label_64_half);
    let label_64_alpha = 1.0 - smoothstep(0.0, 0.003, label_64_d);
    if (label_64_alpha > 0.0) {
        let label_64_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let label_64_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var label_64_color = select(label_64_base, label_64_base + vec4f(0.08), label_64_hover);
        color = mix(color, label_64_color, label_64_alpha);
    }

    // unknown widget at index 65
    let unknown_65_center = vec2f(0.159668, 0.385417);
    let unknown_65_half = vec2f(0.073730, 0.132812);
    let unknown_65_uv = uv - unknown_65_center;
    let unknown_65_d = sdBox(unknown_65_uv, unknown_65_half);
    let unknown_65_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_65_d);
    if (unknown_65_alpha > 0.0) {
        let unknown_65_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_65_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_65_color = select(unknown_65_base, unknown_65_base + vec4f(0.08), unknown_65_hover);
        color = mix(color, unknown_65_color, unknown_65_alpha);
    }

    // unknown widget at index 66
    let unknown_66_center = vec2f(0.254395, 0.385417);
    let unknown_66_half = vec2f(0.097168, 0.132812);
    let unknown_66_uv = uv - unknown_66_center;
    let unknown_66_d = sdBox(unknown_66_uv, unknown_66_half);
    let unknown_66_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_66_d);
    if (unknown_66_alpha > 0.0) {
        let unknown_66_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_66_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_66_color = select(unknown_66_base, unknown_66_base + vec4f(0.08), unknown_66_hover);
        color = mix(color, unknown_66_color, unknown_66_alpha);
    }

    // unknown widget at index 67
    let unknown_67_center = vec2f(0.325684, 0.385417);
    let unknown_67_half = vec2f(0.120605, 0.132812);
    let unknown_67_uv = uv - unknown_67_center;
    let unknown_67_d = sdBox(unknown_67_uv, unknown_67_half);
    let unknown_67_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_67_d);
    if (unknown_67_alpha > 0.0) {
        let unknown_67_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_67_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_67_color = select(unknown_67_base, unknown_67_base + vec4f(0.08), unknown_67_hover);
        color = mix(color, unknown_67_color, unknown_67_alpha);
    }

    // unknown widget at index 68
    let unknown_68_center = vec2f(0.436035, 0.387370);
    let unknown_68_half = vec2f(0.186035, 0.134766);
    let unknown_68_uv = uv - unknown_68_center;
    let unknown_68_d = sdBox(unknown_68_uv, unknown_68_half);
    let unknown_68_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_68_d);
    if (unknown_68_alpha > 0.0) {
        let unknown_68_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_68_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_68_color = select(unknown_68_base, unknown_68_base + vec4f(0.08), unknown_68_hover);
        color = mix(color, unknown_68_color, unknown_68_alpha);
    }

    // unknown widget at index 69
    let unknown_69_center = vec2f(0.620605, 0.385417);
    let unknown_69_half = vec2f(0.237793, 0.132812);
    let unknown_69_uv = uv - unknown_69_center;
    let unknown_69_d = sdBox(unknown_69_uv, unknown_69_half);
    let unknown_69_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_69_d);
    if (unknown_69_alpha > 0.0) {
        let unknown_69_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_69_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_69_color = select(unknown_69_base, unknown_69_base + vec4f(0.08), unknown_69_hover);
        color = mix(color, unknown_69_color, unknown_69_alpha);
    }

    // unknown widget at index 70
    let unknown_70_center = vec2f(0.749512, 0.385417);
    let unknown_70_half = vec2f(0.265137, 0.132812);
    let unknown_70_uv = uv - unknown_70_center;
    let unknown_70_d = sdBox(unknown_70_uv, unknown_70_half);
    let unknown_70_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_70_d);
    if (unknown_70_alpha > 0.0) {
        let unknown_70_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_70_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_70_color = select(unknown_70_base, unknown_70_base + vec4f(0.08), unknown_70_hover);
        color = mix(color, unknown_70_color, unknown_70_alpha);
    }

    // unknown widget at index 71
    let unknown_71_center = vec2f(0.015625, 0.658854);
    let unknown_71_half = vec2f(0.007812, 0.235677);
    let unknown_71_uv = uv - unknown_71_center;
    let unknown_71_d = sdBox(unknown_71_uv, unknown_71_half);
    let unknown_71_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_71_d);
    if (unknown_71_alpha > 0.0) {
        let unknown_71_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_71_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_71_color = select(unknown_71_base, unknown_71_base + vec4f(0.08), unknown_71_hover);
        color = mix(color, unknown_71_color, unknown_71_alpha);
    }

    // unknown widget at index 72
    let unknown_72_center = vec2f(0.015625, 0.565104);
    let unknown_72_half = vec2f(0.007812, 0.204427);
    let unknown_72_uv = uv - unknown_72_center;
    let unknown_72_d = sdBox(unknown_72_uv, unknown_72_half);
    let unknown_72_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_72_d);
    if (unknown_72_alpha > 0.0) {
        let unknown_72_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_72_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_72_color = select(unknown_72_base, unknown_72_base + vec4f(0.08), unknown_72_hover);
        color = mix(color, unknown_72_color, unknown_72_alpha);
    }

    // unknown widget at index 73
    let unknown_73_center = vec2f(0.015625, 0.471354);
    let unknown_73_half = vec2f(0.007812, 0.173177);
    let unknown_73_uv = uv - unknown_73_center;
    let unknown_73_d = sdBox(unknown_73_uv, unknown_73_half);
    let unknown_73_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_73_d);
    if (unknown_73_alpha > 0.0) {
        let unknown_73_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_73_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_73_color = select(unknown_73_base, unknown_73_base + vec4f(0.08), unknown_73_hover);
        color = mix(color, unknown_73_color, unknown_73_alpha);
    }

    // unknown widget at index 74
    let unknown_74_center = vec2f(0.077637, 0.418620);
    let unknown_74_half = vec2f(0.054199, 0.145182);
    let unknown_74_uv = uv - unknown_74_center;
    let unknown_74_d = sdBox(unknown_74_uv, unknown_74_half);
    let unknown_74_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_74_d);
    if (unknown_74_alpha > 0.0) {
        let unknown_74_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_74_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_74_color = select(unknown_74_base, unknown_74_base + vec4f(0.08), unknown_74_hover);
        color = mix(color, unknown_74_color, unknown_74_alpha);
    }

    // unknown widget at index 75
    let unknown_75_center = vec2f(0.206543, 0.418620);
    let unknown_75_half = vec2f(0.089355, 0.145182);
    let unknown_75_uv = uv - unknown_75_center;
    let unknown_75_d = sdBox(unknown_75_uv, unknown_75_half);
    let unknown_75_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_75_d);
    if (unknown_75_alpha > 0.0) {
        let unknown_75_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_75_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_75_color = select(unknown_75_base, unknown_75_base + vec4f(0.08), unknown_75_hover);
        color = mix(color, unknown_75_color, unknown_75_alpha);
    }

    // unknown widget at index 76
    let unknown_76_center = vec2f(0.073730, 0.449870);
    let unknown_76_half = vec2f(0.050293, 0.155599);
    let unknown_76_uv = uv - unknown_76_center;
    let unknown_76_d = sdBox(unknown_76_uv, unknown_76_half);
    let unknown_76_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_76_d);
    if (unknown_76_alpha > 0.0) {
        let unknown_76_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_76_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_76_color = select(unknown_76_base, unknown_76_base + vec4f(0.08), unknown_76_hover);
        color = mix(color, unknown_76_color, unknown_76_alpha);
    }

    // unknown widget at index 77
    let unknown_77_center = vec2f(0.179199, 0.447917);
    let unknown_77_half = vec2f(0.069824, 0.153646);
    let unknown_77_uv = uv - unknown_77_center;
    let unknown_77_d = sdBox(unknown_77_uv, unknown_77_half);
    let unknown_77_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_77_d);
    if (unknown_77_alpha > 0.0) {
        let unknown_77_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_77_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_77_color = select(unknown_77_base, unknown_77_base + vec4f(0.08), unknown_77_hover);
        color = mix(color, unknown_77_color, unknown_77_alpha);
    }

    // unknown widget at index 78
    let unknown_78_center = vec2f(0.262207, 0.449870);
    let unknown_78_half = vec2f(0.112793, 0.155599);
    let unknown_78_uv = uv - unknown_78_center;
    let unknown_78_d = sdBox(unknown_78_uv, unknown_78_half);
    let unknown_78_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_78_d);
    if (unknown_78_alpha > 0.0) {
        let unknown_78_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_78_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_78_color = select(unknown_78_base, unknown_78_base + vec4f(0.08), unknown_78_hover);
        color = mix(color, unknown_78_color, unknown_78_alpha);
    }

    // unknown widget at index 79
    let unknown_79_center = vec2f(0.390137, 0.447917);
    let unknown_79_half = vec2f(0.155762, 0.153646);
    let unknown_79_uv = uv - unknown_79_center;
    let unknown_79_d = sdBox(unknown_79_uv, unknown_79_half);
    let unknown_79_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_79_d);
    if (unknown_79_alpha > 0.0) {
        let unknown_79_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_79_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_79_color = select(unknown_79_base, unknown_79_base + vec4f(0.08), unknown_79_hover);
        color = mix(color, unknown_79_color, unknown_79_alpha);
    }

    // unknown widget at index 80
    let unknown_80_center = vec2f(0.485840, 0.458333);
    let unknown_80_half = vec2f(0.162598, 0.153646);
    let unknown_80_uv = uv - unknown_80_center;
    let unknown_80_d = sdBox(unknown_80_uv, unknown_80_half);
    let unknown_80_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_80_d);
    if (unknown_80_alpha > 0.0) {
        let unknown_80_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_80_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_80_color = select(unknown_80_base, unknown_80_base + vec4f(0.08), unknown_80_hover);
        color = mix(color, unknown_80_color, unknown_80_alpha);
    }

    // unknown widget at index 81
    let unknown_81_center = vec2f(0.073730, 0.481120);
    let unknown_81_half = vec2f(0.050293, 0.166016);
    let unknown_81_uv = uv - unknown_81_center;
    let unknown_81_d = sdBox(unknown_81_uv, unknown_81_half);
    let unknown_81_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_81_d);
    if (unknown_81_alpha > 0.0) {
        let unknown_81_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_81_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_81_color = select(unknown_81_base, unknown_81_base + vec4f(0.08), unknown_81_hover);
        color = mix(color, unknown_81_color, unknown_81_alpha);
    }

    // unknown widget at index 82
    let unknown_82_center = vec2f(0.207520, 0.481120);
    let unknown_82_half = vec2f(0.097168, 0.166016);
    let unknown_82_uv = uv - unknown_82_center;
    let unknown_82_d = sdBox(unknown_82_uv, unknown_82_half);
    let unknown_82_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_82_d);
    if (unknown_82_alpha > 0.0) {
        let unknown_82_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_82_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_82_color = select(unknown_82_base, unknown_82_base + vec4f(0.08), unknown_82_hover);
        color = mix(color, unknown_82_color, unknown_82_alpha);
    }

    // unknown widget at index 83
    let unknown_83_center = vec2f(0.073730, 0.512370);
    let unknown_83_half = vec2f(0.050293, 0.176432);
    let unknown_83_uv = uv - unknown_83_center;
    let unknown_83_d = sdBox(unknown_83_uv, unknown_83_half);
    let unknown_83_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_83_d);
    if (unknown_83_alpha > 0.0) {
        let unknown_83_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_83_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_83_color = select(unknown_83_base, unknown_83_base + vec4f(0.08), unknown_83_hover);
        color = mix(color, unknown_83_color, unknown_83_alpha);
    }

    // unknown widget at index 84
    let unknown_84_center = vec2f(0.179199, 0.516276);
    let unknown_84_half = vec2f(0.069824, 0.176432);
    let unknown_84_uv = uv - unknown_84_center;
    let unknown_84_d = sdBox(unknown_84_uv, unknown_84_half);
    let unknown_84_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_84_d);
    if (unknown_84_alpha > 0.0) {
        let unknown_84_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_84_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_84_color = select(unknown_84_base, unknown_84_base + vec4f(0.08), unknown_84_hover);
        color = mix(color, unknown_84_color, unknown_84_alpha);
    }

    // unknown widget at index 85
    let unknown_85_center = vec2f(0.249512, 0.510417);
    let unknown_85_half = vec2f(0.101074, 0.174479);
    let unknown_85_uv = uv - unknown_85_center;
    let unknown_85_d = sdBox(unknown_85_uv, unknown_85_half);
    let unknown_85_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_85_d);
    if (unknown_85_alpha > 0.0) {
        let unknown_85_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_85_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_85_color = select(unknown_85_base, unknown_85_base + vec4f(0.08), unknown_85_hover);
        color = mix(color, unknown_85_color, unknown_85_alpha);
    }

    // unknown widget at index 86
    let unknown_86_center = vec2f(0.321777, 0.520833);
    let unknown_86_half = vec2f(0.107910, 0.174479);
    let unknown_86_uv = uv - unknown_86_center;
    let unknown_86_d = sdBox(unknown_86_uv, unknown_86_half);
    let unknown_86_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_86_d);
    if (unknown_86_alpha > 0.0) {
        let unknown_86_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_86_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_86_color = select(unknown_86_base, unknown_86_base + vec4f(0.08), unknown_86_hover);
        color = mix(color, unknown_86_color, unknown_86_alpha);
    }

    // unknown widget at index 87
    let unknown_87_center = vec2f(0.065918, 0.543620);
    let unknown_87_half = vec2f(0.042480, 0.186849);
    let unknown_87_uv = uv - unknown_87_center;
    let unknown_87_d = sdBox(unknown_87_uv, unknown_87_half);
    let unknown_87_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_87_d);
    if (unknown_87_alpha > 0.0) {
        let unknown_87_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_87_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_87_color = select(unknown_87_base, unknown_87_base + vec4f(0.08), unknown_87_hover);
        color = mix(color, unknown_87_color, unknown_87_alpha);
    }

    // unknown widget at index 88
    let unknown_88_center = vec2f(0.161133, 0.541667);
    let unknown_88_half = vec2f(0.065430, 0.184896);
    let unknown_88_uv = uv - unknown_88_center;
    let unknown_88_d = sdBox(unknown_88_uv, unknown_88_half);
    let unknown_88_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_88_d);
    if (unknown_88_alpha > 0.0) {
        let unknown_88_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_88_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_88_color = select(unknown_88_base, unknown_88_base + vec4f(0.08), unknown_88_hover);
        color = mix(color, unknown_88_color, unknown_88_alpha);
    }

    // unknown widget at index 89
    let unknown_89_center = vec2f(0.254395, 0.543620);
    let unknown_89_half = vec2f(0.112793, 0.186849);
    let unknown_89_uv = uv - unknown_89_center;
    let unknown_89_d = sdBox(unknown_89_uv, unknown_89_half);
    let unknown_89_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_89_d);
    if (unknown_89_alpha > 0.0) {
        let unknown_89_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_89_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_89_color = select(unknown_89_base, unknown_89_base + vec4f(0.08), unknown_89_hover);
        color = mix(color, unknown_89_color, unknown_89_alpha);
    }

    // unknown widget at index 90
    let unknown_90_center = vec2f(0.356934, 0.552083);
    let unknown_90_half = vec2f(0.119629, 0.184896);
    let unknown_90_uv = uv - unknown_90_center;
    let unknown_90_d = sdBox(unknown_90_uv, unknown_90_half);
    let unknown_90_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_90_d);
    if (unknown_90_alpha > 0.0) {
        let unknown_90_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_90_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_90_color = select(unknown_90_base, unknown_90_base + vec4f(0.08), unknown_90_hover);
        color = mix(color, unknown_90_color, unknown_90_alpha);
    }

    // unknown widget at index 91
    let unknown_91_center = vec2f(0.077637, 0.574870);
    let unknown_91_half = vec2f(0.054199, 0.197266);
    let unknown_91_uv = uv - unknown_91_center;
    let unknown_91_d = sdBox(unknown_91_uv, unknown_91_half);
    let unknown_91_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_91_d);
    if (unknown_91_alpha > 0.0) {
        let unknown_91_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_91_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_91_color = select(unknown_91_base, unknown_91_base + vec4f(0.08), unknown_91_hover);
        color = mix(color, unknown_91_color, unknown_91_alpha);
    }

    // unknown widget at index 92
    let unknown_92_center = vec2f(0.198242, 0.572917);
    let unknown_92_half = vec2f(0.081055, 0.195312);
    let unknown_92_uv = uv - unknown_92_center;
    let unknown_92_d = sdBox(unknown_92_uv, unknown_92_half);
    let unknown_92_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_92_d);
    if (unknown_92_alpha > 0.0) {
        let unknown_92_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_92_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_92_color = select(unknown_92_base, unknown_92_base + vec4f(0.08), unknown_92_hover);
        color = mix(color, unknown_92_color, unknown_92_alpha);
    }

    // unknown widget at index 93
    let unknown_93_center = vec2f(0.296387, 0.574870);
    let unknown_93_half = vec2f(0.124512, 0.197266);
    let unknown_93_uv = uv - unknown_93_center;
    let unknown_93_d = sdBox(unknown_93_uv, unknown_93_half);
    let unknown_93_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_93_d);
    if (unknown_93_alpha > 0.0) {
        let unknown_93_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_93_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_93_color = select(unknown_93_base, unknown_93_base + vec4f(0.08), unknown_93_hover);
        color = mix(color, unknown_93_color, unknown_93_alpha);
    }

    // unknown widget at index 94
    let unknown_94_center = vec2f(0.399902, 0.583333);
    let unknown_94_half = vec2f(0.139160, 0.195312);
    let unknown_94_uv = uv - unknown_94_center;
    let unknown_94_d = sdBox(unknown_94_uv, unknown_94_half);
    let unknown_94_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_94_d);
    if (unknown_94_alpha > 0.0) {
        let unknown_94_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_94_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_94_color = select(unknown_94_base, unknown_94_base + vec4f(0.08), unknown_94_hover);
        color = mix(color, unknown_94_color, unknown_94_alpha);
    }

    // unknown widget at index 95
    let unknown_95_center = vec2f(0.065918, 0.606120);
    let unknown_95_half = vec2f(0.042480, 0.207682);
    let unknown_95_uv = uv - unknown_95_center;
    let unknown_95_d = sdBox(unknown_95_uv, unknown_95_half);
    let unknown_95_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_95_d);
    if (unknown_95_alpha > 0.0) {
        let unknown_95_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_95_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_95_color = select(unknown_95_base, unknown_95_base + vec4f(0.08), unknown_95_hover);
        color = mix(color, unknown_95_color, unknown_95_alpha);
    }

    // unknown widget at index 96
    let unknown_96_center = vec2f(0.155762, 0.608073);
    let unknown_96_half = vec2f(0.062012, 0.205729);
    let unknown_96_uv = uv - unknown_96_center;
    let unknown_96_d = sdBox(unknown_96_uv, unknown_96_half);
    let unknown_96_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_96_d);
    if (unknown_96_alpha > 0.0) {
        let unknown_96_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_96_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_96_color = select(unknown_96_base, unknown_96_base + vec4f(0.08), unknown_96_hover);
        color = mix(color, unknown_96_color, unknown_96_alpha);
    }

    // unknown widget at index 97
    let unknown_97_center = vec2f(0.220215, 0.606120);
    let unknown_97_half = vec2f(0.085449, 0.207682);
    let unknown_97_uv = uv - unknown_97_center;
    let unknown_97_d = sdBox(unknown_97_uv, unknown_97_half);
    let unknown_97_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_97_d);
    if (unknown_97_alpha > 0.0) {
        let unknown_97_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_97_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_97_color = select(unknown_97_base, unknown_97_base + vec4f(0.08), unknown_97_hover);
        color = mix(color, unknown_97_color, unknown_97_alpha);
    }

    // unknown widget at index 98
    let unknown_98_center = vec2f(0.296387, 0.604167);
    let unknown_98_half = vec2f(0.116699, 0.205729);
    let unknown_98_uv = uv - unknown_98_center;
    let unknown_98_d = sdBox(unknown_98_uv, unknown_98_half);
    let unknown_98_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_98_d);
    if (unknown_98_alpha > 0.0) {
        let unknown_98_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_98_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_98_color = select(unknown_98_base, unknown_98_base + vec4f(0.08), unknown_98_hover);
        color = mix(color, unknown_98_color, unknown_98_alpha);
    }

    // unknown widget at index 99
    let unknown_99_center = vec2f(0.376465, 0.614583);
    let unknown_99_half = vec2f(0.131348, 0.205729);
    let unknown_99_uv = uv - unknown_99_center;
    let unknown_99_d = sdBox(unknown_99_uv, unknown_99_half);
    let unknown_99_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_99_d);
    if (unknown_99_alpha > 0.0) {
        let unknown_99_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_99_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_99_color = select(unknown_99_base, unknown_99_base + vec4f(0.08), unknown_99_hover);
        color = mix(color, unknown_99_color, unknown_99_alpha);
    }

    // unknown widget at index 100
    let unknown_100_center = vec2f(0.062012, 0.637370);
    let unknown_100_half = vec2f(0.038574, 0.218099);
    let unknown_100_uv = uv - unknown_100_center;
    let unknown_100_d = sdBox(unknown_100_uv, unknown_100_half);
    let unknown_100_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_100_d);
    if (unknown_100_alpha > 0.0) {
        let unknown_100_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_100_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_100_color = select(unknown_100_base, unknown_100_base + vec4f(0.08), unknown_100_hover);
        color = mix(color, unknown_100_color, unknown_100_alpha);
    }

    // unknown widget at index 101
    let unknown_101_center = vec2f(0.159668, 0.635417);
    let unknown_101_half = vec2f(0.073730, 0.216146);
    let unknown_101_uv = uv - unknown_101_center;
    let unknown_101_d = sdBox(unknown_101_uv, unknown_101_half);
    let unknown_101_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_101_d);
    if (unknown_101_alpha > 0.0) {
        let unknown_101_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_101_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_101_color = select(unknown_101_base, unknown_101_base + vec4f(0.08), unknown_101_hover);
        color = mix(color, unknown_101_color, unknown_101_alpha);
    }

    // unknown widget at index 102
    let unknown_102_center = vec2f(0.065918, 0.668620);
    let unknown_102_half = vec2f(0.042480, 0.228516);
    let unknown_102_uv = uv - unknown_102_center;
    let unknown_102_d = sdBox(unknown_102_uv, unknown_102_half);
    let unknown_102_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_102_d);
    if (unknown_102_alpha > 0.0) {
        let unknown_102_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_102_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_102_color = select(unknown_102_base, unknown_102_base + vec4f(0.08), unknown_102_hover);
        color = mix(color, unknown_102_color, unknown_102_alpha);
    }

    // unknown widget at index 103
    let unknown_103_center = vec2f(0.179199, 0.668620);
    let unknown_103_half = vec2f(0.085449, 0.228516);
    let unknown_103_uv = uv - unknown_103_center;
    let unknown_103_d = sdBox(unknown_103_uv, unknown_103_half);
    let unknown_103_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_103_d);
    if (unknown_103_alpha > 0.0) {
        let unknown_103_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_103_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_103_color = select(unknown_103_base, unknown_103_base + vec4f(0.08), unknown_103_hover);
        color = mix(color, unknown_103_color, unknown_103_alpha);
    }

    // unknown widget at index 104
    let unknown_104_center = vec2f(0.282715, 0.677083);
    let unknown_104_half = vec2f(0.100098, 0.226562);
    let unknown_104_uv = uv - unknown_104_center;
    let unknown_104_d = sdBox(unknown_104_uv, unknown_104_half);
    let unknown_104_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_104_d);
    if (unknown_104_alpha > 0.0) {
        let unknown_104_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_104_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_104_color = select(unknown_104_base, unknown_104_base + vec4f(0.08), unknown_104_hover);
        color = mix(color, unknown_104_color, unknown_104_alpha);
    }

    // unknown widget at index 105
    let unknown_105_center = vec2f(0.082520, 0.697917);
    let unknown_105_half = vec2f(0.041504, 0.236979);
    let unknown_105_uv = uv - unknown_105_center;
    let unknown_105_d = sdBox(unknown_105_uv, unknown_105_half);
    let unknown_105_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_105_d);
    if (unknown_105_alpha > 0.0) {
        let unknown_105_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_105_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_105_color = select(unknown_105_base, unknown_105_base + vec4f(0.08), unknown_105_hover);
        color = mix(color, unknown_105_color, unknown_105_alpha);
    }

    // unknown widget at index 106
    let unknown_106_center = vec2f(0.073730, 0.729167);
    let unknown_106_half = vec2f(0.034668, 0.247396);
    let unknown_106_uv = uv - unknown_106_center;
    let unknown_106_d = sdBox(unknown_106_uv, unknown_106_half);
    let unknown_106_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_106_d);
    if (unknown_106_alpha > 0.0) {
        let unknown_106_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_106_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_106_color = select(unknown_106_base, unknown_106_base + vec4f(0.08), unknown_106_hover);
        color = mix(color, unknown_106_color, unknown_106_alpha);
    }

    // unknown widget at index 107
    let unknown_107_center = vec2f(0.122559, 0.739583);
    let unknown_107_half = vec2f(0.041504, 0.247396);
    let unknown_107_uv = uv - unknown_107_center;
    let unknown_107_d = sdBox(unknown_107_uv, unknown_107_half);
    let unknown_107_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_107_d);
    if (unknown_107_alpha > 0.0) {
        let unknown_107_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_107_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_107_color = select(unknown_107_base, unknown_107_base + vec4f(0.08), unknown_107_hover);
        color = mix(color, unknown_107_color, unknown_107_alpha);
    }

    // label widget at index 108
    let label_108_center = vec2f(0.075684, 0.759115);
    let label_108_half = vec2f(0.025879, 0.253906);
    let label_108_uv = uv - label_108_center;
    let label_108_d = sdBox(label_108_uv, label_108_half);
    let label_108_alpha = 1.0 - smoothstep(0.0, 0.003, label_108_d);
    if (label_108_alpha > 0.0) {
        let label_108_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let label_108_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var label_108_color = select(label_108_base, label_108_base + vec4f(0.08), label_108_hover);
        color = mix(color, label_108_color, label_108_alpha);
    }

    // unknown widget at index 109
    let unknown_109_center = vec2f(0.123535, 0.761068);
    let unknown_109_half = vec2f(0.061035, 0.258464);
    let unknown_109_uv = uv - unknown_109_center;
    let unknown_109_d = sdBox(unknown_109_uv, unknown_109_half);
    let unknown_109_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_109_d);
    if (unknown_109_alpha > 0.0) {
        let unknown_109_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_109_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_109_color = select(unknown_109_base, unknown_109_base + vec4f(0.08), unknown_109_hover);
        color = mix(color, unknown_109_color, unknown_109_alpha);
    }

    // unknown widget at index 110
    let unknown_110_center = vec2f(0.226074, 0.760417);
    let unknown_110_half = vec2f(0.093262, 0.257812);
    let unknown_110_uv = uv - unknown_110_center;
    let unknown_110_d = sdBox(unknown_110_uv, unknown_110_half);
    let unknown_110_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_110_d);
    if (unknown_110_alpha > 0.0) {
        let unknown_110_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_110_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_110_color = select(unknown_110_base, unknown_110_base + vec4f(0.08), unknown_110_hover);
        color = mix(color, unknown_110_color, unknown_110_alpha);
    }

    // unknown widget at index 111
    let unknown_111_center = vec2f(0.140137, 0.793620);
    let unknown_111_half = vec2f(0.077637, 0.270182);
    let unknown_111_uv = uv - unknown_111_center;
    let unknown_111_d = sdBox(unknown_111_uv, unknown_111_half);
    let unknown_111_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_111_d);
    if (unknown_111_alpha > 0.0) {
        let unknown_111_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_111_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_111_color = select(unknown_111_base, unknown_111_base + vec4f(0.08), unknown_111_hover);
        color = mix(color, unknown_111_color, unknown_111_alpha);
    }

    // unknown widget at index 112
    let unknown_112_center = vec2f(0.276855, 0.791667);
    let unknown_112_half = vec2f(0.112793, 0.268229);
    let unknown_112_uv = uv - unknown_112_center;
    let unknown_112_d = sdBox(unknown_112_uv, unknown_112_half);
    let unknown_112_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_112_d);
    if (unknown_112_alpha > 0.0) {
        let unknown_112_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_112_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_112_color = select(unknown_112_base, unknown_112_base + vec4f(0.08), unknown_112_hover);
        color = mix(color, unknown_112_color, unknown_112_alpha);
    }

    // unknown widget at index 113
    let unknown_113_center = vec2f(0.140137, 0.824870);
    let unknown_113_half = vec2f(0.077637, 0.280599);
    let unknown_113_uv = uv - unknown_113_center;
    let unknown_113_d = sdBox(unknown_113_uv, unknown_113_half);
    let unknown_113_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_113_d);
    if (unknown_113_alpha > 0.0) {
        let unknown_113_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_113_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_113_color = select(unknown_113_base, unknown_113_base + vec4f(0.08), unknown_113_hover);
        color = mix(color, unknown_113_color, unknown_113_alpha);
    }

    // menu widget at index 114
    let menu_114_center = vec2f(0.269043, 0.822917);
    let menu_114_half = vec2f(0.104980, 0.278646);
    let menu_114_uv = uv - menu_114_center;
    let menu_114_d = sdBox(menu_114_uv, menu_114_half);
    let menu_114_alpha = 1.0 - smoothstep(0.0, 0.003, menu_114_d);
    if (menu_114_alpha > 0.0) {
        let menu_114_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let menu_114_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var menu_114_color = select(menu_114_base, menu_114_base + vec4f(0.08), menu_114_hover);
        // Pressed state for clickable widget
        if (menu_114_hover && ui.mouse_pressed > 0.5) { menu_114_color -= vec4f(0.05); }
        color = mix(color, menu_114_color, menu_114_alpha);
    }

    // unknown widget at index 115
    let unknown_115_center = vec2f(0.340332, 0.822917);
    let unknown_115_half = vec2f(0.120605, 0.278646);
    let unknown_115_uv = uv - unknown_115_center;
    let unknown_115_d = sdBox(unknown_115_uv, unknown_115_half);
    let unknown_115_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_115_d);
    if (unknown_115_alpha > 0.0) {
        let unknown_115_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_115_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_115_color = select(unknown_115_base, unknown_115_base + vec4f(0.08), unknown_115_hover);
        color = mix(color, unknown_115_color, unknown_115_alpha);
    }

    // unknown widget at index 116
    let unknown_116_center = vec2f(0.413574, 0.823568);
    let unknown_116_half = vec2f(0.162598, 0.279297);
    let unknown_116_uv = uv - unknown_116_center;
    let unknown_116_d = sdBox(unknown_116_uv, unknown_116_half);
    let unknown_116_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_116_d);
    if (unknown_116_alpha > 0.0) {
        let unknown_116_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_116_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_116_color = select(unknown_116_base, unknown_116_base + vec4f(0.08), unknown_116_hover);
        color = mix(color, unknown_116_color, unknown_116_alpha);
    }

    // unknown widget at index 117
    let unknown_117_center = vec2f(0.526855, 0.826823);
    let unknown_117_half = vec2f(0.190918, 0.278646);
    let unknown_117_uv = uv - unknown_117_center;
    let unknown_117_d = sdBox(unknown_117_uv, unknown_117_half);
    let unknown_117_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_117_d);
    if (unknown_117_alpha > 0.0) {
        let unknown_117_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_117_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_117_color = select(unknown_117_base, unknown_117_base + vec4f(0.08), unknown_117_hover);
        color = mix(color, unknown_117_color, unknown_117_alpha);
    }

    // unknown widget at index 118
    let unknown_118_center = vec2f(0.617676, 0.822917);
    let unknown_118_half = vec2f(0.226074, 0.278646);
    let unknown_118_uv = uv - unknown_118_center;
    let unknown_118_d = sdBox(unknown_118_uv, unknown_118_half);
    let unknown_118_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_118_d);
    if (unknown_118_alpha > 0.0) {
        let unknown_118_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_118_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_118_color = select(unknown_118_base, unknown_118_base + vec4f(0.08), unknown_118_hover);
        color = mix(color, unknown_118_color, unknown_118_alpha);
    }

    // unknown widget at index 119
    let unknown_119_center = vec2f(0.114746, 0.854167);
    let unknown_119_half = vec2f(0.050293, 0.289062);
    let unknown_119_uv = uv - unknown_119_center;
    let unknown_119_d = sdBox(unknown_119_uv, unknown_119_half);
    let unknown_119_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_119_d);
    if (unknown_119_alpha > 0.0) {
        let unknown_119_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_119_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_119_color = select(unknown_119_base, unknown_119_base + vec4f(0.08), unknown_119_hover);
        color = mix(color, unknown_119_color, unknown_119_alpha);
    }

    // unknown widget at index 120
    let unknown_120_center = vec2f(0.171387, 0.854167);
    let unknown_120_half = vec2f(0.062012, 0.289062);
    let unknown_120_uv = uv - unknown_120_center;
    let unknown_120_d = sdBox(unknown_120_uv, unknown_120_half);
    let unknown_120_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_120_d);
    if (unknown_120_alpha > 0.0) {
        let unknown_120_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_120_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_120_color = select(unknown_120_base, unknown_120_base + vec4f(0.08), unknown_120_hover);
        color = mix(color, unknown_120_color, unknown_120_alpha);
    }

    // unknown widget at index 121
    let unknown_121_center = vec2f(0.234863, 0.854167);
    let unknown_121_half = vec2f(0.101074, 0.289062);
    let unknown_121_uv = uv - unknown_121_center;
    let unknown_121_d = sdBox(unknown_121_uv, unknown_121_half);
    let unknown_121_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_121_d);
    if (unknown_121_alpha > 0.0) {
        let unknown_121_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_121_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_121_color = select(unknown_121_base, unknown_121_base + vec4f(0.08), unknown_121_hover);
        color = mix(color, unknown_121_color, unknown_121_alpha);
    }

    // unknown widget at index 122
    let unknown_122_center = vec2f(0.347168, 0.854167);
    let unknown_122_half = vec2f(0.136230, 0.289062);
    let unknown_122_uv = uv - unknown_122_center;
    let unknown_122_d = sdBox(unknown_122_uv, unknown_122_half);
    let unknown_122_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_122_d);
    if (unknown_122_alpha > 0.0) {
        let unknown_122_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_122_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_122_color = select(unknown_122_base, unknown_122_base + vec4f(0.08), unknown_122_hover);
        color = mix(color, unknown_122_color, unknown_122_alpha);
    }

    // unknown widget at index 123
    let unknown_123_center = vec2f(0.437988, 0.854167);
    let unknown_123_half = vec2f(0.155762, 0.289062);
    let unknown_123_uv = uv - unknown_123_center;
    let unknown_123_d = sdBox(unknown_123_uv, unknown_123_half);
    let unknown_123_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_123_d);
    if (unknown_123_alpha > 0.0) {
        let unknown_123_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_123_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_123_color = select(unknown_123_base, unknown_123_base + vec4f(0.08), unknown_123_hover);
        color = mix(color, unknown_123_color, unknown_123_alpha);
    }

    // unknown widget at index 124
    let unknown_124_center = vec2f(0.515137, 0.854818);
    let unknown_124_half = vec2f(0.193848, 0.289714);
    let unknown_124_uv = uv - unknown_124_center;
    let unknown_124_d = sdBox(unknown_124_uv, unknown_124_half);
    let unknown_124_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_124_d);
    if (unknown_124_alpha > 0.0) {
        let unknown_124_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_124_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_124_color = select(unknown_124_base, unknown_124_base + vec4f(0.08), unknown_124_hover);
        color = mix(color, unknown_124_color, unknown_124_alpha);
    }

    // unknown widget at index 125
    let unknown_125_center = vec2f(0.618652, 0.854167);
    let unknown_125_half = vec2f(0.218262, 0.289062);
    let unknown_125_uv = uv - unknown_125_center;
    let unknown_125_d = sdBox(unknown_125_uv, unknown_125_half);
    let unknown_125_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_125_d);
    if (unknown_125_alpha > 0.0) {
        let unknown_125_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_125_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_125_color = select(unknown_125_base, unknown_125_base + vec4f(0.08), unknown_125_hover);
        color = mix(color, unknown_125_color, unknown_125_alpha);
    }

    // unknown widget at index 126
    let unknown_126_center = vec2f(0.683105, 0.854167);
    let unknown_126_half = vec2f(0.237793, 0.289062);
    let unknown_126_uv = uv - unknown_126_center;
    let unknown_126_d = sdBox(unknown_126_uv, unknown_126_half);
    let unknown_126_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_126_d);
    if (unknown_126_alpha > 0.0) {
        let unknown_126_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_126_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_126_color = select(unknown_126_base, unknown_126_base + vec4f(0.08), unknown_126_hover);
        color = mix(color, unknown_126_color, unknown_126_alpha);
    }

    // unknown widget at index 127
    let unknown_127_center = vec2f(0.745605, 0.854167);
    let unknown_127_half = vec2f(0.261230, 0.289062);
    let unknown_127_uv = uv - unknown_127_center;
    let unknown_127_d = sdBox(unknown_127_uv, unknown_127_half);
    let unknown_127_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_127_d);
    if (unknown_127_alpha > 0.0) {
        let unknown_127_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_127_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_127_color = select(unknown_127_base, unknown_127_base + vec4f(0.08), unknown_127_hover);
        color = mix(color, unknown_127_color, unknown_127_alpha);
    }

    // unknown widget at index 128
    let unknown_128_center = vec2f(0.062012, 0.887370);
    let unknown_128_half = vec2f(0.038574, 0.301432);
    let unknown_128_uv = uv - unknown_128_center;
    let unknown_128_d = sdBox(unknown_128_uv, unknown_128_half);
    let unknown_128_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_128_d);
    if (unknown_128_alpha > 0.0) {
        let unknown_128_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_128_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_128_color = select(unknown_128_base, unknown_128_base + vec4f(0.08), unknown_128_hover);
        color = mix(color, unknown_128_color, unknown_128_alpha);
    }

    // unknown widget at index 129
    let unknown_129_center = vec2f(0.151855, 0.885417);
    let unknown_129_half = vec2f(0.065918, 0.299479);
    let unknown_129_uv = uv - unknown_129_center;
    let unknown_129_d = sdBox(unknown_129_uv, unknown_129_half);
    let unknown_129_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_129_d);
    if (unknown_129_alpha > 0.0) {
        let unknown_129_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_129_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_129_color = select(unknown_129_base, unknown_129_base + vec4f(0.08), unknown_129_hover);
        color = mix(color, unknown_129_color, unknown_129_alpha);
    }

    // unknown widget at index 130
    let unknown_130_center = vec2f(0.233887, 0.885417);
    let unknown_130_half = vec2f(0.093262, 0.299479);
    let unknown_130_uv = uv - unknown_130_center;
    let unknown_130_d = sdBox(unknown_130_uv, unknown_130_half);
    let unknown_130_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_130_d);
    if (unknown_130_alpha > 0.0) {
        let unknown_130_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_130_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_130_color = select(unknown_130_base, unknown_130_base + vec4f(0.08), unknown_130_hover);
        color = mix(color, unknown_130_color, unknown_130_alpha);
    }

    // unknown widget at index 131
    let unknown_131_center = vec2f(0.327637, 0.887370);
    let unknown_131_half = vec2f(0.132324, 0.301432);
    let unknown_131_uv = uv - unknown_131_center;
    let unknown_131_d = sdBox(unknown_131_uv, unknown_131_half);
    let unknown_131_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_131_d);
    if (unknown_131_alpha > 0.0) {
        let unknown_131_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_131_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_131_color = select(unknown_131_base, unknown_131_base + vec4f(0.08), unknown_131_hover);
        color = mix(color, unknown_131_color, unknown_131_alpha);
    }

    // unknown widget at index 132
    let unknown_132_center = vec2f(0.423340, 0.895833);
    let unknown_132_half = vec2f(0.146973, 0.299479);
    let unknown_132_uv = uv - unknown_132_center;
    let unknown_132_d = sdBox(unknown_132_uv, unknown_132_half);
    let unknown_132_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_132_d);
    if (unknown_132_alpha > 0.0) {
        let unknown_132_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_132_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_132_color = select(unknown_132_base, unknown_132_base + vec4f(0.08), unknown_132_hover);
        color = mix(color, unknown_132_color, unknown_132_alpha);
    }

    // unknown widget at index 133
    let unknown_133_center = vec2f(0.062012, 0.918620);
    let unknown_133_half = vec2f(0.038574, 0.311849);
    let unknown_133_uv = uv - unknown_133_center;
    let unknown_133_d = sdBox(unknown_133_uv, unknown_133_half);
    let unknown_133_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_133_d);
    if (unknown_133_alpha > 0.0) {
        let unknown_133_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_133_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_133_color = select(unknown_133_base, unknown_133_base + vec4f(0.08), unknown_133_hover);
        color = mix(color, unknown_133_color, unknown_133_alpha);
    }

    // unknown widget at index 134
    let unknown_134_center = vec2f(0.140137, 0.916667);
    let unknown_134_half = vec2f(0.054199, 0.309896);
    let unknown_134_uv = uv - unknown_134_center;
    let unknown_134_d = sdBox(unknown_134_uv, unknown_134_half);
    let unknown_134_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_134_d);
    if (unknown_134_alpha > 0.0) {
        let unknown_134_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_134_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_134_color = select(unknown_134_base, unknown_134_base + vec4f(0.08), unknown_134_hover);
        color = mix(color, unknown_134_color, unknown_134_alpha);
    }

    // unknown widget at index 135
    let unknown_135_center = vec2f(0.190918, 0.916667);
    let unknown_135_half = vec2f(0.073730, 0.309896);
    let unknown_135_uv = uv - unknown_135_center;
    let unknown_135_d = sdBox(unknown_135_uv, unknown_135_half);
    let unknown_135_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_135_d);
    if (unknown_135_alpha > 0.0) {
        let unknown_135_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_135_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_135_color = select(unknown_135_base, unknown_135_base + vec4f(0.08), unknown_135_hover);
        color = mix(color, unknown_135_color, unknown_135_alpha);
    }

    // unknown widget at index 136
    let unknown_136_center = vec2f(0.261230, 0.916667);
    let unknown_136_half = vec2f(0.104980, 0.309896);
    let unknown_136_uv = uv - unknown_136_center;
    let unknown_136_d = sdBox(unknown_136_uv, unknown_136_half);
    let unknown_136_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_136_d);
    if (unknown_136_alpha > 0.0) {
        let unknown_136_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_136_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_136_color = select(unknown_136_base, unknown_136_base + vec4f(0.08), unknown_136_hover);
        color = mix(color, unknown_136_color, unknown_136_alpha);
    }

    // unknown widget at index 137
    let unknown_137_center = vec2f(0.362793, 0.918620);
    let unknown_137_half = vec2f(0.144043, 0.311849);
    let unknown_137_uv = uv - unknown_137_center;
    let unknown_137_d = sdBox(unknown_137_uv, unknown_137_half);
    let unknown_137_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_137_d);
    if (unknown_137_alpha > 0.0) {
        let unknown_137_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_137_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_137_color = select(unknown_137_base, unknown_137_base + vec4f(0.08), unknown_137_hover);
        color = mix(color, unknown_137_color, unknown_137_alpha);
    }

    // unknown widget at index 138
    let unknown_138_center = vec2f(0.058105, 0.949870);
    let unknown_138_half = vec2f(0.034668, 0.322266);
    let unknown_138_uv = uv - unknown_138_center;
    let unknown_138_d = sdBox(unknown_138_uv, unknown_138_half);
    let unknown_138_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_138_d);
    if (unknown_138_alpha > 0.0) {
        let unknown_138_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_138_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_138_color = select(unknown_138_base, unknown_138_base + vec4f(0.08), unknown_138_hover);
        color = mix(color, unknown_138_color, unknown_138_alpha);
    }

    // unknown widget at index 139
    let unknown_139_center = vec2f(0.128418, 0.947917);
    let unknown_139_half = vec2f(0.050293, 0.320312);
    let unknown_139_uv = uv - unknown_139_center;
    let unknown_139_d = sdBox(unknown_139_uv, unknown_139_half);
    let unknown_139_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_139_d);
    if (unknown_139_alpha > 0.0) {
        let unknown_139_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_139_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_139_color = select(unknown_139_base, unknown_139_base + vec4f(0.08), unknown_139_hover);
        color = mix(color, unknown_139_color, unknown_139_alpha);
    }

    // unknown widget at index 140
    let unknown_140_center = vec2f(0.179199, 0.947917);
    let unknown_140_half = vec2f(0.069824, 0.320312);
    let unknown_140_uv = uv - unknown_140_center;
    let unknown_140_d = sdBox(unknown_140_uv, unknown_140_half);
    let unknown_140_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_140_d);
    if (unknown_140_alpha > 0.0) {
        let unknown_140_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_140_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_140_color = select(unknown_140_base, unknown_140_base + vec4f(0.08), unknown_140_hover);
        color = mix(color, unknown_140_color, unknown_140_alpha);
    }

    // unknown widget at index 141
    let unknown_141_center = vec2f(0.229980, 0.947917);
    let unknown_141_half = vec2f(0.081543, 0.320312);
    let unknown_141_uv = uv - unknown_141_center;
    let unknown_141_d = sdBox(unknown_141_uv, unknown_141_half);
    let unknown_141_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_141_d);
    if (unknown_141_alpha > 0.0) {
        let unknown_141_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_141_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_141_color = select(unknown_141_base, unknown_141_base + vec4f(0.08), unknown_141_hover);
        color = mix(color, unknown_141_color, unknown_141_alpha);
    }

    // unknown widget at index 142
    let unknown_142_center = vec2f(0.312012, 0.947917);
    let unknown_142_half = vec2f(0.140137, 0.320312);
    let unknown_142_uv = uv - unknown_142_center;
    let unknown_142_d = sdBox(unknown_142_uv, unknown_142_half);
    let unknown_142_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_142_d);
    if (unknown_142_alpha > 0.0) {
        let unknown_142_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_142_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_142_color = select(unknown_142_base, unknown_142_base + vec4f(0.08), unknown_142_hover);
        color = mix(color, unknown_142_color, unknown_142_alpha);
    }

    // unknown widget at index 143
    let unknown_143_center = vec2f(0.448730, 0.947917);
    let unknown_143_half = vec2f(0.159668, 0.320312);
    let unknown_143_uv = uv - unknown_143_center;
    let unknown_143_d = sdBox(unknown_143_uv, unknown_143_half);
    let unknown_143_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_143_d);
    if (unknown_143_alpha > 0.0) {
        let unknown_143_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_143_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_143_color = select(unknown_143_base, unknown_143_base + vec4f(0.08), unknown_143_hover);
        color = mix(color, unknown_143_color, unknown_143_alpha);
    }

    // unknown widget at index 144
    let unknown_144_center = vec2f(0.504395, 0.947917);
    let unknown_144_half = vec2f(0.175293, 0.320312);
    let unknown_144_uv = uv - unknown_144_center;
    let unknown_144_d = sdBox(unknown_144_uv, unknown_144_half);
    let unknown_144_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_144_d);
    if (unknown_144_alpha > 0.0) {
        let unknown_144_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_144_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_144_color = select(unknown_144_base, unknown_144_base + vec4f(0.08), unknown_144_hover);
        color = mix(color, unknown_144_color, unknown_144_alpha);
    }

    // button widget at index 145
    let button_145_center = vec2f(0.554199, 0.947917);
    let button_145_half = vec2f(0.194824, 0.320312);
    let button_145_uv = uv - button_145_center;
    let button_145_d = sdBox(button_145_uv, button_145_half);
    let button_145_alpha = 1.0 - smoothstep(0.0, 0.003, button_145_d);
    if (button_145_alpha > 0.0) {
        let button_145_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let button_145_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var button_145_color = select(button_145_base, button_145_base + vec4f(0.08), button_145_hover);
        color = mix(color, button_145_color, button_145_alpha);
    }

    // unknown widget at index 146
    let unknown_146_center = vec2f(0.612793, 0.947917);
    let unknown_146_half = vec2f(0.214355, 0.320312);
    let unknown_146_uv = uv - unknown_146_center;
    let unknown_146_d = sdBox(unknown_146_uv, unknown_146_half);
    let unknown_146_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_146_d);
    if (unknown_146_alpha > 0.0) {
        let unknown_146_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_146_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_146_color = select(unknown_146_base, unknown_146_base + vec4f(0.08), unknown_146_hover);
        color = mix(color, unknown_146_color, unknown_146_alpha);
    }

    // unknown widget at index 147
    let unknown_147_center = vec2f(0.065918, 0.981120);
    let unknown_147_half = vec2f(0.042480, 0.332682);
    let unknown_147_uv = uv - unknown_147_center;
    let unknown_147_d = sdBox(unknown_147_uv, unknown_147_half);
    let unknown_147_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_147_d);
    if (unknown_147_alpha > 0.0) {
        let unknown_147_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_147_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_147_color = select(unknown_147_base, unknown_147_base + vec4f(0.08), unknown_147_hover);
        color = mix(color, unknown_147_color, unknown_147_alpha);
    }

    // unknown widget at index 148
    let unknown_148_center = vec2f(0.167480, 0.981120);
    let unknown_148_half = vec2f(0.073730, 0.332682);
    let unknown_148_uv = uv - unknown_148_center;
    let unknown_148_d = sdBox(unknown_148_uv, unknown_148_half);
    let unknown_148_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_148_d);
    if (unknown_148_alpha > 0.0) {
        let unknown_148_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_148_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_148_color = select(unknown_148_base, unknown_148_base + vec4f(0.08), unknown_148_hover);
        color = mix(color, unknown_148_color, unknown_148_alpha);
    }

    // unknown widget at index 149
    let unknown_149_center = vec2f(0.257324, 0.981120);
    let unknown_149_half = vec2f(0.101074, 0.332682);
    let unknown_149_uv = uv - unknown_149_center;
    let unknown_149_d = sdBox(unknown_149_uv, unknown_149_half);
    let unknown_149_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_149_d);
    if (unknown_149_alpha > 0.0) {
        let unknown_149_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_149_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_149_color = select(unknown_149_base, unknown_149_base + vec4f(0.08), unknown_149_hover);
        color = mix(color, unknown_149_color, unknown_149_alpha);
    }

    // unknown widget at index 150
    let unknown_150_center = vec2f(0.329590, 0.989583);
    let unknown_150_half = vec2f(0.115723, 0.330729);
    let unknown_150_uv = uv - unknown_150_center;
    let unknown_150_d = sdBox(unknown_150_uv, unknown_150_half);
    let unknown_150_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_150_d);
    if (unknown_150_alpha > 0.0) {
        let unknown_150_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_150_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_150_color = select(unknown_150_base, unknown_150_base + vec4f(0.08), unknown_150_hover);
        color = mix(color, unknown_150_color, unknown_150_alpha);
    }

    // unknown widget at index 151
    let unknown_151_center = vec2f(0.065918, 1.012370);
    let unknown_151_half = vec2f(0.042480, 0.343099);
    let unknown_151_uv = uv - unknown_151_center;
    let unknown_151_d = sdBox(unknown_151_uv, unknown_151_half);
    let unknown_151_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_151_d);
    if (unknown_151_alpha > 0.0) {
        let unknown_151_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_151_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_151_color = select(unknown_151_base, unknown_151_base + vec4f(0.08), unknown_151_hover);
        color = mix(color, unknown_151_color, unknown_151_alpha);
    }

    // unknown widget at index 152
    let unknown_152_center = vec2f(0.167480, 1.012370);
    let unknown_152_half = vec2f(0.073730, 0.343099);
    let unknown_152_uv = uv - unknown_152_center;
    let unknown_152_d = sdBox(unknown_152_uv, unknown_152_half);
    let unknown_152_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_152_d);
    if (unknown_152_alpha > 0.0) {
        let unknown_152_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_152_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_152_color = select(unknown_152_base, unknown_152_base + vec4f(0.08), unknown_152_hover);
        color = mix(color, unknown_152_color, unknown_152_alpha);
    }

    // unknown widget at index 153
    let unknown_153_center = vec2f(0.253418, 1.012370);
    let unknown_153_half = vec2f(0.097168, 0.343099);
    let unknown_153_uv = uv - unknown_153_center;
    let unknown_153_d = sdBox(unknown_153_uv, unknown_153_half);
    let unknown_153_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_153_d);
    if (unknown_153_alpha > 0.0) {
        let unknown_153_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_153_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_153_color = select(unknown_153_base, unknown_153_base + vec4f(0.08), unknown_153_hover);
        color = mix(color, unknown_153_color, unknown_153_alpha);
    }

    // unknown widget at index 154
    let unknown_154_center = vec2f(0.065918, 1.043620);
    let unknown_154_half = vec2f(0.042480, 0.353516);
    let unknown_154_uv = uv - unknown_154_center;
    let unknown_154_d = sdBox(unknown_154_uv, unknown_154_half);
    let unknown_154_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_154_d);
    if (unknown_154_alpha > 0.0) {
        let unknown_154_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_154_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_154_color = select(unknown_154_base, unknown_154_base + vec4f(0.08), unknown_154_hover);
        color = mix(color, unknown_154_color, unknown_154_alpha);
    }

    // unknown widget at index 155
    let unknown_155_center = vec2f(0.167480, 1.043620);
    let unknown_155_half = vec2f(0.073730, 0.353516);
    let unknown_155_uv = uv - unknown_155_center;
    let unknown_155_d = sdBox(unknown_155_uv, unknown_155_half);
    let unknown_155_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_155_d);
    if (unknown_155_alpha > 0.0) {
        let unknown_155_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_155_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_155_color = select(unknown_155_base, unknown_155_base + vec4f(0.08), unknown_155_hover);
        color = mix(color, unknown_155_color, unknown_155_alpha);
    }

    // unknown widget at index 156
    let unknown_156_center = vec2f(0.253418, 1.041667);
    let unknown_156_half = vec2f(0.097168, 0.351562);
    let unknown_156_uv = uv - unknown_156_center;
    let unknown_156_d = sdBox(unknown_156_uv, unknown_156_half);
    let unknown_156_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_156_d);
    if (unknown_156_alpha > 0.0) {
        let unknown_156_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_156_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_156_color = select(unknown_156_base, unknown_156_base + vec4f(0.08), unknown_156_hover);
        color = mix(color, unknown_156_color, unknown_156_alpha);
    }

    // unknown widget at index 157
    let unknown_157_center = vec2f(0.065918, 1.074870);
    let unknown_157_half = vec2f(0.042480, 0.363932);
    let unknown_157_uv = uv - unknown_157_center;
    let unknown_157_d = sdBox(unknown_157_uv, unknown_157_half);
    let unknown_157_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_157_d);
    if (unknown_157_alpha > 0.0) {
        let unknown_157_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_157_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_157_color = select(unknown_157_base, unknown_157_base + vec4f(0.08), unknown_157_hover);
        color = mix(color, unknown_157_color, unknown_157_alpha);
    }

    // unknown widget at index 158
    let unknown_158_center = vec2f(0.155762, 1.072917);
    let unknown_158_half = vec2f(0.062012, 0.361979);
    let unknown_158_uv = uv - unknown_158_center;
    let unknown_158_d = sdBox(unknown_158_uv, unknown_158_half);
    let unknown_158_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_158_d);
    if (unknown_158_alpha > 0.0) {
        let unknown_158_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_158_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_158_color = select(unknown_158_base, unknown_158_base + vec4f(0.08), unknown_158_hover);
        color = mix(color, unknown_158_color, unknown_158_alpha);
    }

    // unknown widget at index 159
    let unknown_159_center = vec2f(0.212402, 1.083333);
    let unknown_159_half = vec2f(0.076660, 0.361979);
    let unknown_159_uv = uv - unknown_159_center;
    let unknown_159_d = sdBox(unknown_159_uv, unknown_159_half);
    let unknown_159_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_159_d);
    if (unknown_159_alpha > 0.0) {
        let unknown_159_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_159_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_159_color = select(unknown_159_base, unknown_159_base + vec4f(0.08), unknown_159_hover);
        color = mix(color, unknown_159_color, unknown_159_alpha);
    }

    // unknown widget at index 160
    let unknown_160_center = vec2f(0.026855, 1.135417);
    let unknown_160_half = vec2f(0.026855, 0.382812);
    let unknown_160_uv = uv - unknown_160_center;
    let unknown_160_d = sdBox(unknown_160_uv, unknown_160_half);
    let unknown_160_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_160_d);
    if (unknown_160_alpha > 0.0) {
        let unknown_160_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_160_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_160_color = select(unknown_160_base, unknown_160_base + vec4f(0.08), unknown_160_hover);
        color = mix(color, unknown_160_color, unknown_160_alpha);
    }

    // unknown widget at index 161
    let unknown_161_center = vec2f(0.101074, 1.135417);
    let unknown_161_half = vec2f(0.038574, 0.382812);
    let unknown_161_uv = uv - unknown_161_center;
    let unknown_161_d = sdBox(unknown_161_uv, unknown_161_half);
    let unknown_161_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_161_d);
    if (unknown_161_alpha > 0.0) {
        let unknown_161_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_161_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_161_color = select(unknown_161_base, unknown_161_base + vec4f(0.08), unknown_161_hover);
        color = mix(color, unknown_161_color, unknown_161_alpha);
    }

    // unknown widget at index 162
    let unknown_162_center = vec2f(0.151855, 1.137370);
    let unknown_162_half = vec2f(0.065918, 0.384766);
    let unknown_162_uv = uv - unknown_162_center;
    let unknown_162_d = sdBox(unknown_162_uv, unknown_162_half);
    let unknown_162_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_162_d);
    if (unknown_162_alpha > 0.0) {
        let unknown_162_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_162_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_162_color = select(unknown_162_base, unknown_162_base + vec4f(0.08), unknown_162_hover);
        color = mix(color, unknown_162_color, unknown_162_alpha);
    }

    // unknown widget at index 163
    let unknown_163_center = vec2f(0.229980, 1.135417);
    let unknown_163_half = vec2f(0.089355, 0.382812);
    let unknown_163_uv = uv - unknown_163_center;
    let unknown_163_d = sdBox(unknown_163_uv, unknown_163_half);
    let unknown_163_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_163_d);
    if (unknown_163_alpha > 0.0) {
        let unknown_163_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_163_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_163_color = select(unknown_163_base, unknown_163_base + vec4f(0.08), unknown_163_hover);
        color = mix(color, unknown_163_color, unknown_163_alpha);
    }

    // unknown widget at index 164
    let unknown_164_center = vec2f(0.296387, 1.135417);
    let unknown_164_half = vec2f(0.108887, 0.382812);
    let unknown_164_uv = uv - unknown_164_center;
    let unknown_164_d = sdBox(unknown_164_uv, unknown_164_half);
    let unknown_164_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_164_d);
    if (unknown_164_alpha > 0.0) {
        let unknown_164_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_164_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_164_color = select(unknown_164_base, unknown_164_base + vec4f(0.08), unknown_164_hover);
        color = mix(color, unknown_164_color, unknown_164_alpha);
    }

    // unknown widget at index 165
    let unknown_165_center = vec2f(0.022461, 1.166667);
    let unknown_165_half = vec2f(0.022461, 0.393229);
    let unknown_165_uv = uv - unknown_165_center;
    let unknown_165_d = sdBox(unknown_165_uv, unknown_165_half);
    let unknown_165_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_165_d);
    if (unknown_165_alpha > 0.0) {
        let unknown_165_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_165_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_165_color = select(unknown_165_base, unknown_165_base + vec4f(0.08), unknown_165_hover);
        color = mix(color, unknown_165_color, unknown_165_alpha);
    }

    // unknown widget at index 166
    let unknown_166_center = vec2f(0.136230, 1.166667);
    let unknown_166_half = vec2f(0.081543, 0.393229);
    let unknown_166_uv = uv - unknown_166_center;
    let unknown_166_d = sdBox(unknown_166_uv, unknown_166_half);
    let unknown_166_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_166_d);
    if (unknown_166_alpha > 0.0) {
        let unknown_166_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_166_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_166_color = select(unknown_166_base, unknown_166_base + vec4f(0.08), unknown_166_hover);
        color = mix(color, unknown_166_color, unknown_166_alpha);
    }

    // unknown widget at index 167
    let unknown_167_center = vec2f(0.265137, 1.170573);
    let unknown_167_half = vec2f(0.093262, 0.393229);
    let unknown_167_uv = uv - unknown_167_center;
    let unknown_167_d = sdBox(unknown_167_uv, unknown_167_half);
    let unknown_167_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_167_d);
    if (unknown_167_alpha > 0.0) {
        let unknown_167_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_167_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_167_color = select(unknown_167_base, unknown_167_base + vec4f(0.08), unknown_167_hover);
        color = mix(color, unknown_167_color, unknown_167_alpha);
    }

    // unknown widget at index 168
    let unknown_168_center = vec2f(0.300293, 1.170573);
    let unknown_168_half = vec2f(0.104980, 0.393229);
    let unknown_168_uv = uv - unknown_168_center;
    let unknown_168_d = sdBox(unknown_168_uv, unknown_168_half);
    let unknown_168_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_168_d);
    if (unknown_168_alpha > 0.0) {
        let unknown_168_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_168_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_168_color = select(unknown_168_base, unknown_168_base + vec4f(0.08), unknown_168_hover);
        color = mix(color, unknown_168_color, unknown_168_alpha);
    }

    // unknown widget at index 169
    let unknown_169_center = vec2f(0.351074, 1.167969);
    let unknown_169_half = vec2f(0.132324, 0.394531);
    let unknown_169_uv = uv - unknown_169_center;
    let unknown_169_d = sdBox(unknown_169_uv, unknown_169_half);
    let unknown_169_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_169_d);
    if (unknown_169_alpha > 0.0) {
        let unknown_169_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_169_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_169_color = select(unknown_169_base, unknown_169_base + vec4f(0.08), unknown_169_hover);
        color = mix(color, unknown_169_color, unknown_169_alpha);
    }

    // unknown widget at index 170
    let unknown_170_center = vec2f(0.454102, 1.168620);
    let unknown_170_half = vec2f(0.178711, 0.395182);
    let unknown_170_uv = uv - unknown_170_center;
    let unknown_170_d = sdBox(unknown_170_uv, unknown_170_half);
    let unknown_170_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_170_d);
    if (unknown_170_alpha > 0.0) {
        let unknown_170_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_170_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_170_color = select(unknown_170_base, unknown_170_base + vec4f(0.08), unknown_170_hover);
        color = mix(color, unknown_170_color, unknown_170_alpha);
    }

    // unknown widget at index 171
    let unknown_171_center = vec2f(0.038574, 1.229167);
    let unknown_171_half = vec2f(0.038574, 0.414062);
    let unknown_171_uv = uv - unknown_171_center;
    let unknown_171_d = sdBox(unknown_171_uv, unknown_171_half);
    let unknown_171_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_171_d);
    if (unknown_171_alpha > 0.0) {
        let unknown_171_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_171_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_171_color = select(unknown_171_base, unknown_171_base + vec4f(0.08), unknown_171_hover);
        color = mix(color, unknown_171_color, unknown_171_alpha);
    }

    // label widget at index 172
    let label_172_center = vec2f(0.152832, 1.231120);
    let label_172_half = vec2f(0.064941, 0.416016);
    let label_172_uv = uv - label_172_center;
    let label_172_d = sdBox(label_172_uv, label_172_half);
    let label_172_alpha = 1.0 - smoothstep(0.0, 0.003, label_172_d);
    if (label_172_alpha > 0.0) {
        let label_172_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let label_172_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var label_172_color = select(label_172_base, label_172_base + vec4f(0.08), label_172_hover);
        color = mix(color, label_172_color, label_172_alpha);
    }

    // unknown widget at index 173
    let unknown_173_center = vec2f(0.026855, 1.260417);
    let unknown_173_half = vec2f(0.026855, 0.424479);
    let unknown_173_uv = uv - unknown_173_center;
    let unknown_173_d = sdBox(unknown_173_uv, unknown_173_half);
    let unknown_173_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_173_d);
    if (unknown_173_alpha > 0.0) {
        let unknown_173_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_173_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_173_color = select(unknown_173_base, unknown_173_base + vec4f(0.08), unknown_173_hover);
        color = mix(color, unknown_173_color, unknown_173_alpha);
    }

    // unknown widget at index 174
    let unknown_174_center = vec2f(0.101074, 1.260417);
    let unknown_174_half = vec2f(0.038574, 0.424479);
    let unknown_174_uv = uv - unknown_174_center;
    let unknown_174_d = sdBox(unknown_174_uv, unknown_174_half);
    let unknown_174_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_174_d);
    if (unknown_174_alpha > 0.0) {
        let unknown_174_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_174_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_174_color = select(unknown_174_base, unknown_174_base + vec4f(0.08), unknown_174_hover);
        color = mix(color, unknown_174_color, unknown_174_alpha);
    }

    // unknown widget at index 175
    let unknown_175_center = vec2f(0.151855, 1.262370);
    let unknown_175_half = vec2f(0.065918, 0.426432);
    let unknown_175_uv = uv - unknown_175_center;
    let unknown_175_d = sdBox(unknown_175_uv, unknown_175_half);
    let unknown_175_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_175_d);
    if (unknown_175_alpha > 0.0) {
        let unknown_175_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_175_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_175_color = select(unknown_175_base, unknown_175_base + vec4f(0.08), unknown_175_hover);
        color = mix(color, unknown_175_color, unknown_175_alpha);
    }

    // unknown widget at index 176
    let unknown_176_center = vec2f(0.229980, 1.260417);
    let unknown_176_half = vec2f(0.089355, 0.424479);
    let unknown_176_uv = uv - unknown_176_center;
    let unknown_176_d = sdBox(unknown_176_uv, unknown_176_half);
    let unknown_176_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_176_d);
    if (unknown_176_alpha > 0.0) {
        let unknown_176_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_176_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_176_color = select(unknown_176_base, unknown_176_base + vec4f(0.08), unknown_176_hover);
        color = mix(color, unknown_176_color, unknown_176_alpha);
    }

    // unknown widget at index 177
    let unknown_177_center = vec2f(0.296387, 1.260417);
    let unknown_177_half = vec2f(0.108887, 0.424479);
    let unknown_177_uv = uv - unknown_177_center;
    let unknown_177_d = sdBox(unknown_177_uv, unknown_177_half);
    let unknown_177_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_177_d);
    if (unknown_177_alpha > 0.0) {
        let unknown_177_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_177_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_177_color = select(unknown_177_base, unknown_177_base + vec4f(0.08), unknown_177_hover);
        color = mix(color, unknown_177_color, unknown_177_alpha);
    }

    // unknown widget at index 178
    let unknown_178_center = vec2f(0.022461, 1.291667);
    let unknown_178_half = vec2f(0.022461, 0.434896);
    let unknown_178_uv = uv - unknown_178_center;
    let unknown_178_d = sdBox(unknown_178_uv, unknown_178_half);
    let unknown_178_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_178_d);
    if (unknown_178_alpha > 0.0) {
        let unknown_178_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_178_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_178_color = select(unknown_178_base, unknown_178_base + vec4f(0.08), unknown_178_hover);
        color = mix(color, unknown_178_color, unknown_178_alpha);
    }

    // unknown widget at index 179
    let unknown_179_center = vec2f(0.136230, 1.291667);
    let unknown_179_half = vec2f(0.081543, 0.434896);
    let unknown_179_uv = uv - unknown_179_center;
    let unknown_179_d = sdBox(unknown_179_uv, unknown_179_half);
    let unknown_179_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_179_d);
    if (unknown_179_alpha > 0.0) {
        let unknown_179_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_179_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_179_color = select(unknown_179_base, unknown_179_base + vec4f(0.08), unknown_179_hover);
        color = mix(color, unknown_179_color, unknown_179_alpha);
    }

    // unknown widget at index 180
    let unknown_180_center = vec2f(0.265137, 1.295573);
    let unknown_180_half = vec2f(0.093262, 0.434896);
    let unknown_180_uv = uv - unknown_180_center;
    let unknown_180_d = sdBox(unknown_180_uv, unknown_180_half);
    let unknown_180_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_180_d);
    if (unknown_180_alpha > 0.0) {
        let unknown_180_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_180_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_180_color = select(unknown_180_base, unknown_180_base + vec4f(0.08), unknown_180_hover);
        color = mix(color, unknown_180_color, unknown_180_alpha);
    }

    // unknown widget at index 181
    let unknown_181_center = vec2f(0.300293, 1.295573);
    let unknown_181_half = vec2f(0.104980, 0.434896);
    let unknown_181_uv = uv - unknown_181_center;
    let unknown_181_d = sdBox(unknown_181_uv, unknown_181_half);
    let unknown_181_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_181_d);
    if (unknown_181_alpha > 0.0) {
        let unknown_181_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_181_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_181_color = select(unknown_181_base, unknown_181_base + vec4f(0.08), unknown_181_hover);
        color = mix(color, unknown_181_color, unknown_181_alpha);
    }

    // unknown widget at index 182
    let unknown_182_center = vec2f(0.351074, 1.292969);
    let unknown_182_half = vec2f(0.132324, 0.436198);
    let unknown_182_uv = uv - unknown_182_center;
    let unknown_182_d = sdBox(unknown_182_uv, unknown_182_half);
    let unknown_182_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_182_d);
    if (unknown_182_alpha > 0.0) {
        let unknown_182_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_182_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_182_color = select(unknown_182_base, unknown_182_base + vec4f(0.08), unknown_182_hover);
        color = mix(color, unknown_182_color, unknown_182_alpha);
    }

    // unknown widget at index 183
    let unknown_183_center = vec2f(0.454102, 1.293620);
    let unknown_183_half = vec2f(0.178711, 0.436849);
    let unknown_183_uv = uv - unknown_183_center;
    let unknown_183_d = sdBox(unknown_183_uv, unknown_183_half);
    let unknown_183_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_183_d);
    if (unknown_183_alpha > 0.0) {
        let unknown_183_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_183_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_183_color = select(unknown_183_base, unknown_183_base + vec4f(0.08), unknown_183_hover);
        color = mix(color, unknown_183_color, unknown_183_alpha);
    }

    // unknown widget at index 184
    let unknown_184_center = vec2f(0.038574, 1.354167);
    let unknown_184_half = vec2f(0.038574, 0.455729);
    let unknown_184_uv = uv - unknown_184_center;
    let unknown_184_d = sdBox(unknown_184_uv, unknown_184_half);
    let unknown_184_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_184_d);
    if (unknown_184_alpha > 0.0) {
        let unknown_184_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_184_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_184_color = select(unknown_184_base, unknown_184_base + vec4f(0.08), unknown_184_hover);
        color = mix(color, unknown_184_color, unknown_184_alpha);
    }

    // unknown widget at index 185
    let unknown_185_center = vec2f(0.149902, 1.356120);
    let unknown_185_half = vec2f(0.062012, 0.457682);
    let unknown_185_uv = uv - unknown_185_center;
    let unknown_185_d = sdBox(unknown_185_uv, unknown_185_half);
    let unknown_185_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_185_d);
    if (unknown_185_alpha > 0.0) {
        let unknown_185_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_185_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_185_color = select(unknown_185_base, unknown_185_base + vec4f(0.08), unknown_185_hover);
        color = mix(color, unknown_185_color, unknown_185_alpha);
    }

    // unknown widget at index 186
    let unknown_186_center = vec2f(0.026855, 1.385417);
    let unknown_186_half = vec2f(0.026855, 0.466146);
    let unknown_186_uv = uv - unknown_186_center;
    let unknown_186_d = sdBox(unknown_186_uv, unknown_186_half);
    let unknown_186_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_186_d);
    if (unknown_186_alpha > 0.0) {
        let unknown_186_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_186_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_186_color = select(unknown_186_base, unknown_186_base + vec4f(0.08), unknown_186_hover);
        color = mix(color, unknown_186_color, unknown_186_alpha);
    }

    // unknown widget at index 187
    let unknown_187_center = vec2f(0.101074, 1.385417);
    let unknown_187_half = vec2f(0.038574, 0.466146);
    let unknown_187_uv = uv - unknown_187_center;
    let unknown_187_d = sdBox(unknown_187_uv, unknown_187_half);
    let unknown_187_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_187_d);
    if (unknown_187_alpha > 0.0) {
        let unknown_187_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_187_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_187_color = select(unknown_187_base, unknown_187_base + vec4f(0.08), unknown_187_hover);
        color = mix(color, unknown_187_color, unknown_187_alpha);
    }

    // unknown widget at index 188
    let unknown_188_center = vec2f(0.151855, 1.387370);
    let unknown_188_half = vec2f(0.065918, 0.468099);
    let unknown_188_uv = uv - unknown_188_center;
    let unknown_188_d = sdBox(unknown_188_uv, unknown_188_half);
    let unknown_188_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_188_d);
    if (unknown_188_alpha > 0.0) {
        let unknown_188_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_188_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_188_color = select(unknown_188_base, unknown_188_base + vec4f(0.08), unknown_188_hover);
        color = mix(color, unknown_188_color, unknown_188_alpha);
    }

    // unknown widget at index 189
    let unknown_189_center = vec2f(0.229980, 1.385417);
    let unknown_189_half = vec2f(0.089355, 0.466146);
    let unknown_189_uv = uv - unknown_189_center;
    let unknown_189_d = sdBox(unknown_189_uv, unknown_189_half);
    let unknown_189_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_189_d);
    if (unknown_189_alpha > 0.0) {
        let unknown_189_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_189_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_189_color = select(unknown_189_base, unknown_189_base + vec4f(0.08), unknown_189_hover);
        color = mix(color, unknown_189_color, unknown_189_alpha);
    }

    // unknown widget at index 190
    let unknown_190_center = vec2f(0.296387, 1.385417);
    let unknown_190_half = vec2f(0.108887, 0.466146);
    let unknown_190_uv = uv - unknown_190_center;
    let unknown_190_d = sdBox(unknown_190_uv, unknown_190_half);
    let unknown_190_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_190_d);
    if (unknown_190_alpha > 0.0) {
        let unknown_190_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_190_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_190_color = select(unknown_190_base, unknown_190_base + vec4f(0.08), unknown_190_hover);
        color = mix(color, unknown_190_color, unknown_190_alpha);
    }

    // unknown widget at index 191
    let unknown_191_center = vec2f(0.022461, 1.416667);
    let unknown_191_half = vec2f(0.022461, 0.476562);
    let unknown_191_uv = uv - unknown_191_center;
    let unknown_191_d = sdBox(unknown_191_uv, unknown_191_half);
    let unknown_191_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_191_d);
    if (unknown_191_alpha > 0.0) {
        let unknown_191_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_191_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_191_color = select(unknown_191_base, unknown_191_base + vec4f(0.08), unknown_191_hover);
        color = mix(color, unknown_191_color, unknown_191_alpha);
    }

    // unknown widget at index 192
    let unknown_192_center = vec2f(0.136230, 1.416667);
    let unknown_192_half = vec2f(0.081543, 0.476562);
    let unknown_192_uv = uv - unknown_192_center;
    let unknown_192_d = sdBox(unknown_192_uv, unknown_192_half);
    let unknown_192_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_192_d);
    if (unknown_192_alpha > 0.0) {
        let unknown_192_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_192_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_192_color = select(unknown_192_base, unknown_192_base + vec4f(0.08), unknown_192_hover);
        color = mix(color, unknown_192_color, unknown_192_alpha);
    }

    // unknown widget at index 193
    let unknown_193_center = vec2f(0.265137, 1.420573);
    let unknown_193_half = vec2f(0.093262, 0.476562);
    let unknown_193_uv = uv - unknown_193_center;
    let unknown_193_d = sdBox(unknown_193_uv, unknown_193_half);
    let unknown_193_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_193_d);
    if (unknown_193_alpha > 0.0) {
        let unknown_193_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_193_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_193_color = select(unknown_193_base, unknown_193_base + vec4f(0.08), unknown_193_hover);
        color = mix(color, unknown_193_color, unknown_193_alpha);
    }

    // unknown widget at index 194
    let unknown_194_center = vec2f(0.300293, 1.420573);
    let unknown_194_half = vec2f(0.104980, 0.476562);
    let unknown_194_uv = uv - unknown_194_center;
    let unknown_194_d = sdBox(unknown_194_uv, unknown_194_half);
    let unknown_194_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_194_d);
    if (unknown_194_alpha > 0.0) {
        let unknown_194_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_194_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_194_color = select(unknown_194_base, unknown_194_base + vec4f(0.08), unknown_194_hover);
        color = mix(color, unknown_194_color, unknown_194_alpha);
    }

    // unknown widget at index 195
    let unknown_195_center = vec2f(0.351074, 1.417969);
    let unknown_195_half = vec2f(0.132324, 0.477865);
    let unknown_195_uv = uv - unknown_195_center;
    let unknown_195_d = sdBox(unknown_195_uv, unknown_195_half);
    let unknown_195_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_195_d);
    if (unknown_195_alpha > 0.0) {
        let unknown_195_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_195_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_195_color = select(unknown_195_base, unknown_195_base + vec4f(0.08), unknown_195_hover);
        color = mix(color, unknown_195_color, unknown_195_alpha);
    }

    // unknown widget at index 196
    let unknown_196_center = vec2f(0.454102, 1.418620);
    let unknown_196_half = vec2f(0.178711, 0.478516);
    let unknown_196_uv = uv - unknown_196_center;
    let unknown_196_d = sdBox(unknown_196_uv, unknown_196_half);
    let unknown_196_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_196_d);
    if (unknown_196_alpha > 0.0) {
        let unknown_196_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_196_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_196_color = select(unknown_196_base, unknown_196_base + vec4f(0.08), unknown_196_hover);
        color = mix(color, unknown_196_color, unknown_196_alpha);
    }

    // unknown widget at index 197
    let unknown_197_center = vec2f(0.038574, 1.479167);
    let unknown_197_half = vec2f(0.038574, 0.497396);
    let unknown_197_uv = uv - unknown_197_center;
    let unknown_197_d = sdBox(unknown_197_uv, unknown_197_half);
    let unknown_197_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_197_d);
    if (unknown_197_alpha > 0.0) {
        let unknown_197_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_197_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_197_color = select(unknown_197_base, unknown_197_base + vec4f(0.08), unknown_197_hover);
        color = mix(color, unknown_197_color, unknown_197_alpha);
    }

    // unknown widget at index 198
    let unknown_198_center = vec2f(0.149902, 1.481120);
    let unknown_198_half = vec2f(0.062012, 0.499349);
    let unknown_198_uv = uv - unknown_198_center;
    let unknown_198_d = sdBox(unknown_198_uv, unknown_198_half);
    let unknown_198_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_198_d);
    if (unknown_198_alpha > 0.0) {
        let unknown_198_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_198_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_198_color = select(unknown_198_base, unknown_198_base + vec4f(0.08), unknown_198_hover);
        color = mix(color, unknown_198_color, unknown_198_alpha);
    }

    // button widget at index 199
    let button_199_center = vec2f(1.460449, 0.104167);
    let button_199_half = vec2f(0.491699, 0.039062);
    let button_199_uv = uv - button_199_center;
    let button_199_d = sdBox(button_199_uv, button_199_half);
    let button_199_alpha = 1.0 - smoothstep(0.0, 0.003, button_199_d);
    if (button_199_alpha > 0.0) {
        let button_199_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let button_199_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var button_199_color = select(button_199_base, button_199_base + vec4f(0.08), button_199_hover);
        // Pressed state for clickable widget
        if (button_199_hover && ui.mouse_pressed > 0.5) { button_199_color -= vec4f(0.05); }
        color = mix(color, button_199_color, button_199_alpha);
    }

    // button widget at index 200
    let button_200_center = vec2f(1.460449, 0.135417);
    let button_200_half = vec2f(0.491699, 0.049479);
    let button_200_uv = uv - button_200_center;
    let button_200_d = sdBox(button_200_uv, button_200_half);
    let button_200_alpha = 1.0 - smoothstep(0.0, 0.003, button_200_d);
    if (button_200_alpha > 0.0) {
        let button_200_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let button_200_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var button_200_color = select(button_200_base, button_200_base + vec4f(0.08), button_200_hover);
        // Pressed state for clickable widget
        if (button_200_hover && ui.mouse_pressed > 0.5) { button_200_color -= vec4f(0.05); }
        color = mix(color, button_200_color, button_200_alpha);
    }

    // button widget at index 201
    let button_201_center = vec2f(1.460449, 0.166667);
    let button_201_half = vec2f(0.491699, 0.059896);
    let button_201_uv = uv - button_201_center;
    let button_201_d = sdBox(button_201_uv, button_201_half);
    let button_201_alpha = 1.0 - smoothstep(0.0, 0.003, button_201_d);
    if (button_201_alpha > 0.0) {
        let button_201_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let button_201_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var button_201_color = select(button_201_base, button_201_base + vec4f(0.08), button_201_hover);
        // Pressed state for clickable widget
        if (button_201_hover && ui.mouse_pressed > 0.5) { button_201_color -= vec4f(0.05); }
        color = mix(color, button_201_color, button_201_alpha);
    }

    // unknown widget at index 202
    let unknown_202_center = vec2f(1.461914, 0.416667);
    let unknown_202_half = vec2f(0.491211, 0.143229);
    let unknown_202_uv = uv - unknown_202_center;
    let unknown_202_d = sdBox(unknown_202_uv, unknown_202_half);
    let unknown_202_alpha = 1.0 - smoothstep(0.0, 0.003, unknown_202_d);
    if (unknown_202_alpha > 0.0) {
        let unknown_202_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let unknown_202_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var unknown_202_color = select(unknown_202_base, unknown_202_base + vec4f(0.08), unknown_202_hover);
        color = mix(color, unknown_202_color, unknown_202_alpha);
    }

    // button widget at index 203
    let button_203_center = vec2f(1.460449, 0.447917);
    let button_203_half = vec2f(0.491699, 0.153646);
    let button_203_uv = uv - button_203_center;
    let button_203_d = sdBox(button_203_uv, button_203_half);
    let button_203_alpha = 1.0 - smoothstep(0.0, 0.003, button_203_d);
    if (button_203_alpha > 0.0) {
        let button_203_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let button_203_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var button_203_color = select(button_203_base, button_203_base + vec4f(0.08), button_203_hover);
        // Pressed state for clickable widget
        if (button_203_hover && ui.mouse_pressed > 0.5) { button_203_color -= vec4f(0.05); }
        color = mix(color, button_203_color, button_203_alpha);
    }

    // button widget at index 204
    let button_204_center = vec2f(1.460449, 0.479167);
    let button_204_half = vec2f(0.491699, 0.164062);
    let button_204_uv = uv - button_204_center;
    let button_204_d = sdBox(button_204_uv, button_204_half);
    let button_204_alpha = 1.0 - smoothstep(0.0, 0.003, button_204_d);
    if (button_204_alpha > 0.0) {
        let button_204_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let button_204_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var button_204_color = select(button_204_base, button_204_base + vec4f(0.08), button_204_hover);
        // Pressed state for clickable widget
        if (button_204_hover && ui.mouse_pressed > 0.5) { button_204_color -= vec4f(0.05); }
        color = mix(color, button_204_color, button_204_alpha);
    }

    // button widget at index 205
    let button_205_center = vec2f(1.460449, 0.510417);
    let button_205_half = vec2f(0.491699, 0.174479);
    let button_205_uv = uv - button_205_center;
    let button_205_d = sdBox(button_205_uv, button_205_half);
    let button_205_alpha = 1.0 - smoothstep(0.0, 0.003, button_205_d);
    if (button_205_alpha > 0.0) {
        let button_205_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let button_205_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var button_205_color = select(button_205_base, button_205_base + vec4f(0.08), button_205_hover);
        // Pressed state for clickable widget
        if (button_205_hover && ui.mouse_pressed > 0.5) { button_205_color -= vec4f(0.05); }
        color = mix(color, button_205_color, button_205_alpha);
    }

    // button widget at index 206
    let button_206_center = vec2f(1.460449, 0.541667);
    let button_206_half = vec2f(0.491699, 0.184896);
    let button_206_uv = uv - button_206_center;
    let button_206_d = sdBox(button_206_uv, button_206_half);
    let button_206_alpha = 1.0 - smoothstep(0.0, 0.003, button_206_d);
    if (button_206_alpha > 0.0) {
        let button_206_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let button_206_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var button_206_color = select(button_206_base, button_206_base + vec4f(0.08), button_206_hover);
        // Pressed state for clickable widget
        if (button_206_hover && ui.mouse_pressed > 0.5) { button_206_color -= vec4f(0.05); }
        color = mix(color, button_206_color, button_206_alpha);
    }

    // button widget at index 207
    let button_207_center = vec2f(1.460449, 0.572917);
    let button_207_half = vec2f(0.491699, 0.195312);
    let button_207_uv = uv - button_207_center;
    let button_207_d = sdBox(button_207_uv, button_207_half);
    let button_207_alpha = 1.0 - smoothstep(0.0, 0.003, button_207_d);
    if (button_207_alpha > 0.0) {
        let button_207_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let button_207_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var button_207_color = select(button_207_base, button_207_base + vec4f(0.08), button_207_hover);
        // Pressed state for clickable widget
        if (button_207_hover && ui.mouse_pressed > 0.5) { button_207_color -= vec4f(0.05); }
        color = mix(color, button_207_color, button_207_alpha);
    }

    // button widget at index 208
    let button_208_center = vec2f(1.460449, 0.604167);
    let button_208_half = vec2f(0.491699, 0.205729);
    let button_208_uv = uv - button_208_center;
    let button_208_d = sdBox(button_208_uv, button_208_half);
    let button_208_alpha = 1.0 - smoothstep(0.0, 0.003, button_208_d);
    if (button_208_alpha > 0.0) {
        let button_208_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let button_208_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var button_208_color = select(button_208_base, button_208_base + vec4f(0.08), button_208_hover);
        // Pressed state for clickable widget
        if (button_208_hover && ui.mouse_pressed > 0.5) { button_208_color -= vec4f(0.05); }
        color = mix(color, button_208_color, button_208_alpha);
    }

    // button widget at index 209
    let button_209_center = vec2f(1.460449, 0.635417);
    let button_209_half = vec2f(0.491699, 0.216146);
    let button_209_uv = uv - button_209_center;
    let button_209_d = sdBox(button_209_uv, button_209_half);
    let button_209_alpha = 1.0 - smoothstep(0.0, 0.003, button_209_d);
    if (button_209_alpha > 0.0) {
        let button_209_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let button_209_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var button_209_color = select(button_209_base, button_209_base + vec4f(0.08), button_209_hover);
        // Pressed state for clickable widget
        if (button_209_hover && ui.mouse_pressed > 0.5) { button_209_color -= vec4f(0.05); }
        color = mix(color, button_209_color, button_209_alpha);
    }

    // button widget at index 210
    let button_210_center = vec2f(1.460449, 0.697917);
    let button_210_half = vec2f(0.491699, 0.236979);
    let button_210_uv = uv - button_210_center;
    let button_210_d = sdBox(button_210_uv, button_210_half);
    let button_210_alpha = 1.0 - smoothstep(0.0, 0.003, button_210_d);
    if (button_210_alpha > 0.0) {
        let button_210_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let button_210_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var button_210_color = select(button_210_base, button_210_base + vec4f(0.08), button_210_hover);
        // Pressed state for clickable widget
        if (button_210_hover && ui.mouse_pressed > 0.5) { button_210_color -= vec4f(0.05); }
        color = mix(color, button_210_color, button_210_alpha);
    }

    // button widget at index 211
    let button_211_center = vec2f(1.460449, 0.854167);
    let button_211_half = vec2f(0.491699, 0.289062);
    let button_211_uv = uv - button_211_center;
    let button_211_d = sdBox(button_211_uv, button_211_half);
    let button_211_alpha = 1.0 - smoothstep(0.0, 0.003, button_211_d);
    if (button_211_alpha > 0.0) {
        let button_211_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let button_211_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var button_211_color = select(button_211_base, button_211_base + vec4f(0.08), button_211_hover);
        // Pressed state for clickable widget
        if (button_211_hover && ui.mouse_pressed > 0.5) { button_211_color -= vec4f(0.05); }
        color = mix(color, button_211_color, button_211_alpha);
    }

    // button widget at index 212
    let button_212_center = vec2f(1.460449, 0.947917);
    let button_212_half = vec2f(0.491699, 0.320312);
    let button_212_uv = uv - button_212_center;
    let button_212_d = sdBox(button_212_uv, button_212_half);
    let button_212_alpha = 1.0 - smoothstep(0.0, 0.003, button_212_d);
    if (button_212_alpha > 0.0) {
        let button_212_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let button_212_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var button_212_color = select(button_212_base, button_212_base + vec4f(0.08), button_212_hover);
        // Pressed state for clickable widget
        if (button_212_hover && ui.mouse_pressed > 0.5) { button_212_color -= vec4f(0.05); }
        color = mix(color, button_212_color, button_212_alpha);
    }

    // button widget at index 213
    let button_213_center = vec2f(1.460449, 0.979167);
    let button_213_half = vec2f(0.491699, 0.330729);
    let button_213_uv = uv - button_213_center;
    let button_213_d = sdBox(button_213_uv, button_213_half);
    let button_213_alpha = 1.0 - smoothstep(0.0, 0.003, button_213_d);
    if (button_213_alpha > 0.0) {
        let button_213_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let button_213_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var button_213_color = select(button_213_base, button_213_base + vec4f(0.08), button_213_hover);
        // Pressed state for clickable widget
        if (button_213_hover && ui.mouse_pressed > 0.5) { button_213_color -= vec4f(0.05); }
        color = mix(color, button_213_color, button_213_alpha);
    }

    // button widget at index 214
    let button_214_center = vec2f(1.460449, 1.010417);
    let button_214_half = vec2f(0.491699, 0.341146);
    let button_214_uv = uv - button_214_center;
    let button_214_d = sdBox(button_214_uv, button_214_half);
    let button_214_alpha = 1.0 - smoothstep(0.0, 0.003, button_214_d);
    if (button_214_alpha > 0.0) {
        let button_214_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let button_214_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var button_214_color = select(button_214_base, button_214_base + vec4f(0.08), button_214_hover);
        // Pressed state for clickable widget
        if (button_214_hover && ui.mouse_pressed > 0.5) { button_214_color -= vec4f(0.05); }
        color = mix(color, button_214_color, button_214_alpha);
    }

    // button widget at index 215
    let button_215_center = vec2f(1.460449, 1.041667);
    let button_215_half = vec2f(0.491699, 0.351562);
    let button_215_uv = uv - button_215_center;
    let button_215_d = sdBox(button_215_uv, button_215_half);
    let button_215_alpha = 1.0 - smoothstep(0.0, 0.003, button_215_d);
    if (button_215_alpha > 0.0) {
        let button_215_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let button_215_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var button_215_color = select(button_215_base, button_215_base + vec4f(0.08), button_215_hover);
        // Pressed state for clickable widget
        if (button_215_hover && ui.mouse_pressed > 0.5) { button_215_color -= vec4f(0.05); }
        color = mix(color, button_215_color, button_215_alpha);
    }

    // button widget at index 216
    let button_216_center = vec2f(1.460449, 1.072917);
    let button_216_half = vec2f(0.491699, 0.361979);
    let button_216_uv = uv - button_216_center;
    let button_216_d = sdBox(button_216_uv, button_216_half);
    let button_216_alpha = 1.0 - smoothstep(0.0, 0.003, button_216_d);
    if (button_216_alpha > 0.0) {
        let button_216_base = vec4f(0.4, 0.4, 0.4, 1.0);
        let button_216_hover = distance(uv, ui.mouse / ui.resolution) < 0.0500;
        var button_216_color = select(button_216_base, button_216_base + vec4f(0.08), button_216_hover);
        // Pressed state for clickable widget
        if (button_216_hover && ui.mouse_pressed > 0.5) { button_216_color -= vec4f(0.05); }
        color = mix(color, button_216_color, button_216_alpha);
    }

    return color;
}