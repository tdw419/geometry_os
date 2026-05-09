; DESCRIPTION: Creates a purple rectangular region at (289, 24) spanning 118 by 67 pixels.
; PLAN: r0=289(x), r1=24(y), r2=118(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 24
LDI r2, 118
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
