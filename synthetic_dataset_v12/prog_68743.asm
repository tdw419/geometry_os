; DESCRIPTION: Renders a purple line between points (359, 40) and (51, 138).
; PLAN: r0=359(x1), r1=40(y1), r2=51(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 40
LDI r2, 51
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
