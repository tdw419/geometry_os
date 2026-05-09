; DESCRIPTION: Composite: Draws a black circle centered at (253, 164) with radius 55 then Sets a single yellow pixel at (66, 50).
; PLAN: r0=253(x), r1=164(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=66(x), r6=50(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 253
LDI r1, 164
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 66
LDI r6, 50
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
