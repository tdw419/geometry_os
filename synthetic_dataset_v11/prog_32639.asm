; DESCRIPTION: Places a magenta 63x85 rectangle at position (185, 64).
; PLAN: r0=185(x), r1=64(y), r2=63(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 64
LDI r2, 63
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
