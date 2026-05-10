; DESCRIPTION: Renders a purple line between points (296, 112) and (52, 0).
; PLAN: r0=296(x1), r1=112(y1), r2=52(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 112
LDI r2, 52
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
