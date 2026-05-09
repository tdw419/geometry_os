; DESCRIPTION: Renders a purple line between points (234, 15) and (200, 123).
; PLAN: r0=234(x1), r1=15(y1), r2=200(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 15
LDI r2, 200
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
