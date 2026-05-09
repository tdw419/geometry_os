; DESCRIPTION: Renders a blue line between points (47, 2) and (117, 216).
; PLAN: r0=47(x1), r1=2(y1), r2=117(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 2
LDI r2, 117
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
