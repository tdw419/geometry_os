; DESCRIPTION: Draws a purple line from (147, 39) to (59, 122).
; PLAN: r0=147(x1), r1=39(y1), r2=59(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 39
LDI r2, 59
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
