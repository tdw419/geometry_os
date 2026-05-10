; DESCRIPTION: Creates a yellow filled rectangle of size 62x96 starting at (201, 145).
; PLAN: r0=201(x), r1=145(y), r2=62(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 145
LDI r2, 62
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
