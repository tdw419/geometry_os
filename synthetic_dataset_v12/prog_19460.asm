; DESCRIPTION: Creates a yellow rectangular region at (216, 94) spanning 114 by 99 pixels.
; PLAN: r0=216(x), r1=94(y), r2=114(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 94
LDI r2, 114
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
