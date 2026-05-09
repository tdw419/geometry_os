; DESCRIPTION: Places a orange line segment connecting (153, 94) to (258, 140).
; PLAN: r0=153(x1), r1=94(y1), r2=258(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 94
LDI r2, 258
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
