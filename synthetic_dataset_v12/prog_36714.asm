; DESCRIPTION: Creates a purple rectangular region at (252, 88) spanning 79 by 89 pixels.
; PLAN: r0=252(x), r1=88(y), r2=79(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 88
LDI r2, 79
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
