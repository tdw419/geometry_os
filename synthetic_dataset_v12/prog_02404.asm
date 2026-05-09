; DESCRIPTION: Creates a yellow rectangular region at (49, 75) spanning 49 by 25 pixels.
; PLAN: r0=49(x), r1=75(y), r2=49(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 75
LDI r2, 49
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
