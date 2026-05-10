; DESCRIPTION: Places a orange line segment connecting (255, 61) to (427, 204).
; PLAN: r0=255(x1), r1=61(y1), r2=427(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 61
LDI r2, 427
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
