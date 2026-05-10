; DESCRIPTION: Creates a purple filled rectangle of size 97x29 starting at (25, 81).
; PLAN: r0=25(x), r1=81(y), r2=97(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 81
LDI r2, 97
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
