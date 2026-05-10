; DESCRIPTION: Places a orange dot at position (257, 60).
; PLAN: r0=257(x), r1=60(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 257
LDI r1, 60
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
