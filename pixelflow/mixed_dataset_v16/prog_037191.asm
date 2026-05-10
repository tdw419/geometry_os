; DESCRIPTION: Renders a purple line between points (24, 75) and (211, 229).
; PLAN: r0=24(x1), r1=75(y1), r2=211(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 75
LDI r2, 211
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
