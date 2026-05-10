; DESCRIPTION: Renders a purple line between points (86, 53) and (248, 118).
; PLAN: r0=86(x1), r1=53(y1), r2=248(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 53
LDI r2, 248
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
