; DESCRIPTION: Places a purple line segment connecting (40, 89) to (195, 251).
; PLAN: r0=40(x1), r1=89(y1), r2=195(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 89
LDI r2, 195
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
