; DESCRIPTION: Renders a blue line between points (1, 199) and (78, 170).
; PLAN: r0=1(x1), r1=199(y1), r2=78(x2), r3=170(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 199
LDI r2, 78
LDI r3, 170
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
