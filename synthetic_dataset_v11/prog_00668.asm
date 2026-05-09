; DESCRIPTION: Draws a blue line from (96, 142) to (36, 155).
; PLAN: r0=96(x1), r1=142(y1), r2=36(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 142
LDI r2, 36
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
