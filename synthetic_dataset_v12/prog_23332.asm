; DESCRIPTION: Renders a purple line between points (83, 35) and (75, 191).
; PLAN: r0=83(x1), r1=35(y1), r2=75(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 35
LDI r2, 75
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
