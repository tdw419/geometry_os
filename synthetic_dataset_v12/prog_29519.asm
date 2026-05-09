; DESCRIPTION: Creates a purple rectangular region at (338, 161) spanning 31 by 88 pixels.
; PLAN: r0=338(x), r1=161(y), r2=31(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 161
LDI r2, 31
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
