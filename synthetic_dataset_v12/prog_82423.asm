; DESCRIPTION: Renders a purple line between points (321, 5) and (253, 203).
; PLAN: r0=321(x1), r1=5(y1), r2=253(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 5
LDI r2, 253
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
