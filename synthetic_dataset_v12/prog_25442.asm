; DESCRIPTION: Sets a single purple pixel at (257, 207).
; PLAN: r0=257(x), r1=207(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 257
LDI r1, 207
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
