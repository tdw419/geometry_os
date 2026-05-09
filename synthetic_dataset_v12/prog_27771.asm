; DESCRIPTION: Renders a yellow line between points (201, 35) and (56, 69).
; PLAN: r0=201(x1), r1=35(y1), r2=56(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 35
LDI r2, 56
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
