; DESCRIPTION: Places a orange line segment connecting (200, 216) to (134, 153).
; PLAN: r0=200(x1), r1=216(y1), r2=134(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 216
LDI r2, 134
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
