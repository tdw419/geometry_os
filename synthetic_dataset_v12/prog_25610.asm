; DESCRIPTION: Draws a yellow line from (129, 6) to (316, 226).
; PLAN: r0=129(x1), r1=6(y1), r2=316(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 6
LDI r2, 316
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
