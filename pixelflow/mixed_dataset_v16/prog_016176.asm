; DESCRIPTION: Draws a purple line from (114, 252) to (137, 63).
; PLAN: r0=114(x1), r1=252(y1), r2=137(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 252
LDI r2, 137
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
