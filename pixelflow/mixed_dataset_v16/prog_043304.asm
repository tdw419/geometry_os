; DESCRIPTION: Creates a blue filled rectangle of size 13x91 starting at (282, 97).
; PLAN: r0=282(x), r1=97(y), r2=13(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 97
LDI r2, 13
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
