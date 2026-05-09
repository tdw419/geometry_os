; DESCRIPTION: Draws a blue line from (121, 1) to (451, 230).
; PLAN: r0=121(x1), r1=1(y1), r2=451(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 1
LDI r2, 451
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
