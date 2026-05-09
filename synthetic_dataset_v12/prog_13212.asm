; DESCRIPTION: Draws a purple line from (37, 222) to (337, 65).
; PLAN: r0=37(x1), r1=222(y1), r2=337(x2), r3=65(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 222
LDI r2, 337
LDI r3, 65
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
