; DESCRIPTION: Draws a purple line from (232, 162) to (88, 58).
; PLAN: r0=232(x1), r1=162(y1), r2=88(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 162
LDI r2, 88
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
