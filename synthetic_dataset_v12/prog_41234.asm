; DESCRIPTION: Places a purple line segment connecting (137, 47) to (112, 87).
; PLAN: r0=137(x1), r1=47(y1), r2=112(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 47
LDI r2, 112
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
