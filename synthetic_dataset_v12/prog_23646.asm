; DESCRIPTION: Creates a purple rectangular region at (183, 139) spanning 57 by 88 pixels.
; PLAN: r0=183(x), r1=139(y), r2=57(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 139
LDI r2, 57
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
