; DESCRIPTION: Creates a yellow rectangular region at (122, 145) spanning 114 by 28 pixels.
; PLAN: r0=122(x), r1=145(y), r2=114(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 145
LDI r2, 114
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
