; DESCRIPTION: Draws a yellow line from (170, 167) to (165, 9).
; PLAN: r0=170(x1), r1=167(y1), r2=165(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 167
LDI r2, 165
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
