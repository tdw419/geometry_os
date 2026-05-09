; DESCRIPTION: Composite: Renders a black disk with center (460, 104) and radius 40 then Places a orange dot at position (380, 140).
; PLAN: r0=460(x), r1=104(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=380(x), r6=140(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 460
LDI r1, 104
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 380
LDI r6, 140
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
