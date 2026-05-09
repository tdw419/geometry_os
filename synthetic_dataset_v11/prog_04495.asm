; DESCRIPTION: Renders a purple line between points (132, 25) and (212, 78).
; PLAN: r0=132(x1), r1=25(y1), r2=212(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 25
LDI r2, 212
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
