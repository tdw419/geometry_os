; DESCRIPTION: Creates a yellow rectangular region at (149, 68) spanning 114 by 112 pixels.
; PLAN: r0=149(x), r1=68(y), r2=114(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 68
LDI r2, 114
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
