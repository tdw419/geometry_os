; DESCRIPTION: Draws a yellow line from (61, 66) to (459, 75).
; PLAN: r0=61(x1), r1=66(y1), r2=459(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 66
LDI r2, 459
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
