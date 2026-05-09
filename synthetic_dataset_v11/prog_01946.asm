; DESCRIPTION: Renders a purple line between points (212, 20) and (88, 99).
; PLAN: r0=212(x1), r1=20(y1), r2=88(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 20
LDI r2, 88
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
