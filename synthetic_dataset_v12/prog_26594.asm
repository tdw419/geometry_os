; DESCRIPTION: Renders a purple line between points (435, 131) and (265, 217).
; PLAN: r0=435(x1), r1=131(y1), r2=265(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 131
LDI r2, 265
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
