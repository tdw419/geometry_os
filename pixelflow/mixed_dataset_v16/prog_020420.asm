; DESCRIPTION: Renders a purple line between points (78, 18) and (22, 33).
; PLAN: r0=78(x1), r1=18(y1), r2=22(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 18
LDI r2, 22
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
