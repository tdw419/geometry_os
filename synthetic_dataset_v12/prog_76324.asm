; DESCRIPTION: Composite: Places a red line segment connecting (496, 170) to (282, 123) then Draws a purple circle centered at (177, 35) with radius 30.
; PLAN: r0=496(x1), r1=170(y1), r2=282(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=177(x), r6=35(y), r7=30(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 496
LDI r1, 170
LDI r2, 282
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 35
LDI r7, 30
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
