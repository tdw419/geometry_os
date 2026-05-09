; DESCRIPTION: Places a black line segment connecting (109, 137) to (19, 201).
; PLAN: r0=109(x1), r1=137(y1), r2=19(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 137
LDI r2, 19
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
