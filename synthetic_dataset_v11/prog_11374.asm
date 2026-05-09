; DESCRIPTION: Creates a green rectangular region at (155, 23) spanning 49 by 21 pixels.
; PLAN: r0=155(x), r1=23(y), r2=49(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 23
LDI r2, 49
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
