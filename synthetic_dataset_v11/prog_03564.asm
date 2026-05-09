; DESCRIPTION: Creates a yellow rectangular region at (97, 106) spanning 14 by 34 pixels.
; PLAN: r0=97(x), r1=106(y), r2=14(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 106
LDI r2, 14
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
