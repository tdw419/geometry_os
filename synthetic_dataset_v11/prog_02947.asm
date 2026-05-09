; DESCRIPTION: Renders a purple line between points (227, 2) and (14, 92).
; PLAN: r0=227(x1), r1=2(y1), r2=14(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 2
LDI r2, 14
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
