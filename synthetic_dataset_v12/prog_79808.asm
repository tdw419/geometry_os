; DESCRIPTION: Sets a single green pixel at (354, 238).
; PLAN: r0=354(x), r1=238(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 354
LDI r1, 238
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
