; DESCRIPTION: Creates a purple rectangular region at (19, 67) spanning 114 by 119 pixels.
; PLAN: r0=19(x), r1=67(y), r2=114(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 67
LDI r2, 114
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
