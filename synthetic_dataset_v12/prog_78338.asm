; DESCRIPTION: Renders a blue line between points (366, 169) and (72, 122).
; PLAN: r0=366(x1), r1=169(y1), r2=72(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 169
LDI r2, 72
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
