; DESCRIPTION: Creates a purple filled rectangle of size 26x34 starting at (200, 94).
; PLAN: r0=200(x), r1=94(y), r2=26(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 94
LDI r2, 26
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
