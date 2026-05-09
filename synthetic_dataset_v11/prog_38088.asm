; DESCRIPTION: Places a purple line segment connecting (124, 152) to (89, 2).
; PLAN: r0=124(x1), r1=152(y1), r2=89(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 152
LDI r2, 89
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
