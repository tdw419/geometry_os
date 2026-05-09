; DESCRIPTION: Renders a purple line between points (66, 198) and (117, 118).
; PLAN: r0=66(x1), r1=198(y1), r2=117(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 198
LDI r2, 117
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
