; DESCRIPTION: Renders a purple line between points (328, 33) and (134, 254).
; PLAN: r0=328(x1), r1=33(y1), r2=134(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 33
LDI r2, 134
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
