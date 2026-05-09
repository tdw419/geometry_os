; DESCRIPTION: Draws a purple line from (166, 154) to (222, 232).
; PLAN: r0=166(x1), r1=154(y1), r2=222(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 154
LDI r2, 222
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
