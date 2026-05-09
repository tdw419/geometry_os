; DESCRIPTION: Renders a blue line between points (216, 30) and (110, 140).
; PLAN: r0=216(x1), r1=30(y1), r2=110(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 30
LDI r2, 110
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
