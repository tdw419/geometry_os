; DESCRIPTION: Places a purple line segment connecting (133, 17) to (61, 172).
; PLAN: r0=133(x1), r1=17(y1), r2=61(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 17
LDI r2, 61
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
