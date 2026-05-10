; DESCRIPTION: Renders a purple line between points (278, 155) and (83, 156).
; PLAN: r0=278(x1), r1=155(y1), r2=83(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 155
LDI r2, 83
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
