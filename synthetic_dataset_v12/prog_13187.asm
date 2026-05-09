; DESCRIPTION: Places a yellow line segment connecting (409, 201) to (142, 75).
; PLAN: r0=409(x1), r1=201(y1), r2=142(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 201
LDI r2, 142
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
