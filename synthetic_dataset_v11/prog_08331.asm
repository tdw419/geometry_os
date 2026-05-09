; DESCRIPTION: Renders a purple line between points (188, 68) and (132, 94).
; PLAN: r0=188(x1), r1=68(y1), r2=132(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 68
LDI r2, 132
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
