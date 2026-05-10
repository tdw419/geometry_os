; DESCRIPTION: Renders a purple box of size 22x97 starting at (311, 78).
; PLAN: r0=311(x), r1=78(y), r2=22(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 78
LDI r2, 22
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
