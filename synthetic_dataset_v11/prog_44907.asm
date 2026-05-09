; DESCRIPTION: Places a green line segment connecting (137, 201) to (78, 86).
; PLAN: r0=137(x1), r1=201(y1), r2=78(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 201
LDI r2, 78
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
