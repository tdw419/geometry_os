; DESCRIPTION: Composite: Draws a black circle centered at (303, 143) with radius 45 then Places a green dot at position (394, 49).
; PLAN: r0=303(x), r1=143(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=394(x), r6=49(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 303
LDI r1, 143
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 394
LDI r6, 49
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
