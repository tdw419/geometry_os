; DESCRIPTION: Creates a green rectangular region at (145, 64) spanning 25 by 88 pixels.
; PLAN: r0=145(x), r1=64(y), r2=25(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 64
LDI r2, 25
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
