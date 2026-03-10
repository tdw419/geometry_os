import numpy as np
from systems.visual_shell.wgsl.quantization.q4_utils import q4_dequantize_block

# Test the single block test case
scale = np.float16(2.0)
packed_weights = np.zeros(16, dtype=np.uint8)
packed_weights[0] = 0x98  # 8,9 packed
packed_weights[1] = 0xBA  # 10,11 packed

print("Scale:", scale)
print("Packed weights:", [hex(w) for w in packed_weights[:8]])

# Test unpacking both ways
weights_4bit_old = np.zeros(32, dtype=np.uint8)
weights_4bit_new = np.zeros(32, dtype=np.uint8)

for i in range(16):
    byte = packed_weights[i]
    # Old way (wrong)
    weights_4bit_old[i * 2] = (byte >> 4) & 0xF
    weights_4bit_old[i * 2 + 1] = byte & 0xF
    # New way (right)
    weights_4bit_new[i * 2] = byte >> 4
    weights_4bit_new[i * 2 + 1] = byte & 0xF

print("Old unpacked weights:", weights_4bit_old[:8])
print("New unpacked weights:", weights_4bit_new[:8])
print("Expected weights:", [8, 9, 10, 11, 0, 0, 0, 0])

# Dequantize
result = q4_dequantize_block(packed_weights, scale)
print("Result:", result[:8])
print("Expected:", [0.0, 2.0, 4.0, 6.0, 0.0, 0.0, 0.0, 0.0])