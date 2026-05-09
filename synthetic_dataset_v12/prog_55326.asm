; DESCRIPTION: Creates a green rectangular region at (9, 136) spanning 56 by 96 pixels.
; PLAN: r0=9(x), r1=136(y), r2=56(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 136
LDI r2, 56
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
