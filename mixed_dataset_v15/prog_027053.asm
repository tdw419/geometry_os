; DESCRIPTION: Creates a yellow rectangular region at (15, 99) spanning 88 by 40 pixels.
; PLAN: r0=15(x), r1=99(y), r2=88(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 99
LDI r2, 88
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
