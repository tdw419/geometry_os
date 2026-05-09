; DESCRIPTION: Places a blue line segment connecting (280, 216) to (84, 62).
; PLAN: r0=280(x1), r1=216(y1), r2=84(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 216
LDI r2, 84
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
