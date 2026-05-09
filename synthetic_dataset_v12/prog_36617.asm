; DESCRIPTION: Draws a orange line from (163, 31) to (23, 144).
; PLAN: r0=163(x1), r1=31(y1), r2=23(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 31
LDI r2, 23
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
