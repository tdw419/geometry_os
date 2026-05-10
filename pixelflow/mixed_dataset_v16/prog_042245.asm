; DESCRIPTION: Composite: Places a orange line segment connecting (270, 241) to (389, 217) then Draws a green circle centered at (178, 122) with radius 62.
; PLAN: r0=270(x1), r1=241(y1), r2=389(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=178(x), r6=122(y), r7=62(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 270
LDI r1, 241
LDI r2, 389
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 122
LDI r7, 62
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
