; DESCRIPTION: Renders a purple line between points (103, 123) and (172, 148).
; PLAN: r0=103(x1), r1=123(y1), r2=172(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 123
LDI r2, 172
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
