; DESCRIPTION: Draws a purple line from (103, 79) to (192, 147).
; PLAN: r0=103(x1), r1=79(y1), r2=192(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 79
LDI r2, 192
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
