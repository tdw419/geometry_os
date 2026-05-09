; DESCRIPTION: Draws a purple line from (484, 232) to (131, 181).
; PLAN: r0=484(x1), r1=232(y1), r2=131(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 232
LDI r2, 131
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
