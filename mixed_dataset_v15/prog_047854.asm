; DESCRIPTION: Renders a purple line between points (95, 91) and (490, 72).
; PLAN: r0=95(x1), r1=91(y1), r2=490(x2), r3=72(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 91
LDI r2, 490
LDI r3, 72
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
