; DESCRIPTION: Draws a yellow line from (163, 49) to (174, 58).
; PLAN: r0=163(x1), r1=49(y1), r2=174(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 49
LDI r2, 174
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
