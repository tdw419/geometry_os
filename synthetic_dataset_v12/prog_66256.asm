; DESCRIPTION: Draws a yellow line from (343, 157) to (88, 63).
; PLAN: r0=343(x1), r1=157(y1), r2=88(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 157
LDI r2, 88
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
