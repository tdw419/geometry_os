; DESCRIPTION: Renders a purple line between points (61, 116) and (144, 130).
; PLAN: r0=61(x1), r1=116(y1), r2=144(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 116
LDI r2, 144
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
