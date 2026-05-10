; DESCRIPTION: Creates a purple rectangular region at (276, 89) spanning 67 by 23 pixels.
; PLAN: r0=276(x), r1=89(y), r2=67(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 89
LDI r2, 67
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
