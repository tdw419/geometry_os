; DESCRIPTION: Places a purple line segment connecting (422, 156) to (347, 65).
; PLAN: r0=422(x1), r1=156(y1), r2=347(x2), r3=65(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 156
LDI r2, 347
LDI r3, 65
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
