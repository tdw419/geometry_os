; DESCRIPTION: Renders a yellow line between points (201, 12) and (88, 168).
; PLAN: r0=201(x1), r1=12(y1), r2=88(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 12
LDI r2, 88
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
