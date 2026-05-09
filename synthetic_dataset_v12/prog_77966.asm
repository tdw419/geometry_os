; DESCRIPTION: Draws a yellow line from (144, 162) to (343, 156).
; PLAN: r0=144(x1), r1=162(y1), r2=343(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 162
LDI r2, 343
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
