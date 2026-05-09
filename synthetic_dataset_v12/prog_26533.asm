; DESCRIPTION: Composite: Draws a red circle centered at (310, 96) with radius 36 then Places a black dot at position (449, 102).
; PLAN: r0=310(x), r1=96(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=449(x), r6=102(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 310
LDI r1, 96
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 449
LDI r6, 102
LDI r7, 0x000000
PSET r5, r6, r7
HALT
