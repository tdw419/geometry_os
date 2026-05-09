; DESCRIPTION: Renders a purple line between points (40, 4) and (62, 13).
; PLAN: r0=40(x1), r1=4(y1), r2=62(x2), r3=13(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 4
LDI r2, 62
LDI r3, 13
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
