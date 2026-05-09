; DESCRIPTION: Renders a purple line between points (131, 70) and (93, 52).
; PLAN: r0=131(x1), r1=70(y1), r2=93(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 70
LDI r2, 93
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
