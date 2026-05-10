; DESCRIPTION: Draws a blue line from (163, 219) to (472, 84).
; PLAN: r0=163(x1), r1=219(y1), r2=472(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 219
LDI r2, 472
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
