; DESCRIPTION: Composite: Draws a yellow circle centered at (223, 58) with radius 34 then Places a red dot at position (378, 111).
; PLAN: r0=223(x), r1=58(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=378(x), r6=111(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 223
LDI r1, 58
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 378
LDI r6, 111
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
