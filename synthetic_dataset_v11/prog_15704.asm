; DESCRIPTION: Renders a purple line between points (104, 106) and (143, 29).
; PLAN: r0=104(x1), r1=106(y1), r2=143(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 106
LDI r2, 143
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
