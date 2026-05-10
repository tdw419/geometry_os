; DESCRIPTION: Creates a purple filled rectangle of size 88x73 starting at (328, 49).
; PLAN: r0=328(x), r1=49(y), r2=88(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 49
LDI r2, 88
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
