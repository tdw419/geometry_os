; DESCRIPTION: Renders a blue line between points (183, 220) and (201, 131).
; PLAN: r0=183(x1), r1=220(y1), r2=201(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 220
LDI r2, 201
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
