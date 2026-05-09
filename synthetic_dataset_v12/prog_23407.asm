; DESCRIPTION: Sets a single green pixel at (28, 45).
; PLAN: r0=28(x), r1=45(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 28
LDI r1, 45
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
