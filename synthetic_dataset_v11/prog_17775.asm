; DESCRIPTION: Renders a purple line between points (198, 101) and (137, 223).
; PLAN: r0=198(x1), r1=101(y1), r2=137(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 101
LDI r2, 137
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
