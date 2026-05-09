; DESCRIPTION: Composite: Draws a blue circle centered at (257, 84) with radius 63 then Sets a single cyan pixel at (363, 61).
; PLAN: r0=257(x), r1=84(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=363(x), r6=61(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 257
LDI r1, 84
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 363
LDI r6, 61
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
