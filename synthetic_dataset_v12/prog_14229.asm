; DESCRIPTION: Places a blue line segment connecting (457, 210) to (451, 52).
; PLAN: r0=457(x1), r1=210(y1), r2=451(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 210
LDI r2, 451
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
