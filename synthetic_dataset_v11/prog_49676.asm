; DESCRIPTION: Places a purple line segment connecting (124, 156) to (132, 124).
; PLAN: r0=124(x1), r1=156(y1), r2=132(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 156
LDI r2, 132
LDI r3, 124
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
