; DESCRIPTION: Draws a purple line from (147, 195) to (1, 26).
; PLAN: r0=147(x1), r1=195(y1), r2=1(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 195
LDI r2, 1
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
