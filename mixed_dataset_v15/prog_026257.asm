; DESCRIPTION: Places a yellow line segment connecting (409, 89) to (475, 105).
; PLAN: r0=409(x1), r1=89(y1), r2=475(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 89
LDI r2, 475
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
