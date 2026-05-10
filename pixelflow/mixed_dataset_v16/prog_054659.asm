; DESCRIPTION: Renders a purple line between points (130, 83) and (293, 218).
; PLAN: r0=130(x1), r1=83(y1), r2=293(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 83
LDI r2, 293
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
