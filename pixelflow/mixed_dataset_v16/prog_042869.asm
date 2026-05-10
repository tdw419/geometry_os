; DESCRIPTION: Draws a blue line from (147, 145) to (170, 233).
; PLAN: r0=147(x1), r1=145(y1), r2=170(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 145
LDI r2, 170
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
