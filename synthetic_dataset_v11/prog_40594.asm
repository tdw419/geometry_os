; DESCRIPTION: Draws a yellow line from (167, 66) to (129, 101).
; PLAN: r0=167(x1), r1=66(y1), r2=129(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 66
LDI r2, 129
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
