; DESCRIPTION: Places a purple line segment connecting (478, 112) to (495, 31).
; PLAN: r0=478(x1), r1=112(y1), r2=495(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 112
LDI r2, 495
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
