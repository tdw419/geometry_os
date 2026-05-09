; DESCRIPTION: Renders a blue line between points (484, 119) and (54, 37).
; PLAN: r0=484(x1), r1=119(y1), r2=54(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 119
LDI r2, 54
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
