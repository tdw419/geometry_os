; DESCRIPTION: Places a purple line segment connecting (147, 98) to (78, 98).
; PLAN: r0=147(x1), r1=98(y1), r2=78(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 98
LDI r2, 78
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
