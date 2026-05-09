; DESCRIPTION: Renders a purple line between points (123, 247) and (17, 80).
; PLAN: r0=123(x1), r1=247(y1), r2=17(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 247
LDI r2, 17
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
