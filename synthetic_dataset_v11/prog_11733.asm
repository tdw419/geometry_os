; DESCRIPTION: Renders a purple line between points (188, 66) and (243, 211).
; PLAN: r0=188(x1), r1=66(y1), r2=243(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 66
LDI r2, 243
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
