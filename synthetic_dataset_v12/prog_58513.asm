; DESCRIPTION: Draws a purple line from (9, 50) to (147, 63).
; PLAN: r0=9(x1), r1=50(y1), r2=147(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 50
LDI r2, 147
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
