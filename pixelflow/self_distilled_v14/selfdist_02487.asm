; DESCRIPTION: Draws a blue line from (38, 119) to (98, 96).
; PLAN: r0=38(x1), r1=119(y1), r2=98(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 119
LDI r2, 98
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
