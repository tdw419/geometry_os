; DESCRIPTION: Renders a purple line between points (93, 196) and (450, 80).
; PLAN: r0=93(x1), r1=196(y1), r2=450(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 196
LDI r2, 450
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
