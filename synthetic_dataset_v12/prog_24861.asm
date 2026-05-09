; DESCRIPTION: Draws a purple line from (80, 121) to (441, 100).
; PLAN: r0=80(x1), r1=121(y1), r2=441(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 121
LDI r2, 441
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
