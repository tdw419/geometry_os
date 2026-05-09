; DESCRIPTION: Renders a purple line between points (150, 20) and (10, 116).
; PLAN: r0=150(x1), r1=20(y1), r2=10(x2), r3=116(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 20
LDI r2, 10
LDI r3, 116
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
