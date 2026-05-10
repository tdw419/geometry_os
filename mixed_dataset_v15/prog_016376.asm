; DESCRIPTION: Creates a purple filled rectangle of size 23x110 starting at (35, 121).
; PLAN: r0=35(x), r1=121(y), r2=23(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 121
LDI r2, 23
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
