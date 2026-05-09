; DESCRIPTION: Creates a purple rectangular region at (118, 1) spanning 61 by 67 pixels.
; PLAN: r0=118(x), r1=1(y), r2=61(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 1
LDI r2, 61
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
