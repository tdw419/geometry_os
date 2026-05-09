; DESCRIPTION: Composite: Draws a purple line from (275, 104) to (490, 148) then Creates a yellow circular shape at (413, 163) with radius 61.
; PLAN: r0=275(x1), r1=104(y1), r2=490(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=413(x), r6=163(y), r7=61(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 275
LDI r1, 104
LDI r2, 490
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 163
LDI r7, 61
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
