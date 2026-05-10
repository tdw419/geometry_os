; DESCRIPTION: Renders a purple line between points (393, 198) and (102, 11).
; PLAN: r0=393(x1), r1=198(y1), r2=102(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 198
LDI r2, 102
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
