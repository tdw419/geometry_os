; DESCRIPTION: Creates a purple rectangular region at (129, 36) spanning 84 by 119 pixels.
; PLAN: r0=129(x), r1=36(y), r2=84(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 36
LDI r2, 84
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
