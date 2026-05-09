; DESCRIPTION: Places a blue line segment connecting (200, 109) to (132, 163).
; PLAN: r0=200(x1), r1=109(y1), r2=132(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 109
LDI r2, 132
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
