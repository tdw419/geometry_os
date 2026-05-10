; DESCRIPTION: Draws a purple line from (469, 199) to (200, 181).
; PLAN: r0=469(x1), r1=199(y1), r2=200(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 199
LDI r2, 200
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
