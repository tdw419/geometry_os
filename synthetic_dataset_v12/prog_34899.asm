; DESCRIPTION: Composite: Creates a red circular shape at (393, 174) with radius 31 then Places a black dot at position (6, 44).
; PLAN: r0=393(x), r1=174(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=6(x), r6=44(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 393
LDI r1, 174
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 6
LDI r6, 44
LDI r7, 0x000000
PSET r5, r6, r7
HALT
