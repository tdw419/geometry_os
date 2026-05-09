; DESCRIPTION: Places a orange line segment connecting (175, 174) to (212, 144).
; PLAN: r0=175(x1), r1=174(y1), r2=212(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 174
LDI r2, 212
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
