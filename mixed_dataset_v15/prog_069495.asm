; DESCRIPTION: Creates a purple filled rectangle of size 11x73 starting at (243, 25).
; PLAN: r0=243(x), r1=25(y), r2=11(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 25
LDI r2, 11
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
