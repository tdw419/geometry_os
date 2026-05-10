; DESCRIPTION: Composite: Draws a yellow circle centered at (291, 83) with radius 44 then Places a black dot at position (399, 132).
; PLAN: r0=291(x), r1=83(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=399(x), r6=132(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 291
LDI r1, 83
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 399
LDI r6, 132
LDI r7, 0x000000
PSET r5, r6, r7
HALT
