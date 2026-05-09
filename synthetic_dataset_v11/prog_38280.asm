; DESCRIPTION: Draws a yellow line from (74, 253) to (181, 65).
; PLAN: r0=74(x1), r1=253(y1), r2=181(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 253
LDI r2, 181
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
