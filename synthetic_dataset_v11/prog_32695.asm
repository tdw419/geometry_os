; DESCRIPTION: Renders a purple line between points (245, 180) and (22, 100).
; PLAN: r0=245(x1), r1=180(y1), r2=22(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 180
LDI r2, 22
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
