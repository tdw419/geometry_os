; DESCRIPTION: Draws a yellow line from (36, 121) to (8, 56).
; PLAN: r0=36(x1), r1=121(y1), r2=8(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 121
LDI r2, 8
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
