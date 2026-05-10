; DESCRIPTION: Renders a purple line between points (159, 124) and (71, 92).
; PLAN: r0=159(x1), r1=124(y1), r2=71(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 124
LDI r2, 71
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
