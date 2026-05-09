; DESCRIPTION: Renders a blue line between points (129, 68) and (30, 138).
; PLAN: r0=129(x1), r1=68(y1), r2=30(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 68
LDI r2, 30
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
