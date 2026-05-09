; DESCRIPTION: Draws a purple line from (491, 89) to (40, 58).
; PLAN: r0=491(x1), r1=89(y1), r2=40(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 89
LDI r2, 40
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
