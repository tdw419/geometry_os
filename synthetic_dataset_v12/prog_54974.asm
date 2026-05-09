; DESCRIPTION: Renders a purple line between points (119, 10) and (20, 3).
; PLAN: r0=119(x1), r1=10(y1), r2=20(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 10
LDI r2, 20
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
