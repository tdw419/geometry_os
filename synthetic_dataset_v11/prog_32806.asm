; DESCRIPTION: Renders a purple line between points (14, 18) and (222, 26).
; PLAN: r0=14(x1), r1=18(y1), r2=222(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 18
LDI r2, 222
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
