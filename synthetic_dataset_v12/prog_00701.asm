; DESCRIPTION: Places a red dot at position (257, 217).
; PLAN: r0=257(x), r1=217(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 257
LDI r1, 217
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
