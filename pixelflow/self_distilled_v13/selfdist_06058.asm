; DESCRIPTION: Renders a purple line segment connecting (36, 85) to (337, 32).
; PLAN: r0=36(x1), r1=85(y1), r2=337(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 85
LDI r2, 337
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
