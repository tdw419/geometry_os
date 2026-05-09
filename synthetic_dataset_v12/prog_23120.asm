; DESCRIPTION: Renders a purple line between points (289, 204) and (435, 17).
; PLAN: r0=289(x1), r1=204(y1), r2=435(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 204
LDI r2, 435
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
