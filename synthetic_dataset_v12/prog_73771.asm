; DESCRIPTION: Places a orange line segment connecting (28, 253) to (91, 188).
; PLAN: r0=28(x1), r1=253(y1), r2=91(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 253
LDI r2, 91
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
