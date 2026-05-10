; DESCRIPTION: Composite: Draws a yellow circle centered at (386, 184) with radius 72 then Places a orange dot at position (12, 18).
; PLAN: r0=386(x), r1=184(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=12(x), r6=18(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 386
LDI r1, 184
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 12
LDI r6, 18
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
