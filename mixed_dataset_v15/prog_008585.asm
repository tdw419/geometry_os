; DESCRIPTION: Creates a purple rectangular region at (125, 122) spanning 89 by 67 pixels.
; PLAN: r0=125(x), r1=122(y), r2=89(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 122
LDI r2, 89
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
