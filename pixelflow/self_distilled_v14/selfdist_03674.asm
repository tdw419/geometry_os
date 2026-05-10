; DESCRIPTION: Draws a orange line from (156, 144) to (332, 38).
; PLAN: r0=156(x1), r1=144(y1), r2=332(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 144
LDI r2, 332
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
