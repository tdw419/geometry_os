; DESCRIPTION: Renders a purple line between points (133, 199) and (196, 169).
; PLAN: r0=133(x1), r1=199(y1), r2=196(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 199
LDI r2, 196
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
