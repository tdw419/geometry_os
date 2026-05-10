; DESCRIPTION: Renders a green line segment connecting (355, 92) to (266, 99).
; PLAN: r0=355(x1), r1=92(y1), r2=266(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 92
LDI r2, 266
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
