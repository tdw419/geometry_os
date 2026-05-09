; DESCRIPTION: Places a orange line segment connecting (455, 198) to (201, 52).
; PLAN: r0=455(x1), r1=198(y1), r2=201(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 198
LDI r2, 201
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
