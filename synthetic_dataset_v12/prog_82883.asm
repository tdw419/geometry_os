; DESCRIPTION: Creates a yellow rectangular region at (6, 170) spanning 18 by 11 pixels.
; PLAN: r0=6(x), r1=170(y), r2=18(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 170
LDI r2, 18
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
