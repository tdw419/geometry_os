; DESCRIPTION: Composite: Draws a red circle centered at (436, 201) with radius 50 then Places a orange line segment connecting (347, 0) to (374, 235).
; PLAN: r0=436(x), r1=201(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=347(x1), r6=0(y1), r7=374(x2), r8=235(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 436
LDI r1, 201
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 347
LDI r6, 0
LDI r7, 374
LDI r8, 235
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
