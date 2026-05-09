; DESCRIPTION: Renders a purple line between points (12, 20) and (185, 205).
; PLAN: r0=12(x1), r1=20(y1), r2=185(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 20
LDI r2, 185
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
