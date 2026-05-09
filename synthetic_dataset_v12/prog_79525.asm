; DESCRIPTION: Creates a green rectangular region at (221, 49) spanning 11 by 84 pixels.
; PLAN: r0=221(x), r1=49(y), r2=11(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 49
LDI r2, 11
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
