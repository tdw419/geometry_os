; DESCRIPTION: Sets a single green pixel at (278, 102).
; PLAN: r0=278(x), r1=102(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 278
LDI r1, 102
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
