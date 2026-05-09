; DESCRIPTION: Places a purple line segment connecting (347, 199) to (183, 157).
; PLAN: r0=347(x1), r1=199(y1), r2=183(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 199
LDI r2, 183
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
