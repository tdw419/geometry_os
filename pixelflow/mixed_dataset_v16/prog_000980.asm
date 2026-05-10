; DESCRIPTION: Draws a blue line from (90, 118) to (451, 223).
; PLAN: r0=90(x1), r1=118(y1), r2=451(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 118
LDI r2, 451
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
