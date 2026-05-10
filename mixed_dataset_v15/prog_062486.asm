; DESCRIPTION: Composite: Places a orange line segment connecting (411, 220) to (166, 61) then Creates a yellow circular shape at (104, 170) with radius 51.
; PLAN: r0=411(x1), r1=220(y1), r2=166(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=104(x), r6=170(y), r7=51(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 411
LDI r1, 220
LDI r2, 166
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 170
LDI r7, 51
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
