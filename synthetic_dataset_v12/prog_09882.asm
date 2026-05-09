; DESCRIPTION: Draws a purple line from (385, 88) to (341, 83).
; PLAN: r0=385(x1), r1=88(y1), r2=341(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 88
LDI r2, 341
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
