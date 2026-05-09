; DESCRIPTION: Renders a blue line between points (131, 223) and (201, 201).
; PLAN: r0=131(x1), r1=223(y1), r2=201(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 223
LDI r2, 201
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
