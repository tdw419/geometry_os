; DESCRIPTION: Draws a yellow line from (179, 66) to (181, 36).
; PLAN: r0=179(x1), r1=66(y1), r2=181(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 66
LDI r2, 181
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
