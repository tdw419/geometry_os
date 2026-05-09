; DESCRIPTION: Renders a purple line between points (78, 81) and (129, 140).
; PLAN: r0=78(x1), r1=81(y1), r2=129(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 81
LDI r2, 129
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
