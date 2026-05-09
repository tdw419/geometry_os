; DESCRIPTION: Renders a blue line between points (249, 56) and (86, 201).
; PLAN: r0=249(x1), r1=56(y1), r2=86(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 56
LDI r2, 86
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
