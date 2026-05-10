; DESCRIPTION: Renders a purple line segment connecting (52, 12) to (227, 31).
; PLAN: r0=52(x1), r1=12(y1), r2=227(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 12
LDI r2, 227
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
