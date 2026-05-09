; DESCRIPTION: Renders a blue line between points (9, 89) and (216, 69).
; PLAN: r0=9(x1), r1=89(y1), r2=216(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 89
LDI r2, 216
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
