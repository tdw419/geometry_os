; DESCRIPTION: Renders a yellow line between points (112, 30) and (163, 232).
; PLAN: r0=112(x1), r1=30(y1), r2=163(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 30
LDI r2, 163
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
