; DESCRIPTION: Creates a purple filled rectangle of size 19x35 starting at (233, 24).
; PLAN: r0=233(x), r1=24(y), r2=19(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 24
LDI r2, 19
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
