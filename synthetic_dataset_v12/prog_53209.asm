; DESCRIPTION: Renders a purple line between points (85, 97) and (347, 37).
; PLAN: r0=85(x1), r1=97(y1), r2=347(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 97
LDI r2, 347
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
