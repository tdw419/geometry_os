; DESCRIPTION: Renders a purple line between points (47, 85) and (442, 109).
; PLAN: r0=47(x1), r1=85(y1), r2=442(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 85
LDI r2, 442
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
