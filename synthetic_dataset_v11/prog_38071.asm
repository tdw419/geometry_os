; DESCRIPTION: Draws a blue line from (108, 145) to (47, 22).
; PLAN: r0=108(x1), r1=145(y1), r2=47(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 145
LDI r2, 47
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
