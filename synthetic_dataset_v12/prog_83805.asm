; DESCRIPTION: Places a orange line segment connecting (364, 136) to (281, 119).
; PLAN: r0=364(x1), r1=136(y1), r2=281(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 136
LDI r2, 281
LDI r3, 119
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
