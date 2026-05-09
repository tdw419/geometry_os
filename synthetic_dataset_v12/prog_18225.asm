; DESCRIPTION: Composite: Draws a orange circle centered at (393, 118) with radius 69 then Places a black dot at position (437, 60).
; PLAN: r0=393(x), r1=118(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=437(x), r6=60(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 393
LDI r1, 118
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 437
LDI r6, 60
LDI r7, 0x000000
PSET r5, r6, r7
HALT
