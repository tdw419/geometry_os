; DESCRIPTION: Draws a purple line from (314, 121) to (72, 80).
; PLAN: r0=314(x1), r1=121(y1), r2=72(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 121
LDI r2, 72
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
