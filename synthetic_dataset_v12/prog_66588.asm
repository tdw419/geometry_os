; DESCRIPTION: Renders a purple line between points (75, 210) and (147, 123).
; PLAN: r0=75(x1), r1=210(y1), r2=147(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 210
LDI r2, 147
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
