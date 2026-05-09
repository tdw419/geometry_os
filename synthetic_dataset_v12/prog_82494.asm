; DESCRIPTION: Renders a purple line between points (40, 85) and (135, 148).
; PLAN: r0=40(x1), r1=85(y1), r2=135(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 85
LDI r2, 135
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
