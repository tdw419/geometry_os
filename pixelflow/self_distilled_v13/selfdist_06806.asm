; DESCRIPTION: Draws a yellow line from (66, 157) to (66, 9).
; PLAN: r0=66(x1), r1=157(y1), r2=66(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 157
LDI r2, 66
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
