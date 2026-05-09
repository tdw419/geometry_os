; DESCRIPTION: Draws a yellow line from (17, 174) to (25, 25).
; PLAN: r0=17(x1), r1=174(y1), r2=25(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 174
LDI r2, 25
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
