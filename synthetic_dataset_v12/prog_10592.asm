; DESCRIPTION: Renders a purple line between points (295, 119) and (155, 199).
; PLAN: r0=295(x1), r1=119(y1), r2=155(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 119
LDI r2, 155
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
