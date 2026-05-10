; DESCRIPTION: Creates a purple filled rectangle of size 117x88 starting at (283, 106).
; PLAN: r0=283(x), r1=106(y), r2=117(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 106
LDI r2, 117
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
