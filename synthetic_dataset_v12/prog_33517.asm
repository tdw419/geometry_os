; DESCRIPTION: Creates a purple rectangular region at (266, 101) spanning 15 by 29 pixels.
; PLAN: r0=266(x), r1=101(y), r2=15(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 101
LDI r2, 15
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
