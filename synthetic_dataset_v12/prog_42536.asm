; DESCRIPTION: Draws a blue line from (451, 131) to (59, 100).
; PLAN: r0=451(x1), r1=131(y1), r2=59(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 131
LDI r2, 59
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
