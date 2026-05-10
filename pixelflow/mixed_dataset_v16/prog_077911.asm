; DESCRIPTION: Creates a purple rectangular region at (163, 35) spanning 19 by 98 pixels.
; PLAN: r0=163(x), r1=35(y), r2=19(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 35
LDI r2, 19
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
