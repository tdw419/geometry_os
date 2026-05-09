; DESCRIPTION: Draws a purple line from (232, 49) to (58, 181).
; PLAN: r0=232(x1), r1=49(y1), r2=58(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 49
LDI r2, 58
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
