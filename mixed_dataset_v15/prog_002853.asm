; DESCRIPTION: Draws a blue line from (221, 88) to (44, 80).
; PLAN: r0=221(x1), r1=88(y1), r2=44(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 88
LDI r2, 44
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
