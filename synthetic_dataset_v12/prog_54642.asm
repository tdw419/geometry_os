; DESCRIPTION: Renders a blue line between points (8, 92) and (129, 248).
; PLAN: r0=8(x1), r1=92(y1), r2=129(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 92
LDI r2, 129
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
