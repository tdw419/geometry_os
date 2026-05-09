; DESCRIPTION: Renders a purple line between points (85, 29) and (243, 216).
; PLAN: r0=85(x1), r1=29(y1), r2=243(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 29
LDI r2, 243
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
