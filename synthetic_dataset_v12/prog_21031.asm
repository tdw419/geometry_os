; DESCRIPTION: Composite: Draws a purple circle centered at (69, 55) with radius 30 then Sets a single yellow pixel at (211, 143).
; PLAN: r0=69(x), r1=55(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=211(x), r6=143(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 69
LDI r1, 55
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 211
LDI r6, 143
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
