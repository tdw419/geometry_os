; DESCRIPTION: Draws a blue line from (147, 78) to (114, 233).
; PLAN: r0=147(x1), r1=78(y1), r2=114(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 78
LDI r2, 114
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
