; DESCRIPTION: Renders a purple line between points (88, 26) and (32, 54).
; PLAN: r0=88(x1), r1=26(y1), r2=32(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 26
LDI r2, 32
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
