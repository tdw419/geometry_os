; DESCRIPTION: Creates a yellow rectangular region at (175, 170) spanning 88 by 63 pixels.
; PLAN: r0=175(x), r1=170(y), r2=88(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 170
LDI r2, 88
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
