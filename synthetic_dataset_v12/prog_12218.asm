; DESCRIPTION: Places a purple line segment connecting (22, 113) to (454, 109).
; PLAN: r0=22(x1), r1=113(y1), r2=454(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 113
LDI r2, 454
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
