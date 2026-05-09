; DESCRIPTION: Draws a orange line from (144, 4) to (157, 222).
; PLAN: r0=144(x1), r1=4(y1), r2=157(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 4
LDI r2, 157
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
