; DESCRIPTION: Draws a yellow line from (101, 195) to (222, 122).
; PLAN: r0=101(x1), r1=195(y1), r2=222(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 195
LDI r2, 222
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
