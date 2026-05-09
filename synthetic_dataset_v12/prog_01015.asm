; DESCRIPTION: Renders a purple line between points (114, 187) and (324, 106).
; PLAN: r0=114(x1), r1=187(y1), r2=324(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 187
LDI r2, 324
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
