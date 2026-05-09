; DESCRIPTION: Creates a green rectangular region at (9, 110) spanning 114 by 24 pixels.
; PLAN: r0=9(x), r1=110(y), r2=114(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 110
LDI r2, 114
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
