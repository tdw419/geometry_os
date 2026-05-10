; DESCRIPTION: Composite: Draws a black circle centered at (89, 90) with radius 41 then Places a magenta dot at position (13, 162).
; PLAN: r0=89(x), r1=90(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=13(x), r6=162(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 89
LDI r1, 90
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 13
LDI r6, 162
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
