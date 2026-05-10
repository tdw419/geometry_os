; DESCRIPTION: Composite: Draws a yellow circle centered at (312, 156) with radius 40 then Places a white dot at position (241, 99).
; PLAN: r0=312(x), r1=156(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=241(x), r6=99(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 312
LDI r1, 156
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 241
LDI r6, 99
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
