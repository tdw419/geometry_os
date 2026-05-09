; DESCRIPTION: Renders a blue line between points (56, 221) and (133, 155).
; PLAN: r0=56(x1), r1=221(y1), r2=133(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 221
LDI r2, 133
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
