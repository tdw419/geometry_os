; DESCRIPTION: Renders a purple line between points (121, 28) and (29, 56).
; PLAN: r0=121(x1), r1=28(y1), r2=29(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 28
LDI r2, 29
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
