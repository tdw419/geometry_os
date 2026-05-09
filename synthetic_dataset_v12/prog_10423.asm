; DESCRIPTION: Places a green line segment connecting (483, 216) to (422, 97).
; PLAN: r0=483(x1), r1=216(y1), r2=422(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 216
LDI r2, 422
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
