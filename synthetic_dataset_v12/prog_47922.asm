; DESCRIPTION: Creates a purple rectangular region at (34, 15) spanning 49 by 52 pixels.
; PLAN: r0=34(x), r1=15(y), r2=49(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 15
LDI r2, 49
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
