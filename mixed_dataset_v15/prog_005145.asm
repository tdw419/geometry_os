; DESCRIPTION: Places a green line segment connecting (478, 201) to (451, 120).
; PLAN: r0=478(x1), r1=201(y1), r2=451(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 201
LDI r2, 451
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
