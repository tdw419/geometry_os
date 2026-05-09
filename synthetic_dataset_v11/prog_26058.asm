; DESCRIPTION: Renders a blue line between points (36, 96) and (5, 129).
; PLAN: r0=36(x1), r1=96(y1), r2=5(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 96
LDI r2, 5
LDI r3, 129
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
