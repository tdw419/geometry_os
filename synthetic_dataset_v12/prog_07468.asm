; DESCRIPTION: Composite: Renders a cyan disk with center (462, 73) and radius 45 then Places a cyan dot at position (441, 217).
; PLAN: r0=462(x), r1=73(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=441(x), r6=217(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 462
LDI r1, 73
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 441
LDI r6, 217
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
