; DESCRIPTION: Places a purple line segment connecting (441, 78) to (229, 54).
; PLAN: r0=441(x1), r1=78(y1), r2=229(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 78
LDI r2, 229
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
