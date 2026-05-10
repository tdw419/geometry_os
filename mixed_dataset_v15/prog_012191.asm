; DESCRIPTION: Composite: Creates a yellow circular shape at (276, 61) with radius 35 then Places a yellow dot at position (389, 246).
; PLAN: r0=276(x), r1=61(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=389(x), r6=246(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 276
LDI r1, 61
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 389
LDI r6, 246
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
