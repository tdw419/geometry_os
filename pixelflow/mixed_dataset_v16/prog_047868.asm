; DESCRIPTION: Places a blue line segment connecting (334, 57) to (355, 17).
; PLAN: r0=334(x1), r1=57(y1), r2=355(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 57
LDI r2, 355
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
