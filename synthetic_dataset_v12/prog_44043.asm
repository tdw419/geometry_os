; DESCRIPTION: Composite: Draws a black circle centered at (59, 131) with radius 37 then Places a black dot at position (491, 150).
; PLAN: r0=59(x), r1=131(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=491(x), r6=150(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 59
LDI r1, 131
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 491
LDI r6, 150
LDI r7, 0x000000
PSET r5, r6, r7
HALT
