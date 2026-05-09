; DESCRIPTION: Draws a yellow line from (99, 106) to (241, 181).
; PLAN: r0=99(x1), r1=106(y1), r2=241(x2), r3=181(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 106
LDI r2, 241
LDI r3, 181
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
