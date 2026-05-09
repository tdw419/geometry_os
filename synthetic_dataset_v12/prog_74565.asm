; DESCRIPTION: Places a purple line segment connecting (313, 58) to (441, 78).
; PLAN: r0=313(x1), r1=58(y1), r2=441(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 58
LDI r2, 441
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
