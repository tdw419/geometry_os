; DESCRIPTION: Composite: Draws a black circle centered at (259, 225) with radius 26 then Places a yellow dot at position (414, 174).
; PLAN: r0=259(x), r1=225(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x), r6=174(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 259
LDI r1, 225
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 174
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
