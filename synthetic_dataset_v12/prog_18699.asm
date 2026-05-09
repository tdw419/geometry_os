; DESCRIPTION: Places a blue 64x106 rectangle at position (247, 133).
; PLAN: r0=247(x), r1=133(y), r2=64(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 133
LDI r2, 64
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
