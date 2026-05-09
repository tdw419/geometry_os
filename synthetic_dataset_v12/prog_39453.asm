; DESCRIPTION: Places a orange line segment connecting (186, 156) to (117, 7).
; PLAN: r0=186(x1), r1=156(y1), r2=117(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 156
LDI r2, 117
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
