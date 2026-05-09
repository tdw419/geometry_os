; DESCRIPTION: Creates a yellow rectangular region at (14, 102) spanning 44 by 52 pixels.
; PLAN: r0=14(x), r1=102(y), r2=44(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 102
LDI r2, 44
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
