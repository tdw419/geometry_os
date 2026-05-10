; DESCRIPTION: Places a orange line segment connecting (272, 50) to (175, 2).
; PLAN: r0=272(x1), r1=50(y1), r2=175(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 50
LDI r2, 175
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
