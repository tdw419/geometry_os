; DESCRIPTION: Composite: Creates a red circular shape at (475, 21) with radius 11 then Places a white dot at position (34, 63).
; PLAN: r0=475(x), r1=21(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=34(x), r6=63(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 475
LDI r1, 21
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 34
LDI r6, 63
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
