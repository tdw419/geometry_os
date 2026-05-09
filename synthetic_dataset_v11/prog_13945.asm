; DESCRIPTION: Renders a purple line between points (251, 240) and (231, 147).
; PLAN: r0=251(x1), r1=240(y1), r2=231(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 240
LDI r2, 231
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
