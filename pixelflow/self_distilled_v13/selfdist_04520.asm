; DESCRIPTION: Creates a green filled rectangle of size 13x118 starting at (10, 100).
; PLAN: r0=10(x), r1=100(y), r2=13(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 100
LDI r2, 13
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
