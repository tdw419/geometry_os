; DESCRIPTION: Creates a yellow rectangular region at (9, 35) spanning 29 by 114 pixels.
; PLAN: r0=9(x), r1=35(y), r2=29(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 35
LDI r2, 29
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
