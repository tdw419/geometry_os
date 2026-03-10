import numpy as np
from systems.visual_shell.wgsl.quantization.q4_utils import q4_quantize_block, q4_dequantize_block

# Test quantize then dequantize
values = np.array([0.0, 2.0, 4.0, 6.0] + [0.0] * 28, dtype=np.float32)
print("Original values:", values[:8])

# Quantize
quantized = q4_quantize_block(values)
print("Scale:", quantized['scale'])
print("Packed weights:", [hex(w) for w in quantized['packed_weights'][:4]])

# Dequantize back
dequantized = q4_dequantize_block(quantized['packed_weights'], quantized['scale'])
print("Dequantized:", dequantized[:8])
print("Diff:", dequantized[:8] - values[:8])