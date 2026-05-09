; DESCRIPTION: Composite: Creates a green circular shape at (456, 78) with radius 30 then Places a orange line segment connecting (344, 191) to (444, 4).
; PLAN: r0=456(x), r1=78(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=344(x1), r6=191(y1), r7=444(x2), r8=4(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 456
LDI r1, 78
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 344
LDI r6, 191
LDI r7, 444
LDI r8, 4
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
