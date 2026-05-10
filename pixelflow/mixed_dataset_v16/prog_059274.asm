; DESCRIPTION: Creates a purple filled rectangle of size 22x106 starting at (243, 3).
; PLAN: r0=243(x), r1=3(y), r2=22(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 3
LDI r2, 22
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
