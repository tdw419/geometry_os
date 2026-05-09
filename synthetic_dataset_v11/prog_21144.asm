; DESCRIPTION: Draws a yellow line from (54, 34) to (183, 115).
; PLAN: r0=54(x1), r1=34(y1), r2=183(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 34
LDI r2, 183
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
