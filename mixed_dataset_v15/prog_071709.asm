; DESCRIPTION: Draws a yellow line from (188, 151) to (5, 115).
; PLAN: r0=188(x1), r1=151(y1), r2=5(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 151
LDI r2, 5
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
