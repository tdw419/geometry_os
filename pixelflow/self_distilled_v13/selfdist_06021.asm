; DESCRIPTION: Draws a purple line from (99, 125) to (155, 147).
; PLAN: r0=99(x1), r1=125(y1), r2=155(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 125
LDI r2, 155
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
