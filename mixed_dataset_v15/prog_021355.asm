; DESCRIPTION: Composite: Draws a black circle centered at (415, 110) with radius 41 then Places a black dot at position (387, 223).
; PLAN: r0=415(x), r1=110(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=387(x), r6=223(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 415
LDI r1, 110
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 387
LDI r6, 223
LDI r7, 0x000000
PSET r5, r6, r7
HALT
