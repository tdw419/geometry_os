; DESCRIPTION: Places a purple line segment connecting (195, 13) to (334, 194).
; PLAN: r0=195(x1), r1=13(y1), r2=334(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 13
LDI r2, 334
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
