; DESCRIPTION: Composite: Creates a yellow circular shape at (289, 206) with radius 46 then Places a black dot at position (192, 158).
; PLAN: r0=289(x), r1=206(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x), r6=158(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 289
LDI r1, 206
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 158
LDI r7, 0x000000
PSET r5, r6, r7
HALT
