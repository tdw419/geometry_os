; DESCRIPTION: Renders a purple line between points (13, 198) and (264, 191).
; PLAN: r0=13(x1), r1=198(y1), r2=264(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 198
LDI r2, 264
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
