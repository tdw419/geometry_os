; DESCRIPTION: Draws a purple line from (351, 136) to (219, 153).
; PLAN: r0=351(x1), r1=136(y1), r2=219(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 136
LDI r2, 219
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
