; DESCRIPTION: Renders a purple line between points (12, 37) and (112, 89).
; PLAN: r0=12(x1), r1=37(y1), r2=112(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 37
LDI r2, 112
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
