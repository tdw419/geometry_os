; DESCRIPTION: Composite: Places a magenta line segment connecting (424, 247) to (506, 123) then Draws a orange circle centered at (160, 170) with radius 75.
; PLAN: r0=424(x1), r1=247(y1), r2=506(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=160(x), r6=170(y), r7=75(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 424
LDI r1, 247
LDI r2, 506
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 170
LDI r7, 75
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
