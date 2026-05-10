; DESCRIPTION: Draws a blue line from (366, 25) to (342, 80).
; PLAN: r0=366(x1), r1=25(y1), r2=342(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 25
LDI r2, 342
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
