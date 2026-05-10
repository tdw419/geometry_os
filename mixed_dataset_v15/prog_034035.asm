; DESCRIPTION: Creates a green rectangular region at (52, 64) spanning 99 by 22 pixels.
; PLAN: r0=52(x), r1=64(y), r2=99(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 64
LDI r2, 99
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
