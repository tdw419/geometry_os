; DESCRIPTION: Creates a purple rectangular region at (339, 104) spanning 89 by 84 pixels.
; PLAN: r0=339(x), r1=104(y), r2=89(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 104
LDI r2, 89
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
