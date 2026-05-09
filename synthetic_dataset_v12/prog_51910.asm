; DESCRIPTION: Composite: Creates a green circular shape at (408, 106) with radius 50 then Places a yellow dot at position (241, 218).
; PLAN: r0=408(x), r1=106(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=241(x), r6=218(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 408
LDI r1, 106
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 241
LDI r6, 218
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
