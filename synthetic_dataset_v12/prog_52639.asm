; DESCRIPTION: Renders a magenta line between points (334, 46) and (355, 35).
; PLAN: r0=334(x1), r1=46(y1), r2=355(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 46
LDI r2, 355
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
