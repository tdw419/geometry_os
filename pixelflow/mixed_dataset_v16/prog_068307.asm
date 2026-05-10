; DESCRIPTION: Renders a purple line between points (5, 24) and (3, 84).
; PLAN: r0=5(x1), r1=24(y1), r2=3(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 24
LDI r2, 3
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
