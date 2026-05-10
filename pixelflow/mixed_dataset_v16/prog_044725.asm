; DESCRIPTION: Draws a purple line from (499, 147) to (132, 25).
; PLAN: r0=499(x1), r1=147(y1), r2=132(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 147
LDI r2, 132
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
