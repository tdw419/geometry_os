; DESCRIPTION: Renders a purple line between points (145, 77) and (52, 8).
; PLAN: r0=145(x1), r1=77(y1), r2=52(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 77
LDI r2, 52
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
