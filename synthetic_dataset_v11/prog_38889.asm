; DESCRIPTION: Draws a yellow line from (25, 26) to (241, 22).
; PLAN: r0=25(x1), r1=26(y1), r2=241(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 26
LDI r2, 241
LDI r3, 22
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
