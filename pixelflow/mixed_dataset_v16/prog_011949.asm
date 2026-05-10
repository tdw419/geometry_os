; DESCRIPTION: Places a purple line segment connecting (417, 89) to (441, 98).
; PLAN: r0=417(x1), r1=89(y1), r2=441(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 89
LDI r2, 441
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
