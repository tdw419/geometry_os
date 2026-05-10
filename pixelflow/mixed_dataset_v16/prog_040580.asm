; DESCRIPTION: Renders a purple line between points (381, 40) and (160, 74).
; PLAN: r0=381(x1), r1=40(y1), r2=160(x2), r3=74(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 40
LDI r2, 160
LDI r3, 74
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
