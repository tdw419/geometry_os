; DESCRIPTION: Places a yellow line segment connecting (394, 110) to (211, 201).
; PLAN: r0=394(x1), r1=110(y1), r2=211(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 110
LDI r2, 211
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
