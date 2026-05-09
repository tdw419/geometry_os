; DESCRIPTION: Renders a orange line between points (335, 216) and (163, 132).
; PLAN: r0=335(x1), r1=216(y1), r2=163(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 216
LDI r2, 163
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
