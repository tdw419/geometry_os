; DESCRIPTION: Draws a blue line from (155, 229) to (121, 59).
; PLAN: r0=155(x1), r1=229(y1), r2=121(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 229
LDI r2, 121
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
