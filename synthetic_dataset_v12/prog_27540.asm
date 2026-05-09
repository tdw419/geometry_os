; DESCRIPTION: Renders a purple line between points (68, 21) and (85, 51).
; PLAN: r0=68(x1), r1=21(y1), r2=85(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 21
LDI r2, 85
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
