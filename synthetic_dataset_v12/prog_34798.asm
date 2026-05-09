; DESCRIPTION: Renders a purple line between points (351, 103) and (140, 116).
; PLAN: r0=351(x1), r1=103(y1), r2=140(x2), r3=116(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 103
LDI r2, 140
LDI r3, 116
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
