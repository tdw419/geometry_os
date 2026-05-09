; DESCRIPTION: Renders a blue line between points (201, 96) and (129, 27).
; PLAN: r0=201(x1), r1=96(y1), r2=129(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 96
LDI r2, 129
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
