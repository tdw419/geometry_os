; DESCRIPTION: Draws a purple line from (35, 111) to (69, 147).
; PLAN: r0=35(x1), r1=111(y1), r2=69(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 111
LDI r2, 69
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
