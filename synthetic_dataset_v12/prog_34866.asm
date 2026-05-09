; DESCRIPTION: Draws a purple line from (131, 62) to (222, 108).
; PLAN: r0=131(x1), r1=62(y1), r2=222(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 62
LDI r2, 222
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
