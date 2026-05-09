; DESCRIPTION: Places a black line segment connecting (34, 201) to (105, 36).
; PLAN: r0=34(x1), r1=201(y1), r2=105(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 201
LDI r2, 105
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
