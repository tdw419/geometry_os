; DESCRIPTION: Composite: Draws a cyan circle centered at (335, 211) with radius 21 then Places a black dot at position (284, 5).
; PLAN: r0=335(x), r1=211(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x), r6=5(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 335
LDI r1, 211
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 5
LDI r7, 0x000000
PSET r5, r6, r7
HALT
