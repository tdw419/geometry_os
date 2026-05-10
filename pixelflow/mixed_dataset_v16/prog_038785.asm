; DESCRIPTION: Creates a purple filled rectangle of size 58x86 starting at (88, 97).
; PLAN: r0=88(x), r1=97(y), r2=58(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 97
LDI r2, 58
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
