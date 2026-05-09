; DESCRIPTION: Composite: Draws a black circle centered at (277, 52) with radius 31 then Sets a single green pixel at (106, 69).
; PLAN: r0=277(x), r1=52(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=106(x), r6=69(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 277
LDI r1, 52
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 106
LDI r6, 69
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
