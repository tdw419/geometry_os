; DESCRIPTION: Draws a blue line from (508, 119) to (22, 110).
; PLAN: r0=508(x1), r1=119(y1), r2=22(x2), r3=110(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 119
LDI r2, 22
LDI r3, 110
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
