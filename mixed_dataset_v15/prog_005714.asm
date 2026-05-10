; DESCRIPTION: Creates a purple rectangular region at (19, 14) spanning 92 by 26 pixels.
; PLAN: r0=19(x), r1=14(y), r2=92(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 14
LDI r2, 92
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
