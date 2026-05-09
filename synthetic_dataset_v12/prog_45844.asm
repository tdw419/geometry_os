; DESCRIPTION: Creates a yellow rectangular region at (334, 12) spanning 66 by 101 pixels.
; PLAN: r0=334(x), r1=12(y), r2=66(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 12
LDI r2, 66
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
