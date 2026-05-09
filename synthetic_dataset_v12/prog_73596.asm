; DESCRIPTION: Draws a purple line from (155, 206) to (493, 159).
; PLAN: r0=155(x1), r1=206(y1), r2=493(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 206
LDI r2, 493
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
