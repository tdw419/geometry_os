; DESCRIPTION: Renders a purple line between points (71, 124) and (200, 4).
; PLAN: r0=71(x1), r1=124(y1), r2=200(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 124
LDI r2, 200
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
