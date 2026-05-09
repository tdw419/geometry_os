; DESCRIPTION: Draws a orange line from (145, 194) to (144, 158).
; PLAN: r0=145(x1), r1=194(y1), r2=144(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 194
LDI r2, 144
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
