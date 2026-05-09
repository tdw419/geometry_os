; DESCRIPTION: Renders a purple line between points (220, 180) and (119, 100).
; PLAN: r0=220(x1), r1=180(y1), r2=119(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 180
LDI r2, 119
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
