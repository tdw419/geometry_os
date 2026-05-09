; DESCRIPTION: Renders a yellow line between points (124, 89) and (282, 170).
; PLAN: r0=124(x1), r1=89(y1), r2=282(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 89
LDI r2, 282
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
