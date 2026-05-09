; DESCRIPTION: Renders a blue line between points (74, 210) and (11, 201).
; PLAN: r0=74(x1), r1=210(y1), r2=11(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 210
LDI r2, 11
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
