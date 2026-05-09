; DESCRIPTION: Composite: Creates a blue circular shape at (347, 150) with radius 45 then Places a black dot at position (283, 10).
; PLAN: r0=347(x), r1=150(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x), r6=10(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 347
LDI r1, 150
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 10
LDI r7, 0x000000
PSET r5, r6, r7
HALT
