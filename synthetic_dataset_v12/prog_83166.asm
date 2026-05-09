; DESCRIPTION: Renders a purple line between points (78, 145) and (7, 71).
; PLAN: r0=78(x1), r1=145(y1), r2=7(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 145
LDI r2, 7
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
