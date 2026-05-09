; DESCRIPTION: Places a purple line segment connecting (261, 81) to (94, 39).
; PLAN: r0=261(x1), r1=81(y1), r2=94(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 81
LDI r2, 94
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
