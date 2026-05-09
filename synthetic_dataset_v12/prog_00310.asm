; DESCRIPTION: Places a magenta 109x48 rectangle at position (320, 179).
; PLAN: r0=320(x), r1=179(y), r2=109(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 179
LDI r2, 109
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
