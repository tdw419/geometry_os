; DESCRIPTION: Creates a yellow rectangular region at (163, 17) spanning 97 by 43 pixels.
; PLAN: r0=163(x), r1=17(y), r2=97(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 17
LDI r2, 97
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
