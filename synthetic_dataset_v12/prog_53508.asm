; DESCRIPTION: Creates a yellow rectangular region at (170, 87) spanning 114 by 89 pixels.
; PLAN: r0=170(x), r1=87(y), r2=114(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 87
LDI r2, 114
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
