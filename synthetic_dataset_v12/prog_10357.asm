; DESCRIPTION: Places a orange line segment connecting (192, 75) to (425, 79).
; PLAN: r0=192(x1), r1=75(y1), r2=425(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 75
LDI r2, 425
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
