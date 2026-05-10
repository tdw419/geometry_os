; DESCRIPTION: Composite: Creates a black circular shape at (389, 45) with radius 25 then Places a white dot at position (440, 161).
; PLAN: r0=389(x), r1=45(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=440(x), r6=161(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 389
LDI r1, 45
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 440
LDI r6, 161
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
