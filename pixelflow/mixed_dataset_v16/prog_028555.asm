; DESCRIPTION: Composite: Places a orange line segment connecting (432, 185) to (134, 170) then Creates a green circular shape at (89, 122) with radius 18.
; PLAN: r0=432(x1), r1=185(y1), r2=134(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=89(x), r6=122(y), r7=18(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 432
LDI r1, 185
LDI r2, 134
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 122
LDI r7, 18
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
