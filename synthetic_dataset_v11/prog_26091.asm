; DESCRIPTION: Draws a purple line from (189, 89) to (55, 101).
; PLAN: r0=189(x1), r1=89(y1), r2=55(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 89
LDI r2, 55
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
