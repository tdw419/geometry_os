; DESCRIPTION: Draws a yellow line from (316, 88) to (471, 6).
; PLAN: r0=316(x1), r1=88(y1), r2=471(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 88
LDI r2, 471
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
