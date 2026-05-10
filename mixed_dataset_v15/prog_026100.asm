; DESCRIPTION: Places a magenta 64x42 rectangle at position (57, 179).
; PLAN: r0=57(x), r1=179(y), r2=64(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 179
LDI r2, 64
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
