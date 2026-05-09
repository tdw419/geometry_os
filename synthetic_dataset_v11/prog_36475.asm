; DESCRIPTION: Creates a yellow rectangular region at (136, 23) spanning 13 by 49 pixels.
; PLAN: r0=136(x), r1=23(y), r2=13(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 23
LDI r2, 13
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
