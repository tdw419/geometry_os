; DESCRIPTION: Sets a single green pixel at (247, 149).
; PLAN: r0=247(x), r1=149(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 247
LDI r1, 149
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
