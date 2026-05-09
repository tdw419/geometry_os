; DESCRIPTION: Places a orange line segment connecting (473, 183) to (191, 118).
; PLAN: r0=473(x1), r1=183(y1), r2=191(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 183
LDI r2, 191
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
