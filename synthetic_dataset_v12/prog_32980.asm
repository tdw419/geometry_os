; DESCRIPTION: Composite: Sets a single green pixel at (278, 25) then Places a white circle of radius 45 at center (347, 108).
; PLAN: r0=278(x), r1=25(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=347(x), r6=108(y), r7=45(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 278
LDI r1, 25
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 347
LDI r6, 108
LDI r7, 45
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
