; DESCRIPTION: Renders a purple line between points (103, 103) and (78, 145).
; PLAN: r0=103(x1), r1=103(y1), r2=78(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 103
LDI r2, 78
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
