; DESCRIPTION: Renders a purple line between points (34, 25) and (141, 243).
; PLAN: r0=34(x1), r1=25(y1), r2=141(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 25
LDI r2, 141
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
