; DESCRIPTION: Renders a blue line between points (312, 77) and (442, 99).
; PLAN: r0=312(x1), r1=77(y1), r2=442(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 77
LDI r2, 442
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
