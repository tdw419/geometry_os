; DESCRIPTION: Renders a purple line segment connecting (129, 89) to (72, 112).
; PLAN: r0=129(x1), r1=89(y1), r2=72(x2), r3=112(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 89
LDI r2, 72
LDI r3, 112
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
