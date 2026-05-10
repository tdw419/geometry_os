; DESCRIPTION: Creates a yellow filled rectangle of size 103x29 starting at (124, 97).
; PLAN: r0=124(x), r1=97(y), r2=103(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 97
LDI r2, 103
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
