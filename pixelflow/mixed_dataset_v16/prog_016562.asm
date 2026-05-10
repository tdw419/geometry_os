; DESCRIPTION: Creates a purple filled rectangle of size 114x67 starting at (285, 9).
; PLAN: r0=285(x), r1=9(y), r2=114(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 9
LDI r2, 114
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
