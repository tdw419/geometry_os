; DESCRIPTION: Creates a purple rectangular region at (155, 2) spanning 101 by 38 pixels.
; PLAN: r0=155(x), r1=2(y), r2=101(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 2
LDI r2, 101
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
