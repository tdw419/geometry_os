; DESCRIPTION: Creates a green rectangular region at (29, 23) spanning 64 by 15 pixels.
; PLAN: r0=29(x), r1=23(y), r2=64(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 23
LDI r2, 64
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
