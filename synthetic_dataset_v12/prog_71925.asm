; DESCRIPTION: Draws a purple line from (441, 166) to (222, 149).
; PLAN: r0=441(x1), r1=166(y1), r2=222(x2), r3=149(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 166
LDI r2, 222
LDI r3, 149
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
