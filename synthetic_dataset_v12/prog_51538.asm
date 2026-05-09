; DESCRIPTION: Composite: Draws a orange circle centered at (298, 59) with radius 57 then Places a purple line segment connecting (471, 239) to (478, 251).
; PLAN: r0=298(x), r1=59(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=471(x1), r6=239(y1), r7=478(x2), r8=251(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 298
LDI r1, 59
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 471
LDI r6, 239
LDI r7, 478
LDI r8, 251
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
