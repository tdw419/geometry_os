; DESCRIPTION: Creates a yellow rectangular region at (430, 36) spanning 75 by 112 pixels.
; PLAN: r0=430(x), r1=36(y), r2=75(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 36
LDI r2, 75
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
