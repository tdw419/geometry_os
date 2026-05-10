; DESCRIPTION: Creates a blue filled rectangle of size 110x22 starting at (124, 26).
; PLAN: r0=124(x), r1=26(y), r2=110(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 26
LDI r2, 110
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
