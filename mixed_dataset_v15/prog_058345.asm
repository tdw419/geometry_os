; DESCRIPTION: Renders a purple line between points (195, 178) and (459, 147).
; PLAN: r0=195(x1), r1=178(y1), r2=459(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 178
LDI r2, 459
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
