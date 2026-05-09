; DESCRIPTION: Places a orange line segment connecting (316, 72) to (188, 127).
; PLAN: r0=316(x1), r1=72(y1), r2=188(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 72
LDI r2, 188
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
