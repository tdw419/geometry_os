; DESCRIPTION: Draws a yellow line from (449, 246) to (144, 108).
; PLAN: r0=449(x1), r1=246(y1), r2=144(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 246
LDI r2, 144
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
