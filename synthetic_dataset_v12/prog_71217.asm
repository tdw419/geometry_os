; DESCRIPTION: Composite: Draws a purple circle centered at (246, 142) with radius 46 then Places a cyan dot at position (438, 28).
; PLAN: r0=246(x), r1=142(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=438(x), r6=28(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 246
LDI r1, 142
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 438
LDI r6, 28
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
