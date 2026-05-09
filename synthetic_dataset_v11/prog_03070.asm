; DESCRIPTION: Creates a purple rectangular region at (84, 148) spanning 34 by 43 pixels.
; PLAN: r0=84(x), r1=148(y), r2=34(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 148
LDI r2, 34
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
