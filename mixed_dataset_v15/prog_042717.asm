; DESCRIPTION: Composite: Places a red line segment connecting (420, 75) to (251, 211) then Draws a red circle centered at (378, 43) with radius 14.
; PLAN: r0=420(x1), r1=75(y1), r2=251(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=378(x), r6=43(y), r7=14(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 420
LDI r1, 75
LDI r2, 251
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 43
LDI r7, 14
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
