; DESCRIPTION: Creates a yellow rectangular region at (390, 167) spanning 98 by 56 pixels.
; PLAN: r0=390(x), r1=167(y), r2=98(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 167
LDI r2, 98
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
