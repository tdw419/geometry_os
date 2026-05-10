; DESCRIPTION: Renders a purple line between points (250, 49) and (246, 251).
; PLAN: r0=250(x1), r1=49(y1), r2=246(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 49
LDI r2, 246
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
