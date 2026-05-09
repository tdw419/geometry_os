; DESCRIPTION: Renders a purple line between points (144, 2) and (105, 197).
; PLAN: r0=144(x1), r1=2(y1), r2=105(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 2
LDI r2, 105
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
