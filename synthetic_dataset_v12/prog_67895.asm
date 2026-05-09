; DESCRIPTION: Creates a yellow rectangular region at (6, 119) spanning 23 by 77 pixels.
; PLAN: r0=6(x), r1=119(y), r2=23(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 119
LDI r2, 23
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
