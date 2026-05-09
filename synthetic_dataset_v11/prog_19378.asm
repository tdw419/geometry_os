; DESCRIPTION: Draws a purple line from (55, 19) to (192, 156).
; PLAN: r0=55(x1), r1=19(y1), r2=192(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 19
LDI r2, 192
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
