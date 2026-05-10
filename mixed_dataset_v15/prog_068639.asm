; DESCRIPTION: Composite: Places a cyan circle of radius 18 at center (275, 236) then Places a black dot at position (407, 150).
; PLAN: r0=275(x), r1=236(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=407(x), r6=150(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 275
LDI r1, 236
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 407
LDI r6, 150
LDI r7, 0x000000
PSET r5, r6, r7
HALT
