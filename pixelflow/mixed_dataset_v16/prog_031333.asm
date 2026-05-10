; DESCRIPTION: Renders a purple line between points (381, 150) and (462, 2).
; PLAN: r0=381(x1), r1=150(y1), r2=462(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 150
LDI r2, 462
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
