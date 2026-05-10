; DESCRIPTION: Creates a purple filled rectangle of size 12x99 starting at (389, 22).
; PLAN: r0=389(x), r1=22(y), r2=12(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 22
LDI r2, 12
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
