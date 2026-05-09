; DESCRIPTION: Renders a purple line between points (291, 199) and (427, 46).
; PLAN: r0=291(x1), r1=199(y1), r2=427(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 199
LDI r2, 427
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
