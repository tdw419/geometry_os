; DESCRIPTION: Renders a purple line between points (246, 193) and (132, 155).
; PLAN: r0=246(x1), r1=193(y1), r2=132(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 193
LDI r2, 132
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
