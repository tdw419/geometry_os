; DESCRIPTION: Composite: Creates a black circular shape at (210, 171) with radius 47 then Places a white dot at position (350, 41).
; PLAN: r0=210(x), r1=171(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x), r6=41(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 210
LDI r1, 171
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 41
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
