; DESCRIPTION: Composite: Renders a white disk with center (393, 191) and radius 51 then Places a green dot at position (456, 122).
; PLAN: r0=393(x), r1=191(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=456(x), r6=122(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 393
LDI r1, 191
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 456
LDI r6, 122
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
