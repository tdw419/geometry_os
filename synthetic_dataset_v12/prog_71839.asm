; DESCRIPTION: Composite: Draws a yellow circle centered at (274, 66) with radius 53 then Places a green dot at position (41, 71).
; PLAN: r0=274(x), r1=66(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x), r6=71(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 274
LDI r1, 66
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 71
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
