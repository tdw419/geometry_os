; DESCRIPTION: Composite: Draws a black circle centered at (309, 164) with radius 63 then Sets a single cyan pixel at (45, 210).
; PLAN: r0=309(x), r1=164(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x), r6=210(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 309
LDI r1, 164
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 210
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
