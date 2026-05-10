; DESCRIPTION: Draws a blue line from (118, 133) to (129, 157).
; PLAN: r0=118(x1), r1=133(y1), r2=129(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 133
LDI r2, 129
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
