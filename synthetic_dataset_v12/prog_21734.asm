; DESCRIPTION: Renders a purple line between points (283, 75) and (120, 155).
; PLAN: r0=283(x1), r1=75(y1), r2=120(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 75
LDI r2, 120
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
