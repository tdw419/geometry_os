; DESCRIPTION: Creates a purple rectangular region at (313, 49) spanning 106 by 36 pixels.
; PLAN: r0=313(x), r1=49(y), r2=106(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 49
LDI r2, 106
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
