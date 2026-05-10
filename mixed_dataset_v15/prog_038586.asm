; DESCRIPTION: Places a blue line segment connecting (148, 29) to (355, 96).
; PLAN: r0=148(x1), r1=29(y1), r2=355(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 29
LDI r2, 355
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
