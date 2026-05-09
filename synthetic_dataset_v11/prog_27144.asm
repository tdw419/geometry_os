; DESCRIPTION: Draws a purple line from (136, 174) to (163, 230).
; PLAN: r0=136(x1), r1=174(y1), r2=163(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 174
LDI r2, 163
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
