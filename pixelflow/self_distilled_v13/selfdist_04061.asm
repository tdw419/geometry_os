; DESCRIPTION: Creates a purple filled rectangle of size 81x110 starting at (267, 129).
; PLAN: r0=267(x), r1=129(y), r2=81(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 129
LDI r2, 81
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
