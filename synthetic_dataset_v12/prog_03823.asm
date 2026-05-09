; DESCRIPTION: Renders a purple line between points (419, 254) and (220, 118).
; PLAN: r0=419(x1), r1=254(y1), r2=220(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 254
LDI r2, 220
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
