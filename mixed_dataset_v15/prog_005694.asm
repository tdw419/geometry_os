; DESCRIPTION: Places a purple line segment connecting (89, 39) to (181, 221).
; PLAN: r0=89(x1), r1=39(y1), r2=181(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 39
LDI r2, 181
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
