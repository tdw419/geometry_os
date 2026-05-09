; DESCRIPTION: Draws a blue line from (423, 106) to (432, 119).
; PLAN: r0=423(x1), r1=106(y1), r2=432(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 106
LDI r2, 432
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
