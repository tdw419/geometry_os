; DESCRIPTION: Renders a purple line between points (337, 116) and (80, 140).
; PLAN: r0=337(x1), r1=116(y1), r2=80(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 116
LDI r2, 80
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
