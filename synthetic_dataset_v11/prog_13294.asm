; DESCRIPTION: Renders a purple line between points (121, 0) and (249, 99).
; PLAN: r0=121(x1), r1=0(y1), r2=249(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 0
LDI r2, 249
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
