; DESCRIPTION: Places a purple line segment connecting (122, 165) to (378, 66).
; PLAN: r0=122(x1), r1=165(y1), r2=378(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 165
LDI r2, 378
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
