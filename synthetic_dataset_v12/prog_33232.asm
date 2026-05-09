; DESCRIPTION: Sets a single green pixel at (98, 108).
; PLAN: r0=98(x), r1=108(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 98
LDI r1, 108
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
