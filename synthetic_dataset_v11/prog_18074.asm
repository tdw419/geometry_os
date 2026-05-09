; DESCRIPTION: Draws a blue line from (163, 180) to (78, 69).
; PLAN: r0=163(x1), r1=180(y1), r2=78(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 180
LDI r2, 78
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
