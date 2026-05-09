; DESCRIPTION: Places a blue line segment connecting (176, 123) to (216, 196).
; PLAN: r0=176(x1), r1=123(y1), r2=216(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 123
LDI r2, 216
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
