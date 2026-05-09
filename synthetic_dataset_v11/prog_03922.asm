; DESCRIPTION: Renders a purple line between points (118, 43) and (51, 122).
; PLAN: r0=118(x1), r1=43(y1), r2=51(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 43
LDI r2, 51
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
