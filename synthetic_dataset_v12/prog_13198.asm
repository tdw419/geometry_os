; DESCRIPTION: Places a blue line segment connecting (467, 1) to (369, 2).
; PLAN: r0=467(x1), r1=1(y1), r2=369(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 1
LDI r2, 369
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
