; DESCRIPTION: Draws a blue line from (78, 133) to (155, 74).
; PLAN: r0=78(x1), r1=133(y1), r2=155(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 133
LDI r2, 155
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
