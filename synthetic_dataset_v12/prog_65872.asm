; DESCRIPTION: Places a orange line segment connecting (128, 165) to (91, 137).
; PLAN: r0=128(x1), r1=165(y1), r2=91(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 165
LDI r2, 91
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
