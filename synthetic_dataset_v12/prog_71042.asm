; DESCRIPTION: Draws a purple line from (147, 213) to (91, 226).
; PLAN: r0=147(x1), r1=213(y1), r2=91(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 213
LDI r2, 91
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
