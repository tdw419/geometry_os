; DESCRIPTION: Renders a purple line between points (58, 181) and (43, 64).
; PLAN: r0=58(x1), r1=181(y1), r2=43(x2), r3=64(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 181
LDI r2, 43
LDI r3, 64
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
