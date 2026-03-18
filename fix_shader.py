#!/usr/bin/env python3
import sys

with open('systems/infinite_map_rs/src/shaders/wave_logic_unit.wgsl', 'r') as f:
    lines = f.readlines()

new_lines = []
for line in lines:
    if '@group(0) @binding(3) var<uniform> params: array<f32, 21>;' in line:
        # Add the struct before the binding
        new_lines.append('/// Wrapper for params array (WGSL requires fixed-size arrays to be in a struct for uniform buffers)\n')
        new_lines.append('struct ParamsWrapper {\n')
        new_lines.append('    data: array<f32, 21>,\n')
        new_lines.append('}\n')
        new_lines.append('\n')
        new_lines.append('@group(0) @binding(3) var<uniform> params: ParamsWrapper;\n')
    else:
        new_lines.append(line)

with open('systems/infinite_map_rs/src/shaders/wave_logic_unit.wgsl', 'w') as f:
    f.writelines(new_lines)

print("Shader fixed successfully")
