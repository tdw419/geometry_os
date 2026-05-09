; DESCRIPTION: Renders a purple line between points (195, 246) and (246, 110).
; PLAN: r0=195(x1), r1=246(y1), r2=246(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 246
LDI r2, 246
LDI r3, 110
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
