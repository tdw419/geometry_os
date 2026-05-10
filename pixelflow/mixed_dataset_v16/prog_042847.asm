; DESCRIPTION: Places a black line segment connecting (422, 112) to (331, 201).
; PLAN: r0=422(x1), r1=112(y1), r2=331(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 112
LDI r2, 331
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
