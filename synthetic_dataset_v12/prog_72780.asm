; DESCRIPTION: Sets a single green pixel at (257, 232).
; PLAN: r0=257(x), r1=232(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 257
LDI r1, 232
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
