; DESCRIPTION: Places a yellow line segment connecting (251, 89) to (478, 18).
; PLAN: r0=251(x1), r1=89(y1), r2=478(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 89
LDI r2, 478
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
