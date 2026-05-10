; DESCRIPTION: Renders a purple line between points (501, 84) and (51, 136).
; PLAN: r0=501(x1), r1=84(y1), r2=51(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 84
LDI r2, 51
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
