; DESCRIPTION: Composite: Draws a orange circle centered at (265, 178) with radius 19 then Places a orange dot at position (451, 139).
; PLAN: r0=265(x), r1=178(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x), r6=139(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 265
LDI r1, 178
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 139
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
