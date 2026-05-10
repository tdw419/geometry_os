; DESCRIPTION: Places a blue line segment connecting (392, 131) to (216, 163).
; PLAN: r0=392(x1), r1=131(y1), r2=216(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 131
LDI r2, 216
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
