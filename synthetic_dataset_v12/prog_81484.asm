; DESCRIPTION: Renders a purple line between points (316, 240) and (185, 105).
; PLAN: r0=316(x1), r1=240(y1), r2=185(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 240
LDI r2, 185
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
