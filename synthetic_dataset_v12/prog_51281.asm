; DESCRIPTION: Renders a purple line between points (285, 109) and (163, 70).
; PLAN: r0=285(x1), r1=109(y1), r2=163(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 109
LDI r2, 163
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
