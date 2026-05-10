; DESCRIPTION: Composite: Draws a green circle centered at (172, 77) with radius 69 then Sets a single black pixel at (144, 100).
; PLAN: r0=172(x), r1=77(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=144(x), r6=100(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 172
LDI r1, 77
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 144
LDI r6, 100
LDI r7, 0x000000
PSET r5, r6, r7
HALT
