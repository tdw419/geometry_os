; DESCRIPTION: Renders a purple line between points (86, 193) and (148, 123).
; PLAN: r0=86(x1), r1=193(y1), r2=148(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 193
LDI r2, 148
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
