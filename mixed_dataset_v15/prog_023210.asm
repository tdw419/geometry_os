; DESCRIPTION: Places a blue line segment connecting (185, 76) to (369, 56).
; PLAN: r0=185(x1), r1=76(y1), r2=369(x2), r3=56(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 76
LDI r2, 369
LDI r3, 56
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
