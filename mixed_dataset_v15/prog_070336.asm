; DESCRIPTION: Composite: Places a cyan circle of radius 63 at center (195, 145) then Places a black dot at position (252, 35).
; PLAN: r0=195(x), r1=145(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=252(x), r6=35(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 195
LDI r1, 145
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 252
LDI r6, 35
LDI r7, 0x000000
PSET r5, r6, r7
HALT
