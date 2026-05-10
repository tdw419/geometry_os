; DESCRIPTION: Draws a purple line from (266, 53) to (86, 155).
; PLAN: r0=266(x1), r1=53(y1), r2=86(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 53
LDI r2, 86
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
