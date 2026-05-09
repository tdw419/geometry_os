; DESCRIPTION: Composite: Places a orange line segment connecting (186, 31) to (155, 69) then Draws a blue circle centered at (468, 68) with radius 12.
; PLAN: r0=186(x1), r1=31(y1), r2=155(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=468(x), r6=68(y), r7=12(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 186
LDI r1, 31
LDI r2, 155
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 68
LDI r7, 12
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
