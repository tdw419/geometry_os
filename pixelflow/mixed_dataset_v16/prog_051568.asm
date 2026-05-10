; DESCRIPTION: Renders a white line segment connecting (178, 127) to (355, 89).
; PLAN: r0=178(x1), r1=127(y1), r2=355(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 127
LDI r2, 355
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
