; DESCRIPTION: Draws a yellow line from (407, 34) to (40, 129).
; PLAN: r0=407(x1), r1=34(y1), r2=40(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 34
LDI r2, 40
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
