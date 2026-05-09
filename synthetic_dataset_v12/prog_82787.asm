; DESCRIPTION: Places a orange line segment connecting (150, 91) to (318, 192).
; PLAN: r0=150(x1), r1=91(y1), r2=318(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 91
LDI r2, 318
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
