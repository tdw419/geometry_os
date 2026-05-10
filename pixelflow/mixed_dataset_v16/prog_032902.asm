; DESCRIPTION: Draws a yellow line from (459, 6) to (486, 157).
; PLAN: r0=459(x1), r1=6(y1), r2=486(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 6
LDI r2, 486
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
