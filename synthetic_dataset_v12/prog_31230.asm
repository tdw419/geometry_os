; DESCRIPTION: Creates a yellow rectangular region at (14, 137) spanning 114 by 106 pixels.
; PLAN: r0=14(x), r1=137(y), r2=114(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 137
LDI r2, 114
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
