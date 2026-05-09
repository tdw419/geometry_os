; DESCRIPTION: Places a orange line segment connecting (425, 44) to (13, 183).
; PLAN: r0=425(x1), r1=44(y1), r2=13(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 44
LDI r2, 13
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
