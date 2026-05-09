; DESCRIPTION: Renders a purple line between points (402, 167) and (250, 211).
; PLAN: r0=402(x1), r1=167(y1), r2=250(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 167
LDI r2, 250
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
