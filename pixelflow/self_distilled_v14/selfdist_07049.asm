; DESCRIPTION: Creates a purple filled rectangle of size 73x112 starting at (190, 69).
; PLAN: r0=190(x), r1=69(y), r2=73(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 69
LDI r2, 73
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
