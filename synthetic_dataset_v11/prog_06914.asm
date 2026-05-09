; DESCRIPTION: Creates a purple rectangular region at (20, 52) spanning 43 by 75 pixels.
; PLAN: r0=20(x), r1=52(y), r2=43(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 52
LDI r2, 43
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
