; DESCRIPTION: Places a purple line segment connecting (194, 142) to (94, 233).
; PLAN: r0=194(x1), r1=142(y1), r2=94(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 142
LDI r2, 94
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
