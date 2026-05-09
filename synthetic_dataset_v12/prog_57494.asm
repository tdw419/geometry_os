; DESCRIPTION: Places a purple line segment connecting (251, 34) to (52, 211).
; PLAN: r0=251(x1), r1=34(y1), r2=52(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 34
LDI r2, 52
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
