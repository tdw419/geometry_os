; DESCRIPTION: Composite: Creates a red circular shape at (230, 129) with radius 63 then Places a black dot at position (88, 241).
; PLAN: r0=230(x), r1=129(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=88(x), r6=241(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 230
LDI r1, 129
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 88
LDI r6, 241
LDI r7, 0x000000
PSET r5, r6, r7
HALT
