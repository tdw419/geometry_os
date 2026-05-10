; DESCRIPTION: Creates a purple rectangular region at (163, 24) spanning 84 by 18 pixels.
; PLAN: r0=163(x), r1=24(y), r2=84(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 24
LDI r2, 84
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
