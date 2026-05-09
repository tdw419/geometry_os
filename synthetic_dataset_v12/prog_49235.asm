; DESCRIPTION: Renders a purple line between points (286, 56) and (51, 24).
; PLAN: r0=286(x1), r1=56(y1), r2=51(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 56
LDI r2, 51
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
