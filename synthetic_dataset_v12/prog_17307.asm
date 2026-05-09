; DESCRIPTION: Renders a purple line between points (316, 243) and (422, 200).
; PLAN: r0=316(x1), r1=243(y1), r2=422(x2), r3=200(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 243
LDI r2, 422
LDI r3, 200
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
