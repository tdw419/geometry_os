; DESCRIPTION: Draws a blue line from (110, 160) to (339, 66).
; PLAN: r0=110(x1), r1=160(y1), r2=339(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 160
LDI r2, 339
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
