; DESCRIPTION: Creates a green rectangular region at (137, 160) spanning 84 by 96 pixels.
; PLAN: r0=137(x), r1=160(y), r2=84(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 160
LDI r2, 84
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
