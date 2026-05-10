; DESCRIPTION: Draws a yellow line from (129, 81) to (101, 10).
; PLAN: r0=129(x1), r1=81(y1), r2=101(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 81
LDI r2, 101
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
