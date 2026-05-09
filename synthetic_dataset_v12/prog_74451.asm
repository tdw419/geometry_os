; DESCRIPTION: Creates a green rectangular region at (453, 3) spanning 43 by 84 pixels.
; PLAN: r0=453(x), r1=3(y), r2=43(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 3
LDI r2, 43
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
