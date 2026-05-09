; DESCRIPTION: Renders a purple line between points (1, 122) and (45, 99).
; PLAN: r0=1(x1), r1=122(y1), r2=45(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 122
LDI r2, 45
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
