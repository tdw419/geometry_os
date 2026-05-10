; DESCRIPTION: Creates a purple filled rectangle of size 19x54 starting at (112, 94).
; PLAN: r0=112(x), r1=94(y), r2=19(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 94
LDI r2, 19
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
