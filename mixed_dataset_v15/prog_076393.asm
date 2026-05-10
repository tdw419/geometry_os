; DESCRIPTION: Renders a purple line between points (483, 132) and (376, 15).
; PLAN: r0=483(x1), r1=132(y1), r2=376(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 132
LDI r2, 376
LDI r3, 15
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
