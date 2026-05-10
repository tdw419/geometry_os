; DESCRIPTION: Composite: Places a purple line segment connecting (492, 78) to (53, 63) then Creates a orange circular shape at (108, 91) with radius 80.
; PLAN: r0=492(x1), r1=78(y1), r2=53(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=108(x), r6=91(y), r7=80(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 492
LDI r1, 78
LDI r2, 53
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 91
LDI r7, 80
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
