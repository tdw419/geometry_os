; DESCRIPTION: Renders a blue line between points (11, 139) and (138, 144).
; PLAN: r0=11(x1), r1=139(y1), r2=138(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 139
LDI r2, 138
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
