; DESCRIPTION: Draws a yellow line from (118, 34) to (267, 61).
; PLAN: r0=118(x1), r1=34(y1), r2=267(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 34
LDI r2, 267
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
