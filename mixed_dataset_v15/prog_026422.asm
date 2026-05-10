; DESCRIPTION: Places a orange line segment connecting (16, 255) to (332, 97).
; PLAN: r0=16(x1), r1=255(y1), r2=332(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 255
LDI r2, 332
LDI r3, 97
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
