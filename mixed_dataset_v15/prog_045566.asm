; DESCRIPTION: Places a orange line segment connecting (44, 84) to (438, 21).
; PLAN: r0=44(x1), r1=84(y1), r2=438(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 84
LDI r2, 438
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
