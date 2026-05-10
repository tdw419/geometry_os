; DESCRIPTION: Composite: Places a red dot at position (422, 83) then Places a black circle of radius 41 at center (143, 73).
; PLAN: r0=422(x), r1=83(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=143(x), r6=73(y), r7=41(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 422
LDI r1, 83
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 143
LDI r6, 73
LDI r7, 41
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
