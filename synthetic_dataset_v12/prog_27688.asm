; DESCRIPTION: Renders a yellow line between points (314, 99) and (448, 138).
; PLAN: r0=314(x1), r1=99(y1), r2=448(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 99
LDI r2, 448
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
