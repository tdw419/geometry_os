; DESCRIPTION: Renders a purple line between points (28, 35) and (118, 218).
; PLAN: r0=28(x1), r1=35(y1), r2=118(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 35
LDI r2, 118
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
