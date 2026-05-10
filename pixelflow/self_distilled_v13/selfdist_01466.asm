; DESCRIPTION: Creates a purple filled rectangle of size 114x96 starting at (56, 60).
; PLAN: r0=56(x), r1=60(y), r2=114(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 60
LDI r2, 114
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
