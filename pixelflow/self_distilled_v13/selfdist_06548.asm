; DESCRIPTION: Renders a purple line segment connecting (6, 58) to (129, 129).
; PLAN: r0=6(x1), r1=58(y1), r2=129(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 58
LDI r2, 129
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
