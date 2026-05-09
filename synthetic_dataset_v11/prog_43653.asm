; DESCRIPTION: Renders a purple line between points (71, 126) and (28, 201).
; PLAN: r0=71(x1), r1=126(y1), r2=28(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 126
LDI r2, 28
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
