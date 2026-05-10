; DESCRIPTION: Draws a orange line from (411, 144) to (373, 20).
; PLAN: r0=411(x1), r1=144(y1), r2=373(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 144
LDI r2, 373
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
