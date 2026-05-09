; DESCRIPTION: Renders a purple line between points (230, 186) and (103, 66).
; PLAN: r0=230(x1), r1=186(y1), r2=103(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 186
LDI r2, 103
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
