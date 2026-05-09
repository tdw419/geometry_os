; DESCRIPTION: Creates a green rectangular region at (13, 78) spanning 119 by 100 pixels.
; PLAN: r0=13(x), r1=78(y), r2=119(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 78
LDI r2, 119
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
