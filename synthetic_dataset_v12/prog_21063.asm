; DESCRIPTION: Composite: Creates a yellow circular shape at (262, 167) with radius 49 then Places a black dot at position (204, 95).
; PLAN: r0=262(x), r1=167(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=204(x), r6=95(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 262
LDI r1, 167
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 204
LDI r6, 95
LDI r7, 0x000000
PSET r5, r6, r7
HALT
