; DESCRIPTION: Creates a green rectangular region at (257, 136) spanning 98 by 32 pixels.
; PLAN: r0=257(x), r1=136(y), r2=98(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 136
LDI r2, 98
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
