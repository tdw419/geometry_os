; DESCRIPTION: Renders a purple line between points (334, 124) and (458, 110).
; PLAN: r0=334(x1), r1=124(y1), r2=458(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 124
LDI r2, 458
LDI r3, 110
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
