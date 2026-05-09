; DESCRIPTION: Renders a purple line between points (222, 35) and (279, 144).
; PLAN: r0=222(x1), r1=35(y1), r2=279(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 35
LDI r2, 279
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
