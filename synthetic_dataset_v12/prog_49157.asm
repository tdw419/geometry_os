; DESCRIPTION: Places a blue line segment connecting (18, 216) to (227, 237).
; PLAN: r0=18(x1), r1=216(y1), r2=227(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 216
LDI r2, 227
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
