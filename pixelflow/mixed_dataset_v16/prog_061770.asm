; DESCRIPTION: Places a blue line segment connecting (355, 57) to (92, 71).
; PLAN: r0=355(x1), r1=57(y1), r2=92(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 57
LDI r2, 92
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
