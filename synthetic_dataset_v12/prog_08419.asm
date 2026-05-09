; DESCRIPTION: Places a magenta 64x103 rectangle at position (237, 54).
; PLAN: r0=237(x), r1=54(y), r2=64(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 54
LDI r2, 64
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
